<#include "../parts/security.ftlh">

<#if !calves?has_content>

    <button class="btn  btn-outline-light mt-2 ml-2" data-toggle="modal" data-target="#addCalf">Add Calf</button>

<#else>

    <div class="card mt-1 ml-1 mr-1">

        <div class="d-flex">

            <div class="tableFixHead mainTable table-responsive hiddenScrollBar flex-grow-1">

                <table class="table table-sm" id="test">

                    <thead>
                    <tr>

                        <th>ID</th>
                        <th>Birth Date</th>
                        <th>Gender</th>
                        <th>Mother</th>
                        <th>Father</th>
                        <th>Breed</th>
                        <th>Birth</th>
                        <th>Born</th>
                        <th>Quantity</th>
                        <th>Gestation</th>
                        <th>Birth Place</th>
                        <th>Colostrum</th>
                        <th>Status</th>
                        <th>Age</th>
                        <th>
                            <a href="#" data-toggle="modal" data-target="#searchModal">
                                <i class="fas fa-search"></i>
                            </a>
                        </th>
                        <th>

                            <a href="#" data-toggle="modal" data-target="#addCalf">
                                <i class="fas fa-plus"></i>
                            </a>

                        </th>
                        <th>
                            <a href="#" id="multipleChoice">
                                <i class="fas fa-list"></i>
                            </a>
                        </th>
                    </tr>
                    </thead>
                    <tbody>

                    <#list calves as calf>
                        <tr>
                            <td>${calf.getCalfId()}</td>
                            <td>${calf.getBirthDate()}</td>
                            <td>${calf.getGender().getText()}</td>
                            <td>
                                <#if calf.getMother()??>
                                    ${calf.getMother().getCalfId()}
                                <#else>
                                    ${calf.getIdOfMother()}
                                </#if>
                            </td>
                            <td>${calf.getFather().getName()}</td>
                            <td>${calf.getBreed()}</td>
                            <td>${calf.getBirthList()[0].getText()}</td>
                            <td>${calf.getBorn().getText()}</td>
                            <td>${calf.getQuantity().getText()}</td>
                            <td>${calf.getGestation()}</td>
                            <td>${calf.getBirthPlace().getText()}</td>
                            <td>${calf.getColostrum().getText()}</td>
                            <td>${calf.getStatus().getText()}</td>
                            <td>${calf.getRealAge()}</td>

                            <#if !calf.isBornByCalving()>
                                <td>
                                    <a href="/delete/${calf.getId()}"
                                       onclick="return confirm('Are you sure you want to delete ${calf.getCalfId()} ?')">
                                        <i class="far fa-trash-alt"></i>
                                    </a>
                                </td>
                            <#else>
                                <td></td>
                            </#if>

                            <#if calf.getFileList()?has_content>
                            <td>
                                <a href onclick="openNewWindowWideTest('/files/${calf.getId()}'); return false">
                                    <i class="far fa-folder-open"></i>
                                </a>
                            </td>
                            <#else>
                                <td></td>
                            </#if>

                            <#if !calf.isBornByCalving()>
                                <td>
                                    <a href="/edit/${calf.getId()}"><i class="far fa-edit"></i></a>
                                </td>
                            <#else>
                                <td>
                                    <a href onclick="openNewWindowWideTest('/editCalving/${calf.getId()}'); return false">
                                        <i class="far fa-edit"></i>
                                    </a>
                                </td>
                            </#if>
                            
                        </tr>
                    </#list>

                    </tbody>

                </table>

            </div>

            <div class="hidden flex-grow-1" id="accord">

                <div class="accordion filterAccordion" id="accordionExample">

                    <#--            Birth Info-->
                    <#include "filter/birthInfoMenu.ftlh">

                    <#--            Main Info-->
                    <#include "filter/mainInfoMenu.ftlh">

                    <#--            Treatment Info-->
                    <#include "filter/treatmentMenu.ftlh">

                    <#--            Place History-->
                    <#include "filter/placeOfHabitatMenu.ftlh">


                    <#include "filter/feedControlMenu.ftlh">

                    <#--            Used Parameters-->
                    <div class="card">
                        <div class="card-header" id="headingFour">
                            <h2>
                                <button class="btn btn-link btn-block text-left collapsed"
                                        type="button"
                                        id="resultButton"
                                        data-toggle="collapse"
                                        data-target="#collapseUsedParameters"
                                        aria-expanded="false"
                                        aria-controls="collapseFour">Parameters
                                </button>
                            </h2>
                        </div>
                        <div id="collapseUsedParameters"
                             class="collapse"
                             aria-labelledby="headingFour"
                             data-parent="#accordionExample">

                            <div class="card-body">

                                <div class="form-group" style="margin-left: -2vw">
                                    <ol id="usedParameters"></ol>
                                </div>

                            </div>

                        </div>
                    </div>

                </div>

                <button type="button" id="filterButton" class="btn btn-outline-secondary btn-block"
                        onclick="setFilterResult()">Filter
                </button>

            </div>

        </div>

    </div>

