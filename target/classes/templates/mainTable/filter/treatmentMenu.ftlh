<div class="card">

    <div class="card-header" id="headingTreatment">
        <h2 class="mb-0">
            <button class="btn btn-link btn-block text-left collapsed" type="button"
                    data-toggle="collapse"
                    data-target="#collapseTreatment"
                    aria-expanded="false"
                    aria-controls="collapseTreatment">
                Treatment
            </button>
        </h2>
    </div>

    <div id="collapseTreatment"
         class="collapse"
         aria-labelledby="headingTreatment"
         data-parent="#accordionExample">

        <div class="card-body">

            <div class="form-group ml-1">

                <div class="form-group">

                    <i id="occurrenceArrow" class="fas fa-chevron-down"></i>
                    <a onclick="switchArrow('#occurrenceArrow')"
                       href="#"
                       id="occurrenceMenu">Occurrence</a>

                </div>

                <div id="collapseOccurrence" class="collapse ml-1">

                    <div class="form-group">

                        <#include "treatmentSubMenu/accident.ftlh" />
                        <#include "treatmentSubMenu/calving.ftlh" />
                        <#include "treatmentSubMenu/castration_dehorning.ftlh" />
                        <#include "treatmentSubMenu/condition_score.ftlh" />
                        <#include "treatmentSubMenu/death.ftlh" />
                        <#include "treatmentSubMenu/dryingOff.ftlh" />
                        <#include "treatmentSubMenu/foot_bath.ftlh" />
                        <#include "treatmentSubMenu/hoof_care.ftlh" />
                        <#include "treatmentSubMenu/insemination.ftlh" />
                        <#include "treatmentSubMenu/milkYield.ftlh" />
                        <#include "treatmentSubMenu/pregnancyTest.ftlh" />
                        <#include "treatmentSubMenu/prophylactic.ftlh" />
                        <#include "treatmentSubMenu/sell.ftlh" />
                        <#include "treatmentSubMenu/temperament.ftlh" />
                        <#include "treatmentSubMenu/weaning.ftlh" />

                    </div>

                </div>

                <hr>

                <div class="form-group">

                    <i id="milkDateArrow" class="fas fa-chevron-down"></i>
                    <a onclick="switchArrow('#milkDateArrow')"
                       href="#"
                       id="milkDateMenu">Days Until Milk</a>

                </div>

                <div id="collapseMilkDate" class="collapse ml-1">

                    <div class="form-group">
                        <label for="milkDateFrom">Milk ></label>
                        <input type="date" required
                               value="${aDate?string.iso}"
                               data-date-format=yyyy-MM-dd"
                               id="milkDateFrom"
                               class="form-control form-control-sm smallText"
                               name="date">
                    </div>
                    <div class="form-group">
                        <label for="milkDateTo">Milk <</label>
                        <input type="date" required
                               value="${aDate?string.iso}"
                               data-date-format=yyyy-MM-dd"
                               id="milkDateTo"
                               class="form-control form-control-sm smallText"
                               name="date">
                    </div>

                </div>

                <hr>

                <div class="form-group">

                    <i id="slaughterDateArrow" class="fas fa-chevron-down"></i>
                    <a onclick="switchArrow('#slaughterDateArrow')"
                       href="#"
                       id="slaughterDateMenu">Days Until Slaughter</a>

                </div>

                <div id="collapseSlaughterDate" class="collapse ml-1">

                    <div class="form-group">
                        <label for="slaughterDateFrom">Slaughter ></label>
                        <input type="date" required
                               value="${aDate?string.iso}"
                               data-date-format=yyyy-MM-dd"
                               id="slaughterDateFrom"
                               class="form-control form-control-sm smallText"
                               name="date">
                    </div>
                    <div class="form-group">
                        <label for="slaughterDateTo">Slaughter <</label>
                        <input type="date" required
                               value="${aDate?string.iso}"
                               data-date-format=yyyy-MM-dd"
                               id="slaughterDateTo"
                               class="form-control form-control-sm smallText"
                               name="date">
                    </div>

                </div>

                <hr>

                <div class="form-group">

                    <i id="treatmentAgeArrow" class="fas fa-chevron-down"></i>
                    <a onclick="switchArrow('#treatmentAgeArrow')"
                       href="#"
                       id="treatmentAgeMenu">Age</a>

                </div>

                <div id="collapseTreatmentAge" class="collapse ml-1">

                    <div class="form-group">
                        <label class="label" for="ageFrom">Age ></label>
                        <input type="text" class="form-control form-control-sm number"
                               id="ageFrom">
                    </div>
                    <div class="form-group ">
                        <label class="label" for="ageTo">Age <</label>
                        <input type="text" class="form-control form-control-sm number"
                               id="ageTo">
                    </div>

                </div>

                <hr>

                <div class="form-group">

                    <i id="medicineArrow" class="fas fa-chevron-down"></i>
                    <a onclick="switchArrow('#medicineArrow')"
                       href="#"
                       id="medicineMenu">Medicine</a>

                </div>

                <div id="collapseMedicine" class="collapse ml-1">

                    <div class="form-group">
                        <label for="medicine1">Medicine</label>
                        <select class="custom-select custom-select-sm" name="medicine1" id="medicine1">

                            <#list medicines as m>
                                <option value="${m}">${m.name}</option>
                            </#list>

                        </select>
                    </div>

                    <div class="form-group">
                        <label class="label" for="medicinePerson">Person</label>
                        <input type="text" class="form-control form-control-sm"
                               id="medicinePerson">
                    </div>

                </div>

            </div>

        </div>

    </div>

</div>

<script>

    $('#occurrenceMenu').click(function () {
        $('#collapseOccurrence').slideToggle(400);
    });

    $('#milkDateMenu').click(function () {
        $('#collapseMilkDate').slideToggle(400);
    });

    $('#slaughterDateMenu').click(function () {
        $('#collapseSlaughterDate').slideToggle(400);
    });

    $('#treatmentAgeMenu').click(function () {
        $('#collapseTreatmentAge').slideToggle(400);
    });

    $('#medicineMenu').click(function () {
        $('#collapseMedicine').slideToggle(400);
    });

    function setTreatmentParameters() {

        if ($('#occurrenceArrow').hasClass("fas fa-chevron-up")) {

            setAccidentParameters();
            setCalvingParameters();
            setCastrationDehorningParameters();
            setConditionScoreParameters();
            setDeathParameters();
            setDryingOffParameters();
            setFootBathParameters();
            setInseminationParameters();
            setMilkYieldParameters();
            setHoofCareParameters();
            setPregnancyTestParameters();
            setProphylacticParameters();
            setSellParameters();
            setTemperamentParameters();
            setWeaningParameters();

        }

    }

</script>