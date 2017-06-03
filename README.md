# OSC Keycloak theme

This basic theme works for both OSC and AweSim realms. It assumes the realm names will be osc and awesim.
The logo that appears above the menu is `${realm.name!}-logo.png` i.e. `awesim-logo.png` or `osc-logo.png`.

Install by cloning this repo to /opt/keycloak-3.0.0.Final/themes/osc. Then make the files read only by the user keycloak.

The login.ftl template has been modified from the original in base/login/login.ftl.
When upgrading to a new version of KeyCloak, verify that this base template did not change.

```
$ diff /opt/keycloak-3.0.0.Final/themes/base/login/login.ftl /opt/keycloak-2.5.4.Final/themes/base/login/login.ftl
$
```

Only login.ftl has been modified, so if the user may access another page that uses a different template, we might consider adding the logo to template.ftl instead.

### TODO 

- [ ] build custom bootstrap - remove css you don't need
- [ ] if we should vary the create new account link between awesim and ondemand, use this:

```
<#if realm.name = 'osc'>add osc link here</#if>
<#if realm.name = 'awesim'>add awesim link here</#if>
```

