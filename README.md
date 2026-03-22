# restic

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Build Status](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2Funixorn%2Funixorn-restic%2Fbadge&style=plastic)](https://actions-badge.atrox.dev/unixorn/unixorn-restic/goto)
![Awesomebot](https://github.com/unixorn/unixorn-restic/actions/workflows/awesomebot.yml/badge.svg)
![Megalinter](https://github.com/unixorn/unixorn-restic/actions/workflows/mega-linter.yml/badge.svg)
[![GitHub last commit (main)](https://img.shields.io/github/last-commit/unixorn/unixorn-restic/main.svg)](https://github.com/unixorn/unixorn-restic)

Debian-based [restic](https://restic.net) container.

Run `restic` without installing it, or inside a k8s cluster.

## Usage

Create a `.env` file and set the following variables

| Variable                | Purpose |
| ----------------------- | --------------------------------------------------- |
| `BACKUP_FROM`           | Path you want to backup. This is the path on the host, not the container. |
| `RESTIC_REPOSITORY`     | Path to your repository. |
| `RESTIC_PASSWORD`       | Make sure to use the same password for all containers using a given repository. If you lose it, your backups cannot be recovered. If you change it, your backups will be corrupted. |
| `RESTIC_BACKUP_SOURCES` | Where `BACKUP_FROM` will be mounted inside the container. Defaults to `/mnt/volumes` |
| `RESTIC_COMPRESSION`    | Defaults to auto |
| `TZ`                    | Set this in your .env file |

```sh
docker-compose run --rm -it "restic arg arg arg"
```
