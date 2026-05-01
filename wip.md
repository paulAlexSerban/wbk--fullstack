# Workbook Restructuring Plan

## Current State

Single monorepo (`wbk--fullstack`) with two top-level areas:

- `workbook/` — 7 numbered topic dirs, mix of raw content and existing submodules
- `projects/` — 15 applied projects (4 are empty stubs, 1 is already a submodule)

**Existing submodules:**

| Submodule repo                        | Location in this repo                                      |
| ------------------------------------- | ---------------------------------------------------------- |
| `wbk--frontend-playground`            | `workbook/02_web-development/frontend/`                    |
| `wbk--reactjs-playground`             | `workbook/02_web-development/frontend/`                    |
| `wbk--lerna-monorepo-playground`      | `workbook/02_web-development/frontend/`                    |
| `wbk--wordpress-playground`           | `workbook/02_web-development/cms/`                         |
| `wbk--hello-pytest`                   | `workbook/06_software-testing/effective-software-testing/` |
| `wbk--hello-pytest-w-appium`          | `workbook/06_software-testing/effective-software-testing/` |
| `wbk--software-architecture-n-design` | `workbook/03_system-design-architecture/`                  |
| `prj--bloom-cycle-tracker`            | `projects/`                                                |

---

## Goal

Split everything into focused repositories that link back here as submodules. This repo becomes the shell — a map of all workbooks and projects, not a place where content lives.

---

## Naming Convention

- Workbook repos: `wbk--<slug>` (e.g., `wbk--automation`, `wbk--backend-playground`)
- Project repos: `prj--<slug>` (e.g., `prj--devcamper`)
- Dir names in this repo: `0N_<topic>` — keep the numbered order

---

## Promotion Criteria

Promote inline content to its own repo when **ANY** of the following is true:

- It has its own build system, `package.json`, or `Makefile`
- It contains 10+ exercises or substantive files beyond notes
- It requires environment-specific setup (`.env`, Docker, etc.) that differs from this repo's root
- It is a self-contained teaching unit that can be used or referenced independently

Pure reference notes (`.md` files with no build artefacts) stay inline as docs — they are not promotable content.

---

## Target Workbook Repos

### 01 — `wbk--foundations` → `workbook/01_foundations/`

**Status:** Not yet a submodule. All content inline.

| Dir                               | Content                                | Note                                        |
| --------------------------------- | -------------------------------------- | ------------------------------------------- |
| `data-structure-algorithms/`      | algorithms + data structures exercises | likely meets volume criterion — evaluate    |
| `design-patterns/`                | 3 GoF `.md` notes                      | stays inline — reference docs only          |
| `principles/`                     | SOLID, DRY, KISS `.md` notes           | stays inline — reference docs only          |
| `software-development-lifecycle/` | readme only                            | **EMPTY — fill or delete before promoting** |
| `projects/`                       | applied foundations projects           | move to `projects/` root or keep here       |

**Action:** Fill `software-development-lifecycle/`. Once DSA content is sufficient, promote entire dir to `wbk--foundations`.

---

### 02 — `wbk--web-dev` → `workbook/02_web-development/`

**Status:** Partially submoduled — frontend already split into 3 repos.

| Dir                              | Content                                                                            | Action                                                       |
| -------------------------------- | ---------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| `backend/`                       | 13 `hello-*` framework dirs (express, django, fastapi, flask, nestjs, nginx, node) | promote to `wbk--backend-playground` — volume criterion met  |
| `fullstack/`                     | 3 Next.js variants + streamlit                                                     | promote to `wbk--fullstack-playground` or merge into backend |
| `database/`                      | 2 SQLite exercises                                                                 | too small to split — merge into backend                      |
| `api-design/`                    | 4 `.md` notes (REST, GraphQL, gRPC)                                                | stays inline — reference docs only                           |
| `cms/`                           | 4 `hello-*` dirs + wordpress submodule                                             | promote `hello-*` dirs to `wbk--cms-playground`              |
| `rnd/`                           | scratch pad                                                                        | clean periodically, never promote                            |
| `wbk--frontend-playground`       | submodule ✓                                                                        | keep                                                         |
| `wbk--reactjs-playground`        | submodule ✓                                                                        | keep                                                         |
| `wbk--lerna-monorepo-playground` | submodule ✓                                                                        | keep                                                         |
| `wbk--wordpress-playground`      | submodule ✓                                                                        | keep                                                         |

**Action:** Priority — promote `backend/` as `wbk--backend-playground`. Then evaluate `fullstack/` and `cms/` inline dirs.

---

### 03 — `wbk--system-design` → `workbook/03_system-design-architecture/`

**Status:** Partially submoduled (`wbk--software-architecture-n-design` already split).

| Dir                                   | Content                                                    | Action                                           |
| ------------------------------------- | ---------------------------------------------------------- | ------------------------------------------------ |
| `case-studies/`                       | 3 case studies (key-value store, parking lot, leaderboard) | merge into `wbk--software-architecture-n-design` |
| `software-design/`                    | enterprise patterns, POSA, GoF-in-systems                  | merge into `wbk--software-architecture-n-design` |
| `database-design/`                    | —                                                          | evaluate — merge or keep inline                  |
| `docs/`                               | —                                                          | review; move useful content, delete dead weight  |
| `project-structures/`                 | —                                                          | review; likely reference docs, keep inline       |
| `wbk--software-architecture-n-design` | submodule ✓                                                | keep; absorb remaining inline content            |

**Action:** Merge remaining inline dirs into the existing submodule. Avoid maintaining two places for the same topic.

---

### 04 — `wbk--cloud-infra` → `workbook/04_cloud-infrastructure/`

**Status:** Not yet a submodule. All content inline.

