<div class="modal fade" id="castration_dehorningModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add Castration/Dehorning</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <form method="post" action="/addOccurrence" enctype="multipart/form-data">

                        <div class="container scrollWindow">

                            <div class="form-group">
                                <label for="castration_dehorningDate">Date</label>
                                <input type="date" required
                                       value="${aDate?string.iso}"
                                       data-date-format=yyyy-MM-dd"
                                       id="castration_dehorningDate"
                                       class="form-control form-control-sm date"
                                       name="date">
                            </div>

                            <div class="form-group">
                                <label for="castrationType">Type</label>
                                <select class="custom-select custom-select-sm"
                                        id="castrationType"
                                        name="castrationType">
                                    <#list castrationType as l>
                                        <option value="${l}">${l.getText()}</option>
                                    </#list>

                                </select>
                            </div>

                            <div class="form-group">
                                <label for="castrationDehorningMedicine">Medicine</label>
                                <select class="custom-select custom-select-sm"
                                        name="castrationDehorningMedicine"
                                        id="castrationDehorningMedicine">

                                    <option>None</option>
                                    <#list noneAndNormalWithdrawalMedicines as m>
                                        <option value="${m.getId()}">${m.getName()}</option>
                                    </#list>

                                </select>
                            </div>

                            <div id="castrationDehorningMedicineInfo" class="hidden">

                                <div class="form-group">
                                    <label for="castrationDehorningPerson">Person</label>
                                    <select class="custom-select custom-select-sm"
                                            name="castrationDehorningPerson"
                                            id="castrationDehorningPerson">

                                        <#if people?has_content>

                                            <#list people as p>
                                                <option value="${p.getId()}">${p.getName()}</option>
                                            </#list>
                                        <#else>
                                            <option>None</option>
                                        </#if>

                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="castrationDehorningAmount">Amount</label>
                                    <input type="text"
                                           class="form-control form-control-sm noSpace"
                                           name="castrationDehorningAmount"
                                           id="castrationDehorningAmount"/>
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
                                        <tbody id="castrationDehorningMedicineTable">

                                        </tbody>

                                    </table>

                                </div>

                                <div class="form-group">

                                    <div class="button-bar">

                                    <span style="margin-left: 0.3vw">
                                        <i type="button" class="fas fa-plus" id="addCastrationDehorningMedicine"></i>
                                    </span>

                                        <span style="margin-left: 2vw">
                                        <i type="button" class="fas fa-minus"
                                           id="deleteCastrationDehorningMedicine"></i>
                                    </span>

                                    </div>

                                </div>

                            </div>

                            <div class="form-group">

                                <label for="OEIList">Occurrence extra info</label>
                                <span>
                                        <i type="button" class="fas fa-plus" id="addCastrationDehorningOEI"></i>
                                    </span>
                                <select class="custom-select custom-select-sm"
                                        multiple="multiple"
                                        name="OEIList"
                                        id="OEIList">

                                    <#if castrationDehorningOEI?has_content>

                                        <#list castrationDehorningOEI as cdExtra>
                                            <option value="${cdExtra.getId()}">${cdExtra.getName()}</option>
                                        </#list>

                                    <#else>

                                        <option value="-1"> No Data for this occurrence</option>

                                    </#if>

                                </select>

                            </div>

                            <div id="castrationDehorningOEIPanel" class="hidden">

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
                                    onclick="return addCastrationDehorningValidation()"
                                    class="btn btn-outline-secondary btn-sm">Accept
                            </button>
                        </div>

                        <input type="hidden" name="medicineInputSequenceArray" id="castrationDehorningMedicineInputSequenceArray">
                        <input type="hidden" name="calf" value="${calf.getId()}">
                        <input type="hidden" name="occurrenceType" value="CASTRATION_DEHORNING">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    let castrationDehorningMedicineInfo = [];

    $("#addCastrationDehorningMedicine").click(function () {

        let parameters = {};

        parameters.medicineId = $('#castrationDehorningMedicine').val()
        parameters.personId = $('#castrationDehorningPerson').val()
        parameters.amount = $("#castrationDehorningAmount").val()

        castrationDehorningMedicineInfo.push(parameters);

        if ($("#castrationDehorningAmount").val() === "") {

            alert("Amount is empty")
            return false;
        }

        if ($("#castrationDehorningPerson").val() === "None") {

            alert("Person is undefined")
            return false;
        }

        let row = document.createElement("tr");

        let td1 = document.createElement("td");
        let td2 = document.createElement("td");
        let td3 = document.createElement("td");

        td1.append(document.createTextNode($('#castrationDehorningMedicine option:selected').text()));
        td2.append(document.createTextNode($("#castrationDehorningAmount").val()));
        td3.append(document.createTextNode($('#castrationDehorningPerson option:selected').text()));

        row.append(td1, td2, td3);

        $("#castrationDehorningMedicineTable").append(row);

        $("#castrationDehorningAmount").val('')

    })

    $("#deleteCastrationDehorningMedicine").click(function () {

        $("#castrationDehorningMedicineTable tr:last-child").remove();

        castrationDehorningMedicineInfo.pop();

    });

    $("#castrationDehorningMedicine").change(function () {

        let value = $("#castrationDehorningMedicine").val();

        if (value === "None") {

            $("#castrationDehorningMedicineInfo").hide();

        } else {
            $("#castrationDehorningMedicineInfo").show();
        }

    })

    //Occurrence Extra Info

    $("#addCastrationDehorningOEI").click(function () {

        $("#castrationDehorningOEIPanel").slideToggle(100);

        $('#addCastrationDehorningOEI').toggleClass("fas fa-plus");
        $('#addCastrationDehorningOEI').toggleClass("fas fa-minus");

    })


    $(".noSpace").change(function () {
        this.value = $.trim(this.value);
    });

    function addCastrationDehorningValidation() {

        if (castrationDehorningMedicineInfo.length < 3) {

            alert("Amount of medicine is less than 3");
            return false;

        }

        $('#castrationDehorningMedicineInputSequenceArray').val(JSON.stringify(castrationDehorningMedicineInfo));

    }

</script>
