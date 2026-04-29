# Redirect click tracking (WP → Google Sheets, no Zapier) — Documentation

**Last updated:** 2026-04-04  
**Goal:** Track **email click-throughs** by routing users through a WordPress redirect page (`/go-tickets-2026`), logging the click to a WordPress REST endpoint, and writing a row into Google Sheets via a Google Apps Script Web App.

This system logs **clicks only** (not purchases). Purchase attribution is only possible if your ticketing provider later returns a matching identifier (see **CID** below).

---

## Architecture overview (no Zapier)

### Flow

1) **Email (Klaviyo)** contains a link to your redirect page, e.g.:

`https://3sof.com/go-tickets-2026?src=email&utm_source=klaviyo&utm_medium=email&utm_campaign=3sof_2026_launch&utm_content=hero_button&eid=3sof_2026&cid=__CID__`

2) **Redirect page JavaScript**:
- reads query params (src + UTMs + eid + optional cid)
- ensures a correlation id `cid` exists (cookie fallback)
- POSTs a JSON payload to WordPress:
  - `POST https://3sof.com/wp-json/tracker/v1/log`
- redirects the browser to the final ticket URL (iaBilet) with UTMs (and optionally cid)

3) **WordPress plugin**:
- receives JSON from the browser
- sanitizes + keeps only the fields we care about
- forwards JSON to Google Apps Script Web App

4) **Google Apps Script Web App**:
- validates a shared secret **key included in the JSON body** (not headers)
- appends a new row to Google Sheets tab **Clicks**

---

## 1) Redirect URL + query params

### 1.1 Canonical redirect URL format (what to put in Klaviyo)

Use:

`https://3sof.com/go-tickets-2026?src=email&utm_source=klaviyo&utm_medium=email&utm_campaign=3sof_2026_launch&utm_content=hero_button&eid=3sof_2026&cid=__CID__`

Minimal recommended params:
- `src`
- `utm_source`
- `utm_medium`
- `utm_campaign`
- `utm_content` (optional but useful)
- `eid`
- `cid` (strongly recommended if you can generate it)

### 1.2 Query params: meaning + mapping to Google Sheets columns

| Param          |            Required? | Example            | Meaning                                                           | Sheet column   |
| -------------- | -------------------: | ------------------ | ----------------------------------------------------------------- | -------------- |
| `src`          |                  yes | `email`            | Your internal traffic source label                                | `src`          |
| `utm_source`   |          recommended | `klaviyo`          | Marketing source                                                  | `utm_source`   |
| `utm_medium`   |          recommended | `email`            | Marketing medium/channel                                          | `utm_medium`   |
| `utm_campaign` |          recommended | `3sof_2026_launch` | Campaign identifier                                               | `utm_campaign` |
| `utm_content`  |             optional | `hero_button`      | Which link/button/creative                                        | `utm_content`  |
| `eid`          |          recommended | `3sof_2026`        | Event identifier                                                  | `eid`          |
| `cid`          | strongly recommended | `7b2d...`          | Correlation ID to connect clicks to later purchases (if possible) | `cid`          |

---

## 2) What is `cid` and why it matters

`cid` = **Correlation ID** (Click ID).

It lets you group multiple clicks by the same email recipient/browser and—**only if your ticketing provider later returns it**—it can enable click → purchase matching.

### Best practice
- Generate a **unique cid per recipient** inside Klaviyo and place it into the redirect link.
- If you cannot do that, the redirect page will generate a random `cid` and persist it as a cookie (`tt_cid`) for 30 days.

### Important limitation
If iaBilet does not return your `cid` back in an order report/webhook/export, you will not be able to deterministically attribute purchases using `cid`. You will still have reliable click tracking.

---

## 3) Data we log (simplified)

To remove “useless” fields and keep things clean, we log only:

- `received_at` (server time, set by Apps Script)
- `client_ts` (browser time)
- `src`
- `utm_source`
- `utm_medium`
- `utm_campaign`
- `utm_content`
- `eid`
- `cid`
- `destination` (final URL we redirected to)
- `request_id` (UUID to dedupe retries)

We do **not** store:
- `user_agent`
- `referrer`
- `language`
- `timezone`
- IP
- email/name

---

## 4) Redirect page JS (browser) — how it works

### 4.1 Where it lives
Create a WordPress page with slug:  
`go-tickets-2026`

