<div class="card">

    <div class="card-header" id="headingDateOfBirthAndAge">
        <h2 class="mb-0">

            <button class="btn btn-link btn-block text-left"
                    type="button"
                    data-toggle="collapse"
                    data-target="#collapseDateOfBirthAndAge"
                    aria-expanded="true"
                    aria-controls="collapseDateOfBirthAndAge">
                Birth Info
            </button>

        </h2>
    </div>
    <div id="collapseDateOfBirthAndAge"
         class="collapse"
         aria-labelledby="headingDateOfBirthAndAge"
         data-parent="#accordionExample">

        <div class="card-body">

            <div class="form-group ml-1">

                <div class="form-group">

                    <i id="birthDateArrow" class="fas fa-chevron-down"></i>
                    <a onclick="switchArrow('#birthDateArrow')"
                       href="#"
                       id="birthDateMenu">Date Of Birth</a>

                </div>

                <div id="collapseDateOfBirth" class="collapse ml-1">

                    <div class="form-group">
                        <label for="birthDateFrom">Date ></label>
                        <input type="date" required
                               value="${aDate?string.iso}"
                               data-date-format=yyyy-MM-dd"
                               id="birthDateFrom"
                               class="form-control form-control-sm smallText">
                    </div>

                    <div class="form-group">
                        <label for="birthDateTo">Date <</label>
                        <input type="date" required
                               value="${aDate?string.iso}"
                               data-date-format=yyyy-MM-dd"
                               id="birthDateTo"
                               class="form-control form-control-sm smallText">
                    </div>

                </div>

                <hr>

                <div class="form-group">

                    <i id="ageArrow" class="fas fa-chevron-down"></i>
                    <a onclick="switchArrow('#ageArrow')"
                       href="#"
                       id="ageMenu">Age</a>

                </div>

                <div id="collapseAge" class="collapse ml-1">

                    <div class="form-group">
                        <label class="label" for="ageFrom">Age ></label>
                        <input type="text" class="form-control form-control-sm number"
                               id="ageFrom">
                    </div>
                    <div class="form-group">
                        <label class="label" for="ageTo">Age <</label>
                        <input type="text" class="form-control form-control-sm number"
                               id="ageTo">
                    </div>

                </div>

            </div>

        </div>
    </div>

</div>

<script>

    $("#birthDateFrom , #birthDateTo").change(function () {

        let today = new Date();
        let dateToCheck = new Date(this.value);
        let dateFrom = new Date($('#birthDateFrom').val());
        let dateTo = new Date($('#birthDateTo').val());

        if (dateToCheck > today) {
            alert("You cannot enter a date in the future!");
            this.value = "${aDate?string.iso}";

        }

        if (dateFrom > dateTo) {
            alert("date from is after date to!");
            this.value = "${aDate?string.iso}";

        }

    });

    $("#ageFrom , #ageTo").change(function () {

        let from = $('#ageFrom').val();
        let to = $('#ageTo').val();

        if (from!==""&&to!=="") {
            if (from > to) {
                alert("Age From  > Age To");
                this.value = "";
            }
        }

    });

    $('#birthDateMenu').click(function () {

        $('#collapseAge').hide();

        if ($('#ageArrow').hasClass("fas fa-chevron-up")) {
            switchArrow('#ageArrow');
        }

        $('#ageFrom').val("");
        $('#ageTo').val("");
        $('#collapseDateOfBirth').slideToggle(400);

    });

    $('#ageMenu').click(function () {

        $('#collapseDateOfBirth').hide();

        if ($('#birthDateArrow').hasClass("fas fa-chevron-up")) {
            switchArrow('#birthDateArrow');
        }

        $('#birthDateFrom').val("${aDate?string.iso}");
        $('#birthDateTo').val("${aDate?string.iso}");
        $('#collapseAge').slideToggle(400);

    });

    function setBirthInfoParameters() {

        if ($('#birthDateArrow').hasClass("fas fa-chevron-up")) {

            $("ol").append("<li>Date Of Birth From - " + $('#birthDateFrom').val() + "</li>")
                .append("<li>Date Of Birth To - " + $('#birthDateTo').val() + "</li>");

        }

        if ($('#ageArrow').hasClass("fas fa-chevron-up")) {

            $("ol").append("<li>Age From - " + $('#ageFrom').val() + "</li>")
                .append("<li>Age To - " + $('#ageTo').val() + "</li>");

        }

    }

</script>