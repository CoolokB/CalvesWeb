<#import "parts/editPageTemplate.ftlh" as e>

<@e.page "User Editor">

    <div class="form-group">
        <input type="text" class="form-control form-control-sm" name="username" value="${user.username}">
    </div>

    <#list roles as role>

        <div class="form-group">
            <label>
                <input type="checkbox"
                       name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}
            </label>
        </div>

    </#list>
    <input type="hidden" value="${user.id}" name="userId">
    <button type="submit" class="btn btn-outline-secondary btn-sm">Save</button>

</@e.page>
