# Helper - Postgres Backup and Restore

[![CircleCI](https://circleci.com/gh/homelabaas/helper-postgres-mgmt.svg?style=svg)](https://circleci.com/gh/homelabaas/helper-postgres-mgmt)

This container will perform backups and restores using environment variables passed in at run time. It is designed to be run once, to perform the operation requires. It currently supports two operations:

* BACKUP - Run a postgres dump and upload the file into minio.
* RESTORE - Take a file from minio and restore it into a target database.