# 7linden-cp-login

Create a .deb package suitable for \*buntu, Debian, Linux Mint.

## Scripts to login to captive portal (pfsense).

### /opt/7linden-cp-login/bin/post_login

Script checks whether we are at home (by asking for routers ssh key fingerprints and comparing them with `/opt/7linden-cp-login/data/host_keys`).

It then reads the config (notably *username*, *password* and *hostname*) from `/etc/7linden/cp-login.conf` and posts this data to the given host (pfSense Captive Portal assumed).

Note that the script should have no file-ending such that it can be linked in `/etc/network/if-up.d/` and thus be called at bootup time with `ifup -a`.

This can be done with `sudo ln -s /etc/network/if-up.d/post-login /opt/7linden-cp-login/bin/post-login`.
This is also wrapped in two scripts:

  /opt/7linden-cp-login/bin/install_ifup_script

and

  /opt/7linden-cp-login/bin/uninstall_ifup_script

which do just that.

### Package building

To build the package you need to have [FPM](https://github.com/jordansissel/fpm) in the path and execute `create.sh`.

### Package release

To ease integration with other tools, a version bump should be tagged with the current version number.
As the packages version is inferred by `create.sh` from the `VERSION` file, this is the recommended behaviour:

  - Improve code.
  - Raise `VERSION` (mind semantic versioning).
  - Commit, tag and push the stuff:
    git add VERSION; git commit -m "raise VERSION to `cat VERSION`"
    git tag -a "`cat VERSION`" -m "`cat VERSION`"
    git push && git push --tags

### License

Copyright 2015, 2016 Felix Wolfsteller.

Released under the [GPLv3](LICENSE) (or any later version) as included as LICENSE file.

### Contribute

You are welcome, drop me a line and issue a Pull Request.

### Known TODOs

 * be more defensive
 * be more defensive, 2: escaping
 * set proper timeouts for the wget-call
