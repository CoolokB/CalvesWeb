<div class="modal fade" id="conditionScoreModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add Condition Score</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <form method="post" action="/addOccurrence" enctype="multipart/form-data">

                        <div class="container">

                            <div class="form-group">
                                <label for="conditionScoreDate">Date</label>
                                <input type="date" required
                                       value="${aDate?string.iso}"
                                       id="conditionScoreDate"
                                       data-date-format=yyyy-MM-dd"
                                       class="form-control form-control-sm date"
                                       name="date">
                            </div>

                            <div class="form-group">
                                <label for="conditionRange">Score</label>
                                <input type="range"
                                       class="custom-range"
                                       min="1"
                                       max="5"
                                       step="0.5"
                                       id="conditionRange"
                                       name="score">
                                <p>Value: <span id="conditionValue"></span></p>
                            </div>

                            <div class="form-group">

                                <label for="OEIList">Occurrence extra info</label>
                                <span>
                                        <i type="button" class="fas fa-plus" id="addConditionScoreOEI"></i>
                                    </span>
                                <select class="custom-select custom-select-sm"
                                        multiple="multiple"
                                        name="OEIList"
                                        id="OEIList">

                                    <#if conditionScoreOEI?has_content>

                                        <#list conditionScoreOEI as conditionScoreExtra>
                                            <option value="${conditionScoreExtra.getId()}">${conditionScoreExtra.getName()}</option>
                                        </#list>

                                    <#else>

                                        <option value="-1"> No Data for this occurrence</option>

                                    </#if>

                                </select>

                            </div>

                            <div id="conditionScoreOEIPanel" class="hidden">

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
                                    <label class="custom-file-label col-form-label-sm" for="customFile">Choose
                                        file</label>
                                </div>
                            </div>

                        </div>

                        <div class="form-group submitForm">
                            <button type="submit"
                                    class="btn btn-outline-secondary btn-sm">Accept
                            </button>
                        </div>

                        <input type="hidden" name="calf" value="${calf.id}">
                        <input type="hidden" name="occurrenceType" value="CONDITION_SCORE">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

    let slider = document.getElementById("conditionRange");
    let output = document.getElementById("conditionValue");

    output.innerHTML = slider.value;

    slider.oninput = function () {
        output.innerHTML = this.value;
    }

    $("#addConditionScoreOEI").click(function () {

        $("#conditionScoreOEIPanel").slideToggle(100);

        $('#addConditionScoreOEI').toggleClass("fas fa-plus");
        $('#addConditionScoreOEI').toggleClass("fas fa-minus");

    })

</script>