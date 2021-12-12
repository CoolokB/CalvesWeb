<#import "../parts/common.ftlh" as c>

<@c.page>

    <#include "addMedicine.ftlh" />

    <#if !medicines?has_content>

        <button class="btn btn-outline-light mt-2 ml-2" data-toggle="modal" data-target="#addMedicineModal">Add Medicine
        </button>

    <#else>

        <div class="card shadow mt-1 ml-1 mr-1">
            <div class="tableFixHead mainTable table-responsive hiddenScrollBar">
                <table class="table table-sm">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Type</th>
                        <th>Milk Normal</th>
                        <th>Slaughter</th>
                        <th>Calving <= X</th>
                        <th>Calving from X</th>
                        <th>Calving to X</th>
                        <th>Calving >= X</th>
                        <th>Milk <= X</th>
                        <th>Milk from to X</th>
                        <th>Milk >= X</th>
                        <th>Link</th>
                        <th></th>
                        <th>
                            <a href="#" data-toggle="modal" data-target="#addMedicineModal">
                                <i class="fas fa-plus"></i>
                            </a>
                        </th>

                    </tr>
                    </thead>
                    <tbody>
                    <#list medicines as medicine>

                        <tr>
                            <td>${medicine.getName()}</td>
                            <td>${medicine.getType().getText()}</td>
                            <td>${medicine.getWithdrawalMilkNormal()}</td>
                            <td>${medicine.getWithdrawalSlaughter()}</td>
                            <td>${medicine.getCalvingLessX()}</td>
                            <td>${medicine.getCalvingFromX()}</td>
                            <td>${medicine.getCalvingToX()}</td>
                            <td>${medicine.getCalvingMoreX()}</td>
                            <td>${medicine.getMilkLessX()}</td>
                            <td>${medicine.getMilkFromToX()}</td>
                            <td>${medicine.getMilkMoreX()}</td>
                            <td>
                                <#if medicine.getLink()?has_content>
                                    <a href="${medicine.getLink()}" target="_blank">Go To Medicine</a>
                                </#if>
                            </td>
                            <td>
                                <a href onclick="openNewWindow('/editMedicine/${medicine.getId()}'); return false">
                                    <i class="far fa-edit"></i>
                                </a>
                            </td>

                            <td>
                                <a href="/deleteMedicine/${medicine.getId()}"
                                   onclick="return confirm('Are you sure you want to delete ${medicine.getName()}?')">
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

    let rr;

    function openMedicineEditing(id) {
        rr = window.open("/editMedicine/" + id, "Edit", "top=300,width=500,height=430");

    }

    window.onunload = function () {
        if (rr && !rr.closed) {
            rr.close();
        }
    };


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





