<div class="form-group">

    <i id="accidentArrow" class="fas fa-chevron-down"></i>
    <a onclick="switchArrow('#accidentArrow')"
       href="#"
       id="accidentMenu">Accident / Illness</a>

</div>

<div id="accidentCollapse" class="collapse ml-1">

    <div class="form-group">

        <i id="accidentOccurrenceArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#accidentOccurrenceArrow')"
           href="#"
           id="accidentOccurrenceMenu">Accident / Illness List</a>

    </div>

    <div id="accidentOccurrenceCollapse" class="collapse ml-1">

        <div class="form-group">

            <label class="switch">
                <input type="checkbox" id="accidentToggle">
                <span class="slider"></span>
            </label>

<#--            <label class="custom-control-label" for="accidentInclude">Include Parameters</label>-->

<#--            <div class="custom-control custom-switch">-->
<#--                <input type="checkbox" class="custom-control-input" id="accidentInclude">-->
<#--                <label class="custom-control-label" for="accidentInclude">Include Parameters</label>-->
<#--            </div>-->

        </div>

<#--        <#list accidentName as an>-->

<#--            <div class="form-group">-->
<#--                <div class="form-check">-->
<#--                    <input class="form-check-input accidentOccurrenceCheck"-->
<#--                           type="checkbox"-->
<#--                           value="${an}">-->
<#--                    <label class="form-check-label">-->
<#--                        ${an.getText()}-->
<#--                    </label>-->
<#--                </div>-->
<#--            </div>-->

<#--        </#list>-->

    </div>

    <hr>

    <div class="form-group">

        <i id="accidentMedicineArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#accidentMedicineArrow')"
           href="#"
           id="accidentMedicineMenu">Medicine</a>

    </div>

    <div id="accidentMedicineCollapse" class="collapse ml-1">

        <label class="switch">
            <input type="checkbox" id="accidentMedicineToggle">
            <span class="slider"></span>
        </label>

        <#list medicines as m>

            <div class="form-group">
                <div class="form-check">
                    <input class="form-check-input accidentMedicineCheck"
                           type="checkbox"
                           value="${m.name}">
                    <label class="form-check-label">
                        ${m.name}
                    </label>
                </div>
            </div>

        </#list>

    </div>

    <hr>

    <div class="form-group">

        <i id="accidentAgeArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#accidentAgeArrow')"
           href="#"
           id="accidentAgeMenu">Age</a>
    </div>

    <div id="accidentAgeCollapse" class="collapse ml-1">

        <div class="form-group">
            <label class="label" for="accidentAgeFrom">Age ></label>
            <input type="text"
                   class="form-control form-control-sm number"
                   id="accidentAgeFrom">
        </div>

        <div class="form-group">
            <label class="label" for="accidentAgeTo">Age <</label>
            <input type="text"
                   class="form-control form-control-sm number"
                   id="accidentAgeTo">
        </div>

    </div>

    <hr>

    <div class="form-group">

        <i id="accidentDateArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#accidentDateArrow')"
           href="#"
           id="accidentDateMenu">Date</a>

    </div>

    <div id="accidentDateCollapse" class="collapse ml-1">

        <div class="form-group">
            <label for="accidentDateFrom">Date ></label>
            <input type="date" required
                   value="${aDate?string.iso}"
                   data-date-format=yyyy-MM-dd"
                   id="accidentDateFrom"
                   class="form-control form-control-sm smallText">
        </div>

        <div class="form-group">
            <label for="accidentDateTo">Date <</label>
            <input type="date" required
                   value="${aDate?string.iso}"
                   data-date-format=yyyy-MM-dd"
                   id="accidentDateTo"
                   class="form-control form-control-sm smallText">
        </div>

    </div>

    <hr class="bottomLine">

</div>
<hr>
<script>

    $("#accidentDateFrom , #accidentDateTo").change(function () {

        let today = new Date();
        let dateToCheck = new Date(this.value);
        let dateFrom = new Date($('#accidentDateFrom').val());
        let dateTo = new Date($('#accidentDateTo').val());

        if (dateToCheck > today) {
            alert("You cannot enter a date in the future!");
            this.value = "${aDate?string.iso}";

        } else if (dateFrom > dateTo) {
            alert("date from is after date to!");
            this.value = "${aDate?string.iso}";
        }

    });

    $('#accidentOccurrenceMenu').click(function () {
        $('#accidentOccurrenceCollapse').slideToggle(400);
    });

    $('#accidentMenu').click(function () {
        $('#accidentCollapse').slideToggle(400);
    });

    $('#accidentMedicineMenu').click(function () {
        $('#accidentMedicineCollapse').slideToggle(400);
    });

    $('#accidentAgeMenu').click(function () {
        $('#accidentAgeCollapse').slideToggle(400);
    });

    $('#accidentDateMenu').click(function () {
        $('#accidentDateCollapse').slideToggle(400);
    });

    function setAccidentParameters() {

        if ($('#accidentArrow').hasClass("fas fa-chevron-up")) {

            if ($('#accidentOccurrenceArrow').hasClass("fas fa-chevron-up")) {

                addToResult($(".accidentOccurrenceCheck"), "Accident Illness");

            }

            if ($('#accidentMedicineArrow').hasClass("fas fa-chevron-up")) {

                addToResult($(".accidentMedicineCheck"), "Accident Medicine");

            }

            if ($('#accidentAgeArrow').hasClass("fas fa-chevron-up")) {


                $("ol").append("<li>Accident / Illness Age From - " + $('#accidentAgeFrom').val() + "</li>")
                    .append("<li>Accident / Illness Age To - " + $('#accidentAgeTo').val() + "</li>");

            }

            if ($('#accidentDateArrow').hasClass("fas fa-chevron-up")) {

                $("ol").append("<li>Accident / Illness Date From - " + $('#accidentDateFrom').val() + "</li>")
                    .append("<li>Accident / Illness Date To - " + $('#accidentDateTo').val() + "</li>");

            }

        }

    }

</script>
