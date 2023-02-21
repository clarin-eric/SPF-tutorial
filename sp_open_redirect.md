# Shibboleth Service Provider open redirect vulnerability

## Test if your Service Provider is vulnerable:

Goto:
```
https://sp.example.org/Shibboleth.sso/Logout?return=https://en.wikipedia.org/wiki/URL_redirection
```
where `sp.example.org` is replaced by the hostname for your service provider (SP).

Example (error page is expected): `https://catalog.clarin.eu/Shibboleth.sso/Logout?return=https://en.wikipedia.org/wiki/URL_redirection`.

* If this link shows an SP error page, you are not affected.
* If this link shows the wikipedia page, you are affected and must update your SP config (continue with the section below).

## Steps to resolve the Shibboleth SP open redirect issue:
1. Service provider is version 2.5 or above. Version 3.x.x or later is strongly recommended.
2. Add `redirectLimit="exact"` to all `<Sessions ...>` elements in your shibboleth2.xml (i.e. `/etc/shibboleth/shibboleth2.xml`).
3. Test your config with `shibd -t`. If the config is fine, the shibboleth deamon does not need to be restarted, however if the issue persist please restart the daemon before contacting sysops@clarin.eu.

## References
See the following links on more information what options are available for the `redirectLimit` attribute:
- https://shibboleth.atlassian.net/wiki/spaces/SHIB2/pages/2577072330/NativeSPSessions
- https://shibboleth.atlassian.net/wiki/spaces/SP3/pages/2065334342/Sessions
Other usefull links (taken from the original DFN email) describing the issue:
- https://shibboleth.net/pipermail/users/2019-October/045311.html
- https://shibboleth.atlassian.net/browse/SSPCPP-714