<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=layout.showSocial; section>
    <#if section = "header">
        ${msg("doLogIn")}
    <#elseif section = "form">
    <div id="kc-form" <#if realm.password && social.providers??>class="${properties.kcContentWrapperClass!}"</#if>>
      <div id="kc-form-wrapper" <#if layout.showSocial >class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}"<#else>class="${properties.kcFormContentClass}"</#if>>
        <#if realm.password>
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                <div class="${properties.kcFormGroupClass!}">
                    <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>

                    <#if usernameEditDisabled??>
                        <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" disabled />
                    <#else>
                        <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}"  type="text" autofocus autocomplete="off" />
                    </#if>
                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                    <input tabindex="2" id="password" class="${properties.kcInputClass!}" name="password" type="password" autocomplete="off" />
                </div>

                <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                    <div id="kc-form-options">
                        <#if realm.rememberMe && !usernameEditDisabled??>
                            <div class="checkbox">
                                <label>
                                    <#if login.rememberMe??>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                                    <#else>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                                    </#if>
                                </label>
                            </div>
                        </#if>
                        </div>
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                            <#if realm.resetPasswordAllowed>
                                <span><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                            </#if>
                        </div>

                  </div>

                  <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                    <input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogInButton")}"/>
                  </div>
            </form>
            <hr>
        <#if properties.oodFooterLinks?has_content>
          <ul class="list-inline">
            <#list properties.oodFooterLinks?split(properties.oodFooterLinksDelimiter) as footerLink>
              <li><a href="${footerLink?split(properties.oodFooterLinkDelimiter)[1]}">${footerLink?split(properties.oodFooterLinkDelimiter)[0]}</a></li>
            </#list>
          </ul>
        </#if>
        </#if><#-- <#if realm.password> -->
	  </div>
        <#if layout.showSocial>
            <div id="kc-social-providers" class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}">
                <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 4>${properties.kcFormSocialAccountDoubleListClass!}</#if>">
                    <#list social.providers as p>
                        <li class="${properties.kcFormSocialAccountListLinkClass!}"><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span>Log in with third party through ${p.displayName}</span></a></li>
                        <#if p.alias = "cilogon">
                            <div class="thumbnail">
                                <h4 style="text-align: center;">Step 1. Choose your identity provider<br><small>CILogon provides access to identity providers from many academic institutions across the state.</small></h4>
                                <img class="img-rounded img-responsive center-block" alt="100%x200" src="${url.resourcesPath}/img/login1.png" style="display: block;">
                            </div>
                            <div class="thumbnail">
                                <h4 style="text-align: center;">Step 2. Login via your provider<br><small>For example, here I've chosen Ohio State University as my provider and am presented OSU's login page.</small></h4>
                                <img class="img-rounded img-responsive center-block" data-src="holder.js/100%x200" alt="100%x200" src="${url.resourcesPath}/img/login2.png" style="display: block;">
                            </div>
                            <div class="thumbnail">
                                <h4 style="text-align: center;">Step 3. Map it to your HPC account (first login only)<br>
                                    <small>If it is the first time logging in with this provider, you will need to associate it with your HPC account.</small>
                                </h4>
                                <img class="img-rounded img-responsive center-block" data-src="holder.js/100%x200" alt="100%x200" src="${url.resourcesPath}/img/login3.png" style="display: block;">
                            </div>
                            <li class="${properties.kcFormSocialAccountListLinkClass!}"><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span>Log in with third party through ${p.displayName}</span></a></li>
                        </#if>
                    </#list>
                </ul>
            </div>
	    </#if>
      </div>

    <div class="col-sm-10 col-sm-offset-1 col-md-6 col-md-offset-3">${msg("footer")?no_esc}</div>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
            <div id="kc-registration">
                <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>
