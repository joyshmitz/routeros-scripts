Upload backup to server
=======================

[![GitHub stars](https://img.shields.io/github/stars/eworm-de/routeros-scripts?logo=GitHub&style=flat&color=red)](https://github.com/eworm-de/routeros-scripts/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/eworm-de/routeros-scripts?logo=GitHub&style=flat&color=green)](https://github.com/eworm-de/routeros-scripts/network)
[![GitHub watchers](https://img.shields.io/github/watchers/eworm-de/routeros-scripts?logo=GitHub&style=flat&color=blue)](https://github.com/eworm-de/routeros-scripts/watchers)
[![required RouterOS version](https://img.shields.io/badge/RouterOS-7.15-yellow?style=flat)](https://mikrotik.com/download/changelogs/)
[![Telegram group @routeros_scripts](https://img.shields.io/badge/Telegram-%40routeros__scripts-%2326A5E4?logo=telegram&style=flat)](https://t.me/routeros_scripts)
[![donate with PayPal](https://img.shields.io/badge/Like_it%3F-Donate!-orange?logo=githubsponsors&logoColor=orange&style=flat)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=A4ZXBD6YS2W8J)

[⬅️ Go back to main README](../README.md)

> ℹ️ **Info**: This script can not be used on its own but requires the base
> installation. See [main README](../README.md) for details.

Description
-----------

This script uploads binary backup (`/system/backup/save`) and complete
configuration export (`/export terse show-sensitive`) to external server.

> ⚠️ **Warning**: The used command can hit errors that a script can not handle.
> This may result in script termination (where no notification is sent) or
> malfunction of fetch command (where all up- and downloads break) for some
> time. Failed notifications are queued then.

### Sample notification

![backup-upload notification](backup-upload.d/notification.avif)

Requirements and installation
-----------------------------

Just install the script:

    $ScriptInstallUpdate backup-upload;

Configuration
-------------

The configuration goes to `global-config-overlay`, these are the parameters:

* `BackupSendBinary`: whether to send binary backup
* `BackupSendExport`: whether to send configuration export
* `BackupSendGlobalConfig`: whether to send `global-config-overlay`
* `BackupPassword`: password to encrypt the backup with
* `BackupRandomDelay`: delay up to amount of seconds when run from scheduler
* `BackupUploadUrl`: url to upload to
* `BackupUploadUser`: username for server authentication
* `BackupUploadPass`: password for server authentication

> ℹ️ **Info**: Copy relevant configuration from
> [`global-config`](../global-config.rsc) (the one without `-overlay`) to
> your local `global-config-overlay` and modify it to your specific needs.

Also notification settings are required for
[e-mail](mod/notification-email.md),
[gotify](mod/notification-gotify.md),
[matrix](mod/notification-matrix.md),
[ntfy](mod/notification-ntfy.md) and/or
[telegram](mod/notification-telegram.md).

### Issues with SFTP client

The RouterOS SFTP client is picky if it comes to authentication methods.
I had to disable all but password authentication on server side. For openssh
edit `/etc/ssh/sshd_config` and add a directive like this, changed for your
needs:

    Match User mikrotik
        AuthenticationMethods password

Usage and invocation
--------------------

Just run the script:

    /system/script/run backup-upload;

Creating a scheduler may be an option:

    /system/scheduler/add interval=1w name=backup-upload on-event="/system/script/run backup-upload;" start-time=09:25:00;

See also
--------

* [Upload backup to Mikrotik cloud](backup-cloud.md)
* [Send backup via e-mail](backup-email.md)
* [Save configuration to fallback partition](backup-partition.md)

---
[⬅️ Go back to main README](../README.md)  
[⬆️ Go back to top](#top)
