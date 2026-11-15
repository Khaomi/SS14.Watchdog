# SS14.Watchdog
A very minimal and dockerized version of SS14.Watchdog.

## Instructions

Run these commands
```bash
mkdir instances
touch data.db
chmod 777 instances
chmod 777 data.db
```

Then copy `appsettings.example.yml` and rename it to `appsettings.yml`
Then run `docker compose up`

## Tip

This is **usually** needed in many server config.
SS14 Admin, and Watchdog requires it to function properly.

If your game server can't ping Watchdog, the blow config is most likely the fix.

```yaml
BaseUrl: "http://localhost:27689"
Urls: "http://0.0.0.0:27689"
AllowedHosts: "*"
```