| Dir                       | Content                                      | Note                              |
| ------------------------- | -------------------------------------------- | --------------------------------- |
| `aws/`                    | architecture diagrams + DynamoDB / VPC notes | substantial — ready               |
| `docker-kubernetes/`      | readme only                                  | **EMPTY — fill before promoting** |
| `infrastructure-as-code/` | Cloudformation + Terraform notes             | ready                             |
| `monitoring-and-logging/` | AWS log notes + reliability patterns         | ready                             |
| `projects/`               | —                                            | evaluate                          |

**Action:** Fill `docker-kubernetes/`. Once done, promote to `wbk--cloud-infra`.

---

### 05 — `wbk--automation` → `workbook/05_automation/`

**Status:** Not yet a submodule. 10 Python scripts/projects inline — **volume criterion already met.**

| Content                                               |
| ----------------------------------------------------- |
| `basic-web-scrapper/`                                 |
| `click-to-google-sheets/`                             |
| `excel-content-refiner/`                              |
| `excel-lorem-seeder/`                                 |
| `hello-browser-automation-n-web-scraping-w-selenium/` |
| `image-manipulation-w-python/`                        |
| `romanian-official-monitor-scrapper/`                 |
| `web-scraper--site-archiver/`                         |
| `working-w-csv-files/`                                |
| `working-w-pdf-files/`                                |

**Action:** High priority. Promote to `wbk--automation` now.

---

### 06 — `wbk--software-testing` → `workbook/06_software-testing/`

**Status:** Partially submoduled (pytest repos already split).

| Dir                          | Content     | Action                                             |
| ---------------------------- | ----------- | -------------------------------------------------- |
| `contract-testing/`          | inline      | consolidate into `wbk--software-testing`           |
| `e2e/`                       | inline      | consolidate into `wbk--software-testing`           |
| `tdd-bdd/`                   | inline      | consolidate into `wbk--software-testing`           |
| `unit-integration-e2e/`      | inline      | consolidate into `wbk--software-testing`           |
| `performance/`               | inline      | consolidate into `wbk--software-testing`           |
| `projects/`                  | inline      | evaluate — move to `projects/` root if substantial |
| `wbk--hello-pytest`          | submodule ✓ | keep                                               |
| `wbk--hello-pytest-w-appium` | submodule ✓ | keep                                               |

**Action:** Create `wbk--software-testing` repo and consolidate inline dirs into it.

---

### 07 — `wbk--cybersecurity` → `workbook/07_cybersecurity/`

**Status:** Barely started — one dir (`offense-n-defense-coding/`).

**Action:** Do not promote yet. Add penetration testing notes, OWASP coverage, security tool walkthroughs. Promote only when the volume criterion is met.

---

## Projects (`projects/`)

All projects should eventually be individual repos linked here as submodules.

| Project                      | Status                 | Action                                       |
| ---------------------------- | ---------------------- | -------------------------------------------- |
| `prj--bloom-cycle-tracker`   | submodule ✓            | keep                                         |
| `birthday-buddy`             | inline                 | promote to `prj--birthday-buddy`             |
| `chinook-online-music-store` | inline                 | promote to `prj--chinook-online-music-store` |
| `devcamper`                  | inline                 | promote to `prj--devcamper`                  |
| `dj-events`                  | inline                 | promote to `prj--dj-events`                  |
| `food-recipes`               | inline                 | promote to `prj--food-recipes`               |
| `monsters-world`             | inline                 | promote to `prj--monsters-world`             |
| `property-pulse-rentals`     | inline                 | promote to `prj--property-pulse-rentals`     |
| `prostore-ecommerce`         | inline                 | promote to `prj--prostore-ecommerce`         |
| `user-profiles`              | inline                 | promote to `prj--user-profiles`              |
| `basic-store`                | inline                 | evaluate: promote or archive                 |
| `gamified-learning`          | **stub — readme only** | build out or delete                          |
| `jobee-job-platform`         | **stub — readme only** | build out or delete                          |
| `knowledge-matrix`           | **stub — readme only** | build out or delete                          |
| `learning-goals`             | **stub — readme only** | build out or delete                          |

---

## Migration Order

Work top-to-bottom. Do not skip ahead — each step unblocks the next.

1. **Clean up stubs** — Make a decision on `gamified-learning`, `jobee-job-platform`, `knowledge-matrix`, `learning-goals`: build out or delete. Do not carry dead weight.
2. **Fill empty sections** — `docker-kubernetes/` and `software-development-lifecycle/` are placeholders. Fill or delete them.
3. **Promote `wbk--automation`** — Volume criterion already met. Do this first.
4. **Promote `wbk--backend-playground`** — 13 framework exercises, volume criterion met.
5. **Merge `03_system-design-architecture` inline content** — Fold `case-studies/` and `software-design/` into the existing `wbk--software-architecture-n-design` submodule.
6. **Promote applied projects** — Batch: create repos for the 10 inline projects, add as submodules.
7. **Promote `wbk--software-testing`** — Consolidate the 5 inline testing dirs.
8. **Promote `wbk--cloud-infra`** — After `docker-kubernetes/` has real content.
9. **Promote `wbk--foundations`** — After `software-development-lifecycle/` is filled.
10. **Promote `wbk--cybersecurity`** — Last. Needs significant content before it earns its own repo.

---

## Housekeeping Rules

- Pure `.md` reference notes (`api-design/`, `design-patterns/`, `principles/`) stay inline — they are docs, not promotable content.
- `rnd/` dirs are scratch pads. Clean them periodically. Never promote them.
- Do not create a new submodule until the content has a working build or run story.
- This repo (`wbk--fullstack`) is the permanent root shell — every workbook and project links back here as a submodule.