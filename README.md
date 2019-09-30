# log.go

Application that can be used to write rotating log files. I wrote this because Windows Task Scheduler annoyingly has no safe way to capture output of commands.

Example:

```
restic backup --repo /my/restic/repo | log -tstmp -size 10 -file /tmp/logs/restic.log --
```
