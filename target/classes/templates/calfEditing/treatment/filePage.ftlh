<div class="container" style="margin-left: -0.92rem;opacity: 0.94">

    <button class="btn btn-light btn-sm bg-white" data-toggle="modal" data-target="#fileAddModal">Upload New File</button>

    <#if calf.getFileList()?has_content>
        <div class="container scrollTreatment bg-white hiddenScrollBar">

            <div class="row row-cols-5 mt-3 mb-3">

                <#list calf.getFileList() as file>

                    <div class="col fileCard mb-3">
                        <div>
                            <a href="/img/${file.fileName}" download>
                                <img class="fileImage" src="../../../static/media/fileIcon.png" alt="file"
                                     data-toggle="tooltip" data-placement="top"
                                     title="Uploaded : ${file.date}">
                            </a>
                        </div>

                        <span class="fileName">${file.fileOriginalName}</span>
                        <a class="hidden deleteFileButton"
                           href="/deleteFile?calf=${calf.id}&fileName=${file.fileName}" onclick="return confirm('Are you sure you want to delete?')">
                            <i class="far fa-trash-alt"></i>
                        </a>

                    </div>

                </#list>

            </div>

        </div>
    </#if>

</div>

<div class="modal fade" id="fileAddModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add Files</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form method="post" action="/addCalfFiles" enctype="multipart/form-data">

                    <div class="container">
                        <div class="form-group">
                            <div class="custom-file">
                                <input type="file"
                                       id="customFile"
                                       name="files"
                                       multiple="multiple"
                                       class="custom-file-input form-control-sm">
                                <label class="custom-file-label col-form-label-sm" for="customFile">Choose
                                    file</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group submitForm">
                        <button type="submit" class="btn btn-outline-secondary btn-sm">
                            Accept
                        </button>
                    </div>

                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <input type="hidden" name="calf" value="${calf.id}">
                </form>
            </div>
        </div>
    </div>
</div>


