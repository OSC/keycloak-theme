<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("loginTitle",realm.name)}
    <#elseif section = "header">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        ${msg("loginTitleHtml",realm.name)}
    <#elseif section = "form">
        <iframe id="duo_iframe" data-host="${apihost}" data-sig-request="${sig_request}" data-post-action="${url.loginAction}">
        </iframe>
        <style>
            #duo_iframe {
                width: 100%;
                min-width: 304px;
                max-width: 620px;
                height: 330px;
                border: none;
            }
        </style>
        <form id="kc-totp-login-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <div class="form-group">
                <div id="kc-form-buttons" class="col-md-offset-2 col-md-10 submit">
                    <div class="">
                        <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}" name="cancel" value="Cancel">${msg("doCancel")}</button>
                    </div>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
