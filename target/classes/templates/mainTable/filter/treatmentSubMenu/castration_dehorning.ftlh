<div class="form-group">

    <i id="castrationDehorningArrow" class="fas fa-chevron-down"></i>
    <a onclick="switchArrow('#castrationDehorningArrow')"
       href="#"
       id="castrationDehorningMenu">Castration / Dehorning</a>

</div>

<div id="collapseCastrationDehorning" class="collapse ml-1">

    <div class="form-group">

        <i id="castrationTypeArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#castrationTypeArrow')"
           href="#"
           id="castrationTypeMenu">Type</a>

    </div>

    <div id="castrationTypeCollapse" class="collapse ml-1">

        <#list castrationType as ct>

            <div class="form-group">
                <div class="form-check">
                    <input class="form-check-input castrationTypeCheck"
                           type="checkbox"
                           value="${ct}">
                    <label class="form-check-label">
                        ${ct.getText()}
                    </label>
                </div>
            </div>

        </#list>

    </div>

    <hr>

    <div class="form-group">

        <i id="castrationAgeArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#castrationAgeArrow')"
           href="#"
           id="castrationAgeMenu">Age</a>

    </div>

    <div id="castrationAgeCollapse" class="collapse ml-1">

        <div class="form-group">
            <label class="label" for="castrationAgeFrom">Age ></label>
            <input type="text"
                   class="form-control form-control-sm"
                   id="castrationAgeFrom">
        </div>
        <div class="form-group">
            <label class="label" for="castrationAgeTo">Age <</label>
            <input type="text"
                   class="form-control form-control-sm"
                   id="castrationAgeTo">
        </div>

    </div>

    <hr>

    <div class="form-group">

        <i id="castrationDateArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#castrationDateArrow')"
           href="#"
           id="castrationDateMenu">Date</a>

    </div>

    <div id="castrationDateCollapse" class="collapse ml-1">

        <div class="form-group">
            <label for="castrationDateFrom">Date ></label>
            <input type="date" required
                   value="${aDate?string.iso}"
                   data-date-format=yyyy-MM-dd"
                   id="castrationDateFrom"
                   class="form-control form-control-sm smallText">
        </div>

        <div class="form-group">
            <label for="castrationDateTo">Date <</label>
            <input type="date" required
                   value="${aDate?string.iso}"
                   data-date-format=yyyy-MM-dd"
                   id="castrationDateTo"
                   class="form-control form-control-sm smallText">
        </div>


    </div>

    <hr class="bottomLine">

</div>

<hr>

<script>

    $("#castrationDateFrom , #castrationDateTo").change(function () {

        let today = new Date();
        let dateToCheck = new Date(this.value);
        let dateFrom = new Date($('#castrationDateFrom').val());
        let dateTo = new Date($('#castrationDateTo').val());

        if (dateToCheck > today) {
            alert("You cannot enter a date in the future!");
            this.value = "${aDate?string.iso}";

        } else if (dateFrom > dateTo) {
            alert("date from is after date to!");
            this.value = "${aDate?string.iso}";
        }

    });

    $('#castrationDehorningMenu').click(function () {
        $('#collapseCastrationDehorning').slideToggle(400);
    });

    $('#castrationTypeMenu').click(function () {
        $('#castrationTypeCollapse').slideToggle(400);
    });

    $('#castrationAgeMenu').click(function () {
        $('#castrationAgeCollapse').slideToggle(400);
    });

    $('#castrationDateMenu').click(function () {
        $('#castrationDateCollapse').slideToggle(400);
    });

    function setCastrationDehorningParameters() {

        if ($('#castrationDehorningArrow').hasClass("fas fa-chevron-up")) {

            if ($('#castrationTypeArrow').hasClass("fas fa-chevron-up")) {

                addToResult($(".castrationTypeCheck"), "Castration / Dehorning Type");

            }

            if ($('#castrationAgeArrow').hasClass("fas fa-chevron-up")) {

                $("ol").append("<li>Castration / Dehorning Age From - " + $('#castrationAgeFrom').val() + "</li>")
                    .append("<li>Castration / Dehorning Age To - " + $('#castrationAgeTo').val() + "</li>");

            }

            if ($('#castrationDateArrow').hasClass("fas fa-chevron-up")) {

                $("ol").append("<li>Castration / Dehorning Date From - " + $('#castrationDateFrom').val() + "</li>")
                    .append("<li>Castration / Dehorning Date To - " + $('#castrationDateTo').val() + "</li>");

            }

        }

    }

</script>