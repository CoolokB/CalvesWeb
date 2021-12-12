<div class="modal fade" id="footBathModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add Foot Bath</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <form method="post" action="/addOccurrence" enctype="multipart/form-data">

                        <div class="container">

                            <div class="form-group">
                                <label for="footBathDate">Date</label>
                                <input type="date" required
                                       id="footBathDate"
                                       value="${aDate?string.iso}"
                                       data-date-format=yyyy-MM-dd" class="form-control form-control-sm date"
                                       name="date">
                            </div>

                            <div class="form-group">
                                <label for="footBathPlace">Place</label>
                                <select class="custom-select custom-select-sm" id="footBathPlace" name="footBathPlace">
                                    <#list placeOfHabitat as p>
                                        <option value="${p}">${p.getText()}</option>
                                    </#list>
                                </select>
                            </div>

                            <div class="form-group">

                                <label for="footBathChemical">Chemical</label>
                                <select class="custom-select custom-select-sm"
                                        multiple="multiple"
                                        name="OEIList"
                                        id="footBathChemical">

                                    <#if footBathChemical?has_content>

                                        <#list footBathChemical as fbc>
                                            <option value="${fbc.getId()}">${fbc.getName()}</option>
                                        </#list>

                                    <#else>

                                        <option value="-1"> No Data for this occurrence</option>

                                    </#if>

                                </select>

                            </div>

                            <div class="form-group">

                                <label for="footBathProblem">Problem</label>
                                <select class="custom-select custom-select-sm"
                                        multiple="multiple"
                                        name="OEIList"
                                        id="footBathProblem">

                                    <#if footBathProblem?has_content>

                                        <#list footBathProblem as fbp>
                                            <option value="${fbp.getId()}">${fbp.getName()}</option>
                                        </#list>

                                    <#else>

                                        <option value="-1"> No Data for this occurrence</option>

                                    </#if>

                                </select>

                            </div>

                            <div class="form-group">

                                <label for="OEIList">Occurrence extra info</label>
                                <span>
                                        <i type="button" class="fas fa-plus" id="addFootBathOEI"></i>
                                    </span>
                                <select class="custom-select custom-select-sm"
                                        multiple="multiple"
                                        name="OEIList"
                                        id="OEIList">

                                    <#if footBathOther?has_content>

                                        <#list footBathOther as fbo>
                                            <option value="${fbo.getId()}">${fbo.getName()}</option>
                                        </#list>

                                    <#else>

                                        <option value="-1"> No Data for this occurrence</option>

                                    </#if>

                                </select>

                            </div>

                            <div id="footBathOEIPanel" class="hidden">

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
                        <input type="hidden" name="occurrenceType" value="FOOT_BATH">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

    $("#addFootBathOEI").click(function () {

        $("#footBathOEIPanel").slideToggle(100);

        $('#addFootBathOEI').toggleClass("fas fa-plus");
        $('#addFootBathOEI').toggleClass("fas fa-minus");

    })



</script>
