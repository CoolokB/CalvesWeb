<div class="modal fade" id="addCalf">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add Calf</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form method="post" enctype="multipart/form-data">

                    <#assign aDateTime = .now>
                    <#assign aDate = aDateTime?date>

                    <div class="container scrollWindow">

                        <div class="form-group">

                            <label for="bDate">Date of birth</label>
                            <input type="date" required value="${aDate?string.iso}"
                                   id="bDate"
                                   data-date-format=yyyy-MM-dd"
                                   class="form-control form-control-sm"
                                   name="birthDate">

                        </div>

                        <div class="form-group">
                            <label for="calfId">ID</label>
                            <input type="text" class="form-control form-control-sm number" id="calfId"
                                   name="calfId" required>
                        </div>

                        <div class="form-group">
                            <label for="IdOfMother">Mother</label>
                            <select class="custom-select custom-select-sm" id="IdOfMother" name="IdOfMother">

                                <#list mothers as mother>
                                    <option>${mother.getCalfId()}</option>
                                </#list>
                                <option value="-1">None</option>

                            </select>

                        </div>

                        <div class="form-group <#if mothers?has_content>hidden</#if>" id="motherPanel">
                            <label for="absentMotherId">Mother</label>
                            <input type="text" class="form-control form-control-sm number" id="absentMotherId"
                                   name="absentMotherId">
                        </div>

                        <div class="form-group">
                            <label for="father">Father</label>
                            <select class="custom-select custom-select-sm" id="father" name="father">

                                <#if fathers?has_content>
                                    <#list fathers as father>
                                        <option value="${father.getId()}">${father.getName()}</option>
                                    </#list>
                                <#else>
                                    <option>None</option>
                                </#if>

                            </select>

                        </div>

                        <div class="form-group">
                            <label for="first">Place of birth</label>
                            <select class="custom-select custom-select-sm" id="first" name="birthPlace">
                                <#list placeOfBirth as p>
                                    <option value="${p}">${p.getText()}</option>
                                </#list>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="sixth">Born</label>
                            <select class="custom-select custom-select-sm" id="sixth" name="born">
                                <#list born as b>
                                    <option value="${b}">${b.getText()}</option>
                                </#list>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="birth">Birth</label>
                            <select class="custom-select custom-select-sm" multiple="multiple" id="birth" name="birth"
                                    required>
                                <#list birth as b>
                                    <option value="${b}">${b.getText()}</option>
                                </#list>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="second">Gender</label>
                            <select class="custom-select custom-select-sm" id="second" name="gender">
                                <#list gender as g>
                                    <option value="${g}">${g.getText()}</option>
                                </#list>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="third">Quantity</label>
                            <select class="custom-select custom-select-sm" id="third" name="quantity">
                                <#list quantity as q>
                                    <option value="${q}">${q.getText()}</option>
                                </#list>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="fourth">Breed</label>
                            <select class="custom-select custom-select-sm" id="fourth" name="breed">
                                <#list breed as b>
                                    <option>${b}</option>
                                </#list>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="fifth">Colostrum</label>
                            <select class="custom-select custom-select-sm" id="fifth" name="colostrum">
                                <#list colostrum as c>
                                    <option value="${c}">${c.getText()}</option>
                                </#list>
                            </select>
                        </div>

                        <div class="form-group">

                            <label for="alive">Status</label>
                            <select class="custom-select custom-select-sm" id="alive" name="alive">
                                <#list status as s>
                                    <option value="${s}">${s.getText()}</option>
                                </#list>
                            </select>

                        </div>

                        <div class="form-group">

                            <label for="gestation">Gestation</label>
                            <input type="text" class="form-control form-control-sm number"
                                   name="gestation"
                                   value="0"
                                   id="gestation">
                        </div>

                        <div class="form-group">
                            <label>Files</label>
                            <div class="custom-file">
                                <input type="file"
                                       id="customFile"
                                       name="files"
                                       multiple="multiple"
                                       class="custom-file-input form-control-sm">
                                <label class="custom-file-label col-form-label-sm"
                                       for="customFile">Choose file</label>
                            </div>
                        </div>

                    </div>

                    <div class="form-group submitForm">
                        <button type="submit"
                                class="btn btn-outline-secondary btn-sm"
                                onclick="return validateAddingCalf()">
                            Accept
                        </button>
                    </div>

                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                </form>
            </div>
        </div>
    </div>
</div>

<script>

    function validateAddingCalf() {

        if ($("#absentMotherId").val() === "" && $("#IdOfMother").val() === "-1") {
            alert("Mother is undefined");
            return false;
        }

        if ($("#father").val() === "None") {

            alert("Father is undefined");
            return false;
        }

    }

    $("#bDate").change(function () {
        let today = new Date();
        let dateToCheck = new Date(this.value);

        if (dateToCheck > today) {
            alert("You cannot enter a date in the future!");
            this.value = "${aDate?string.iso}";

        }

    });

    $("#IdOfMother").change(function () {

        let chosenMother = $("#IdOfMother").val();

        if (chosenMother === "-1") {
            $("#motherPanel").show();
        } else $("#motherPanel").hide();

    });

</script>




