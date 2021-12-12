<#include "security.ftlh">
<#import "login.ftlh" as l>

<nav class="navbar navbar-expand py-0 myNavBar navbar-dark">
    <a class="navbar-brand text-white" href="/">CalvesWeb</a>
    <ul class="navbar-nav mr-auto">

        <#if user??>
            <li class="nav-item">
                <a class="nav-link text-light" href="/">Home</a>
            </li>
        </#if>

        <li class="nav-item">
            <a class="nav-link text-light" href="/test">Test</a>
        </li>

        <#if user??>
            <li class="nav-item">
                <a class="nav-link text-light" href="/mainTable">Calves</a>
            </li>
        </#if>

        <#if user??>
            <li class="nav-item">
                <a class="nav-link text-light" href="/medicineTable?show=ACTIVE">Medicines</a>
            </li>
        </#if>

        <#if user??>
            <li class="nav-item">
                <a class="nav-link text-light" href="/OEITable">Occurrence Extra Info</a>
            </li>
        </#if>

        <#if user??>
            <li class="nav-item">
                <a class="nav-link text-light" href="/bullTable">Bulls</a>
            </li>
        </#if>

        <#if user??>
            <li class="nav-item">
                <a class="nav-link text-light" href="/personTable">Persons</a>
            </li>
        </#if>

        <#if isAdmin>
            <li class="nav-item">
                <a class="nav-link text-light" href="/user">Users</a>
            </li>
        </#if>

        <#if user??>
            <li class="nav-item">
                <a class="nav-link text-light" href="/user/profile">Profile</a>
            </li>
        </#if>

    </ul>

    <#if user??>

        <div class="text-light">
            ${name}
        </div>

    </#if>

    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-link text-light" type="submit"><#if user??>Sign Out<#else>Log in</#if></button>
    </form>

</nav>