</#if>

<script>

    $("#multipleChoice").click(function () {
        $("#accord").toggle(200);
    })

    $('#resultButton').click(function () {

        $('#usedParameters').html('');

        setFilterParameters();

    });

    function setFilterParameters() {

        setBirthInfoParameters();
        setMainInfoParameters();
        setTreatmentParameters();

        // Date Of Occurrence

        if ($('#occurrenceDateArrow').hasClass("fas fa-chevron-up")) {

            $("ol").append("<li>Date Of Occurrence From - " + $('#occurrenceDateFrom').val() + "</li>");
            $("ol").append("<li>Date Of Occurrence To - " + $('#occurrenceDateTo').val() + "</li>");

        }

        // Day Until Milk

        if ($('#milkDateArrow').hasClass("fas fa-chevron-up")) {

            $("ol").append("<li>Days Until Milk From - " + $('#milkDateFrom').val() + "</li>");
            $("ol").append("<li>Days Until Milk To - " + $('#milkDateTo').val() + "</li>");

        }

        // Day Until Slaughter

        if ($('#slaughterDateArrow').hasClass("fas fa-chevron-up")) {

            $("ol").append("<li>Days Until Slaughter From - " + $('#slaughterDateFrom').val() + "</li>");
            $("ol").append("<li>Days Until Slaughter To - " + $('#slaughterDateTo').val() + "</li>");

        }

        // Place Of Habitat

        if ($('#pohArrow').hasClass("fas fa-chevron-up")) {

            addToResult($(".pohCheck"), "Place Of Habitat");

        }

    }

    function addToResult(checkList, menuName) {

        for (let i = 0; i < checkList.length; i++) {

            if (checkList[i].checked === true) {

                $("ol").append("<li>" + menuName + " - " + checkList[i].value + "</li>");

            }

        }

    }

    function switchArrow(arrow) {

        $(arrow).toggleClass('fas fa-chevron-down');
        $(arrow).toggleClass('fas fa-chevron-up');

    }

    function myPost(action) {

        $("body").html('<form id="dynForm" action="/' + action + '" method="post">' +
            '<input type="hidden" name="num" value=' + makeIdArray() + '>' +
            '<input type="hidden" name="_csrf" value="${_csrf.token}">' +
            '</form>');

        $("#dynForm").submit();

    }

    function setFilterResult() {

        let result = {};

        if ($('#ageArrow').hasClass("fas fa-chevron-up")) {

            let ageFrom = $('#ageFrom').val();
            let ageTo = $('#ageTo').val();

            if (ageFrom === "" && ageTo === "" || ageFrom > ageTo) {

                alert("Age input is incorrect");
                return false;

            }

            result.ageFrom = ageFrom;
            result.ageTo = ageTo;

        }

        if ($('#occurrenceArrow').hasClass("fas fa-chevron-up")) {

            if ($('#accidentArrow').hasClass("fas fa-chevron-up")) {
                setOccurrenceAccidentResult(result);
            }

            if ($('#calvingArrow').hasClass("fas fa-chevron-up")) {
                setOccurrenceCalvingResult(result);
            }

            if ($('#castrationDehorningArrow').hasClass("fas fa-chevron-up")) {
                setOccurrenceCastrationDehorningResult(result);
            }

            if ($('#conditionScoreArrow').hasClass("fas fa-chevron-up")) {
                setOccurrenceConditionScoreResult(result);
            }

            if ($('#deathArrow').hasClass("fas fa-chevron-up")) {
                setOccurrenceDeathResult(result);
            }

        }

        if ($('#birthDateArrow').hasClass("fas fa-chevron-up")) {

            result.birthDateFrom = $('#birthDateFrom').val();
            result.birthDateTo = $('#birthDateTo').val();

        }

        if ($('#pobArrow').hasClass("fas fa-chevron-up")) {

            let pobArray = [];

            let pobChecks = $('.pobCheck');

            for (let i = 0; i < pobChecks.length; i++) {
                if (pobChecks[i].checked) {
                    pobArray.push(pobChecks[i].value);
                }
            }

            result.placeOfBirth = pobArray;

        }

        if ($('#pohArrow').hasClass("fas fa-chevron-up")) {

            let pDateFrom = new Date($('#pohDateFrom').val());
            let pDateTo = new Date($('#pohDateTo').val());

            if (pDateTo < pDateFrom) {
                alert("Incorrect Habitat Date Input");
                return false;
            }

            let pohArray = [];

            let pohChecks = $('.pohCheck');

            for (let i = 0; i < pohChecks.length; i++) {
                if (pohChecks[i].checked) {
                    pohArray.push(pohChecks[i].value);
                }
            }

            result.placeOfHabitat = pohArray;
            result.placeOfHabitatDateFrom = $('#pohDateFrom').val();
            result.placeOfHabitatDateTo = $('#pohDateTo').val();

        }

        setMainInfoResult(result);

        loadFilter(JSON.stringify(result));

    }

    function setOccurrenceProphylacticResult(result) {

        if ($('#accidentOccurrenceArrow').hasClass("fas fa-chevron-up")) {

            let accidentOccurrenceArray = [];

            let accidentOccurrenceChecks = $('.accidentOccurrenceCheck');

            for (let i = 0; i < accidentOccurrenceChecks.length; i++) {
                if (accidentOccurrenceChecks[i].checked) {
                    accidentOccurrenceArray.push(accidentOccurrenceChecks[i].value);
                }
            }

            result.accidentNameList = accidentOccurrenceArray;

        }

        if ($('#accidentMedicineToggle').is(':checked')) {

            result.accidentMedicineToggle = true;

        }

        if ($('#accidentMedicineArrow').hasClass("fas fa-chevron-up")) {

            let accidentMedicineArray = [];

            let accidentMedicineChecks = $('.accidentMedicineCheck');

            for (let i = 0; i < accidentMedicineChecks.length; i++) {
                if (accidentMedicineChecks[i].checked) {

                    accidentMedicineArray.push(accidentMedicineChecks[i].value.replace(" ", ""));
                }
            }

            result.accidentMedicineList = accidentMedicineArray;

        }

        if ($('#prophylacticAgeArrow').hasClass("fas fa-chevron-up")) {

            let ageFrom = $('#prophylacticAgeFrom').val();
            let ageTo = $('#prophylacticAgeTo').val();

            if (ageFrom === "" && ageTo === "" || ageFrom > ageTo) {

                alert("Prophylactic age input is incorrect");
                return false;

            }

            result.prophylacticAgeFrom = ageFrom;
            result.prophylacticAgeTo = ageTo;

        }

        if ($('#prophylacticDateArrow').hasClass("fas fa-chevron-up")) {

            result.prophylacticDateFrom = $('#prophylacticDateFrom').val();
            result.prophylacticDateTo = $('#prophylacticDateTo').val();

        }

    }

    function setOccurrenceDryingOffResult(result) {

        if ($('#dryingOffTeatToggle').is(':checked')) {

            result.dryingOffTeatToggle = true;

        }

        if ($('#dryingOffDaysBeforeCalvingArrow').hasClass("fas fa-chevron-up")) {

            let dryingOffDaysBeforeCalvingFrom = $('#dryingOffDaysBeforeCalvingFrom').val();
            let dryingOffDaysBeforeCalvingTo = $('#dryingOffDaysBeforeCalvingTo').val();

            if (dryingOffDaysBeforeCalvingFrom === "" && dryingOffDaysBeforeCalvingTo === "" || dryingOffDaysBeforeCalvingFrom > dryingOffDaysBeforeCalvingTo) {

                alert("Drying Off Days Before Calving input is incorrect");
                return false;

            }

            result.dryingOffDaysBeforeCalvingFrom = dryingOffDaysBeforeCalvingFrom;
            result.dryingOffDaysBeforeCalvingTo = dryingOffDaysBeforeCalvingTo;

        }

        if ($('#dryingMedicineArrow').hasClass("fas fa-chevron-up")) {

            let dryingOffMedicineArray = [];

            let dryingOffMedicineChecks = $('.dryingMedicineCheck');

            for (let i = 0; i < dryingOffMedicineChecks.length; i++) {
                if (dryingOffMedicineChecks[i].checked) {

                    dryingOffMedicineArray.push(dryingOffMedicineChecks[i].value.replace(" ", ""));
                }
            }

            result.dryingOffMedicine = dryingOffMedicineArray;

        }

        if ($('#dryingOffDaysAfterCalvingArrow').hasClass("fas fa-chevron-up")) {

            let dryingOffDaysAfterCalvingFrom = $('#dryingOffDaysAfterCalvingFrom').val();
            let dryingOffDaysAfterCalvingTo = $('#dryingOffDaysAfterCalvingTo').val();

            if (dryingOffDaysAfterCalvingFrom === "" && dryingOffDaysAfterCalvingTo === "" || dryingOffDaysAfterCalvingFrom > dryingOffDaysAfterCalvingTo) {

                alert("Drying Off Days After Calving input is incorrect");
                return false;

            }

            result.dryingOffDaysAfterCalvingFrom = dryingOffDaysAfterCalvingFrom;
            result.dryingOffDaysAfterCalvingTo = dryingOffDaysAfterCalvingTo;

        }

        if ($('#dryingOffDateArrow').hasClass("fas fa-chevron-up")) {

            result.dryingOffDateFrom = $('#dryingOffDateFrom').val();
            result.dryingOffDateTo = $('#dryingOffDateTo').val();

        }

    }

    function setOccurrenceConditionScoreResult(result) {

        if ($('#conditionScoreScoreArrow').hasClass("fas fa-chevron-up")) {

            let conditionScoreScoreArray = [];

            let conditionScoreScoreChecks = $('.conditionScoreCheck');

            for (let i = 0; i < conditionScoreScoreChecks.length; i++) {
                if (conditionScoreScoreChecks[i].checked) {
                    conditionScoreScoreArray.push(conditionScoreScoreChecks[i].value);
                }
            }

            result.conditionScoreScoreList = conditionScoreScoreArray;

        }

    }

    function setOccurrenceDeathResult(result) {

        if ($('#deathMethodArrow').hasClass("fas fa-chevron-up")) {

            let deathMethodArray = [];

            let deathMethodChecks = $('.deathMethodCheck');

            for (let i = 0; i < deathMethodChecks.length; i++) {
                if (deathMethodChecks[i].checked) {
                    deathMethodArray.push(deathMethodChecks[i].value);
                }
            }

            result.deathMethodList = deathMethodArray;

        }

    }

    function setMainInfoResult(result) {

        if ($('#statusArrow').hasClass("fas fa-chevron-up")) {

            let statusArray = [];

            let statusChecks = $('.statusCheck');

            for (let i = 0; i < statusChecks.length; i++) {
                if (statusChecks[i].checked) {
                    statusArray.push(statusChecks[i].value);
                }
            }

            result.status = statusArray;

        }

        if ($('#breedArrow').hasClass("fas fa-chevron-up")) {

            let breedArray = [];

            let breedChecks = $('.breedCheck');

            for (let i = 0; i < breedChecks.length; i++) {
                if (breedChecks[i].checked) {
                    breedArray.push(breedChecks[i].value);
                }
            }

            result.breed = breedArray;

        }

        if ($('#quantityArrow').hasClass("fas fa-chevron-up")) {

            let quantityArray = [];

            let quantityChecks = $('.quantityCheck');

            for (let i = 0; i < quantityChecks.length; i++) {
                if (quantityChecks[i].checked) {
                    quantityArray.push(quantityChecks[i].value);
                }
            }

            result.quantity = quantityArray;

        }

        if ($('#genderArrow').hasClass("fas fa-chevron-up")) {

            let genderArray = [];

            let genderChecks = $('.genderCheck');

            for (let i = 0; i < genderChecks.length; i++) {
                if (genderChecks[i].checked) {
                    genderArray.push(genderChecks[i].value);
                }
            }

            result.gender = genderArray;

        }

        if ($('#birthArrow').hasClass("fas fa-chevron-up")) {

            let birthArray = [];

            let birthChecks = $('.birthCheck');

            for (let i = 0; i < birthChecks.length; i++) {
                if (birthChecks[i].checked) {
                    birthArray.push(birthChecks[i].value);
                }
            }

            result.birth = birthArray;

        }

        if ($('#bornArrow').hasClass("fas fa-chevron-up")) {

            let bornArray = [];

            let bornChecks = $('.bornCheck');

            for (let i = 0; i < bornChecks.length; i++) {
                if (bornChecks[i].checked) {
                    bornArray.push(bornChecks[i].value);
                }
            }

            result.born = bornArray;

        }

        if ($('#colostrumArrow').hasClass("fas fa-chevron-up")) {

            let colostrumArray = [];

            let colostrumChecks = $('.colostrumCheck');

            for (let i = 0; i < colostrumChecks.length; i++) {
                if (colostrumChecks[i].checked) {
                    colostrumArray.push(colostrumChecks[i].value);
                }
            }

            result.colostrum = colostrumArray;

        }

    }

    function loadFilter(result) {

        $("body").html('<form id="dynForm" action="/showDates" method="post">' +
            '<input type="hidden" name="result" value=' + result + '>' +
            '<input type="hidden" name="_csrf" value="${_csrf.token}">' +
            '</form>');

        $("#dynForm").submit();

    }

    for (let i = 0; i < $(".number").length; i++) {

        $(".number")[i].onkeydown =
            function f() {
                return (event.ctrlKey || event.altKey
                    || (47
                        < event.keyCode && event.keyCode < 58 && event.shiftKey == false)
                    || (95
                        < event.keyCode && event.keyCode < 106)
                    || (event.keyCode == 8) || (event.keyCode == 9)
                    || (event.keyCode > 34 && event.keyCode < 40)
                    || (event.keyCode == 46));
            }

    }

    //complete

    function setOccurrenceAccidentResult(result) {

        if ($('#accidentToggle').is(':checked')) {

            result.accidentToggle = true;

        }

        if ($('#accidentOccurrenceArrow').hasClass("fas fa-chevron-up")) {

            let accidentOccurrenceArray = [];

            let accidentOccurrenceChecks = $('.accidentOccurrenceCheck');

            for (let i = 0; i < accidentOccurrenceChecks.length; i++) {
                if (accidentOccurrenceChecks[i].checked) {
                    accidentOccurrenceArray.push(accidentOccurrenceChecks[i].value);
                }
            }

            result.accidentName = accidentOccurrenceArray;

        }

        if ($('#accidentMedicineToggle').is(':checked')) {

            result.accidentMedicineToggle = true;

        }

        if ($('#accidentMedicineArrow').hasClass("fas fa-chevron-up")) {

            let accidentMedicineArray = [];

            let accidentMedicineChecks = $('.accidentMedicineCheck');

            for (let i = 0; i < accidentMedicineChecks.length; i++) {
                if (accidentMedicineChecks[i].checked) {

                    accidentMedicineArray.push(accidentMedicineChecks[i].value.replace(" ", ""));
                }
            }

            result.accidentMedicine = accidentMedicineArray;

        }

        if ($('#accidentAgeArrow').hasClass("fas fa-chevron-up")) {

            let ageFrom = $('#accidentAgeFrom').val();
            let ageTo = $('#accidentAgeTo').val();

            if (ageFrom === "" && ageTo === "" || ageFrom > ageTo) {

                alert("Accident age input is incorrect");
                return false;

            }

            result.accidentAgeFrom = ageFrom;
            result.accidentAgeTo = ageTo;

        }

        if ($('#accidentDateArrow').hasClass("fas fa-chevron-up")) {

            result.accidentDateFrom = $('#accidentDateFrom').val();
            result.accidentDateTo = $('#accidentDateTo').val();

        }

    }

    function setOccurrenceCalvingResult(result) {

        if ($('#calvingPlaceOfBirthToggle').is(':checked')) {

            result.calvingPlaceOfBirthToggle = true;

        }

        if ($('#calvingPOBArrow').hasClass("fas fa-chevron-up")) {

            let calvingPlaceOfBirthArray = [];

            let calvingPlaceOfBirthChecks = $('.calvingPOBCheck');

            for (let i = 0; i < calvingPlaceOfBirthChecks.length; i++) {
                if (calvingPlaceOfBirthChecks[i].checked) {
                    calvingPlaceOfBirthArray.push(calvingPlaceOfBirthChecks[i].value);
                }
            }

            result.calvingPlaceOfBirth = calvingPlaceOfBirthArray;

        }

        if ($('#calvingBornToggle').is(':checked')) {

            result.calvingBornToggle = true;

        }

        if ($('#calvingBornArrow').hasClass("fas fa-chevron-up")) {

            let calvingBornArray = [];

            let calvingBornChecks = $('.calvingBornCheck');

            for (let i = 0; i < calvingBornChecks.length; i++) {
                if (calvingBornChecks[i].checked) {
                    calvingBornArray.push(calvingBornChecks[i].value);
                }
            }

            result.calvingBorn = calvingBornArray;

        }

        if ($('#calvingBirthToggle').is(':checked')) {

            result.calvingBirthToggle = true;

        }

        if ($('#calvingBirthArrow').hasClass("fas fa-chevron-up")) {

            let calvingBirthArray = [];

            let calvingBirthChecks = $('.calvingBirthCheck');

            for (let i = 0; i < calvingBirthChecks.length; i++) {
                if (calvingBirthChecks[i].checked) {
                    calvingBirthArray.push(calvingBirthChecks[i].value);
                }
            }

            result.calvingBirth = calvingBirthArray;

        }

        if ($('#calvingQuantityArrow').hasClass("fas fa-chevron-up")) {

            let calvingQuantityArray = [];

            let calvingQuantityChecks = $('.calvingQuantityCheck');

            for (let i = 0; i < calvingQuantityChecks.length; i++) {
                if (calvingQuantityChecks[i].checked) {
                    calvingQuantityArray.push(calvingQuantityChecks[i].value);
                }
            }

            result.calvingQuantity = calvingQuantityArray;

        }

        if ($('#calvingGenderArrow').hasClass("fas fa-chevron-up")) {

            let calvingGenderArray = [];

            let calvingGenderChecks = $('.calvingGenderCheck');

            for (let i = 0; i < calvingGenderChecks.length; i++) {
                if (calvingGenderChecks[i].checked) {
                    calvingGenderArray.push(calvingGenderChecks[i].value);
                }
            }

            result.calvingGender = calvingGenderArray;

        }

        if ($('#calvingGestationArrow').hasClass("fas fa-chevron-up")) {

            let gestationFrom = $('#calvingGestationFrom').val();
            let gestationTo = $('#calvingGestationTo').val();

            if (gestationFrom === "" && gestationTo === "" || gestationFrom > gestationTo) {

                alert("Calving gestation input is incorrect");
                return false;

            }

            result.calvingGestationFrom = gestationFrom;
            result.calvingGestationTo = gestationTo;

        }

        if ($('#calvingAgeArrow').hasClass("fas fa-chevron-up")) {

            let ageFrom = $('#calvingAgeFrom').val();
            let ageTo = $('#calvingAgeTo').val();

            if (ageFrom === "" && ageTo === "" || ageFrom > ageTo) {

                alert("Calving age input is incorrect");
                return false;

            }

            result.calvingAgeFrom = ageFrom;
            result.calvingAgeTo = ageTo;

        }

        if ($('#calvingDateArrow').hasClass("fas fa-chevron-up")) {

            result.calvingDateFrom = $('#calvingDateFrom').val();
            result.calvingDateTo = $('#calvingDateTo').val();

        }

    }

    function setOccurrenceCastrationDehorningResult(result) {

        if ($('#castrationTypeArrow').hasClass("fas fa-chevron-up")) {

            let castrationTypeArray = [];

            let castrationTypeChecks = $('.castrationTypeCheck');

            for (let i = 0; i < castrationTypeChecks.length; i++) {
                if (castrationTypeChecks[i].checked) {
                    castrationTypeArray.push(castrationTypeChecks[i].value);
                }
            }

            result.castrationDehorningType = castrationTypeArray;

        }

        if ($('#castrationAgeArrow').hasClass("fas fa-chevron-up")) {

            let ageFrom = $('#castrationAgeFrom').val();
            let ageTo = $('#castrationAgeTo').val();

            if (ageFrom === "" && ageTo === "" || ageFrom > ageTo) {

                alert("Castration / Dehorning age input is incorrect");
                return false;

            }

            result.castrationAgeFrom = ageFrom;
            result.castrationAgeTo = ageTo;

        }

        if ($('#castrationDateArrow').hasClass("fas fa-chevron-up")) {

            result.castrationDateFrom = $('#birthDateFrom').val();
            result.castrationDateTo = $('#birthDateTo').val();

        }

    }

    function setOccurrenceFootBathResult(result) {

        if ($('#footBathChemicalArrow').hasClass("fas fa-chevron-up")) {

            let chemical = $('#footBathChemical').val();


            if (chemical === "") {

                alert("Foot Bath Chemical input is incorrect");
                return false;

            }

            result.footBathChemical = chemical;

        }

        if ($('#footBathDateArrow').hasClass("fas fa-chevron-up")) {

            result.footBathDateFrom = $('#footBathDateFrom').val();
            result.footBathDateTo = $('#footBathDateTo').val();

        }

    }

    function setOccurrenceHoofCareResult(result) {

        if ($('#hoofCareFeetToggle').is(':checked')) {

            result.hoofCareFeetToggle = true;

        }

        if ($('#hoofCareFootArrow').hasClass("fas fa-chevron-up")) {

            let hoofCareFootArray = [];

            let hoofCareFootChecks = $('.hoofCareFootCheck');

            for (let i = 0; i < hoofCareFootChecks.length; i++) {
                if (hoofCareFootChecks[i].checked) {
                    hoofCareFootArray.push(hoofCareFootChecks[i].value);
                }
            }

            result.hoofCareFoot = hoofCareFootArray;

        }

        if ($('#hoofCareMovementArrow').hasClass("fas fa-chevron-up")) {

            let hoofCareMovementArray = [];

            let hoofCareMovementChecks = $('.hoofCareMovementCheck');

            for (let i = 0; i < hoofCareMovementChecks.length; i++) {
                if (hoofCareMovementChecks[i].checked) {
                    hoofCareMovementArray.push(hoofCareMovementChecks[i].value);
                }
            }

            result.hoofCareMovement = hoofCareMovementArray;

        }

        if ($('#hoofCareShapeArrow').hasClass("fas fa-chevron-up")) {

            let hoofCareShapeArray = [];

            let hoofCareShapeChecks = $('.hoofCareShapeCheck');

            for (let i = 0; i < hoofCareShapeChecks.length; i++) {
                if (hoofCareShapeChecks[i].checked) {
                    hoofCareShapeArray.push(hoofCareShapeChecks[i]);
                }
            }

            result.hoofCareShape = hoofCareShapeArray;

        }

        if ($('#hoofCareAgeArrow').hasClass("fas fa-chevron-up")) {

            let ageFrom = $('#hoofCareAgeFrom').val();
            let ageTo = $('#hoofCareAgeTo').val();

            if (ageFrom === "" && ageTo === "" || ageFrom > ageTo) {

                alert("Hoof Care age input is incorrect");
                return false;

            }

            result.hoofCareAgeFrom = ageFrom;
            result.hoofCareAgeTo = ageTo;

        }

        if ($('#hoofCareDateArrow').hasClass("fas fa-chevron-up")) {

            result.hoofCareDateFrom = $('#hoofCareDateFrom').val();
            result.hoofCareDateTo = $('#hoofCareDateTo').val();

        }

    }

    function setOccurrenceInseminationResult(result) {

        if ($('#inseminationBreedArrow').hasClass("fas fa-chevron-up")) {

            let inseminationBreedArray = [];

            let inseminationBreedChecks = $('.inseminationBullBreedCheck');

            for (let i = 0; i < inseminationBreedChecks.length; i++) {
                if (inseminationBreedChecks[i].checked) {
                    inseminationBreedArray.push(inseminationBreedChecks[i].value);
                }
            }

            result.inseminationBreed = inseminationBreedArray;

        }

        if ($('#inseminationTypeArrow').hasClass("fas fa-chevron-up")) {

            let inseminationTypeArray = [];

            let inseminationTypeChecks = $('.inseminationTypeCheck');

            for (let i = 0; i < inseminationTypeChecks.length; i++) {
                if (inseminationTypeChecks[i].checked) {

                    inseminationTypeArray.push(inseminationTypeChecks[i].value);
                }
            }

            result.inseminationType = inseminationTypeArray;

        }

        if ($('#inseminationPersonArrow').hasClass("fas fa-chevron-up")) {

            let inseminationPersonArray = [];

            let inseminationPersonChecks = $('.inseminationPersonCheck');

            for (let i = 0; i < inseminationPersonChecks.length; i++) {
                if (inseminationPersonChecks[i].checked) {

                    inseminationPersonArray.push(inseminationPersonChecks[i].value);
                }
            }

            result.inseminationPerson = inseminationPersonArray;

        }

        if ($('#inseminationPregnantArrow').hasClass("fas fa-chevron-up")) {

            let inseminationPregnantArray = [];

            let inseminationPregnantChecks = $('.inseminationPregnantCheck');

            for (let i = 0; i < inseminationPregnantChecks.length; i++) {
                if (inseminationPregnantChecks[i].checked) {

                    inseminationPregnantArray.push(inseminationPregnantChecks[i].value);
                }
            }

            result.inseminationPregnant = inseminationPregnantArray;

        }

        if ($('#inseminationBullNameArrow').hasClass("fas fa-chevron-up")) {

            let name = $('#inseminationBullName').val();

            if (name === "") {

                alert("Insemination bull's name input is incorrect");
                return false;

            }

            result.inseminationBullName = name;

        }

        if ($('#inseminationDateArrow').hasClass("fas fa-chevron-up")) {

            result.inseminationDateFrom = $('#inseminationDateFrom').val();
            result.inseminationDateTo = $('#inseminationDateTo').val();

        }

    }

    function setOccurrenceMilkYieldResult(result) {

        if ($('#lactationNumberToggle').is(':checked')) {

            result.lactationNumberToggle = true;

        }

        if ($('#lactationNumberArrow').hasClass("fas fa-chevron-up")) {

            let lactationNumberArray = [];

            let lactationNumberChecks = $('.milkYieldLactationNumberCheck');

            for (let i = 0; i < lactationNumberChecks.length; i++) {
                if (lactationNumberChecks[i].checked) {
                    lactationNumberArray.push(lactationNumberChecks[i].value);
                }
            }

            result.milkYieldLactationNumber = lactationNumberArray;

        }

        if ($('#lactationWeightArrow').hasClass("fas fa-chevron-up")) {

            let weightFrom = $('#lactationWeightFrom').val();
            let weightTo = $('#lactationWeightTo').val();

            if (weightFrom === "" && weightTo === "" || weightFrom > weightTo) {

                alert("Lactation weight input is incorrect");
                return false;

            }

            result.lactationWeightFrom = weightFrom;
            result.lactationWeightTo = weightTo;

        }

        if ($('#milkYieldDateArrow').hasClass("fas fa-chevron-up")) {

            result.milkYieldDateFrom = $('#milkYieldDateFrom').val();
            result.milkYieldDateTo = $('#milkYieldDateTo').val();

        }

    }

    function setOccurrenceSellResult(result) {

        if ($('#sellDateArrow').hasClass("fas fa-chevron-up")) {

            result.sellDateFrom = $('#sellDateFrom').val();
            result.sellDateTo = $('#sellDateTo').val();

        }

    }

    function setOccurrenceWeaningResult(result) {

        if ($('#weaningAgeArrow').hasClass("fas fa-chevron-up")) {

            let ageFrom = $('#weaningAgeFrom').val();
            let ageTo = $('#weaningAgeTo').val();

            if (ageFrom === "" && ageTo === "" || ageFrom > ageTo) {

                alert("Weaning age input is incorrect");
                return false;

            }

            result.weaningAgeFrom = ageFrom;
            result.weaningAgeTo = ageTo;

        }

        if ($('#weaningDateArrow').hasClass("fas fa-chevron-up")) {

            result.weaningDateFrom = $('#accidentDateFrom').val();
            result.weaningDateTo = $('#accidentDateTo').val();

        }

    }

    function setOccurrencePregnancyTestResult(result) {

        if ($('#pregnancyResultArrow').hasClass("fas fa-chevron-up")) {

            let pregnancyResultArray = [];

            let pregnancyResultChecks = $('.pregnancyTestResultCheck');

            for (let i = 0; i < pregnancyResultChecks.length; i++) {
                if (pregnancyResultChecks[i].checked) {
                    pregnancyResultArray.push(pregnancyResultChecks[i].value);
                }
            }

            result.pregnancyResult = pregnancyResultArray;

        }

        if ($('#pregnancyDaysAfterInseminationArrow').hasClass("fas fa-chevron-up")) {

            let daysFrom = $('#pregnancyDaysAfterInseminationFrom').val();
            let daysTo = $('#pregnancyDaysAfterInseminationTo').val();

            if (daysFrom === "" && daysTo === "" || daysFrom > daysTo) {

                alert("Pregnancy days after Insemination input is incorrect");
                return false;

            }

            result.pregnancyDaysAfterInseminationFrom = daysFrom;
            result.pregnancyDaysAfterInseminationTo = daysTo;

        }

        if ($('#pregnancyTestDateArrow').hasClass("fas fa-chevron-up")) {

            result.pregnancyTestDateFrom = $('#pregnancyTestDateFrom').val();
            result.pregnancyTestDateTo = $('#pregnancyTestDateTo').val();

        }

    }

</script>

<script>

    function openNewWindowWideTest(url) {

        let occurrenceEditingWindow = window.open(url, "Edit", "top=300");

        window.onunload = function () {

            if (occurrenceEditingWindow && !occurrenceEditingWindow.closed) {
                occurrenceEditingWindow.close();
            }
        };
    }


</script>

