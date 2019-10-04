<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        ${msg("errorTitle")}
    <#elseif section = "form">
        <div class="alert alert-error" id="kc-error-message">
            <p class="instruction">${message.summary}</p>
            <#if message.summary = "Unexpected error when authenticating with identity provider">
                This error could be caused by your account already having a mapping for CILogon.</br>
                You may remove your existing mapping through the <a href="/auth/realms/${realm.name}/account/identity">Identity management page</a>
            </#if>
            <#if client?? && client.baseUrl?has_content>
                <p><a id="backToApplication" href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
            </#if>
        </div>
    </#if>
</@layout.registrationLayout>
