<div class="form-group">

    <i id="prophylacticMenuArrow" class="fas fa-chevron-down"></i>
    <a onclick="switchArrow('#prophylacticMenuArrow')"
       href="#"
       id="prophylacticMenu">Prophylactic</a>

</div>

<div id="prophylacticMenuCollapse" class="collapse ml-1">

    <div class="form-group">

        <i id="prophylacticReasonArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#prophylacticReasonArrow')"
           href="#"
           id="prophylacticReasonMenu">Reason</a>

    </div>

    <div id="prophylacticReasonCollapse" class="collapse ml-1">

        <div class="form-group">
            <input type="text" class="form-control form-control-sm" id="prophylacticReason">
        </div>

    </div>

    <hr>

    <div class="form-group">

        <i id="prophylacticMedicineArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#prophylacticMedicineArrow')"
           href="#"
           id="prophylacticMedicineMenu">Medicine</a>

    </div>

    <div id="prophylacticMedicineCollapse" class="collapse ml-1">

        <div class="form-group">

                <#list medicines as m>

                    <div class="form-group">
                        <div class="form-check">
                            <input class="form-check-input prophylacticMedicineCheck"
                                   type="checkbox"
                                   value="${m.name}">
                            <label class="form-check-label">
                                ${m.name}
                            </label>
                        </div>
                    </div>

                </#list>

        </div>

    </div>

    <hr>

    <div class="form-group">

        <i id="prophylacticAgeArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#prophylacticAgeArrow')"
           href="#"
           id="prophylacticAgeMenu">Age</a>

    </div>

    <div id="prophylacticAgeCollapse" class="collapse ml-1">

        <div class="form-group">
            <label class="label" for="prophylacticAgeFrom">Age ></label>
            <input type="text" class="form-control form-control-sm" id="prophylacticAgeFrom">
        </div>

        <div class="form-group">
            <label class="label" for="prophylacticAgeTo">Age <</label>
            <input type="text" class="form-control form-control-sm" id="prophylacticAgeTo">
        </div>

    </div>

    <hr>

    <div class="form-group">

        <i id="prophylacticDateArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#prophylacticDateArrow')"
           href="#"
           id="prophylacticDateMenu">Date</a>

    </div>

    <div id="prophylacticDateCollapse" class="collapse ml-1">

        <div class="form-group">
            <label for="prophylacticDateFrom">Date ></label>
            <input type="date" required
                   value="${aDate?string.iso}"
                   data-date-format=yyyy-MM-dd"
                   id="prophylacticDateFrom"
                   class="form-control form-control-sm smallText">
        </div>

        <div class="form-group">
            <label for="prophylacticDateTo">Date <</label>
            <input type="date" required
                   value="${aDate?string.iso}"
                   data-date-format=yyyy-MM-dd"
                   id="prophylacticDateTo"
                   class="form-control form-control-sm smallText">
        </div>

    </div>

    <hr class="bottomLine">

</div>
<hr>
<script>

    $("#prophylacticDateFrom , #prophylacticDateTo").change(function () {

        let today = new Date();
        let dateToCheck = new Date(this.value);
        let dateFrom = new Date($('#prophylacticDateFrom').val());
        let dateTo = new Date($('#prophylacticDateTo').val());

        if (dateToCheck > today) {
            alert("You cannot enter a date in the future!");
            this.value = "${aDate?string.iso}";

        } else if (dateFrom > dateTo) {
            alert("date from is after date to!");
            this.value = "${aDate?string.iso}";
        }

    });

    $('#prophylacticMenu').click(function () {
        $('#prophylacticMenuCollapse').slideToggle(400);
    });

    $('#prophylacticReasonMenu').click(function () {
        $('#prophylacticReasonCollapse').slideToggle(100);
    });

    $('#prophylacticMedicineMenu').click(function () {
        $('#prophylacticMedicineCollapse').slideToggle(100);
    });

    $('#prophylacticAgeMenu').click(function () {
        $('#prophylacticAgeCollapse').slideToggle(400);
    });

    $('#prophylacticDateMenu').click(function () {
        $('#prophylacticDateCollapse').slideToggle(400);
    });


    function setProphylacticParameters() {

        if ($('#prophylacticMenuArrow').hasClass("fas fa-chevron-up")) {

            if ($('#prophylacticReasonArrow').hasClass("fas fa-chevron-up")) {

                $("ol").append("<li>Prophylactic Reason - " + $('#prophylacticReason').val() + "</li>");

            }

            if ($('#prophylacticMedicineArrow').hasClass("fas fa-chevron-up")) {

                addToResult($(".prophylacticMedicineCheck"), "Prophylactic Medicine");

            }

            if ($('#prophylacticAgeArrow').hasClass("fas fa-chevron-up")) {

                $("ol").append("<li>Prophylactic Age From - " + $('#prophylacticAgeFrom').val() + "</li>")
                    .append("<li>Prophylactic Age To - " + $('#prophylacticAgeTo').val() + "</li>");

            }

            if ($('#prophylacticDateArrow').hasClass("fas fa-chevron-up")) {

                $("ol").append("<li>Prophylactic Date From - " + $('#prophylacticDateFrom').val() + "</li>")
                    .append("<li>Prophylactic Date To - " + $('#prophylacticDateTo').val() + "</li>");

            }

        }

    }

</script>