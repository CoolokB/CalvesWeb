<div class="form-group">

    <i id="deathArrow" class="fas fa-chevron-down"></i>
    <a onclick="switchArrow('#deathArrow')"
       href="#"
       id="deathMenu">Death</a>

</div>

<div id="deathCollapse" class="collapse ml-1">

    <div class="form-group">

        <i id="deathMethodArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#deathMethodArrow')"
           href="#"
           id="deathMethodMenu">Death Method</a>

    </div>

    <div id="deathMethodCollapse" class="collapse  ml-1">

        <#list deathMethod as dm>

            <div class="form-group">
                <div class="form-check">
                    <input class="form-check-input deathMethodCheck"
                           type="checkbox"
                           value="${dm}">
                    <label class="form-check-label">
                        ${dm.getText()}
                    </label>
                </div>
            </div>

        </#list>

    </div>

    <hr>

    <div class="form-group">

        <i id="deathCauseArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#deathCauseArrow')"
           href="#"
           id="deathCauseMenu">Death Cause</a>

    </div>

    <div id="deathCauseCollapse" class="collapse  ml-1">

        <div class="form-group">
            <label class="label" for="deathCause">Death Cause</label>
            <input type="text" class="form-control form-control-sm" id="deathCause">
        </div>

    </div>

    <hr>

    <div class="form-group">

        <i id="deathAgeArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#deathAgeArrow')"
           href="#"
           id="deathAgeMenu">Age</a>

    </div>

    <div id="deathAgeCollapse" class="collapse  ml-1">

        <div class="form-group">
            <label class="label" for="deathAgeFrom">Age ></label>
            <input type="text" class="form-control form-control-sm" id="deathAgeFrom">
        </div>
        <div class="form-group">
            <label class="label" for="deathAgeTo">Age <</label>
            <input type="text" class="form-control form-control-sm" id="deathAgeTo">
        </div>

    </div>

    <hr>

    <div class="form-group">

        <i id="deathDateArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#deathDateArrow')"
           href="#"
           id="deathDateMenu">Date</a>

    </div>

    <div id="deathDateCollapse" class="collapse ml-1">

        <div class="form-group">
            <label for="deathDateFrom">Date ></label>
            <input type="date" required
                   value="${aDate?string.iso}"
                   data-date-format=yyyy-MM-dd"
                   id="deathDateFrom"
                   class="form-control form-control-sm smallText">
        </div>

        <div class="form-group">
            <label for="deathDateTo">Date <</label>
            <input type="date" required
                   value="${aDate?string.iso}"
                   data-date-format=yyyy-MM-dd"
                   id="deathDateTo"
                   class="form-control form-control-sm smallText">
        </div>

    </div>

    <hr class="bottomLine">

</div>

<hr>

<script>

    $("#deathDateFrom , #deathDateTo").change(function () {

        let today = new Date();
        let dateToCheck = new Date(this.value);
        let dateFrom = new Date($('#deathDateFrom').val());
        let dateTo = new Date($('#deathDateTo').val());

        if (dateToCheck > today) {
            alert("You cannot enter a date in the future!");
            this.value = "${aDate?string.iso}";

        } else if (dateFrom > dateTo) {
            this.value = "${aDate?string.iso}";
            alert("date from is after date to!");


        }

    });

    $('#deathMenu').click(function () {
        $('#deathCollapse').slideToggle(400);
    });

    $('#deathMethodMenu').click(function () {
        $('#deathMethodCollapse').slideToggle(400);
    });

    $('#deathCauseMenu').click(function () {
        $('#deathCauseCollapse').slideToggle(400);
    });

    $('#deathAgeMenu').click(function () {
        $('#deathAgeCollapse').slideToggle(400);
    });

    $('#deathDateMenu').click(function () {
        $('#deathDateCollapse').slideToggle(400);
    });

    function setDeathParameters() {

        if ($('#deathArrow').hasClass("fas fa-chevron-up")) {

            if ($('#deathMethodArrow').hasClass("fas fa-chevron-up")) {

                addToResult($(".deathMethodCheck"), "Death Method");

            }

            if ($('#deathCauseArrow').hasClass("fas fa-chevron-up")) {

                $("ol").append("<li>Cause Of Death - " + $('#deathCause').val() + "</li>");

            }

            if ($('#deathAgeArrow').hasClass("fas fa-chevron-up")) {

                $("ol").append("<li>Death Age From - " + $('#deathAgeFrom').val() + "</li>")
                    .append("<li>Death Age To - " + $('#deathAgeTo').val() + "</li>");

            }

            if ($('#deathDateArrow').hasClass("fas fa-chevron-up")) {

                $("ol").append("<li>Death Date From - " + $('#deathDateFrom').val() + "</li>")
                    .append("<li>Death Date To - " + $('#deathDateTo').val() + "</li>");

            }

        }

    }

</script>