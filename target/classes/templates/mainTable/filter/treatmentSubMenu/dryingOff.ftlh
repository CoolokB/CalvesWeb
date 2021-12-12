<div class="form-group">

    <i id="dryingArrow" class="fas fa-chevron-down"></i>
    <a onclick="switchArrow('#dryingArrow')"
       href="#"
       id="dryingMenu">Drying Off</a>

</div>

<div id="dryingCollapse" class="collapse ml-1">

    <div class="form-group">

        <i id="routineDryingOffArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#routineDryingOffArrow')"
           href="#"
           id="routineDryingOffMenu">Routine Drying Off</a>

    </div>

    <div id="routineDryingOffCollapse" class="collapse ml-1">

        <div class="form-group">

            <i id="dryingOffDaysBeforeCalvingArrow" class="fas fa-chevron-down"></i>
            <a onclick="switchArrow('#dryingOffDaysBeforeCalvingArrow')"
               href="#"
               id="dryingOffDaysBeforeCalvingMenu">Days Before Calving</a>

        </div>

        <div id="dryingOffDaysBeforeCalvingCollapse" class="collapse ml-1">

            <div class="form-group">
                <label class="label" for="dryingOffDaysBeforeCalvingFrom">Days ></label>
                <input type="text"
                       class="form-control form-control-sm"
                       id="dryingOffDaysBeforeCalvingFrom">
            </div>

            <div class="form-group">
                <label class="label" for="dryingOffDaysBeforeCalvingTo">Days <</label>
                <input type="text"
                       class="form-control form-control-sm"
                       id="dryingOffDaysBeforeCalvingTo">
            </div>

        </div>

        <hr>

        <div class="form-group">

            <i id="dryingMedicineArrow" class="fas fa-chevron-down"></i>
            <a onclick="switchArrow('#dryingMedicineArrow')"
               href="#"
               id="dryingMedicineMenu">Medicine</a>

        </div>

        <div id="dryingMedicineCollapse" class="collapse ml-1">

            <#list medicines as m>

                <div class="form-group">
                    <div class="form-check">
                        <input class="form-check-input dryingMedicineCheck"
                               type="checkbox"
                               value="${m.getName()}">
                        <label class="form-check-label">
                            ${m.getName()}
                        </label>
                    </div>
                </div>

            </#list>

        </div>

        <hr>

    </div>

    <hr>

    <div class="form-group">

        <i id="teatDryingOffArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#teatDryingOffArrow')"
           href="#"
           id="teatDryingOffMenu">Teat Drying Off</a>

    </div>

    <div id="teatDryingOffCollapse" class="collapse ml-1">

        <div class="form-group">

            <i id="dryingOffDaysAfterCalvingArrow" class="fas fa-chevron-down"></i>
            <a onclick="switchArrow('#dryingOffDaysAfterCalvingArrow')"
               href="#"
               id="dryingOffDaysAfterCalvingMenu">Days After Calving</a>

        </div>

        <div id="dryingOffDaysAfterCalvingCollapse" class="collapse ml-1">

            <div class="form-group">
                <label class="label" for="dryingOffDaysAfterCalvingFrom">Days ></label>
                <input type="text"
                       class="form-control form-control-sm"
                       id="dryingOffDaysAfterCalvingFrom">
            </div>

            <div class="form-group">
                <label class="label" for="dryingOffDaysAfterCalvingTo">Days <</label>
                <input type="text"
                       class="form-control form-control-sm"
                       id="dryingOffDaysAfterCalvingTo">
            </div>

        </div>

        <hr>

        <div class="form-group">

            <i id="dryingTeatArrow" class="fas fa-chevron-down"></i>
            <a onclick="switchArrow('#dryingTeatArrow')"
               href="#"
               id="dryingTeatMenu">Teat</a>

        </div>

        <div id="dryingTeatCollapse" class="collapse ml-1">

            <label class="switch">
                <input type="checkbox" id="dryingOffTeatToggle">
                <span class="slider"></span>
            </label>

            <#list dryingOffTeat as dot>

                <div class="form-group">
                    <div class="form-check">
                        <input class="form-check-input dryingOffTeatCheck"
                               type="checkbox"
                               value="${dot}">
                        <label class="form-check-label">
                            ${dot}
                        </label>
                    </div>
                </div>

            </#list>

        </div>

        <hr>

        <div class="form-group">

            <i id="dryingTypeArrow" class="fas fa-chevron-down"></i>
            <a onclick="switchArrow('#dryingTypeArrow')"
               href="#"
               id="dryingTypeMenu">Type</a>

        </div>

        <div id="dryingTypeCollapse" class="collapse ml-1">

            <#list dryingOffType as dotype>

                <div class="form-group">
                    <div class="form-check">
                        <input class="form-check-input dryingOffTypeCheck"
                               type="checkbox"
                               value="${dotype}">
                        <label class="form-check-label">
                            ${dotype.getText()}
                        </label>
                    </div>
                </div>

            </#list>

        </div>

    </div>

    <hr>

    <div class="form-group">

        <i id="dryingOffDateArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#dryingOffDateArrow')"
           href="#"
           id="dryingOffDateMenu">Date</a>

    </div>

    <div id="dryingOffDateCollapse" class="collapse ml-1">

        <div class="form-group">
            <label for="dryingOffDateFrom">Date ></label>
            <input type="date" required
                   value="${aDate?string.iso}"
                   data-date-format=yyyy-MM-dd"
                   id="dryingOffDateFrom"
                   class="form-control form-control-sm smallText">
        </div>

        <div class="form-group">
            <label for="dryingOffDateTo">Date <</label>
            <input type="date" required
                   value="${aDate?string.iso}"
                   data-date-format=yyyy-MM-dd"
                   id="dryingOffDateTo"
                   class="form-control form-control-sm smallText">
        </div>

    </div>

    <hr class="bottomLine">

