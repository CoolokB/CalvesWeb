<div class="form-group">

    <i id="footBathArrow" class="fas fa-chevron-down"></i>
    <a onclick="switchArrow('#footBathArrow')"
       href="#"
       id="footBathMenu">Foot Bath</a>

</div>

<div id="footBathCollapse" class="collapse ml-1">


    <div class="form-group">

        <i id="footBathChemicalArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#footBathChemicalArrow')"
           href="#"
           id="footBathChemicalMenu">Chemical</a>

    </div>

    <div id="footBathChemicalCollapse" class="collapse ml-1">

        <div class="form-group">
            <input type="text" class="form-control form-control-sm" id="footBathChemical">
        </div>

    </div>

    <hr>

    <div class="form-group">

        <i id="footBathDateArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#footBathDateArrow')"
           href="#"
           id="footBathDateMenu">Date</a>

    </div>

    <div id="footBathDateCollapse" class="collapse ml-1">

        <div class="form-group">
            <label for="footBathDateFrom">Date ></label>
            <input type="date" required
                   value="${aDate?string.iso}"
                   data-date-format=yyyy-MM-dd"
                   id="footBathDateFrom"
                   class="form-control form-control-sm smallText">
        </div>

        <div class="form-group">
            <label for="footBathDateTo">Date <</label>
            <input type="date" required
                   value="${aDate?string.iso}"
                   data-date-format=yyyy-MM-dd"
                   id="footBathDateTo"
                   class="form-control form-control-sm smallText">
        </div>

    </div>

    <hr class="bottomLine">

</div>
<hr>
<script>

    $("#footBathDateFrom , #footBathDateTo").change(function () {

        let today = new Date();
        let dateToCheck = new Date(this.value);
        let dateFrom = new Date($('#footBathDateFrom').val());
        let dateTo = new Date($('#footBathDateTo').val());

        if (dateToCheck > today) {
            alert("You cannot enter a date in the future!");
            this.value = "${aDate?string.iso}";

        } else if (dateFrom > dateTo) {
            alert("date from is after date to!");
            this.value = "${aDate?string.iso}";
        }

    });

    $('#footBathMenu').click(function () {
        $('#footBathCollapse').slideToggle(400);
    });

    $('#footBathChemicalMenu').click(function () {
        $('#footBathChemicalCollapse').slideToggle(100);
    });

    $('#footBathDateMenu').click(function () {
        $('#footBathDateCollapse').slideToggle(400);
    });

    function setFootBathParameters() {

        if ($('#footBathArrow').hasClass("fas fa-chevron-up")) {

            if ($('#footBathChemicalArrow').hasClass("fas fa-chevron-up")) {

                $("ol").append("<li>Foot Bath Chemical - " + $('#footBathChemical').val() + "</li>");
            }

            if ($('#footBathDateArrow').hasClass("fas fa-chevron-up")) {

                $("ol").append("<li>Foot Bath Date From - " + $('#footBathDateFrom').val() + "</li>")
                    .append("<li>Foot Bath Date To - " + $('#footBathDateTo').val() + "</li>");

            }

        }

    }

</script>