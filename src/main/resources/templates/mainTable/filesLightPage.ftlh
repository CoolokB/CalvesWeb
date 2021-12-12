<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
      integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
      crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>

<div class="row row-cols-5 mt-3 mb-3 ml-3 mr-3" style="min-width: 700px">

    <#list calf.getFileList() as file>

        <div class="col mb-3">
            <div>
                <a href="/img/${file.fileName}" download>
                    <img src="../../../static/media/fileIcon.png" alt="file"
                         data-toggle="tooltip" data-placement="top"
                         title="Uploaded : ${file.date}">
                </a>
            </div>

            <span class="fileName">${file.fileOriginalName}</span>

        </div>

    </#list>

</div>
