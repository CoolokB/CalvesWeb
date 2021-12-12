<div class="modal fade" id="calvingModal">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add Calf</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <form method="post" action="/addOccurrence" enctype="multipart/form-data">

                        <div class="container scrollWindow">

                            <div class="form-group">

                                <label for="insemination">Insemination</label>
                                <select class="custom-select custom-select-sm"
                                        id="insemination"
                                        name="insemination">

                                    <#if inseminationList?has_content>
                                        <#list inseminationList as i>
                                            <option value="${i.id}">${i.inseminationToString()}</option>
                                        </#list>
                                    <#else>
                                        <option value="-1">None</option>
                                    </#if>

                                </select>

                            </div>

                            <div class="form-group">
                                <label for="calvingDryingId">Drying Off</label>

                                <select class="custom-select custom-select-sm"
                                        id="calvingDryingId"
                                        name="calvingDryingId">
                                    <option value="-1">None</option>

                                    <#if dryingOffList?has_content>
                                        <#list dryingOffList as d>
                                            <option value="${d.id}">${d}</option>
                                        </#list>
                                    </#if>

                                </select>
                            </div>

                            <div class="form-group">

                                <label>Files</label>
                                <div class="custom-file">
                                    <input type="file"
                                           multiple
                                           id="customFile"
                                           name="files"
                                           class="custom-file-input form-control-sm">
                                    <label class="custom-file-label col-form-label-sm"
                                           for="customFile">Choose
                                        file</label>
                                </div>

                            </div>

                            <hr class="bottomLine">

                            <table class="table table-sm">
                                <thead>
                                <tr>

                                    <th>Date</th>
                                    <th>Id</th>
                                    <th>Place</th>
                                    <th>Born</th>
                                    <th>Birth</th>
                                    <th>Gender</th>
                                    <th>Status</th>
                                    <th>Colostrum</th>

                                    <th><i type="button" class="fas fa-plus" id="addCalvingInputSequence"></i></th>

                                </tr>
                                </thead>

                                <tbody id="calvingInputSequenceTable">

                                </tbody>

                            </table>

                            <hr class="bottomLine">

                        </div>

                        <div class="form-group submitForm">
                            <button type="submit"
                                    onclick="return calvingInputSequenceValidation()"
                                    class="btn btn-outline-secondary btn-sm">Accept
                            </button>
                        </div>

                        <input type="hidden" name="calf" value="${calf.id}">
                        <input type="hidden" name="calvingInputSequenceArray" id="calvingInputSequenceArray">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <input type="hidden" name="occurrenceType" value="CALVING">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    $("#calvingInputSequenceTable").on("click", ".number", function () {

        onkeydown =
            function f() {
                return (event.ctrlKey || event.altKey
                    || (47
                        < event.keyCode && event.keyCode < 58 && event.shiftKey == false)
                    || (95
                        < event.keyCode && event.keyCode < 106)
                    || (event.keyCode == 8) || (event.keyCode == 9)
                    || (event.keyCode > 34 && event.keyCode < 40)
                    || (event.keyCode == 46));
            }


    });

    $("#calvingInputSequenceTable").on("click", ".deleteRow", function () {
        $(this).closest("tr").remove();
        if ($("#calvingInputSequenceTable tr").length < 3) {
            $('#addCalvingInputSequence').show();
        }
    });

    $("#calvingInputSequenceTable").on("change", ".date", function () {

        let today = new Date();
        let dateToCheck = new Date(this.closest(".date").value);

        if (dateToCheck > today) {
            alert("You cannot enter a date in the future!");
            this.closest(".date").value = "${calf.birthDate}";

        }

    });

    $('#addCalvingInputSequence').click(function () {

        let row = document.createElement("tr");

        let td1 = document.createElement("td");
        let td2 = document.createElement("td");
        let td3 = document.createElement("td");
        let td4 = document.createElement("td");
        let td5 = document.createElement("td");
        let td6 = document.createElement("td");
        let td7 = document.createElement("td");
        let td8 = document.createElement("td");
        let td9 = document.createElement("td");

        //Date
        let dateDiv = document.createElement('div');
        dateDiv.className = 'form-group';

        let dateInput = document.createElement('input');
        dateInput.type = 'date';
        dateInput.name = 'calvingDate';
        dateInput.required = true;
        dateInput.className = 'form-control form-control-sm date';
        dateInput.value = '${aDate?string.iso}';

        dateDiv.append(dateInput);
        td1.append(dateDiv);

        //Id
        let idDiv = document.createElement('div');
        idDiv.className = 'form-group';

        let idInput = document.createElement('input');
        idInput.name = 'newBornCalfId';
        idInput.className = 'form-control form-control-sm number';
        idInput.type = 'text';

        idDiv.append(idInput);
        td2.append(idDiv);

        //place of birth
        let pobDiv = document.createElement('div');
        pobDiv.className = 'form-group';

        let pobSelect = document.createElement('select');
        pobSelect.name = 'calvingPlaceOfBirth';
        pobSelect.className = 'custom-select custom-select-sm';
        pobSelect.innerHTML = '<#list placeOfBirth as p> <option value="${p}">${p.getText()}</option></#list>';

        pobDiv.append(pobSelect);
        td3.append(pobDiv);

        //born
        let bornDiv = document.createElement('div');
        bornDiv.className = 'form-group';

        let bornSelect = document.createElement('select');
        bornSelect.name = 'calvingBorn';
        bornSelect.className = 'custom-select custom-select-sm';
        bornSelect.innerHTML = '<#list born as bo> <option value="${bo}">${bo.getText()}</option></#list>';

        bornDiv.append(bornSelect);
        td4.append(bornDiv);

        //birth
        let birthDiv = document.createElement('div');
        birthDiv.className = 'form-group';

        let birthSelect = document.createElement('select');
        birthSelect.name = 'calvingBirth';
        birthSelect.multiple = true;
        birthSelect.className = 'custom-select custom-select-sm';
        birthSelect.innerHTML = '<#list birth as b><option value="${b}">${b.getText()}</option></#list>';

        birthDiv.append(birthSelect);
        td5.append(birthDiv);

        //gender
        let genderDiv = document.createElement('div');
        genderDiv.className = 'form-group';

        let genderSelect = document.createElement('select');
        genderSelect.name = 'calvingGender';
        genderSelect.className = 'custom-select custom-select-sm';
        genderSelect.innerHTML = '<#list gender as g><option value="${g}">${g.getText()}</option></#list>';

        genderDiv.append(genderSelect);
        td6.append(genderDiv);

        //status
        let statusDiv = document.createElement('div');
        statusDiv.className = 'form-group';

        let statusSelect = document.createElement('select');
        statusSelect.name = 'calvingStatus';
        statusSelect.className = 'custom-select custom-select-sm';
        statusSelect.innerHTML = '<#list status as s><option value="${s}">${s.getText()}</option></#list>';

        statusDiv.append(statusSelect);
        td7.append(statusDiv);

        //colostrum
        let colostrumDiv = document.createElement('div');
        colostrumDiv.className = 'form-group';

        let colostrumSelect = document.createElement('select');
        colostrumSelect.name = 'calvingColostrum';
        colostrumSelect.className = 'custom-select custom-select-sm';
        colostrumSelect.innerHTML = '<#list colostrum as c><option value="${c}">${c.getText()}</option></#list>';

        colostrumDiv.append(colostrumSelect);
        td8.append(colostrumDiv);

        //Delete Button
        let deleteButton = document.createElement('div');
        deleteButton.innerHTML = '<i type="button" class="far fa-trash-alt deleteRow">'

        td9.append(deleteButton);

        row.append(td1, td2, td3, td4, td5, td6, td7, td8, td9);

        $("#calvingInputSequenceTable").append(row);

        if ($("#calvingInputSequenceTable tr").length === 3) {
            $('#addCalvingInputSequence').hide();
        }

    });

    function calvingInputSequenceValidation() {

        if ($("#calvingInseminationId").val() === '-1') {

            alert("Insemination is undefined")
            return false;

        }

        let calvingInputSequence = [];

        let length = $("#calvingInputSequenceTable tr").length;

        if (length===0){

            alert('You should add at least 1 calf');
            return false;

        }

        let dateArray = $('[name=calvingDate]');
        let newBornCalfIdArray = $('[name=newBornCalfId]');
        let pobArray = $('[name=calvingPlaceOfBirth]');
        let bornArray = $('[name=calvingBorn]');
        let birthArray = $('[name=calvingBirth]');
        let genderArray = $('[name=calvingGender]');
        let statusArray = $('[name=calvingStatus]');
        let colostrumArray = $('[name=calvingColostrum]');

        for (let i = 0; i < length; i++) {

            if (newBornCalfIdArray[i].value === '') {
                alert("Id is empty");
                return false;
            }

            let birthID = 'b' + i;

            birthArray[i].id = birthID

            let birthValuesArray = $('#' + birthID + ' :selected');
            let birthTempArray = [];
            let birthString;

            if (birthValuesArray.length === 0) {
                alert("Birth is not defined");
                return false;
            }

            birthValuesArray.each(function (index, value) {
                birthTempArray.push(value.value)
            });

            birthString = birthTempArray.join();

            calvingInputSequence.push({

                dateOfBirth: dateArray[i].value,
                calfId: newBornCalfIdArray[i].value,
                placeOfBirth: pobArray[i].value,
                born: bornArray[i].value,
                gender: genderArray[i].value,
                status: statusArray[i].value,
                colostrum: colostrumArray[i].value,
                birth: birthString
            });

        }

        $('#calvingInputSequenceArray').val(JSON.stringify(calvingInputSequence));

    }

</script>

