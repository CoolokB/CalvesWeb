<#import "../parts/common.ftlh" as c>

<@c.page>
    <#include "addOccurrenceExtraInfo.ftlh" />

    <#if !occurrenceExtraInfoList?has_content>

        <button class="btn btn-outline-light mt-2 ml-2" data-toggle="modal" data-target="#addORModal">Add Occurrence
            Extra Info
        </button>

    <#else>

        <div class="card shadow mt-1 ml-1 mr-1 hiddenScrollBar">
            <div class="tableFixHead mainTable table-responsive">
                <table class="table table-sm">
                    <thead>
                    <tr>
                        <th>Text</th>
                        <th>Parent</th>
                        <th>Field</th>
                        <th></th>
                        <th>
                            <a href="#" data-toggle="modal" data-target="#addORModal">
                                <i class="fas fa-plus"></i>
                            </a>
                        </th>

                    </tr>
                    </thead>
                    <tbody>
                    <#list occurrenceExtraInfoList as OEI>

                        <tr>
                            <td style="width: 31vw">${OEI.getName()}</td>
                            <td style="width: 31vw">${OEI.getParent()}</td>
                            <td style="width: 31vw">${OEI.getExtraInfoField().getText()}</td>
                            <td style="width: 2vw">
                                <a href onclick="openNewWindow('/editOccurrenceExtraInfo/${OEI.getId()}'); return false">
                                    <i class="far fa-edit"></i>
                                </a>
                            </td>
                            <td style="width: 2vw">
                                <a href="/deleteOccurrenceExtraInfo/${OEI.getId()}"
                                   onclick="return confirm('Are you sure you want to delete ${OEI.getName()} ?')">
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

    function openNewWindow(url){

        newWindow = window.open(url, "Edit", "top=300,width=500,height=430");
    }

    window.onunload = function () {
        if (newWindow && !newWindow.closed) {
            newWindow.close();
        }
    };

</script>



