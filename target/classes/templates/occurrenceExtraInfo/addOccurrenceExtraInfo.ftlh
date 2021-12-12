<div class="modal fade" id="addORModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <h4 class="modal-title">Add Occurrence Extra Info</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body">
                <form method="post">

                    <div class="container">

                        <div class="form-group">

                            <label for="name">Name</label>
                            <input type="text" class="form-control form-control-sm"
                                   id="name"
                                   name="name" required>
                        </div>

                        <div class="form-group">

                            <label for="parent">Parent</label>
                            <select class="custom-select custom-select-sm"
                                    name="parent"
                                    id="parent">

                                <#list occurrenceType as ot>
                                    <option value="${ot}">${ot.getText()}</option>
                                </#list>

                            </select>
                        </div>

                        <div class="form-group" id="extraInfoFieldPanel">

                            <label for="extraInfoField">Field</label>
                            <select class="custom-select custom-select-sm"
                                    name="extraInfoField"
                                    id="extraInfoField">

                            </select>
                        </div>

                    </div>

                    <div class="form-group submitForm">
                        <button type="submit"
                                onclick="return validate()"
                                class="btn btn-outline-secondary btn-sm">
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

    $(window).on("load", function () {

        checkParent();

    });

    function checkParent() {

        let parent = $("#parent").val();

        switch (parent) {

            case "ACCIDENT_ILLNESS" :
                $('#extraInfoField').html('<#list accidentIllnessExtraInfoField as eif>\n'
                    + '<option value="${eif}">${eif.getText()}</option>\n' +
                    '</#list>');
                break;

            case "CALVING" :
                $('#extraInfoField').html('<#list calvingExtraInfoField as eif>\n'
                    + '<option value="${eif}">${eif.getText()}</option>\n' +
                    '</#list>');
                break;

            case "CASTRATION_DEHORNING" :
                $('#extraInfoField').html('<#list castrationDehorningExtraInfoField as eif>\n'
                    + '<option value="${eif}">${eif.getText()}</option>\n' +
                    '</#list>');
                break;

            case "CONDITION_SCORE" :
                $('#extraInfoField').html('<#list conditionScoreExtraInfoField as eif>\n'
                    + '<option value="${eif}">${eif.getText()}</option>\n' +
                    '</#list>');
                break;

            case "DEATH" :
                $('#extraInfoField').html('<#list deathExtraInfoField as eif>\n'
                    + '<option value="${eif}">${eif.getText()}</option>\n' +
                    '</#list>');
                break;

            case "DRYING_OFF" :
                $('#extraInfoField').html('<#list dryingOffExtraInfoField as eif>\n'
                    + '<option value="${eif}">${eif.getText()}</option>\n' +
                    '</#list>');
                break;

            case "FOOT_BATH" :
                $('#extraInfoField').html('<#list footBathExtraInfoField as eif>\n'
                    + '<option value="${eif}">${eif.getText()}</option>\n' +
                    '</#list>');
                break;

            case "HOOF_CARE" :
                $('#extraInfoField').html('<#list hoofCareExtraInfoField as eif>\n'
                    + '<option value="${eif}">${eif.getText()}</option>\n' +
                    '</#list>');
                break;

            case "INSEMINATION" :
                $('#extraInfoField').html('<#list inseminationExtraInfoField as eif>\n'
                    + '<option value="${eif}">${eif.getText()}</option>\n' +
                    '</#list>');
                break;

            case "MILK_YIELD" :
                $('#extraInfoField').html('<#list milkYieldExtraInfoField as eif>\n'
                    + '<option value="${eif}">${eif.getText()}</option>\n' +
                    '</#list>');
                break;

            case "PREGNANCY_TEST" :
                $('#extraInfoField').html('<#list pregnancyTestExtraInfoField as eif>\n'
                    + '<option value="${eif}">${eif.getText()}</option>\n' +
                    '</#list>');
                break;

            case "PROPHYLACTIC" :
                $('#extraInfoField').html('<#list prophylacticExtraInfoField as eif>\n'
                    + '<option value="${eif}">${eif.getText()}</option>\n' +
                    '</#list>');
                break;

            case "SELL" :
                $('#extraInfoField').html('<#list sellExtraInfoField as eif>\n'
                    + '<option value="${eif}">${eif.getText()}</option>\n' +
                    '</#list>');
                break;

            case "TEMPERAMENT" :
                $('#extraInfoField').html('<#list temperamentExtraInfoField as eif>\n'
                    + '<option value="${eif}">${eif.getText()}</option>\n' +
                    '</#list>');
                break;

            case "WEANING" :
                $('#extraInfoField').html('<#list weaningExtraInfoField as eif>\n'
                    + '<option value="${eif}">${eif.getText()}</option>\n' +
                    '</#list>');
                break;

        }

    }

    $("#name").change(function () {
        this.value = $.trim(this.value);
    });

    $("#parent").change(function () {

        checkParent();

    })

    let names = [];

    <#list occurrenceExtraInfoNames as name>

    names.push("${name}");

    </#list>

    function validate() {

        let name = $("#name").val().toLowerCase();

        if (names.includes(name)) {

            alert("This name already exists");
            return false;

        }

    }

</script>
