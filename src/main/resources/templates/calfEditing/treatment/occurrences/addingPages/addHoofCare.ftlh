<div class="modal fade" id="hoofCareModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add Hoof Care</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <form method="post" action="/addOccurrence" enctype="multipart/form-data">

                        <div class="container scrollWindow">

                            <div class="form-group">
                                <label for="hoofCareModalDate">Date</label>
                                <input type="date" required
                                       value="${aDate?string.iso}"
                                       data-date-format=yyyy-MM-dd"
                                       class="form-control form-control-sm date"
                                       name="date">
                            </div>

                            <div class="form-group">
                                <label for="movement">Movement</label>
                                <select class="custom-select custom-select-sm"
                                        name="movement"
                                        id="movement">

                                    <#list hoofCareMovement as m>
                                        <option value="${m}">${m.getText()}</option>
                                    </#list>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="hoofCareType">Type</label>
                                <select class="custom-select custom-select-sm"
                                        name="hoofCareType"
                                        id="hoofCareType">

                                    <#list hoofCareType as hct>
                                        <option value="${hct}">${hct.getText()}</option>
                                    </#list>
                                </select>
                            </div>

                            <hr class="bottomLine">

                            <table class="table table-sm">
                                <thead>
                                <tr>

                                    <th>Hoof</th>
                                    <th>Shape</th>
                                    <th>Problem</th>
                                    <th>Treatment</th>
                                    <th><i type="button" class="fas fa-plus" id="addHoofCareInputSequence"></i></th>

                                </tr>
                                </thead>

                                <tbody id="hoofCareInputSequenceTable">

                                </tbody>

                            </table>

                            <hr class="bottomLine">

                            <div class="form-group">

                                <label for="OEIList">Occurrence extra info</label>
                                <span>
                                        <i type="button" class="fas fa-plus" id="addOEI"></i>
                                    </span>
                                <select class="custom-select custom-select-sm"
                                        multiple="multiple"
                                        name="OEIList"
                                        id="OEIList">

                                    <#if hoofCareOther?has_content>

                                        <#list hoofCareOther as hoei>
                                            <option value="${hoei.getId()}">${hoei.getName()}</option>
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
                                           multiple
                                           class="custom-file-input form-control-sm">
                                    <label class="custom-file-label col-form-label-sm" for="customFile">Choose
                                        file</label>
                                </div>
                            </div>

                        </div>

                        <div class="form-group submitForm">
                            <button type="submit"
                                    onclick="hoofCareInputSequenceValidation()"
                                    class="btn btn-outline-secondary btn-sm">Accept
                            </button>
                        </div>

                        <input type="hidden" name="hoofCareInputSequenceArray" id="hoofCareInputSequenceArray">
                        <input type="hidden" name="calf" value="${calf.id}">
                        <input type="hidden" name="occurrenceType" value="HOOF_CARE">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

    let count = 0;

    $("#hoofCareInputSequenceTable").on("click", ".deleteRow", function () {
        $(this).closest("tr").remove();
    });

    $('#addHoofCareInputSequence').click(function () {

        let row = document.createElement("tr");

        let td1 = document.createElement("td");
        let td2 = document.createElement("td");
        let td3 = document.createElement("td");
        let td4 = document.createElement("td");
        let td5 = document.createElement("td");

        //Hoof
        let hoofDiv = document.createElement('div');
        hoofDiv.className = 'form-group';

        let hoofSelect = document.createElement('select');
        hoofSelect.name = 'hoof';
        hoofSelect.className = 'custom-select custom-select-sm';
        hoofSelect.innerHTML = '<#list hoof as h><option>${h}</option></#list>'

        hoofDiv.append(hoofSelect);
        td1.append(hoofDiv);

        //Shape
        let shapeDiv = document.createElement('div');
        shapeDiv.className = 'form-group';

        let shapeSelect = document.createElement('select');
        shapeSelect.name = 'shape';
        shapeSelect.className = 'custom-select custom-select-sm';
        shapeSelect.innerHTML = '<#list shape as s><option value="${s}">${s.getText()}</option></#list>'

        shapeDiv.append(shapeSelect);
        td2.append(shapeDiv);

        //problem
        let problemDiv = document.createElement('div');
        problemDiv.className = 'form-group';

        let problemSelect = document.createElement('select');
        problemSelect.name = 'problem';
        problemSelect.multiple = true;
        problemSelect.id = 'p' + (count++);
        problemSelect.className = 'custom-select custom-select-sm';
        problemSelect.innerHTML = '<option value="-1">None</option>' +
            '<#list hoofCareProblem as hcp><option value="${hcp.getId()}">${hcp.getName()}</option></#list>';

        problemDiv.append(problemSelect);
        td3.append(problemDiv);

        //treatment
        let treatmentDiv = document.createElement('div');
        treatmentDiv.className = 'form-group';

        let treatmentSelect = document.createElement('select');
        treatmentSelect.name = 'treatment';
        treatmentSelect.multiple = true;
        treatmentSelect.id = 't' + (count++);
        treatmentSelect.className = 'custom-select custom-select-sm';
        treatmentSelect.innerHTML = '<option value="-1">None</option>' +
            '<#list hoofCareTreatment as hct><option value="${hct.getId()}">${hct.getName()}</option></#list>';

        treatmentDiv.append(treatmentSelect);
        td4.append(treatmentDiv);

        //Delete Button
        let deleteButton = document.createElement('div');
        deleteButton.innerHTML = '<i type="button" class="far fa-trash-alt deleteRow">'

        td5.append(deleteButton);

        row.append(td1, td2, td3, td4, td5);

        $("#hoofCareInputSequenceTable").append(row);

    });

    function hoofCareInputSequenceValidation() {

        if ($("#hoofCareType").val() !== 'INSPECTION') {

            let hoofCareInputSequence = [];

            let length = $("#hoofCareInputSequenceTable tr").length;

            let hoofArray = $('[name=hoof]');
            let shapeArray = $('[name=shape]');
            let problemArray = $('[name=problem]');
            let treatmentArray = $('[name=treatment]');

            for (let i = 0; i < length; i++) {

                let problemId = problemArray[i].id;
                let problemIdArray = $('#' + problemId + ' :selected');
                let problemTempIdArray = [];
                let problemIdString;

                problemIdArray.each(function (index, value) {
                    problemTempIdArray.push(value.value)
                });

                problemIdString = problemTempIdArray.join();

                let treatmentId = treatmentArray[i].id;
                let treatmentIdArray = $('#' + treatmentId + ' :selected');
                let treatmentTempIdArray = [];
                let treatmentIdString;

                treatmentIdArray.each(function (index, value) {
                    treatmentTempIdArray.push(value.value)
                });

                treatmentIdString = treatmentTempIdArray.join();

                hoofCareInputSequence.push({
                    hoof: hoofArray[i].value,
                    shape: shapeArray[i].value,
                    problemId: problemIdString,
                    treatmentId: treatmentIdString
                });

            }

            $('#hoofCareInputSequenceArray').val(JSON.stringify(hoofCareInputSequence));

        }

    }

</script>