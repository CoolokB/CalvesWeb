<div class="card shadow treatmentCard calving">

    <div class="form-group ml-3 mt-3">

        <div class="row">

            <div class="col-md-auto">
                <b>Date</b>
                <p>${oc.getDate()}
            </div>

            <div class="col-md-auto">
                <b>Age</b>
                <p>${oc.getAge()}
            </div>

            <div class="col-md-auto">
                <b>Occurrence</b>
                <p>${oc.getOccurrence()}
            </div>

            <div class="col-md-auto">
                <b>ID</b>
                <p>${oc.getNewBornCalfId()}
            </div>

            <div class="col-md-auto">
                <b>Place Of Birth</b>
                <p>${oc.getPlaceOfBirth().getText()}
            </div>

            <div class="col-md-auto">
                <b>Born</b>
                <p>${oc.getBorn().getText()}
            </div>

            <div class="col-md-auto">
                <b>Birth</b>
                <p>${oc.getBirth().getText()}
            </div>

            <div class="col-md-auto">
                <b>Quantity</b>
                <p>${oc.getQuantity().getText()}
            </div>

            <div class="col-md-auto">
                <b>Gender</b>
                <p>${oc.getGender().getText()}
            </div>

            <#if oc.getGestation()?has_content>
                <div class="col-md-auto">
                    <b>Gestation</b>
                    <p>${oc.getGestation()}
                </div>
            </#if>

        </div>

        <div class="row big-icon">

            <div class="extraInfoIcon button">
                <span>
                    <i type="button" class="far fa-sticky-note" id="${oc.getId()}extraButton"></i>
                </span>
            </div>

            <div class="editIcon">
                    <span>
                       <a href onclick="openNewWindow('/editCalving/${oc.getId()}/?&calf=${calf.getId()}'); return false">
                    <i class="far fa-edit"></i></a>
                </span>
            </div>

            <div class="deleteIcon">
                    <span>
                    <a href="/deleteCalving/${oc.getId()}/?&calf=${calf.getId()}"
                       onclick="return confirm('Are you sure you want to delete?')">
                     <i class="far fa-trash-alt"></i></a>
                </span>
            </div>

        </div>

        <#if oc.getNotes()?has_content>

            <div id="${oc.getId()}extraPanel" class="hidden">
                <hr class="bottomLine">
                <p> ${oc.getNotes()}</p>
            </div>

        </#if>

    </div>
</div>
<script>

    $('#${oc.getId()}extraButton').click(function () {
        $('#${oc.getId()}extraPanel').slideToggle(400);
    });

</script>
