<div class="form-group">

    <i id="conditionScoreArrow" class="fas fa-chevron-down"></i>
    <a onclick="switchArrow('#conditionScoreArrow')"
       href="#"
       id="conditionScoreMenu">Condition Score</a>

</div>

<div id="collapseConditionScore" class="collapse ml-1">

    <div class="form-group">

        <i id="conditionScoreScoreArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#conditionScoreScoreArrow')"
           href="#"
           id="conditionScoreScoreMenu">Score</a>

    </div>

    <div id="conditionScoreScoreCollapse" class="collapse ml-1">

        <#list conditionScore as cs>

            <div class="form-group">
                <div class="form-check">
                    <input class="form-check-input conditionScoreCheck"
                           type="checkbox"
                           value="${cs}">
                    <label class="form-check-label">
                        ${cs}
                    </label>
                </div>
            </div>

        </#list>

    </div>

    <hr>

    <div class="form-group">

        <i id="conditionScoreAgeArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#conditionScoreAgeArrow')"
           href="#"
           id="conditionScoreAgeMenu">Age</a>

    </div>

    <div id="conditionScoreAgeCollapse" class="collapse ml-1">

        <div class="form-group">
            <label class="label" for="conditionScoreAgeFrom">Age ></label>
            <input type="text" class="form-control form-control-sm" id="conditionScoreAgeFrom">
        </div>
        <div class="form-group">
            <label class="label" for="conditionScoreAgeTo">Age <</label>
            <input type="text" class="form-control form-control-sm" id="conditionScoreAgeTo">
        </div>

    </div>

    <hr>

    <div class="form-group">

        <i id="conditionScoreDateArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#conditionScoreDateArrow')"
           href="#"
           id="conditionScoreDateMenu">Date</a>

    </div>

    <div id="conditionScoreDateCollapse" class="collapse ml-1">

        <div class="form-group">
            <label for="conditionScoreDateFrom">Date ></label>
            <input type="date" required
                   value="${aDate?string.iso}"
                   data-date-format=yyyy-MM-dd"
                   id="conditionScoreDateFrom"
                   class="form-control form-control-sm smallText">
        </div>

        <div class="form-group">
            <label for="conditionScoreDateTo">Date <</label>
            <input type="date" required
                   value="${aDate?string.iso}"
                   data-date-format=yyyy-MM-dd"
                   id="conditionScoreDateTo"
                   class="form-control form-control-sm smallText">
        </div>


    </div>

    <hr class="bottomLine">

</div>

<hr>

<script>

    $("#conditionScoreDateFrom , #conditionScoreDateTo").change(function () {

        let today = new Date();
        let dateToCheck = new Date(this.value);
        let dateFrom = new Date($('#conditionScoreDateFrom').val());
        let dateTo = new Date($('#conditionScoreDateTo').val());

        if (dateToCheck > today) {
            alert("You cannot enter a date in the future!");
            this.value = "${aDate?string.iso}";

        } else if (dateFrom > dateTo) {
            alert("date from is after date to!");
            this.value = "${aDate?string.iso}";
        }

    });

    $('#conditionScoreMenu').click(function () {
        $('#collapseConditionScore').slideToggle(400);
    });

    $('#conditionScoreScoreMenu').click(function () {
        $('#conditionScoreScoreCollapse').slideToggle(400);
    });

    $('#conditionScoreAgeMenu').click(function () {
        $('#conditionScoreAgeCollapse').slideToggle(400);
    });

    $('#conditionScoreDateMenu').click(function () {
        $('#conditionScoreDateCollapse').slideToggle(400);
    });

    function setConditionScoreParameters() {

        if ($('#conditionScoreArrow').hasClass("fas fa-chevron-up")) {

            if ($('#conditionScoreScoreArrow').hasClass("fas fa-chevron-up")) {

                addToResult($(".conditionScoreCheck"), "Condition Score");

            }

            if ($('#conditionScoreAgeArrow').hasClass("fas fa-chevron-up")) {

                $("ol").append("<li>Condition Score Age From - " + $('#conditionScoreAgeFrom').val() + "</li>")
                    .append("<li>Condition Score Age To - " + $('#conditionScoreAgeTo').val() + "</li>");

            }

            if ($('#conditionScoreDateArrow').hasClass("fas fa-chevron-up")) {

                $("ol").append("<li>Condition Score Date From - " + $('#conditionScoreDateFrom').val() + "</li>")
                    .append("<li>Condition Score Date To - " + $('#conditionScoreDateTo').val() + "</li>");

            }

        }

    }

</script>