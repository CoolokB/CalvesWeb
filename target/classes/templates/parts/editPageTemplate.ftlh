<#macro page title>
    <link rel="stylesheet" href="/static/css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
          crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/5206a6b817.js" crossorigin="anonymous"></script>


    <div class="card shadow mx-auto editCard mt-3 mb-3" id="heightDetectionID">

        <div class="card-header">
            <h4 class="card-title">${title}</h4>
        </div>

        <div class="card-body">
            <form method="post" enctype="multipart/form-data">

                <div class="form-group editContainer">

                    <#nested>

                </div>

                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            </form>
        </div>

    </div>

    <script>

        window.onunload = refreshParent;

        function refreshParent() {

            window.close();
            window.opener.location.reload();

        }

        let numberFields = $(".number");

        for (let i = 0; i < numberFields.length; i++) {

            numberFields[i].onkeydown =
                function replace() {
                    return (event.ctrlKey || event.altKey
                        || (47
                            < event.keyCode && event.keyCode < 58 && event.shiftKey == false)
                        || (95
                            < event.keyCode && event.keyCode < 106)
                        || (event.keyCode == 8) || (event.keyCode == 9)
                        || (event.keyCode > 34 && event.keyCode < 40)
                        || (event.keyCode == 46));
                }

        }

    </script>
</#macro>