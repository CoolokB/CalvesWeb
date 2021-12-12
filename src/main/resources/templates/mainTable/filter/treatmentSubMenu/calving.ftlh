<div class="form-group">

    <i id="calvingArrow" class="fas fa-chevron-down"></i>
    <a onclick="switchArrow('#calvingArrow')"
       href="#"
       id="calvingMenu">Calving</a>

</div>

<div id="collapseCalving" class="collapse ml-1">

    <div class="form-group">

        <i id="calvingPOBArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#calvingPOBArrow')"
           href="#"
           id="calvingPOBMenu">Place Of Birth</a>

    </div>

    <div id="calvingPOBCollapse" class="collapse ml-1">

        <label class="switch">
            <input type="checkbox" id="calvingPlaceOfBirthToggle">
            <span class="slider"></span>
        </label>

        <#list placeOfBirth as p>

            <div class="form-group">
                <div class="form-check">
                    <input class="form-check-input calvingPOBCheck"
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

        <i id="calvingBornArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#calvingBornArrow')"
           href="#"
           id="calvingBornMenu">Born</a>

    </div>

    <div id="calvingBornCollapse" class="collapse ml-1">

        <label class="switch">
            <input type="checkbox" id="calvingBornToggle">
            <span class="slider"></span>
        </label>

        <#list born as bo>

            <div class="form-group">
                <div class="form-check">
                    <input class="form-check-input calvingBornCheck"
                           type="checkbox"
                           value="${bo}">
                    <label class="form-check-label">
                        ${bo.getText()}
                    </label>
                </div>
            </div>

        </#list>

    </div>

    <hr>

    <div class="form-group">

        <i id="calvingBirthArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#calvingBirthArrow')"
           href="#"
           id="calvingBirthMenu">Birth</a>

    </div>

    <div id="calvingBirthCollapse" class="collapse ml-1">

        <label class="switch">
            <input type="checkbox" id="calvingBirthToggle">
            <span class="slider"></span>
        </label>

        <#list birth as bi>

            <div class="form-group">
                <div class="form-check">
                    <input class="form-check-input calvingBirthCheck"
                           type="checkbox"
                           value="${bi}">
                    <label class="form-check-label">
                        ${bi.getText()}
                    </label>
                </div>
            </div>

        </#list>

    </div>

    <hr>

    <div class="form-group">

        <i id="calvingQuantityArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#calvingQuantityArrow')"
           href="#"
           id="calvingQuantityMenu">Quantity</a>

    </div>

    <div id="calvingQuantityCollapse" class="collapse ml-1">

        <#list quantity as q>

            <div class="form-group">
                <div class="form-check">
                    <input class="form-check-input calvingQuantityCheck"
                           type="checkbox"
                           value="${q}"
                           id="quantityCheck">
                    <label class="form-check-label">
                        ${q.getText()}
                    </label>
                </div>
            </div>

        </#list>

    </div>

    <hr>

    <div class="form-group">

        <i id="calvingGenderArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#calvingGenderArrow')"
           href="#"
           id="calvingGenderMenu">Gender</a>

    </div>

    <div id="calvingGenderCollapse" class="collapse ml-1">

        <#list gender as g>

            <div class="form-group">
                <div class="form-check">
                    <input class="form-check-input calvingGenderCheck"
                           type="checkbox"
                           value="${g}">
                    <label class="form-check-label">
                        ${g.getText()}
                    </label>
                </div>
            </div>

        </#list>
    </div>

    <hr>

    <div class="form-group">

        <i id="calvingGestationArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#calvingGestationArrow')"
           href="#"
           id="calvingGestationMenu">Gestation</a>

    </div>

    <div id="calvingGestationCollapse" class="collapse ml-1">

        <div class="form-group">
            <label class="label" for="gestationFrom">Gestation ></label>
            <input type="text" class="form-control form-control-sm" id="calvingGestationFrom">
        </div>

        <div class="form-group">
            <label class="label" for="gestationTo">Gestation <</label>
            <input type="text" class="form-control form-control-sm" id="calvingGestationTo">
        </div>

    </div>

    <hr>

    <div class="form-group">

        <i id="calvingAgeArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#calvingAgeArrow')"
           href="#"
           id="calvingAgeMenu">Age</a>

    </div>

    <div id="calvingAgeCollapse" class="collapse  ml-1">

        <div class="form-group">
            <label class="label" for="calvingAgeFrom">Age ></label>
            <input type="text"
                   class="form-control form-control-sm number" id="calvingAgeFrom">
        </div>

        <div class="form-group">
            <label class="label" for="calvingAgeTo">Age <</label>
            <input type="text"
                   class="form-control form-control-sm number" id="calvingAgeTo">
        </div>

    </div>

    <hr>

    <div class="form-group">

        <i id="calvingDateArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#calvingDateArrow')"
           href="#"
           id="calvingDateMenu">Date</a>

    </div>

    <div id="calvingDateCollapse" class="collapse ml-1">

        <div class="form-group">
            <label for="calvingDateFrom">Date ></label>
            <input type="date" required
                   value="${aDate?string.iso}"
                   data-date-format=yyyy-MM-dd"
                   id="calvingDateFrom"
                   class="form-control form-control-sm smallText">
        </div>

        <div class="form-group">
            <label for="calvingDateTo">Date <</label>
            <input type="date" required
                   value="${aDate?string.iso}"
                   data-date-format=yyyy-MM-dd"
                   id="calvingDateTo"
                   class="form-control form-control-sm smallText">
        </div>

    </div>

    <hr class="bottomLine">

