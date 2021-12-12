<div class="form-group">

    <i id="inseminationArrow" class="fas fa-chevron-down"></i>
    <a onclick="switchArrow('#inseminationArrow')"
       href="#"
       id="inseminationMenu">Insemination</a>

</div>

<div id="collapseInsemination" class="collapse ml-1">

    <div class="form-group">

        <i id="inseminationBreedArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#inseminationBreedArrow')"
           href="#"
           id="inseminationBreedMenu">Bull's Breed</a>

    </div>

    <div id="inseminationBreedCollapse" class="collapse ml-1">

        <#list bullBreed as br>

            <div class="form-group">
                <div class="form-check">
                    <input class="form-check-input inseminationBullBreedCheck"
                           type="checkbox"
                           value="${br}">
                    <label class="form-check-label">${br}</label>
                </div>
            </div>

        </#list>

    </div>

    <hr>

    <div class="form-group">

        <i id="inseminationTypeArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#inseminationTypeArrow')"
           href="#"
           id="inseminationTypeMenu">Type</a>

    </div>

    <div id="inseminationTypeCollapse" class="collapse ml-1">

        <#list inseminationType as t>

            <div class="form-group">
                <div class="form-check">
                    <input class="form-check-input inseminationTypeCheck"
                           type="checkbox"
                           value="${t}">
                    <label class="form-check-label">
                        ${t.getText()}
                    </label>
                </div>
            </div>

        </#list>

    </div>

    <hr>

    <div class="form-group">

        <i id="inseminationPersonArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#inseminationPersonArrow')"
           href="#"
           id="inseminationPersonMenu">Person</a>

    </div>

    <div id="inseminationPersonCollapse" class="collapse ml-1">

        <#list person as p>

            <div class="form-group">
                <div class="form-check">
                    <input class="form-check-input inseminationPersonCheck"
                           type="checkbox"
                           value="${p}">
                    <label class="form-check-label">
                        ${p.getText()}
                    </label>
                </div>
            </div>

        </#list>

    </div>

    <hr>

    <div class="form-group">

        <i id="inseminationPregnantArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#inseminationPregnantArrow')"
           href="#"
           id="inseminationPregnantMenu">Pregnant</a>

    </div>

    <div id="inseminationPregnantCollapse" class="collapse ml-1">

        <#list pregnantState as pr>

            <div class="form-group">
                <div class="form-check">
                    <input class="form-check-input inseminationPregnantCheck"
                           type="checkbox"
                           value="${pr}">
                    <label class="form-check-label">
                        ${pr.getText()}
                    </label>
                </div>
            </div>

        </#list>

    </div>

    <hr>

    <div class="form-group">

        <i id="inseminationBullNameArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#inseminationBullNameArrow')"
           href="#"
           id="inseminationBullNameMenu">Bull's Name</a>

    </div>

    <div id="inseminationBullNameCollapse" class="collapse ml-1">

        <div class="form-group">
            <input type="text" class="form-control form-control-sm" id="inseminationBullName">
        </div>

    </div>

    <hr>

    <div class="form-group">

        <i id="inseminationDateArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#inseminationDateArrow')"
           href="#"
           id="inseminationDateMenu">Date</a>

    </div>

    <div id="inseminationDateCollapse" class="collapse ml-1">

        <div class="form-group">
            <label for="inseminationDateFrom">Date ></label>
            <input type="date" required
                   value="${aDate?string.iso}"
                   data-date-format=yyyy-MM-dd"
                   id="inseminationDateFrom"
                   class="form-control form-control-sm smallText">
        </div>

        <div class="form-group">
            <label for="inseminationDateTo">Date <</label>
            <input type="date" required
                   value="${aDate?string.iso}"
                   data-date-format=yyyy-MM-dd"
                   id="inseminationDateTo"
                   class="form-control form-control-sm smallText">
        </div>

    </div>

    <hr class="bottomLine">

</div>
<hr>

<script>

    $("#inseminationDateFrom , #inseminationDateTo").change(function () {

        let today = new Date();
        let dateToCheck = new Date(this.value);
        let dateFrom = new Date($('#inseminationDateFrom').val());
        let dateTo = new Date($('#inseminationDateTo').val());

        if (dateToCheck > today) {
            alert("You cannot enter a date in the future!");
            this.value = "${aDate?string.iso}";

        } else if (dateFrom > dateTo) {
            alert("date from is after date to!");
            this.value = "${aDate?string.iso}";

        }

    });

    $('#inseminationMenu').click(function () {
        $('#collapseInsemination').slideToggle(400);
    });

    $('#inseminationBreedMenu').click(function () {
        $('#inseminationBreedCollapse').slideToggle(400);
    });

    $('#inseminationTypeMenu').click(function () {
        $('#inseminationTypeCollapse').slideToggle(400);
    });

    $('#inseminationPersonMenu').click(function () {
        $('#inseminationPersonCollapse').slideToggle(400);
    });

    $('#inseminationPregnantMenu').click(function () {
        $('#inseminationPregnantCollapse').slideToggle(400);
    });

    $('#inseminationBullNameMenu').click(function () {
        $('#inseminationBullNameCollapse').slideToggle(400);
    });

    $('#inseminationDateMenu').click(function () {
        $('#inseminationDateCollapse').slideToggle(400);
    });

    function setInseminationParameters() {

        if ($('#inseminationArrow').hasClass("fas fa-chevron-up")) {

            if ($('#inseminationBreedArrow').hasClass("fas fa-chevron-up")) {

                addToResult($(".inseminationBullBreedCheck"), "Insemination Bull Breed");

            }

            if ($('#inseminationTypeArrow').hasClass("fas fa-chevron-up")) {

                addToResult($(".inseminationTypeCheck"), "Insemination Type");

            }

            if ($('#inseminationPersonArrow').hasClass("fas fa-chevron-up")) {

                addToResult($(".inseminationPersonCheck"), "Insemination Person");

            }

            if ($('#inseminationPregnantArrow').hasClass("fas fa-chevron-up")) {

                addToResult($(".inseminationPregnantCheck"), "Insemination Pregnant");

            }

            if ($('#inseminationBullNameArrow').hasClass("fas fa-chevron-up")) {

                $("ol").append("<li>Insemination Bull's Name - " + $('#inseminationBullName').val() + "</li>");

            }

            if ($('#inseminationDateArrow').hasClass("fas fa-chevron-up")) {

                $("ol").append("<li>Insemination Date From - " + $('#inseminationDateFrom').val() + "</li>")
                    .append("<li>Insemination Date To - " + $('#inseminationDateTo').val() + "</li>");

            }

        }

    }

</script>