<#import "parts/common.ftlh" as c>

<@c.page>

    <div class="card shadow mt-1 ml-1 mr-1">
        <div class="tableFixHead  table-responsive hiddenScrollBar">
            <table class="table table-sm">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Role</th>
                    <th></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>

                <#list users as user>

                    <tr>
                        <td>${user.username}</td>
                        <td><#list user.roles as role>${role}<#sep>, </#list></td>
                        <td style="width: 2vw">
                            <a href
                               onclick="openNewWindowWideTest('/user/${user.id}'); return false">
                                <i class="far fa-edit"></i></a>
                        </td>
                        <td style="width: 2vw"><a href="/user/${user.id}"> <i class="far fa-trash-alt"></i></a></td>

                    </tr>
                </#list>

                </tbody>
            </table>
        </div>
    </div>

</@c.page>

<script>

    function openNewWindowWideTest(url) {

        let occurrenceEditingWindow = window.open(url, "Edit", "top=300");

        window.onunload = function () {

            if (occurrenceEditingWindow && !occurrenceEditingWindow.closed) {
                occurrenceEditingWindow.close();
            }
        };
    }

</script>


