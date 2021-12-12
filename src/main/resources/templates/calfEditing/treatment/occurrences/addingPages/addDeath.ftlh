<div class="modal fade" id="deathModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add Death</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <form method="post" action="/addOccurrence" enctype="multipart/form-data">

                        <div class="container scrollWindow">

                            <div class="form-group">

                                <label for="deathDate">Date</label>
                                <input type="date" required
                                       id="deathDate"
                                       value="${aDate?string.iso}"
                                       data-date-format=yyyy-MM-dd" class="form-control form-control-sm date"
                                       name="date">

                            </div>

                            <div class="form-group">

                                <label for="deathMethod">Method</label>
                                <select class="custom-select custom-select-sm"
                                        name="deathMethod"
                                        id="deathMethod">

                                    <#list deathMethod as m>
                                        <option value="${m}">${m.getText()}</option>
                                    </#list>

                                </select>

                            </div>

                            <div class="form-group">

                                <label for="deathReason">Reason</label>
                                <select class="custom-select custom-select-sm"
                                        name="deathReason"
                                        id="deathReason">

                                    <#list deathReason as r>
                                        <option value="${r}">${r.getText()}</option>
                                    </#list>

                                </select>
                            </div>

                            <div class="form-group">

                                <label for="deathWhereTo">Where To</label>
                                <select class="custom-select custom-select-sm"
                                        name="OEIList"
                                        id="deathWhereTo">

                                    <#if deathWhereTo?has_content>

                                        <#list deathWhereTo as deathExtra>
                                            <option value="${deathExtra.getId()}">${deathExtra.getName()}</option>
                                        </#list>

                                    <#else>

                                        <option value="-1"> No Data for this occurrence</option>

                                    </#if>

                                </select>

                            </div>

                            <div class="form-group">

                                <label for="deathCause">Cause</label>
                                <select class="custom-select custom-select-sm"
                                        multiple="multiple"
                                        name="OEIList"
                                        id="deathCause">

                                    <#if deathCause?has_content>

                                        <#list deathCause as deathExtra>
                                            <option value="${deathExtra.getId()}">${deathExtra.getName()}</option>
                                        </#list>

                                    <#else>

                                        <option value="-1"> No Data for this occurrence</option>

                                    </#if>

                                </select>

                            </div>

                            <div class="form-group">

                                <label for="vetNotes">Veterinary Notes</label>
                                <select class="custom-select custom-select-sm"
                                        multiple="multiple"
                                        name="OEIList"
                                        id="vetNotes">

                                    <#if deathVeterinaryNotes?has_content>

                                        <#list deathVeterinaryNotes as deathExtra>
                                            <option value="${deathExtra.getId()}">${deathExtra.getName()}</option>
                                        </#list>

                                    <#else>

                                        <option value="-1"> No Data for this occurrence</option>

                                    </#if>

                                </select>

                            </div>

                            <div class="hidden" id="slaughterPanel">

                                <div class="form-group">
                                    <label for="slaughterWeight">Slaughter weight</label>
                                    <input type="text"
                                           class="form-control form-control-sm number"
                                           name="slaughterWeight"
                                           id="slaughterWeight"/>
                                </div>

                                <div class="form-group">
                                    <label for="carcassRating">Carcass rating</label>
                                    <select class="custom-select custom-select-sm"
                                            name="carcassRating"
                                            id="carcassRating">

                                        <#list carcassRating as c>
                                            <option value="${c}">${c.getText()}</option>
                                        </#list>

                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="fatRating">Fat Rating</label>
                                    <input type="range"
                                           class="custom-range"
                                           min="1"
                                           max="9"
                                           step="1"
                                           id="fatRating"
                                           name="fatRating">
                                    <p>Value: <span id="fatRatingValue"></span></p>
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
                        <input type="hidden" name="occurrenceType" value="DEATH">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

    $("#addDeathOEI").click(function () {

        $("#deathOEIPanel").slideToggle(100);

        $('#addDeathOEI').toggleClass("fas fa-plus");
        $('#addDeathOEI').toggleClass("fas fa-minus");

    })

    $("#fatRatingValue").html($("#fatRating").val())

    $("#fatRating").change(function () {

        $("#fatRatingValue").html(this.value);

    });

    let euthanasia = "${deathMethod[1]}";
    let slaughter = "${deathMethod[2]}";

    $("#deathMethod").change(function () {

        let selected = $("#deathMethod").val();
        let slaughterPanel = $("#slaughterPanel");

        switch (selected) {

            case "DEATH":
            case euthanasia :
                slaughterPanel.hide();
                break;

            case slaughter :
                slaughterPanel.show();
                break;

        }

    });

</script>




