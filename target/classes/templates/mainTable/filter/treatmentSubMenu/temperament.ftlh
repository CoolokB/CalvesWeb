<div class="form-group">

    <i id="temperamentArrow" class="fas fa-chevron-down"></i>
    <a onclick="switchArrow('#temperamentArrow')"
       href="#"
       id="temperamentMenu">Temperament</a>

</div>

<div id="temperamentCollapse" class="collapse ml-1">

    <div class="form-group">

        <i id="temperamentAboutArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#temperamentAboutArrow')"
           href="#"
           id="temperamentAboutMenu">About</a>

    </div>

    <div id="temperamentAboutCollapse" class="collapse ml-1">

        <div class="form-group">
            <label class="label" for="temperamentAbout">About</label>
            <input type="text" class="form-control form-control-sm" id="temperamentAbout">
        </div>

    </div>

    <hr>

    <div class="form-group">

        <i id="temperamentAgeArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#temperamentAgeArrow')"
           href="#"
           id="temperamentAgeMenu">Age</a>

    </div>

    <div id="temperamentAgeCollapse" class="collapse ml-1">

        <div class="form-group">
            <label class="label" for="temperamentAgeFrom">Age ></label>
            <input type="text" class="form-control form-control-sm" id="temperamentAgeFrom">
        </div>

        <div class="form-group">
            <label class="label" for="temperamentAgeTo">Age <</label>
            <input type="text" class="form-control form-control-sm" id="temperamentAgeTo">
        </div>

    </div>

    <hr>

    <div class="form-group">

        <i id="temperamentDateArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#temperamentDateArrow')"
           href="#"
           id="temperamentDateMenu">Date</a>

    </div>

    <div id="temperamentDateCollapse" class="collapse ml-1">

        <div class="form-group">
            <label for="temperamentDateFrom">Date ></label>
            <input type="date" required
                   value="${aDate?string.iso}"
                   data-date-format=yyyy-MM-dd"
                   id="temperamentDateFrom"
                   class="form-control form-control-sm smallText">
        </div>

        <div class="form-group">
            <label for="temperamentDateTo">Date <</label>
            <input type="date" required
                   value="${aDate?string.iso}"
                   data-date-format=yyyy-MM-dd"
                   id="temperamentDateTo"
                   class="form-control form-control-sm smallText">
        </div>

    </div>

    <hr class="bottomLine">

</div>

<hr>

<script>

    $("#temperamentDateFrom , #temperamentDateTo").change(function () {

        let today = new Date();
        let dateToCheck = new Date(this.value);
        let dateFrom = new Date($('#temperamentDateFrom').val());
        let dateTo = new Date($('#temperamentDateTo').val());

        if (dateToCheck > today) {
            alert("You cannot enter a date in the future!");
            this.value = "${aDate?string.iso}";

        } else if (dateFrom > dateTo) {
            alert("date from is after date to!");
            this.value = "${aDate?string.iso}";

        }

    });

    $('#temperamentMenu').click(function () {
        $('#temperamentCollapse').slideToggle(400);
    });

    $('#temperamentAboutMenu').click(function () {
        $('#temperamentAboutCollapse').slideToggle(100);
    });

    $('#temperamentAgeMenu').click(function () {
        $('#temperamentAgeCollapse').slideToggle(400);
    });

    $('#temperamentDateMenu').click(function () {
        $('#temperamentDateCollapse').slideToggle(400);
    });

    function setTemperamentParameters() {

        if ($('#temperamentArrow').hasClass("fas fa-chevron-up")) {

            if ($('#temperamentAboutArrow').hasClass("fas fa-chevron-up")) {

                $("ol").append("<li>Temperament About - " + $('#temperamentAbout').val() + "</li>");

            }

            if ($('#temperamentAgeArrow').hasClass("fas fa-chevron-up")) {

                $("ol").append("<li>Temperament Age From - " + $('#temperamentAgeFrom').val() + "</li>")
                    .append("<li>Temperament Age To - " + $('#temperamentAgeTo').val() + "</li>");

            }

            if ($('#temperamentDateArrow').hasClass("fas fa-chevron-up")) {

                $("ol").append("<li>Temperament Date From - " + $('#temperamentDateFrom').val() + "</li>")
                    .append("<li>Temperament Date To - " + $('#temperamentDateTo').val() + "</li>");

            }

        }

    }

</script>