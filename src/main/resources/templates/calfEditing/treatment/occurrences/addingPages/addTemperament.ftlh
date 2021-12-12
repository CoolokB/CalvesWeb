<div class="modal fade smallText" id="temperamentModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add Temperament</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <form method="post" action="/addOccurrence" enctype="multipart/form-data">

                        <div class="container">

                            <div class="form-group">
                                <label for="temperamentModalDate">Date</label>
                                <input type="date" required
                                       value="${aDate?string.iso}"
                                       data-date-format=yyyy-MM-dd" class="form-control form-control-sm date"
                                       name="date">
                            </div>

                            <div class="form-group">

                                <label for="OEIList">Description</label>
                                <span>
                                        <i type="button" class="fas fa-plus" id="addTemperamentOEI"></i>
                                    </span>
                                <select class="custom-select custom-select-sm"
                                        multiple="multiple"
                                        name="OEIList"
                                        id="OEIList">

                                    <#if temperamentOEI?has_content>

                                        <#list temperamentOEI as temperamentExtra>
                                            <option value="${temperamentExtra.getId()}">${temperamentExtra.getName()}</option>
                                        </#list>

                                    <#else>

                                        <option value="-1"> No Data for this occurrence</option>

                                    </#if>

                                </select>

                            </div>

                            <div id="temperamentOEIPanel" class="hidden">

                                <div class="form-group">

                                    <label for="name">Name</label>
                                    <input type="text"
                                           class="form-control form-control-sm noSpace"
                                           id="name"
                                           name="name">
                                </div>

                                <div class="form-group">

                                    <label for="commentary">Commentary</label>
                                    <textarea class="form-control form-control-sm noSpace"
                                              name="commentary"
                                              id="commentary"
                                              rows="1"></textarea>
                                </div>

                            </div>

                            <div class="form-group">
                                <label>File</label>
                                <div class="custom-file">
                                    <input type="file"
                                           id="customFile"
                                           name="files"
                                           multiple="multiple"
                                           class="custom-file-input form-control-sm">
                                    <label class="custom-file-label col-form-label-sm" for="customFile">Choose file</label>
                                </div>
                            </div>

                        </div>

                        <div class="form-group submitForm">
                            <button type="submit"
                                    class="btn btn-outline-secondary btn-sm">Accept
                            </button>
                        </div>

                        <input type="hidden" name="calf" value="${calf.id}">
                        <input type="hidden" name="occurrenceType" value="TEMPERAMENT">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>


    $("#addTemperamentOEI").click(function () {

        $("#temperamentOEIPanel").slideToggle(100);

        $('#addTemperamentOEI').toggleClass("fas fa-plus");
        $('#addTemperamentOEI').toggleClass("fas fa-minus");

    })

</script>