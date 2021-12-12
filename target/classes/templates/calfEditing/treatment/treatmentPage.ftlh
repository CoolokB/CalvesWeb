<div class="container" style="margin-left: -0.92rem">

    <a href="#"
       id="dropdownMenuButton"
       type="button"
       class="btn btn-light btn-sm bg-white"
       data-toggle="dropdown">Add Occurrence</a>

    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">

        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#accidentModal">Accident/Illness</a>
        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#castration_dehorningModal">Castration/Dehorning</a>
        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#conditionScoreModal">Condition Score</a>
        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#deathModal">Death</a>
        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#footBathModal">Foot Bath</a>
        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#hoofCareModal">Hoof Care</a>
        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#prophylacticModal">Prophylactic</a>
        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#sellModal">Sell</a>
        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#temperamentModal">Temperament</a>
        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#weaningModal">Weaning</a>
        <#if calf.getGender()!="MALE">
        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#calvingModal">Calving</a>
        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#dryingOffModal">Drying Off</a>
        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#inseminationModal">Insemination</a>
        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#days90Modal">Milk Yield 90 Days</a>
        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#pregnancyTestModal">Pregnancy Test</a>
        </#if>

    </div>

    <div class="container scrollTreatment bg-white hiddenScrollBar">

        <#list OccurrencesList as oc>

            <#include "occurrences/testCard.ftlh">

        </#list>

    </div>
</div>

<#include "occurrences/addingPages/addAccident.ftlh" />
<#include "occurrences/addingPages/AddCalving.ftlh" />
<#include "occurrences/addingPages/addCastration_dehorning.ftlh" />
<#include "occurrences/addingPages/addConditionScore.ftlh" />
<#include "occurrences/addingPages/addDeath.ftlh" />
<#include "occurrences/addingPages/addFootBath.ftlh" />
<#include "occurrences/addingPages/addHoofCare.ftlh" />
<#include "occurrences/addingPages/addInsemination.ftlh" />
<#include "occurrences/addingPages/addMilkYield.ftlh" />
<#include "occurrences/addingPages/addPregnancyTest.ftlh" />
<#include "occurrences/addingPages/addProphylactic.ftlh" />
<#include "occurrences/addingPages/addSell.ftlh" />
<#include "occurrences/addingPages/addTemperament.ftlh" />
<#include "occurrences/addingPages/addWeaning.ftlh" />
<#include "occurrences/addingPages/addDryingOff.ftlh" />

<script>

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

    let status = "${calf.getStatus().getText()}";

    $("#dropdownMenuButton").click(function () {

        if (status === "Dead") {
            alert("This calf is Dead , You can't add new cards!");
            return false;
        }

        if (status === "Sold") {
            alert("This calf is Sold , You can't add new cards!");
            return false;
        }

    });

    $(".date").change(function () {

        let today = new Date();
        let dateToCheck = new Date(this.value);
        let bDay = new Date("${calf.birthDate}");

        if (bDay > dateToCheck) {
            alert("You cannot enter a date before the calf was born!");
            this.value = "${aDate?string.iso}";
        }

        if (dateToCheck > today) {
            alert("You cannot enter a date in the future!");
            this.value = "${aDate?string.iso}";
        }

    });

</script>