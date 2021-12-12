<div class="modal fade" id="accidentModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add Accident / Illness</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <form method="post" action="/addOccurrence" enctype="multipart/form-data">

                        <div class="container scrollWindow">

                            <div class="form-group">
                                <label for="accidentDate">Date</label>
                                <input type="date" required
                                       id="accidentDate"
                                       value="${aDate?string.iso}"
                                       data-date-format=yyyy-MM-dd" class="form-control form-control-sm date"
                                       name="date">
                            </div>

                            <hr class="bottomLine">

                            <table class="table table-sm">
                                <thead>
                                <tr>

                                    <th>Person</th>
                                    <th>Medicine</th>
                                    <th style="width: 7vw">Amount</th>
                                    <th><i type="button" class="fas fa-plus" id="addMedicineSequence"></i></th>

                                </tr>
                                </thead>

                                <tbody id="accidentTable">

                                </tbody>

                            </table>

                            <hr class="bottomLine">

                            <div class="form-group">

                                <label for="OEIList">Occurrence extra info</label>
                                <span>
                                        <i type="button" class="fas fa-plus" id="addOEI"></i>
                                    </span>
                                <select class="custom-select custom-select-sm"
                                        multiple
                                        name="OEIList"
                                        id="OEIList">

                                    <#if accidentIllnessOEI?has_content>

                                        <#list accidentIllnessOEI as accidentExtra>
                                            <option value="${accidentExtra.getId()}">${accidentExtra.getName()}</option>
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
                                    onclick="return addAccidentIllnessValidation()"
                                    class="btn btn-outline-secondary btn-sm">Accept
                            </button>
                        </div>

                        <input type="hidden" name="medicineInputSequenceArray" id="medicineInputSequenceArray">

                        <input type="hidden" name="calf" value="${calf.getId()}">
                        <input type="hidden" name="occurrenceType" value="ACCIDENT_ILLNESS">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    $("#accidentTable").on("click", ".deleteRow", function () {
        $(this).closest("tr").remove();
    });

    //Medicine

    let medicineInfo = [];

    $('#addMedicineSequence').click(function () {

        let row = document.createElement("tr");

        let td1 = document.createElement("td");
        let td2 = document.createElement("td");
        let td3 = document.createElement("td");
        let td4 = document.createElement("td");

        //Person
        let personDiv = document.createElement('div');
        personDiv.className = 'form-group';

        let personSelect = document.createElement('select');
        personSelect.name = 'person';
        personSelect.className = 'custom-select custom-select-sm';
        personSelect.innerHTML = '<#if people?has_content>' +
            '<#list people as p><option value="${p.getId()}">${p.getName()}</option></#list>' +
            '<#else><option value="-1">None</option></#if>';

        personDiv.append(personSelect);
        td1.append(personDiv);

        //Medicine
        let medicineDiv = document.createElement('div');
        medicineDiv.className = 'form-group';

        let medicineSelect = document.createElement('select');
        medicineSelect.name = 'medicine';
        medicineSelect.className = 'custom-select custom-select-sm';
        medicineSelect.innerHTML = '<#if noneAndNormalWithdrawalMedicines?has_content>' +
            '<#list noneAndNormalWithdrawalMedicines as m><option value="${m.getId()}">${m.getName()}</option></#list>' +
            '<#else><option value="-1">None</option></#if>';

        medicineDiv.append(medicineSelect);
        td2.append(medicineDiv);

        //Amount
        let amountDiv = document.createElement('div');
        amountDiv.className = 'form-group';

        let amountInput = document.createElement('input');
        amountInput.name = 'amount';
        amountInput.className = 'form-control form-control-sm noSpace';
        amountInput.type = 'text';

        amountDiv.append(amountInput);
        td3.append(amountDiv);

        //Delete Button
        let deleteButton = document.createElement('div');
        deleteButton.innerHTML = '<i type="button" class="far fa-trash-alt deleteRow">'

        td4.append(deleteButton);

        row.append(td1, td2, td3, td4);

        $("#accidentTable").append(row);

    });

    //Occurrence Extra Info

    $("#addOEI").click(function () {

        $("#OEIPanel").slideToggle(100);

        $('#addOEI').toggleClass("fas fa-plus");
        $('#addOEI').toggleClass("fas fa-minus");

    })

    $(".noSpace").change(function () {
        this.value = $.trim(this.value);
    });

    function addAccidentIllnessValidation() {

        let length = $("#accidentTable tr").length;

        let personArray = $('[name=person]');
        let medicineArray = $('[name=medicine]');
        let amountArray = $('[name=amount]');

        for (let i = 0; i < length; i++) {

            if (medicineArray[i].value === '-1') {

                alert('Medicine is undefined');
                return false;

            }
            if (personArray[i].value === '-1') {

                alert('Person is undefined');
                return false;

            }
            if (amountArray[i].value === '') {

                alert('Amount is empty');
                return false;

            }

                medicineInfo.push({
                    medicineId: medicineArray[i].value,
                    personId: personArray[i].value,
                    amount: amountArray[i].value
                });



            $('#medicineInputSequenceArray').val(JSON.stringify(medicineInfo));

        }
    }

</script>


