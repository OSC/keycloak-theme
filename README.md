# OnDemand Keycloak theme

Currently updated to work with Keycloak 4.2.1.

## Install

1. cd to keycloak/themes directory
2. git clone or wget and untar this repo, renaming the directory to `ood-keycloak`
3. create an override theme based on this (examples under `example_overrides`)  or use base theme as it is


i.e.


```
cd /opt/keycloak-4.2.1/themes
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

* login/messages/messages_en.properties:

  ```
  logintitle=Login to the Ohio Supercomputer Center
  loginTitleHtml=<p class="lead">Log in with your OSC username and password.</p>
  summary=The Ohio Super Computer Center (OSC)
  ```

* theme.properties

  ```
  parent=ood-keycloak

  oodFooterLinks="Forgot your password?==https://www.osc.edu/content/password_change_policy_faqs,,Need Help?==https://www.osc.edu/contact/supercomputing_support,,Register for a new account==https://www.awesim.org/en/signup"
  ```



## Maintaining

The template.ftl and login.ftl templates have been modified from the originals in base/login/template.ftl and base/login/login.ftl.
When upgrading to a new version of KeyCloak, verify that this base template did not change.

```
$ diff /opt/keycloak-4.2.1.Final/themes/base/login/template.ftl /opt/keycloak-4.3.0.Final/themes/base/login/template.ftl
$ diff /opt/keycloak-4.2.1.Final/themes/base/login/login.ftl /opt/keycloak-4.3.0.Final/themes/base/login/login.ftl
```

## LICENSE

- Code licensed under MIT License
- Brand icons are not. All OSC and AweSim brand icons are trademarks of OSC.
  These icons should only be used to represent OSC. TotalSim brand icons are trademarks of TotalSim LLC.
  These icons should only be used to represent TotalSim LLC.
  Please do not use brand logos for any purpose except to represent
  that particular brand or service.


The MIT License (MIT)

Copyright (c) 2016 Ohio Supercomputer Center

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
