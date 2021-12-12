<#import "../parts/editPageTemplate.ftlh" as e>

<@e.page "Edit ${occurrence.getOccurrenceType().getText()}">

    <#assign aDateTime = .now>
    <#assign aDate = aDateTime?date>

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
            <th></th>

        </tr>
        </thead>

        <tbody id="calvingInputSequenceTable">

        <#list children as cs>

            <tr>

                <input type="hidden" name="dbID" value="${cs.getId()}">

                <td>

                    <div class="form-group">
                        <input type="date"
                               required value="${cs.getBirthDate()}"
                               data-date-format=yyyy-MM-dd"
                               class="form-control form-control-sm date"
                               id="calvingDate"
                               name="calvingDate">
                    </div>

                </td>

                <td>

                    <div class="form-group">
                        <input type="text"
                               class="form-control form-control-sm number"
                               name="newBornCalfId"
                               value="${cs.getCalfId()}"/>
                    </div>

                </td>

                <td>

                    <div class="form-group">

                        <select class="custom-select custom-select-sm"
                                name="calvingPlaceOfBirth">
                            <option selected
                                    value="${cs.getBirthPlace()}">${cs.getBirthPlace().getText()}</option>

                            <#list pob as p>

                                <#if cs.getBirthPlace()!=p>

                                    <option value="${p}">${p.getText()}</option>

                                </#if>

                            </#list>

                        </select>

                    </div>

                </td>

                <td>

                    <div class="form-group">
                        <select class="custom-select custom-select-sm"
                                name="calvingBorn">
                            <option selected value="${cs.getBorn()}">${cs.getBorn().getText()}</option>

                            <#list born as b>

                                <#if cs.getBorn()!=b>

                                    <option value="${b}">${b.getText()}</option>

                                </#if>

                            </#list>
                        </select>
                    </div>

                </td>

                <td>

                    <div class="form-group">
                        <select class="custom-select custom-select-sm"
                                multiple
                                name="calvingBirth">

                            <#list birth as b>

                                <#if cs.getBirthList()?seq_contains(b)>

                                    <option selected
                                            value="${b}">${b.getText()}</option>

                                <#else>

                                    <option value="${b}">${b.getText()}</option>

                                </#if>

                            </#list>

                        </select>
                    </div>

                </td>

                <td>

                    <div class="form-group">
                        <select class="custom-select custom-select-sm"
                                name="calvingGender">
                            <option selected value="${cs.getGender()}">${cs.getGender().getText()}</option>

                            <#list gender as g>

                                <#if cs.getGender()!=g>

                                    <option value="${g}">${g.getText()}</option>

                                </#if>

                            </#list>
                        </select>
                    </div>

                </td>

                <td>

                    <div class="form-group">
                        <select class="custom-select custom-select-sm"
                                name="calvingStatus">
                            <option selected value="${cs.getStatus()}">${cs.getStatus().getText()}</option>

                            <#list status as s>

                                <#if cs.getStatus()!=s>

                                    <option value="${s}">${s.getText()}</option>

                                </#if>

                            </#list>
                        </select>
                    </div>

                </td>

                <td>

                    <div class="form-group">
                        <select class="custom-select custom-select-sm"
                                name="calvingColostrum">
                            <option selected value="${cs.getColostrum()}">${cs.getColostrum().getText()}</option>

                            <#list colostrum as c>

                                <#if cs.getColostrum()!=c>

                                    <option value="${c}">${c.getText()}</option>

                                </#if>

                            </#list>
                        </select>
                    </div>

                </td>

                <td>
                    <i type="button" class="far fa-trash-alt deleteRow"></i>
                </td>

            </tr>

        </#list>

        </tbody>

    </table>

    <div class="form-group">
        <button type="submit"
                onclick="return calvingEditingValidation()"
                class="btn btn-outline-secondary btn-sm">Accept
        </button>
    </div>

    <input type="hidden" name="calvingInputSequenceArray" id="calvingInputSequenceArray">
    <input type="hidden" name="motherID" value="${mother}">
    <input type="hidden" name="occurrence" value="${occurrence.getId()}">

</@e.page>

<script>
    
    //Calving

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

    $("#calvingInputSequenceTable").on("change", ".calvingDate", function () {

        let today = new Date();
        let dateToCheck = new Date(this.closest(".calvingDate").value);

        if (dateToCheck > today) {
            alert("You cannot enter a date in the future!");
            this.closest(".calvingDate").value = "${calf.birthDate}";

        }

    });

    function calvingEditingValidation() {

        let calvingInputSequence = [];

        let length = $("#calvingInputSequenceTable tr").length;

        let dateArray = $('[name=calvingDate]');
        let newBornCalfIdArray = $('[name=newBornCalfId]');
        let pobArray = $('[name=calvingPlaceOfBirth]');
        let bornArray = $('[name=calvingBorn]');
        let birthArray = $('[name=calvingBirth]');
        let genderArray = $('[name=calvingGender]');
        let statusArray = $('[name=calvingStatus]');
        let colostrumArray = $('[name=calvingColostrum]');
        let dbIDArray = $('[name=dbID]');

        for (let i = 0; i < length; i++) {

            if (newBornCalfIdArray[i].value === '') {
                alert("Id is empty");
                return false;
            }

            let innerId;

            if (i <= dbIDArray.length - 1) {

                innerId = dbIDArray[i].value;

            } else {
                innerId = -1;
            }

            let birthID = 'b' + i;

            birthArray[i].id = birthID;

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
                dbId: innerId,
                gender: genderArray[i].value,
                status: statusArray[i].value,
                colostrum: colostrumArray[i].value,
                birth: birthString
            });

        }

        $('#calvingInputSequenceArray').val(JSON.stringify(calvingInputSequence));

    }

</script>





