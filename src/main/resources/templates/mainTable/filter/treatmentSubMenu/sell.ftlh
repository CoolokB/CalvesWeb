<div class="form-group">

    <i id="sellArrow" class="fas fa-chevron-down"></i>
    <a onclick="switchArrow('#sellArrow')"
       href="#"
       id="sellMenu">Sell</a>

</div>

<div id="sellMenuCollapse" class="collapse ml-1">

    <div class="form-group">

        <i id="sellDateArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#sellDateArrow')"
           href="#"
           id="sellDateMenu">Date</a>

    </div>

    <div id="sellDateCollapse" class="collapse ml-1">

        <div class="form-group">
            <label for="sellDateFrom">Date ></label>
            <input type="date" required
                   value="${aDate?string.iso}"
                   data-date-format=yyyy-MM-dd"
                   id="sellDateFrom"
                   class="form-control form-control-sm smallText">
        </div>

        <div class="form-group">
            <label for="sellDateTo">Date <</label>
            <input type="date" required
                   value="${aDate?string.iso}"
                   data-date-format=yyyy-MM-dd"
                   id="sellDateTo"
                   class="form-control form-control-sm smallText">
        </div>

    </div>

    <hr class="bottomLine">

</div>

<hr>
<script>

    $("#sellDateFrom , #sellDateTo").change(function () {

        let today = new Date();
        let dateToCheck = new Date(this.value);
        let dateFrom = new Date($('#sellDateFrom').val());
        let dateTo = new Date($('#sellDateTo').val());

        if (dateToCheck > today) {
            alert("You cannot enter a date in the future!");
            this.value = "${aDate?string.iso}";

        } else if (dateFrom > dateTo) {
            alert("date from is after date to!");
            this.value = "${aDate?string.iso}";

        }

    });

    $('#sellMenu').click(function () {
        $('#sellMenuCollapse').slideToggle(400);
    });

    $('#sellDateMenu').click(function () {
        $('#sellDateCollapse').slideToggle(400);
    });

    function setSellParameters() {

        if ($('#sellDateArrow').hasClass("fas fa-chevron-up")) {

            $("ol").append("<li>Sell Date From - " + $('#sellDateFrom').val() + "</li>")
                .append("<li>Sell Date To - " + $('#sellDateTo').val() + "</li>");

        }

    }

</script>

