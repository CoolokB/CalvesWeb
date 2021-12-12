<div class="form-group">

    <i id="hoofCareArrow" class="fas fa-chevron-down"></i>
    <a onclick="switchArrow('#hoofCareArrow')"
       href="#"
       id="hoofCareMenu">Hoof Care</a>

</div>

<div id="hoofCareCollapse" class="collapse ml-1">

    <div class="form-group">
        <i id="hoofCareFootArrow" class="fas fa-chevron-down"></i>
        <a id="hoofCareFootMenu"
           href="#"
           onclick="switchArrow('#hoofCareFootArrow')">Foot</a>
    </div>

    <div id="hoofCareFootCollapse" class="collapse ml-1">

        <label class="switch">
            <input type="checkbox" id="hoofCareFeetToggle">
            <span class="slider"></span>
        </label>

        <#list feet as f>

            <div class="form-group">
                <div class="form-check">
                    <input class="form-check-input hoofCareFootCheck"
                           type="checkbox"
                           value="${f}">
                    <label class="form-check-label">
                        ${f}
                    </label>
                </div>
            </div>

        </#list>

    </div>

    <hr>

    <div class="form-group">
        <i id="hoofCareMovementArrow" class="fas fa-chevron-down"></i>
        <a id="hoofCareMovementMenu"
           href="#"
           onclick="switchArrow('#hoofCareMovementArrow')">Movement</a>
    </div>

    <div id="hoofCareMovementCollapse" class="collapse ml-1">

        <#list movement as m>

            <div class="form-group">
                <div class="form-check">
                    <input class="form-check-input hoofCareMovementCheck"
                           type="checkbox"
                           value=" ${m}">
                    <label class="form-check-label">
                        ${m.getText()}
                    </label>
                </div>
            </div>

        </#list>

    </div>

    <hr>

    <div class="form-group">

        <i id="hoofCareShapeArrow" class="fas fa-chevron-down"></i>
        <a id="hoofCareShapeMenu"
           href="#"
           onclick="switchArrow('#hoofCareShapeArrow')">Shape</a>

    </div>

    <div id="hoofCareShapeCollapse" class="collapse ml-1">

        <#list shape as shape>

            <div class="form-group ">
                <div class="form-check">
                    <input class="form-check-input hoofCareShapeCheck"
                           type="checkbox"
                           value="${shape}">
                    <label class="form-check-label">
                        ${shape.getText()}
                    </label>
                </div>
            </div>

        </#list>

    </div>

    <hr>

    <div class="form-group">

        <i id="hoofCareAgeArrow" class="fas fa-chevron-down"></i>
        <a id="hoofCareAgeMenu"
           href="#"
           onclick="switchArrow('#hoofCareAgeArrow')">Age</a>

    </div>

    <div id="hoofCareAgeCollapse" class="collapse ml-1">

        <div class="form-group">
            <label class="label">Age ></label>
            <input type="text" class="form-control form-control-sm" id="hoofCareAgeFrom">
        </div>

        <div class="form-group ">
            <label class="label">Age <</label>
            <input type="text" class="form-control form-control-sm" id="hoofCareAgeTo">
        </div>

    </div>

    <hr>

    <div class="form-group">

        <i id="hoofCareDateArrow" class="fas fa-chevron-down"></i>
        <a onclick="switchArrow('#hoofCareDateArrow')"
           href="#"
           id="hoofCareDateMenu">Date</a>

    </div>

    <div id="hoofCareDateCollapse" class="collapse ml-1">

        <div class="form-group">
            <label for="hoofCareDateFrom">Date ></label>
            <input type="date" required
                   value="${aDate?string.iso}"
                   data-date-format=yyyy-MM-dd"
                   id="hoofCareDateFrom"
                   class="form-control form-control-sm smallText">
        </div>

        <div class="form-group">
            <label for="hoofCareDateTo">Date <</label>
            <input type="date" required
                   value="${aDate?string.iso}"
                   data-date-format=yyyy-MM-dd"
                   id="hoofCareDateTo"
                   class="form-control form-control-sm smallText">
        </div>

    </div>

    <hr class="bottomLine">

</div>
<hr>
<script>

    $("#hoofCareDateFrom , #hoofCareDateTo").change(function () {

        let today = new Date();
        let dateToCheck = new Date(this.value);
        let dateFrom = new Date($('#hoofCareDateFrom').val());
        let dateTo = new Date($('#hoofCareDateTo').val());

        if (dateToCheck > today) {
            alert("You cannot enter a date in the future!");
            this.value = "${aDate?string.iso}";

        } else if (dateFrom > dateTo) {
            alert("date from is after date to!");
            this.value = "${aDate?string.iso}";
        }

    });

    $('#hoofCareMenu').click(function () {
        $('#hoofCareCollapse').slideToggle(400);
    });

    $('#hoofCareFootMenu').click(function () {
        $('#hoofCareFootCollapse').slideToggle(400);
    });

    $('#hoofCareMovementMenu').click(function () {
        $('#hoofCareMovementCollapse').slideToggle(400);
    });

    $('#hoofCareShapeMenu').click(function () {
        $('#hoofCareShapeCollapse').slideToggle(400);
    });

    $('#hoofCareAgeMenu').click(function () {
        $('#hoofCareAgeCollapse').slideToggle(400);
    });

    $('#hoofCareDateMenu').click(function () {
        $('#hoofCareDateCollapse').slideToggle(400);
    });

    function setHoofCareParameters() {

        if ($('#hoofCareArrow').hasClass("fas fa-chevron-up")) {

            if ($('#hoofCareFootArrow').hasClass("fas fa-chevron-up")) {

                addToResult($(".hoofCareFootCheck"), "Hoof Care Foot");

            }

            if ($('#hoofCareMovementArrow').hasClass("fas fa-chevron-up")) {

                addToResult($(".hoofCareMovementCheck"), "Hoof Care Movement");

            }

            if ($('#hoofCareShapeArrow').hasClass("fas fa-chevron-up")) {

                addToResult($(".hoofCareShapeCheck"), "Hoof Care Shape");

            }

            if ($('#hoofCareAgeArrow').hasClass("fas fa-chevron-up")) {

                $("ol").append("<li>Hoof Care Age From - " + $('#hoofCareAgeFrom').val() + "</li>")
                    .append("<li>Hoof Care Age To - " + $('#hoofCareAgeTo').val() + "</li>");

            }

            if ($('#hoofCareDateArrow').hasClass("fas fa-chevron-up")) {

                $("ol").append("<li>Hoof Care Date From - " + $('#hoofCareDateFrom').val() + "</li>")
                    .append("<li>Hoof Care Date To - " + $('#hoofCareDateTo').val() + "</li>");

            }

        }

    }

</script>