Add a **Custom HTML** block and paste the script below.

### 4.2 How it behaves
- Reads query params
- Ensures `cid` exists (URL → cookie → generated)
- Generates `request_id`
- Sends a POST to `/wp-json/tracker/v1/log`
- Redirects to iaBilet after ~350ms

### 4.3 Redirect page JS (copy/paste)

**Replace:**
- `TT_BROWSER_KEY` with a long random secret (same as `TT_BROWSER_KEY` in PHP)

```html
<script>
(function () {
  // Shared key included in JSON body (not headers)
  const TT_BROWSER_KEY = 'PUT_A_LONG_RANDOM_KEY_HERE';

  const params = new URLSearchParams(window.location.search);
  const get = (k, fallback = '') => params.get(k) || fallback;

  const src = get('src', 'direct');
  const utm_source = get('utm_source', '');
  const utm_medium = get('utm_medium', '');
  const utm_campaign = get('utm_campaign', '');
  const utm_content = get('utm_content', '');
  const eid = get('eid', '');

  // cid (URL > cookie > generated)
  const readCookie = (name) => {
    const m = document.cookie.match(new RegExp('(^| )' + name + '=([^;]+)'));
    return m ? decodeURIComponent(m[2]) : '';
  };
  const setCookie = (name, value, days) => {
    const maxAge = days * 24 * 60 * 60;
    document.cookie = `${name}=${encodeURIComponent(value)}; max-age=${maxAge}; path=/; samesite=lax`;
  };

  let cid = get('cid', '') || readCookie('tt_cid');
  if (!cid) cid = (crypto.randomUUID ? crypto.randomUUID() : String(Date.now()) + '-' + Math.random().toString(16).slice(2));
  setCookie('tt_cid', cid, 30);

  const request_id = (crypto.randomUUID ? crypto.randomUUID() : String(Date.now()) + '-' + Math.random().toString(16).slice(2));

  // Destination URL with UTMs
  const dest = new URL('https://iabilet.ro/event/3sof');
  if (utm_source) dest.searchParams.set('utm_source', utm_source);
  if (utm_medium) dest.searchParams.set('utm_medium', utm_medium);
  if (utm_campaign) dest.searchParams.set('utm_campaign', utm_campaign);
  if (utm_content) dest.searchParams.set('utm_content', utm_content);

  // Optional: forward cid/eid to destination if you want
  // dest.searchParams.set('cid', cid);
  // if (eid) dest.searchParams.set('eid', eid);

  const payload = {
    key: TT_BROWSER_KEY,
    client_ts: new Date().toISOString(),
    src,
    utm_source,
    utm_medium,
    utm_campaign,
    utm_content,
    eid,
    cid,
    destination: dest.toString(),
    request_id
  };

  fetch('/wp-json/tracker/v1/log', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(payload),
    keepalive: true,
    credentials: 'same-origin'
  }).catch(() => {});

  setTimeout(() => {
    window.location.href = dest.toString();
  }, 350);
})();
</script>

<p>Redirecting to ticket purchase...</p>
```

---

## 5) WordPress plugin — installation + configuration

### 5.1 Where to place it (cPanel)
Create:

- `wp-content/plugins/ticket-tracker/`
- `wp-content/plugins/ticket-tracker/ticket-tracker.php`

### 5.2 Configure secrets + Google endpoint in `wp-config.php` (recommended)
Add:

```php
define('TT_BROWSER_KEY', 'PUT_A_LONG_RANDOM_KEY_HERE');
define('TT_GAS_URL', 'https://script.google.com/macros/s/YOUR_DEPLOYMENT_ID/exec');
define('TT_GAS_KEY', 'PUT_ANOTHER_LONG_RANDOM_KEY_HERE');
```

- `TT_BROWSER_KEY`: browser → WP shared key (in JSON body)
- `TT_GAS_KEY`: WP → Google shared key (in JSON body). Keep server-side only.

### 5.3 Plugin code (simplified)

