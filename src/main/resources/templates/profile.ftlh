<#import "parts/common.ftlh" as c>
<@c.page>
    <div class="card bg-light shadow mt-4 ml-4">
        <div class="card-header py-2">
            <h4>${username}</h4>
        </div>
        <div class="card-body">
            ${message!}
            <form method="post">
                <div class="form-group">
                    <label>Password:</label>

                        <input type="password" name="password" class="form-control" placeholder="Password"/>

                </div>
                <div class="form-group">
                    <label>Email:</label>

                        <input type="email" name="email" class="form-control" placeholder="some@some.com"
                               value="${email!''}"/>

                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class="form-group">
                    <button class="btn btn-primary btn-sm" type="submit">Save</button>
                </div>
            </form>
        </div>
    </div>
</@c.page>
