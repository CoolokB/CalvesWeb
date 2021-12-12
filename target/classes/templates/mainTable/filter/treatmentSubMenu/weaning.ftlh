<div class="form-group">

    <i id="weaningArrow" class="fas fa-chevron-down"></i>
    <a onclick="switchArrow('#weaningArrow')"
       href="#"
       id="weaningMenu">Weaning</a>

</div>

<div id="weaningCollapse" class="collapse ml-1">

    <div class="form-group">

        <i id="weaningAgeArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#weaningAgeArrow')"
           href="#"
           id="weaningAgeMenu">Age</a>

    </div>

    <div id="weaningAgeCollapse" class="collapse ml-1">

        <div class="form-group">
            <label class="label" for="weaningAgeFrom">Age ></label>
            <input type="text" class="form-control form-control-sm" id="weaningAgeFrom">
        </div>

        <div class="form-group">
            <label class="label" for="weaningAgeTo">Age <</label>
            <input type="text" class="form-control form-control-sm" id="weaningAgeTo">
        </div>

    </div>

    <hr>

    <div class="form-group">

        <i id="weaningDateArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#weaningDateArrow')"
           href="#"
           id="weaningDateMenu">Date</a>

    </div>

    <div id="weaningDateCollapse" class="collapse ml-1">

        <div class="form-group">
            <label for="weaningDateFrom">Date ></label>
            <input type="date" required
                   value="${aDate?string.iso}"
                   data-date-format=yyyy-MM-dd"
                   id="weaningDateFrom"
                   class="form-control form-control-sm smallText">
        </div>

        <div class="form-group">
            <label for="weaningDateTo">Date <</label>
            <input type="date" required
                   value="${aDate?string.iso}"
                   data-date-format=yyyy-MM-dd"
                   id="weaningDateTo"
                   class="form-control form-control-sm smallText">
        </div>

    </div>

</div>
<hr class="bottomLine">
<script>

    $("#weaningDateFrom , #weaningDateTo").change(function () {

        let today = new Date();
        let dateToCheck = new Date(this.value);
        let dateFrom = new Date($('#weaningDateFrom').val());
        let dateTo = new Date($('#weaningDateTo').val());

        if (dateToCheck > today) {
            alert("You cannot enter a date in the future!");
            this.value = "${aDate?string.iso}";

        } else if (dateFrom > dateTo) {
            alert("date from is after date to!");
            this.value = "${aDate?string.iso}";

        }

    });

    $('#weaningMenu').click(function () {
        $('#weaningCollapse').slideToggle(100);
    });

    $('#weaningAgeMenu').click(function () {
        $('#weaningAgeCollapse').slideToggle(400);
    });

    $('#weaningDateMenu').click(function () {
        $('#weaningDateCollapse').slideToggle(400);
    });

    function setWeaningParameters() {

        if ($('#weaningArrow').hasClass("fas fa-chevron-up")) {

            if ($('#weaningAgeArrow').hasClass("fas fa-chevron-up")) {

                $("ol").append("<li>Weaning Age From - " + $('#weaningAgeFrom').val() + "</li>")
                    .append("<li>Weaning Age To - " + $('#weaningAgeTo').val() + "</li>");

            }

            if ($('#weaningDateArrow').hasClass("fas fa-chevron-up")) {

                $("ol").append("<li>Weaning Date From - " + $('#weaningDateFrom').val() + "</li>")
                    .append("<li>Weaning Date To - " + $('#weaningDateTo').val() + "</li>");

            }

        }

    }

</script>