```php
<?php
/**
 * Plugin Name: Ticket Source Tracker
 */

add_action('rest_api_init', function () {
  register_rest_route('tracker/v1', '/log', [
    'methods'             => 'POST',
    'callback'            => 'tt_log_ticket_visit',
    'permission_callback' => '__return_true',
  ]);
});

function tt_clean($v, $max = 300) {
  $s = is_scalar($v) ? (string) $v : '';
  $s = sanitize_text_field($s);
  if (strlen($s) > $max) $s = substr($s, 0, $max);
  return $s;
}

function tt_resp($arr, $status = 200) {
  return new WP_REST_Response($arr, $status);
}

function tt_log_ticket_visit(WP_REST_Request $request) {
  if (!defined('TT_BROWSER_KEY') || !TT_BROWSER_KEY) return tt_resp(['ok'=>false,'error'=>'server_not_configured'], 500);
  if (!defined('TT_GAS_URL') || !TT_GAS_URL) return tt_resp(['ok'=>false,'error'=>'server_not_configured'], 500);
  if (!defined('TT_GAS_KEY') || !TT_GAS_KEY) return tt_resp(['ok'=>false,'error'=>'server_not_configured'], 500);

  $data = $request->get_json_params();
  if (!is_array($data)) $data = [];

  // Anti-spam: key in JSON body
  $provided = (string)($data['key'] ?? '');
  if (!$provided || !hash_equals(TT_BROWSER_KEY, $provided)) {
    return tt_resp(['ok'=>false,'error'=>'unauthorized'], 401);
  }

  // Keep only useful fields
  $payload = [
    'key'         => TT_GAS_KEY, // WP -> Google key
    'client_ts'   => tt_clean($data['client_ts'] ?? '', 40),
    'src'         => tt_clean($data['src'] ?? '', 120),

    'utm_source'  => tt_clean($data['utm_source'] ?? '', 80),
    'utm_medium'  => tt_clean($data['utm_medium'] ?? '', 80),
    'utm_campaign'=> tt_clean($data['utm_campaign'] ?? '', 160),
    'utm_content' => tt_clean($data['utm_content'] ?? '', 160),

    'eid'         => tt_clean($data['eid'] ?? '', 80),
    'cid'         => tt_clean($data['cid'] ?? '', 120),

    'destination' => tt_clean($data['destination'] ?? '', 300),
    'request_id'  => tt_clean($data['request_id'] ?? '', 80),
  ];

  $resp = wp_remote_post(TT_GAS_URL, [
    'headers' => ['Content-Type' => 'application/json'],
    'body'    => wp_json_encode($payload),
    'timeout' => 5,
  ]);

  if (is_wp_error($resp)) {
    // don’t break redirect flow; still return ok
    return tt_resp(['ok'=>true,'status'=>'logged','upstream'=>'error'], 200);
  }

  return tt_resp(['ok'=>true,'status'=>'logged','upstream'=>'ok'], 200);
}
```

### 5.4 Activate plugin
WP Admin → Plugins → Activate **Ticket Source Tracker**

### 5.5 WP endpoint
`POST https://3sof.com/wp-json/tracker/v1/log`

---

## 6) Google Apps Script — setup + deployment (simplified + secure key in body)

### 6.1 Create a Google Sheet
- Create a tab named: `Clicks`

### 6.2 Apps Script (Code.gs)

Replace:
- `SHEET_ID` with your sheet id
- `TAB_NAME` if needed

```javascript
const SHEET_ID = 'YOUR_SHEET_ID';
const TAB_NAME = 'Clicks';

function getTrackerKey_() {
  const key = PropertiesService.getScriptProperties().getProperty('TRACKER_KEY');
  if (!key) throw new Error('Missing Script Property TRACKER_KEY');
  return key;
}

function toStr_(v) { return (v === null || v === undefined) ? '' : String(v); }
function trunc_(s, max) { s = toStr_(s); return s.length > max ? s.slice(0, max) : s; }
function json_(obj) { return ContentService.createTextOutput(JSON.stringify(obj)).setMimeType(ContentService.MimeType.JSON); }

function doPost(e) {
  try {
    if (!e || !e.postData || !e.postData.contents) return json_({ ok: false, error: 'missing_body' });

    let data;
    try { data = JSON.parse(e.postData.contents); }
    catch (_) { return json_({ ok: false, error: 'invalid_json' }); }

    // Auth: key in JSON body
    const providedKey = data && data.key ? String(data.key) : '';
    if (!providedKey || providedKey !== getTrackerKey_()) return json_({ ok: false, error: 'unauthorized' });

    const ss = SpreadsheetApp.openById(SHEET_ID);
    let sheet = ss.getSheetByName(TAB_NAME);
    if (!sheet) {
      sheet = ss.insertSheet(TAB_NAME);
      sheet.appendRow([
        'received_at','client_ts','src',
        'utm_source','utm_medium','utm_campaign','utm_content',
        'eid','cid',
        'destination','request_id'
      ]);
    }

    sheet.appendRow([
      new Date(),                      // received_at
      trunc_(data.client_ts, 40),
      trunc_(data.src, 120),
      trunc_(data.utm_source, 80),
      trunc_(data.utm_medium, 80),
      trunc_(data.utm_campaign, 160),
      trunc_(data.utm_content, 160),
      trunc_(data.eid, 80),
      trunc_(data.cid, 120),
      trunc_(data.destination, 300),
      trunc_(data.request_id, 80),
    ]);

    return json_({ ok: true });
  } catch (err) {
    return json_({ ok: false, error: 'server_error', message: String(err) });
  }
}
```

