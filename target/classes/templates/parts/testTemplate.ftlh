<#import "common.ftlh" as c>
<@c.page>

    <div class="border rounded-0 border-info register-photo">
        <div class="border rounded-0 shadow-lg form-container">

            <div class="image-holder"></div>

            <form method="post">
                <h2 class="text-center"><strong>Wellcome Back!</strong></h2>
                <div class="form-group"><input type="email" class="form-control" name="email" placeholder="User Name" /></div>
                <div class="form-group"><input type="password" class="form-control" name="password" placeholder="Password" /></div><button class="btn btn-block text-white bg-primary border rounded-0" type="button">Sign In</button>
                <hr /><button class="btn btn-success btn-block border rounded-0" type="button">Register</button></form>
        </div>
    </div>
</@c.page>
