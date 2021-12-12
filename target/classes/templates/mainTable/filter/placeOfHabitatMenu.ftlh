<div class="card">

    <div class="card-header" id="headingPOHPanel">
        <h2 class="mb-0">

            <button class="btn btn-link btn-block text-left"
                    type="button"
                    data-toggle="collapse"
                    data-target="#collapsePOHPanel"
                    aria-expanded="true"
                    aria-controls="collapsePOHPanel">
                Habitat
            </button>

        </h2>
    </div>
    <div id="collapsePOHPanel"
         class="collapse"
         aria-labelledby="headingPOHPanel"
         data-parent="#accordionExample">

        <div class="card-body">

            <div class="form-group ml-1">

                <div class="form-group">

                    <i id="pohArrow" class="fas fa-chevron-down"></i>
                    <a onclick="switchArrow('#pohArrow')"
                       href="#"
                       id="pohMenu">Place Of Habitat</a>

                </div>

                <div id="collapsePOH" class="collapse ml-1">

                    <#list placeOfHabitat as poh>

                        <div class="form-group">
                            <div class="form-check">
                                <input class="form-check-input pohCheck"
                                       type="checkbox"
                                       onclick="showHiddenField()"
                                       value="${poh}">
                                <label class="form-check-label">
                                    ${poh.getText()}
                                </label>
                            </div>
                        </div>

                    </#list>

                    <div class="form-group hidden" id="grazingField">
                        <label class="label">Field Number</label>
                        <input type="text" class="form-control form-control-sm"
                               name="grazingField">
                    </div>

                </div>

                <hr>

                <div class="form-group">
                    <label for="pohDateFrom">Date ></label>
                    <input type="date" required
                           value="${aDate?string.iso}"
                           data-date-format=yyyy-MM-dd"
                           id="pohDateFrom"
                           class="form-control form-control-sm smallText"
                           name="date">
                </div>

                <div class="form-group">
                    <label for="pohDateTo">Date <</label>
                    <input type="date" required
                           value="${aDate?string.iso}"
                           data-date-format=yyyy-MM-dd"
                           id="pohDateTo"
                           class="form-control form-control-sm smallText"
                           name="date">
                </div>

            </div>

        </div>

    </div>
</div>
<script>

    function showHiddenField() {

        let pohChecks = $('.pohCheck');

        for (let i = 0; i < pohChecks.length; i++) {

            if (pohChecks[i].checked) {

                if (pohChecks[i].value === "GRAZING_FIELD_NUMBER") {

                    $('#grazingField').show();
                }

            } else {
                $('#grazingField').hide();

            }
        }

    }

    $('#pohMenu').click(function () {

        $('#collapsePOH').slideToggle(400);

        clearCheckButtons(".pohCheck");

    });

    $("#pohDateFrom , #pohDateTo").change(function () {

        let today = new Date();
        let dateToCheck = new Date(this.value);

        if (dateToCheck > today) {
            alert("You cannot enter a date in the future!");
            this.value = "${aDate?string.iso}";
        }

    });

</script>