</div>

<hr>

<script>

    $("#dryingOffDateFrom , #dryingOffDateTo").change(function () {

        let today = new Date();
        let dateToCheck = new Date(this.value);
        let dateFrom = new Date($('#dryingOffDateFrom').val());
        let dateTo = new Date($('#dryingOffDateTo').val());

        if (dateToCheck > today) {
            alert("You cannot enter a date in the future!");
            this.value = "${aDate?string.iso}";

        } else if (dateFrom > dateTo) {
            alert("date from is after date to!");
            this.value = "${aDate?string.iso}";
        }

    });

    $('#dryingMenu').click(function () {
        $('#dryingCollapse').slideToggle(400);
    });

    $('#dryingOffDaysBeforeCalvingMenu').click(function () {
        $('#dryingOffDaysBeforeCalvingCollapse').slideToggle(400);
    });

    $('#dryingMedicineMenu').click(function () {
        $('#dryingMedicineCollapse').slideToggle(400);
    });

    $('#dryingOffDaysAfterCalvingMenu').click(function () {
        $('#dryingOffDaysAfterCalvingCollapse').slideToggle(400);
    });

    $('#dryingTeatMenu').click(function () {
        $('#dryingTeatCollapse').slideToggle(400);
    });

    $('#dryingTypeMenu').click(function () {
        $('#dryingTypeCollapse').slideToggle(400);
    });

    $('#routineDryingOffMenu').click(function () {
        $('#routineDryingOffCollapse').slideToggle(400);
    });

    $('#teatDryingOffMenu').click(function () {
        $('#teatDryingOffCollapse').slideToggle(400);
    });

    $('#dryingOffDateMenu').click(function () {
        $('#dryingOffDateCollapse').slideToggle(400);
    });

    function setDryingOffParameters() {

        if ($('#routineDryingOffArrow').hasClass("fas fa-chevron-up")) {

            if ($('#dryingOffDaysBeforeCalvingArrow').hasClass("fas fa-chevron-up")) {

                $("ol").append("<li>Drying Off Days Before Calving From - " + $('#dryingOffDaysBeforeCalvingFrom').val() + "</li>")
                    .append("<li>Drying Off Days Before Calving To - " + $('#dryingOffDaysBeforeCalvingTo').val() + "</li>");

            }

            if ($('#dryingMedicineArrow').hasClass("fas fa-chevron-up")) {

                addToResult($(".dryingMedicineCheck"), "Drying Off Medicine");

            }

        }

        if ($('#teatDryingOffArrow').hasClass("fas fa-chevron-up")) {

            if ($('#daysAfterCalvingArrow').hasClass("fas fa-chevron-up")) {

                $("ol").append("<li>Drying Off Days After Calving From - " + $('#dryingOffDaysAfterCalvingFrom').val() + "</li>")
                    .append("<li>Drying Off Days After Calving To - " + $('#dryingOffDaysAfterCalvingTo').val() + "</li>");

            }

            if ($('#dryingTeatArrow').hasClass("fas fa-chevron-up")) {

                addToResult($(".dryingOffTeatCheck"), "Drying Off Teat");

            }

            if ($('#dryingTypeArrow').hasClass("fas fa-chevron-up")) {

                addToResult($(".dryingOffTypeCheck"), "Drying Off Type");

            }

        }

        if ($('#dryingOffDateArrow').hasClass("fas fa-chevron-up")) {

            $("ol").append("<li>Drying Off Date From - " + $('#dryingOffDateFrom').val() + "</li>")
                .append("<li>Drying Off Date To - " + $('#dryingOffDateTo').val() + "</li>");

        }

    }

</script>