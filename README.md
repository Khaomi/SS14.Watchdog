# SS14.Watchdog
A very minial and dockerized version of SS14.Watchdog.

This repository is based on [Robust.Cdn](https://github.com/space-wizards/Robust.Cdn)'s repository.

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