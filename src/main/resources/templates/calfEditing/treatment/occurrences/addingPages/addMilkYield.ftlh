<div class="modal fade smallText" id="days90Modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add Milk Yield</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <form method="post" action="/addOccurrence" enctype="multipart/form-data">

                        <div class="container">

                            <div class="form-group">
                                <label for="date">Date</label>
                                <input type="date" required
                                       value="${aDate?string.iso}"
                                       data-date-format=yyyy-MM-dd"
                                       class="form-control form-control-sm date"
                                       id="date"
                                       name="date">
                            </div>

                            <div class="form-group">
                                <label for="lactationRange">Lactation Number</label>
                                <input type="range" class="custom-range" min="1" max="10" value="1" step="1"
                                       id="lactationRange"
                                       name="lactationNumber">
                                <p>Value: <span id="lactationValue"></span></p>
                            </div>

                            <div class="form-group">
                                <label for="kilograms">Milk Yield Kg</label>
                                <input required type="text"
                                       class="form-control form-control-sm number"
                                       name="kilograms"
                                       id="kilograms">
                            </div>

                            <div class="form-group">

                                <label for="OEIList">Occurrence extra info</label>
                                <span>
                                        <i type="button" class="fas fa-plus" id="addMilkYieldOEI"></i>
                                    </span>
                                <select class="custom-select custom-select-sm"
                                        multiple="multiple"
                                        name="OEIList"
                                        id="OEIList">

                                    <#if milkYieldOEI?has_content>

                                        <#list milkYieldOEI as conditionScoreExtra>
                                            <option value="${conditionScoreExtra.getId()}">${conditionScoreExtra.getName()}</option>
                                        </#list>

                                    <#else>

                                        <option value="-1"> No Data for this occurrence</option>

                                    </#if>

                                </select>

                            </div>

                            <div id="milkYieldOEIPanel" class="hidden">

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

                        </div>

                        <div class="form-group submitForm">
                            <button type="submit"
                                    class="btn btn-outline-secondary btn-sm">Accept
                            </button>
                        </div>

                        <input type="hidden" name="calf" value="${calf.id}">
                        <input type="hidden" name="occurrenceType" value="MILK_YIELD">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

    let lactationSlider = document.getElementById("lactationRange");
    let lactationOutput = document.getElementById("lactationValue");

    lactationOutput.innerHTML = lactationSlider.value;

    lactationSlider.oninput = function () {
        lactationOutput.innerHTML = this.value;
    }

    $("#addMilkYieldOEI").click(function () {

        $("#milkYieldOEIPanel").slideToggle(100);

        $('#addMilkYieldOEI').toggleClass("fas fa-plus");
        $('#addMilkYieldOEI').toggleClass("fas fa-minus");

    })

</script>