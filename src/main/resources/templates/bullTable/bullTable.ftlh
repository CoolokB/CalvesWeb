<#import "../parts/common.ftlh" as c>

<@c.page>
    <#include "addBull.ftlh" />

    <#if !bullsList?has_content>

        <button class="btn btn-outline-light mt-2 ml-2" data-toggle="modal" data-target="#addBull">Add Bull</button>

    <#else>

        <div class="card shadow mt-1 ml-1 mr-1 hiddenScrollBar">
            <div class="tableFixHead mainTable table-responsive">
                <table class="table table-sm">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Breed</th>
                        <th>Link</th>
                        <th></th>
                        <th>
                            <a href="#" data-toggle="modal" data-target="#addBull">
                                <i class="fas fa-plus"></i>
                            </a>
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list bullsList as bull>

                        <tr>
                            <td style="width: 32vw">${bull.getName()}</td>
                            <td style="width: 32vw">${bull.getBullBreed()}</td>
                            <td style="width: 32vw">
                                <a href="${bull.getLink()}" target="_blank">Go To Bull</a></td>
                            <td style="width: 2vw">
                                <a href onclick="openNewWindow('/editBull/${bull.getId()}'); return false">
                                    <i class="far fa-edit"></i>
                                </a>
                            </td>
                            <td style="width: 2vw">
                                <a href="/deleteBull/${bull.getId()}"
                                   onclick="return confirm('Are you sure you want to delete ${bull.getName()} ?')">
                                    <i class="far fa-trash-alt"></i>
                                </a>
                            </td>
                        </tr>

                    </#list>
                    </tbody>
                </table>
            </div>
        </div>
    </#if>

</@c.page>

<script>

    let newWindow;

    function openNewWindow(url) {

        newWindow = window.open(url, "Edit", "top=300,width=500,height=430");
    }

    window.onunload = function () {
        if (newWindow && !newWindow.closed) {
            newWindow.close();
        }
    };

</script>





