<div class="form-group">

    <i id="pregnancyTestArrow" class="fas fa-chevron-down"></i>
    <a onclick="switchArrow('#pregnancyTestArrow')"
       href="#"
       id="pregnancyTestMenu">Pregnancy Test</a>

</div>

<div id="pregnancyTestCollapse" class="collapse ml-1">

    <div class="form-group">

        <i id="pregnancyResultArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#pregnancyResultArrow')"
           href="#"
           id="pregnancyResultMenu">Pregnant</a>

    </div>

    <div id="pregnancyResultCollapse" class="collapse ml-1">

        <#list pregnantState as ps>

            <div class="form-group">
                <div class="form-check">
                    <input class="form-check-input pregnancyTestResultCheck"
                           type="checkbox"
                           value="${ps}">
                    <label class="form-check-label">
                        ${ps.getText()}
                    </label>
                </div>
            </div>

        </#list>

    </div>

    <hr>

    <div class="form-group">

        <i id="pregnancyDaysAfterInseminationArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#pregnancyDaysAfterInseminationArrow')"
           href="#"
           id="pregnancyDaysAfterInseminationMenu">Days After Insemination</a>

    </div>

    <div id="pregnancyDaysAfterInseminationCollapse" class="collapse ml-1">

        <div class="form-group">
            <label class="label" for="pregnancyDaysAfterInseminationFrom">Days After ></label>
            <input type="text" class="form-control form-control-sm" id="pregnancyDaysAfterInseminationFrom">
        </div>

        <div class="form-group">
            <label class="label" for="pregnancyDaysAfterInseminationTo">Days After <</label>
            <input type="text" class="form-control form-control-sm" id="pregnancyDaysAfterInseminationTo">
        </div>

    </div>

    <hr>

    <div class="form-group">

        <i id="pregnancyTestDateArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#pregnancyTestDateArrow')"
           href="#"
           id="pregnancyTestDateMenu">Date</a>

    </div>

    <div id="pregnancyTestDateCollapse" class="collapse ml-1">

        <div class="form-group">
            <label for="pregnancyTestDateFrom">Date ></label>
            <input type="date" required
                   value="${aDate?string.iso}"
                   data-date-format=yyyy-MM-dd"
                   id="pregnancyTestDateFrom"
                   class="form-control form-control-sm smallText">
        </div>

        <div class="form-group">
            <label for="pregnancyTestDateTo">Date <</label>
            <input type="date" required
                   value="${aDate?string.iso}"
                   data-date-format=yyyy-MM-dd"
                   id="pregnancyTestDateTo"
                   class="form-control form-control-sm smallText">
        </div>

    </div>

    <hr class="bottomLine">

</div>
<hr>
<script>

    $("#pregnancyTestDateFrom , #pregnancyTestDateTo").change(function () {

        let today = new Date();
        let dateToCheck = new Date(this.value);
        let dateFrom = new Date($('#pregnancyTestDateFrom').val());
        let dateTo = new Date($('#pregnancyTestDateTo').val());

        if (dateToCheck > today) {
            alert("You cannot enter a date in the future!");
            this.value = "${aDate?string.iso}";

        } else if (dateFrom > dateTo) {
            alert("date from is after date to!");
            this.value = "${aDate?string.iso}";

        }

    });

    $('#pregnancyTestMenu').click(function () {
        $('#pregnancyTestCollapse').slideToggle(400);
    });

    $('#pregnancyResultMenu').click(function () {
        $('#pregnancyResultCollapse').slideToggle(400);
    });

    $('#pregnancyDaysAfterInseminationMenu').click(function () {
        $('#pregnancyDaysAfterInseminationCollapse').slideToggle(400);
    });

    $('#pregnancyTestDateMenu').click(function () {
        $('#pregnancyTestDateCollapse').slideToggle(400);
    });

    function setPregnancyTestParameters() {

        if ($('#pregnancyTestArrow').hasClass("fas fa-chevron-up")) {

            if ($('#pregnancyResultArrow').hasClass("fas fa-chevron-up")) {

                addToResult($(".pregnancyTestResultCheck"), "Pregnancy Test Result");

            }

            if ($('#pregnancyDaysAfterInseminationArrow').hasClass("fas fa-chevron-up")) {

                $("ol").append("<li>Pregnancy Test Days after Insemination From - " + $('#pregnancyDaysAfterInseminationFrom').val() + "</li>")
                    .append("<li>Pregnancy Test Days after Insemination To - " + $('#pregnancyDaysAfterInseminationTo').val() + "</li>");

            }

            if ($('#pregnancyTestDateArrow').hasClass("fas fa-chevron-up")) {

                $("ol").append("<li>Pregnancy Test Date From - " + $('#pregnancyTestDateFrom').val() + "</li>")
                    .append("<li>Pregnancy Test Date To - " + $('#pregnancyTestDateTo').val() + "</li>");

            }

        }

    }

</script>