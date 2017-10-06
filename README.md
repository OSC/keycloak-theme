# OnDemand Keycloak theme

1. cd to keycloak/themes directory
2. git clone or wget and untar this repo, renaming the directory to `ood-keycloak`
3. create an override theme based on this (examples under `example_overrides`)  or use base theme as it is


i.e.


```
cd /opt/keycloak-3.3.0.CR2/themes
git clone https://github.com/OSC/keycloak-theme.git ood-keycloak
cp -r ood-keycloak/example_overrides/awesim awesim
cp -r ood-keycloak/example_overrides/osc osc

# choose awesim or osc for appropriate realms
```

## Configuring

Example theme override:

```
awesim/
└── login
    ├── messages
    │   └── messages_en.properties
    ├── resources
    │   └── img
    │       ├── favicon.ico
    │       └── logo.png
    └── theme.properties
```


## Maintaining

Install by cloning this repo to /opt/keycloak-3.0.0.Final/themes/osc. Then make the files read only by the user keycloak.

The login.ftl template has been modified from the original in base/login/login.ftl.
When upgrading to a new version of KeyCloak, verify that this base template did not change.

```
$ diff /opt/keycloak-3.0.0.Final/themes/base/login/login.ftl /opt/keycloak-2.5.4.Final/themes/base/login/login.ftl
$
```

Only login.ftl has been modified, so if the user may access another page that uses a different template, we might consider adding the logo to template.ftl instead.

