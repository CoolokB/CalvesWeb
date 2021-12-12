<div class="form-group">

    <i id="milkYieldArrow" class="fas fa-chevron-down"></i>
    <a onclick="switchArrow('#milkYieldArrow')"
       href="#"
       id="milkYieldMenu">Milk Yield</a>

</div>

<div id="milkYieldCollapse" class="collapse ml-1">

    <div class="form-group">

        <i id="lactationNumberArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#lactationNumberArrow')"
           href="#"
           id="lactationNumberMenu">Lactation №</a>

    </div>

    <div id="lactationNumberCollapse" class="collapse ml-1">

        <label class="switch">
            <input type="checkbox" id="lactationNumberToggle">
            <span class="slider"></span>
        </label>

        <#list lactationNumber as ln>

            <div class="form-group">
                <div class="form-check">
                    <input class="form-check-input milkYieldLactationNumberCheck"
                           type="checkbox"
                           value="${ln}">
                    <label class="form-check-label">
                        ${ln}
                    </label>
                </div>
            </div>

        </#list>

    </div>

    <hr>

    <div class="form-group">

        <i id="lactationWeightArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#lactationWeightArrow')"
           href="#"
           id="lactationWeightMenu">Weight</a>

    </div>

    <div id="lactationWeightCollapse" class="collapse ml-1">

        <div class="form-group">
            <label for="lactationWeightFrom" class="label">Amount ></label>
            <input type="text" class="form-control form-control-sm" id="lactationWeightFrom">
        </div>

        <div class="form-group">
            <label for="lactationWeightTo" class="label">Amount <</label>
            <input type="text" class="form-control form-control-sm" id="lactationWeightTo">
        </div>

    </div>

    <hr>

    <div class="form-group">

        <i id="milkYieldDateArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#milkYieldDateArrow')"
           href="#"
           id="milkYieldDateMenu">Date</a>

    </div>

    <div id="milkYieldDateCollapse" class="collapse ml-1">

        <div class="form-group">
            <label for="milkYieldDateFrom">Date ></label>
            <input type="date" required
                   value="${aDate?string.iso}"
                   data-date-format=yyyy-MM-dd"
                   id="milkYieldDateFrom"
                   class="form-control form-control-sm smallText">
        </div>

        <div class="form-group">
            <label for="milkYieldDateTo">Date <</label>
            <input type="date" required
                   value="${aDate?string.iso}"
                   data-date-format=yyyy-MM-dd"
                   id="milkYieldDateTo"
                   class="form-control form-control-sm smallText">
        </div>

    </div>

    <hr class="bottomLine">

</div>
<hr>
<script>

    $("#milkYieldDateFrom , #milkYieldDateTo").change(function () {

        let today = new Date();
        let dateToCheck = new Date(this.value);
        let dateFrom = new Date($('#milkYieldDateFrom').val());
        let dateTo = new Date($('#milkYieldDateTo').val());

        if (dateToCheck > today) {
            alert("You cannot enter a date in the future!");
            this.value = "${aDate?string.iso}";


        } else if (dateFrom > dateTo) {
            alert("date from is after date to!");
            this.value = "${aDate?string.iso}";
        }

    });

    $('#milkYieldMenu').click(function () {
        $('#milkYieldCollapse').slideToggle(400);
    });

    $('#lactationNumberMenu').click(function () {
        $('#lactationNumberCollapse').slideToggle(400);
    });

    $('#lactationWeightMenu').click(function () {
        $('#lactationWeightCollapse').slideToggle(400);
    });

    $('#milkYieldDateMenu').click(function () {
        $('#milkYieldDateCollapse').slideToggle(400);
    });

    function setMilkYieldParameters() {

        if ($('#milkYieldArrow').hasClass("fas fa-chevron-up")) {

            if ($('#lactationNumberArrow').hasClass("fas fa-chevron-up")) {

                addToResult($(".milkYieldLactationNumberCheck"), "Lactation Number");

            }

            if ($('#lactationWeightArrow').hasClass("fas fa-chevron-up")) {

                $("ol").append("<li>Lactation Weight From - " + $('#lactationWeightFrom').val() + "</li>")
                    .append("<li>Lactation Weight To - " + $('#lactationWeightTo').val() + "</li>");

            }

            if ($('#milkYieldDateArrow').hasClass("fas fa-chevron-up")) {

                $("ol").append("<li>Milk Yield Date From - " + $('#milkYieldDateFrom').val() + "</li>")
                    .append("<li>Milk Yield Date To - " + $('#milkYieldDateTo').val() + "</li>");

            }

        }

    }

</script>