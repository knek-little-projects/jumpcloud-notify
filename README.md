JumpCloud Notify
================

Daemon to notify about changes in JumpCloud database.

Notification examles:
* some user/system/group was added/deleted/changed 
* some user/system has dangerous parameters (MFA turned off, etc)


Deploy
------

It is wrapped in saltstack formula. You need to attach a config pillar,
see example `pillar-example.yaml`.

Formula was written for Debian 9.


License
-------

GPLv2: https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt