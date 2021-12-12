<#import "../parts/common.ftlh" as c>

<@c.page>

    <div class="card shadow mt-1 ml-1 mr-1">
        <div class="tableFixHead mainTable table-responsive hiddenScrollBar">

            <table class="table table-sm" id="test">

                <thead>
                <tr>

                    <th>ID</th>
                    <th>Status</th>
                    <th>Days</th>
                    <th>
                        <a href="#" data-toggle="modal" data-target="#searchModal">
                            <i class="fas fa-search"></i>
                        </a>
                    </th>
                    <th>

                        <a href="#" data-toggle="modal" data-target="#addCalf">
                            <i class="fas fa-plus"></i>
                        </a>

                    </th>
                    <th>
                        <a href="#" id="multipleChoice">
                            <i class="fas fa-list"></i>
                        </a>
                    </th>
                </tr>
                </thead>
                <tbody>

                <#list calves as calf>
                    <tr>

                        <td>${calf.getCalfId()}</td>
                        <td>${calf.getBullingInfo().getStatus()}</td>
                        <td>${calf.getBullingInfo().getDays()}</td>

                    </tr>
                </#list>

                </tbody>

            </table>

        </div>
    </div>

</@c.page>