### 6.3 Script property
Apps Script → Project Settings → Script properties:
- `TRACKER_KEY` = same value as `TT_GAS_KEY` in `wp-config.php`

### 6.4 Deploy as Web App
Deploy → New deployment → Web app
- Execute as: **Me**
- Who has access: **Anyone** (or “Anyone with the link”)

Copy deployment URL into `TT_GAS_URL` in `wp-config.php`.

---

## 7) Python local tests (no headers, key in JSON)

### 7.1 Test Google Apps Script directly (`test_gas.py`)

```python
import requests
from datetime import datetime, timezone

GAS_URL = "https://script.google.com/macros/s/YOUR_DEPLOYMENT_ID/exec"
GAS_KEY = "PUT_ANOTHER_LONG_RANDOM_KEY_HERE"

payload = {
    "key": GAS_KEY,
    "client_ts": datetime.now(timezone.utc).isoformat(),
    "src": "email",
    "utm_source": "klaviyo",
    "utm_medium": "email",
    "utm_campaign": "3sof_2026_launch",
    "utm_content": "hero_button",
    "eid": "3sof_2026",
    "cid": "example_cid",
    "destination": "https://iabilet.ro/event/3sof?utm_source=klaviyo&utm_medium=email",
    "request_id": "example_request_id",
}

r = requests.post(GAS_URL, json=payload, timeout=10)
print("status:", r.status_code)
print("body:", r.text)
```

### 7.2 Test WordPress endpoint (`test_wp.py`)

```python
import requests
from datetime import datetime, timezone

WP_URL = "https://3sof.com/wp-json/tracker/v1/log"
BROWSER_KEY = "PUT_A_LONG_RANDOM_KEY_HERE"

payload = {
    "key": BROWSER_KEY,
    "client_ts": datetime.now(timezone.utc).isoformat(),
    "src": "email",
    "utm_source": "klaviyo",
    "utm_medium": "email",
    "utm_campaign": "3sof_2026_launch",
    "utm_content": "hero_button",
    "eid": "3sof_2026",
    "cid": "example_cid",
    "destination": "https://iabilet.ro/event/3sof?utm_source=klaviyo&utm_medium=email",
    "request_id": "example_request_id",
}

r = requests.post(WP_URL, json=payload, timeout=10)
print("status:", r.status_code)
print("body:", r.text)
```

Expected WP response:
- `{"ok":true,"status":"logged","upstream":"ok"}`

---

## 8) Operations checklist

1) Create Google Sheet + `Clicks` tab (or let script create it).
2) Configure Apps Script:
   - set Script Property `TRACKER_KEY`
   - deploy Web App and copy URL
3) Configure WordPress:
   - add constants in `wp-config.php` (`TT_BROWSER_KEY`, `TT_GAS_URL`, `TT_GAS_KEY`)
   - install/activate plugin
4) Create WP redirect page `/go-tickets-2026` and paste the JS
5) Test:
   - run `test_gas.py` (direct → sheet)
   - run `test_wp.py` (wp → gas → sheet)
   - click the redirect URL in a browser (end-to-end)

---

## 9) Security notes (practical)
- The **browser key** is visible in page source. It blocks random spam but is not strong security.
- The **WP → Google key** is server-side and should be treated as a real secret.
- Keep payload minimal and avoid PII.
