# Hello NGINX Upload Service
> Simple Static File Storage & WebDAV Upload Server with NGINX

This project sets up a lightweight file storage and upload server using **NGINX** with **WebDAV** support, running in a Docker container. It serves static files and allows uploading and managing files via WebDAV on the `/uploads/` path.

## 📁 Directory Contents

- `Dockerfile` – Builds the NGINX container with WebDAV support.
- `./nginx/default.conf` – Main NGINX configuration file.
- `README.md` – This documentation file.

## ⚙️ Features

- Serves static files via `http://localhost/`
- Upload files via WebDAV to `http://localhost/uploads/`
- WebDAV methods enabled: `PUT`, `DELETE`, `MKCOL`, `COPY`, `MOVE`
- Max upload size: **50 MB**
- Auto-creates directories for uploads
- Directory listing (`autoindex`) enabled
- No authentication (intended for private/local use)

## 🚀 Getting Started

### 1. Build and Run with Docker

```bash
docker build -t hello-nginx-upload-service .
docker run -d \
  --name hello-nginx-upload-service \
  -p 3000:80 \
  hello-nginx-upload-service
````

### 2. Accessing the Service

* **Browse files**: [http://localhost/](http://localhost/)
* **Upload file using `curl`**:

  ```bash
  curl -T ./myfile.txt http://localhost:3000/uploads/myfile.txt
  ```

### 3. Upload Folder or File via WebDAV GUI

Use a WebDAV client like:

* Cyberduck
* FileZilla (with WebDAV plugin)
* Windows Explorer (Map network drive)
* macOS Finder (`Go > Connect to Server > http://localhost:3000/uploads/`)

## 🔐 Optional: Add Authentication or HTTPS

This setup has **no authentication** or encryption by default.

To secure it:

* Use NGINX `auth_basic` for simple user/password protection.
* Add TLS config using a reverse proxy like Caddy, Traefik, or an NGINX SSL block with Let's Encrypt.

## 🧹 Cleanup

```bash
docker stop hello-nginx-upload-service && docker rm hello-nginx-upload-service
```

## 📦 Notes

* The `html/uploads/` directory must exist and be writable.
* WebDAV support requires NGINX built with the `ngx_http_dav_module` (included in official builds).

## 🛠️ Useful Commands

Check logs:

```bash
docker logs -f hello-nginx-upload-service
```

Test config:

```bash
nginx -t
```

Restart container:

```bash
docker restart hello-nginx-upload-service
```

## 📌 Disclaimer

This is a minimal, unauthenticated setup suitable for local or internal use. Do not expose it to the internet without hardening it first.

