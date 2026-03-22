# restic

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