</div>
<hr>

<script>

    $("#calvingDateFrom , #calvingDateTo").change(function () {

        let today = new Date();
        let dateToCheck = new Date(this.value);
        let dateFrom = new Date($('#calvingDateFrom').val());
        let dateTo = new Date($('#calvingDateTo').val());

        if (dateToCheck > today) {
            alert("You cannot enter a date in the future!");
            this.value = "${aDate?string.iso}";

        } else if (dateFrom > dateTo) {
            alert("date from is after date to!");
            this.value = "${aDate?string.iso}";

        }

    });

    $('#calvingMenu').click(function () {
        $('#collapseCalving').slideToggle(400);
    });

    $('#calvingPOBMenu').click(function () {
        $('#calvingPOBCollapse').slideToggle(400);
    });

    $('#calvingBornMenu').click(function () {
        $('#calvingBornCollapse').slideToggle(400);
    });

    $('#calvingBirthMenu').click(function () {
        $('#calvingBirthCollapse').slideToggle(400);
    });

    $('#calvingQuantityMenu').click(function () {
        $('#calvingQuantityCollapse').slideToggle(400);
    });

    $('#calvingGenderMenu').click(function () {
        $('#calvingGenderCollapse').slideToggle(400);
    });

    $('#calvingGestationMenu').click(function () {
        $('#calvingGestationCollapse').slideToggle(400);
    });

    $('#calvingAgeMenu').click(function () {
        $('#calvingAgeCollapse').slideToggle(400);
    });

    $('#calvingDateMenu').click(function () {
        $('#calvingDateCollapse').slideToggle(400);
    });

    function setCalvingParameters() {

        if ($('#calvingArrow').hasClass("fas fa-chevron-up")) {

            if ($('#calvingPOBArrow').hasClass("fas fa-chevron-up")) {

                addToResult($(".calvingPOBCheck"), "Calving Habitat");

            }

            if ($('#calvingBornArrow').hasClass("fas fa-chevron-up")) {

                addToResult($(".calvingBornCheck"), "Calving Born");

            }

            if ($('#calvingBirthArrow').hasClass("fas fa-chevron-up")) {

                addToResult($(".calvingBirthCheck"), "Calving Birth");

            }

            if ($('#calvingQuantityArrow').hasClass("fas fa-chevron-up")) {

                addToResult($(".calvingQuantityCheck"), "Calving Quantity");

            }

            if ($('#calvingGenderArrow').hasClass("fas fa-chevron-up")) {

                addToResult($(".calvingGenderCheck"), "Calving Gender");

            }

            if ($('#calvingGestationArrow').hasClass("fas fa-chevron-up")) {


                $("ol").append("<li>Calving Gestation From - " + $('#calvingGestationFrom').val() + "</li>")
                    .append("<li>Calving Gestation To - " + $('#calvingGestationTo').val() + "</li>");

            }

            if ($('#calvingAgeArrow').hasClass("fas fa-chevron-up")) {


                $("ol").append("<li>Calving Age From - " + $('#calvingAgeFrom').val() + "</li>")
                    .append("<li>Calving Age To - " + $('#calvingAgeTo').val() + "</li>");

            }

            if ($('#calvingDateArrow').hasClass("fas fa-chevron-up")) {

                $("ol").append("<li>Calving Date From - " + $('#calvingDateFrom').val() + "</li>")
                    .append("<li>Calving Date To - " + $('#calvingDateTo').val() + "</li>");

            }

        }

    }

</script>
