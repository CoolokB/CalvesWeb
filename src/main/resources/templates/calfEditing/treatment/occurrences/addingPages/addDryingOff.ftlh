<div class="modal fade" id="dryingOffModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add Drying Off</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <form method="post" action="/addOccurrence" enctype="multipart/form-data">

                        <div class="container scrollWindow">

                            <div class="form-group">
                                <label for="date">Date</label>
                                <input type="date" required
                                       id="date"
                                       value="${aDate?string.iso}"
                                       data-date-format=yyyy-MM-dd" class="form-control form-control-sm date"
                                       name="date">
                            </div>

                            <div class="form-group">

                                <div class="label mb-1">Teat</div>

                                <div class="custom-control custom-switch">
                                    <input type="checkbox"
                                           class="custom-control-input"
                                           id="flSwitch"

                                           <#if previousDryingOff??>
                                               <#if previousDryingOff.isFl()>checked="checked"</#if>
                                           </#if>

                                           name="fl">
                                    <label class="custom-control-label"
                                           for="flSwitch">FL</label>
                                </div>

                                <div class="custom-control custom-switch">
                                    <input type="checkbox"
                                           class="custom-control-input"
                                           id="frSwitch"
                                            <#if previousDryingOff??>
                                                <#if previousDryingOff.isFr()>checked="checked"</#if>
                                            </#if>
                                           name="fr">
                                    <label class="custom-control-label"
                                           for="frSwitch">FR</label>
                                </div>

                                <div class="custom-control custom-switch">
                                    <input type="checkbox"
                                           class="custom-control-input"
                                           id="rlSwitch"
                                            <#if previousDryingOff??>
                                                <#if previousDryingOff.isRl()>checked="checked"</#if>
                                            </#if>
                                           name="rl">
                                    <label class="custom-control-label"
                                           for="rlSwitch">RL</label>
                                </div>

                                <div class="custom-control custom-switch">
                                    <input type="checkbox"
                                           class="custom-control-input"
                                           id="rrSwitch"
                                            <#if previousDryingOff??>
                                                <#if previousDryingOff.isRr()>checked="checked"</#if>
                                            </#if>
                                           name="rr">
                                    <label class="custom-control-label"
                                           for="rrSwitch">RR</label>
                                </div>

                            </div>

                            <div class="form-group">
                                <label for="dryingOffType">Type</label>
                                <select class="custom-select custom-select-sm" name="dryingOffType" id="dryingOffType">

                                    <#list dryingOffType as d>
                                        <option value="${d}">${d.getText()}</option>
                                    </#list>

                                </select>
                            </div>

                            <div class="form-group">
                                <label for="dryingOffClass">Class</label>
                                <select class="custom-select custom-select-sm" name="dryingOffClass"
                                        id="dryingOffClass">

                                    <#list dryingOffClass as c>
                                        <option value="${c}">${c.getText()}</option>
                                    </#list>

                                </select>
                            </div>

                            <div class="form-group">
                                <label for="dryingOffMedicine">Medicine</label>
                                <select class="custom-select custom-select-sm"
                                        name="medicine"
                                        id="dryingOffMedicine">

                                    <option>None</option>
                                    <#list noneAndNormalWithdrawalMedicines as m>
                                        <option value="${m.getId()}">${m.getName()}</option>
                                    </#list>

                                </select>
                            </div>

                            <div id="dryingOffMedicineInfo" class="hidden">
                                <div class="form-group">
                                    <label for="dryingOffPerson">Person</label>
                                    <select class="custom-select custom-select-sm"
                                            name="person"
                                            id="dryingOffPerson">
                                        <option>None</option>
                                        <#list people as p>
                                            <option value="${p.getId()}">${p.getName()}</option>
                                        </#list>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="dryingOffAmount">Amount</label>
                                    <input type="text"
                                           class="form-control form-control-sm noSpace"
                                           name="amount"
                                           id="dryingOffAmount"/>
                                </div>

                                <div class="form-group">

                                    <table class="table table-sm">
                                        <thead>
                                        <tr>

                                            <th>Medicine</th>
                                            <th>Amount</th>
                                            <th>Person</th>

                                        </tr>
                                        </thead>
                                        <tbody id="dryingOffMedicineTable">

                                        </tbody>

                                    </table>

                                </div>

                                <div class="form-group">

                                    <div class="button-bar">

                                    <span style="margin-left: 0.3vw">
                                        <i type="button" class="fas fa-plus" id="addDryingOffMedicine"></i>
                                    </span>

                                        <span style="margin-left: 2vw">
                                        <i type="button" class="fas fa-minus" id="deleteDryingOffMedicine"></i>
                                    </span>

                                    </div>

                                </div>
                            </div>

                            <div class="form-group">

                                <label for="OEIList">Occurrence extra info</label>
                                <span>
                                        <i type="button" class="fas fa-plus" id="addOEI"></i>
                                    </span>
                                <select class="custom-select custom-select-sm"
                                        multiple="multiple"
                                        name="OEIList"
                                        id="OEIList">

                                    <#if dryingOffOEI?has_content>

                                        <#list dryingOffOEI as doei>
                                            <option value="${doei.getId()}">${doei.getName()}</option>
                                        </#list>

                                    <#else>

                                        <option value="-1"> No Data for this occurrence</option>

                                    </#if>

                                </select>

                            </div>

                            <div id="OEIPanel" class="hidden">

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
                                    onclick="addDryingOffValidation()"
                                    class="btn btn-outline-secondary btn-sm">Accept
                            </button>
                        </div>

                        <input type="hidden" name="medicineInputSequenceArray" id="dryingOffMedicineInputSequenceArray">
                        <input type="hidden" name="calf" value="${calf.id}">
                        <input type="hidden" name="occurrenceType" value="DRYING_OFF">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

    let type = $('#dryingOffType');
    let dryingClass = $('#dryingOffClass');

    let routine = "${dryingOffClass[0]}";
    let teat = "${dryingOffClass[1]}";

    let dryingOff = "${dryingOffType[0]}";

    dryingClass.change(function () {

        let dryingClassValue = dryingClass.val();

        switch (dryingClassValue) {

            case routine :

                type.prop('disabled', true);
                type.val(dryingOff);
                break;

            case teat :
                type.prop('disabled', false);
                break;
        }

    });

    $("#addDryingOffOEI").click(function () {

        $("#conditionScoreOEIPanel").slideToggle(100);

        $('#addConditionScoreOEI').toggleClass("fas fa-plus");
        $('#addConditionScoreOEI').toggleClass("fas fa-minus");

    })


    let dryingOffMedicineInfo = [];

    $("#addDryingOffMedicine").click(function () {

        let parameters = {};

        parameters.medicineId = $('#dryingOffMedicine').val()
        parameters.personId = $('#dryingOffPerson').val()
        parameters.amount = $("#dryingOffAmount").val()

        dryingOffMedicineInfo.push(parameters);

        if ($("#dryingOffAmount").val() === "") {

            alert("Amount is empty")
            return false;
        }

        if ($("#dryingOffPerson").val() === "None") {

            alert("Person is undefined")
            return false;
        }

        let row = document.createElement("tr");

        let td1 = document.createElement("td");
        let td2 = document.createElement("td");
        let td3 = document.createElement("td");

        td1.append(document.createTextNode($('#dryingOffMedicine option:selected').text()));
        td2.append(document.createTextNode($("#dryingOffAmount").val()));
        td3.append(document.createTextNode($('#dryingOffPerson option:selected').text()));

        row.append(td1, td2, td3);

        $("#dryingOffMedicineTable").append(row);

        $("#dryingOffAmount").val('')

    })

    $("#deleteDryingOffMedicine").click(function () {

        $("#dryingOffMedicineTable tr:last-child").remove();

        dryingOffMedicineInfo.pop();

    });

    $("#dryingOffMedicine").change(function () {

        let value = $("#dryingOffMedicine").val();

        if (value === "None") {

            $("#dryingOffMedicineInfo").hide();

        } else {
            $("#dryingOffMedicineInfo").show();
        }

    })

    //Occurrence Extra Info

    $("#addOEI").click(function () {

        $("#OEIPanel").slideToggle(100);

        $('#addOEI').toggleClass("fas fa-plus");
        $('#addOEI').toggleClass("fas fa-minus");

    })


    $(".noSpace").change(function () {
        this.value = $.trim(this.value);
    });

    function addDryingOffValidation() {

        $('#dryingOffMedicineInputSequenceArray').val(JSON.stringify(dryingOffMedicineInfo));

    }

</script>
