<#import "../../../../parts/editPageTemplate.ftlh" as e>

<@e.page "Edit Calving">

    <div class="form-group">
        <label for="calvingDate">Datefffvdvvdfvfd</label>
        <input type="date" required value="${calving.getDate()}"
               data-date-format=yyyy-MM-dd"
               class="form-control form-control-sm date"
               id="calvingDate"
               name="date">
    </div>

    <div class="form-group">
        <label for="newBornCalfId">ID</label>
        <input type="text"
               class="form-control form-control-sm"
               id="newBornCalfId"
               name="newBornCalfId"
               value="${calving.getNewBornCalfId()}">
    </div>

    <div class="form-group">

        <label for="calvingPlaceOfBirth">Place of birth</label>
        <select class="custom-select custom-select-sm"
                id="calvingPlaceOfBirth"
                name="placeOfBirth">

            <option selected value="${calving.getPlaceOfBirth()}">${calving.getPlaceOfBirth().getText()}</option>
            <#list placeOfBirthList as p>
                <#if calving.getPlaceOfBirth()!=p>
                    <option value="${p}">${p.getText()}</option>
                </#if>
            </#list>
        </select>

    </div>

    <div class="form-group">

        <label for="calvingBirth">Birth</label>
        <select class="custom-select custom-select-sm"
                id="calvingBirth"
                name="birth">

            <option selected value="${calving.getBirth()}">${calving.getBirth().getText()}</option>
            <#list birthList as b>
                <#if calving.getBirth()!=b>
                    <option value="${b}">${b.getText()}</option>
                </#if>
            </#list>
        </select>
    </div>

    <div class="form-group">

        <label for="calvingBorn">Born</label>
        <select class="custom-select custom-select-sm"
                id="calvingBorn"
                name="born">
            <option selected value="${calving.getBorn()}">${calving.getBorn().getText()}</option>
            <#list bornList as b>
                <#if calving.getBorn()!=b>
                    <option value="${b}">${b.getText()}</option>
                </#if>
            </#list>
        </select>
    </div>

    <div class="form-group">
        <label for="calvingGender">Gender</label>
        <select class="custom-select custom-select-sm"
                id="calvingGender"
                name="gender">
            <option selected value="${calving.getGender()}">${calving.getGender().getText()}</option>
            <#list gender as g>
                <#if calving.getGender()!=g>
                    <option value="${g}">${g.getText()}</option>
                </#if>
            </#list>
        </select>
    </div>

    <div class="form-group">
        <label for="calvingQuantity">Quantity</label>
        <select class="custom-select custom-select-sm"
                id="calvingQuantity"
                name="quantity">
            <option selected value="${calving.getQuantity()}">${calving.getQuantity().getText()}</option>
            <#list quantity as q>
                <#if calving.getQuantity()!=q>
                    <option value="${q}">${q.getText()}</option>
                </#if>
            </#list>
        </select>
    </div>

    <div class="form-group">

        <label for="calvingStatus">Status</label>
        <select class="custom-select custom-select-sm"
                id="calvingStatus"
                name="status">
            <option selected value="${calving.getStatus()}">${calving.getStatus().getText()}</option>
            <#list states as s>
                <#if calving.getStatus()!=s>
                    <option value="${s}">${s.getText()}</option>
                </#if>
            </#list>
        </select>
    </div>

    <div class="form-group">
        <label for="calvingBreed">Breed</label>
        <select class="custom-select custom-select-sm" id="calvingBreed" name="breed">
            <option selected>${calving.getBreed()}</option>
            <#list breed as b>
                <#if calving.getBreed()!=b>
                    <option>${b}</option>
                </#if>
            </#list>
        </select>
    </div>

    <div class="form-group">

        <label for="calvingColostrum">Colostrum</label>
        <select class="custom-select custom-select-sm"
                id="calvingColostrum"
                name="colostrum">
            <option selected value="${calving.getColostrum()}">${calving.getColostrum().getText()}</option>
            <#list colostrumList as c>
                <#if calving.getColostrum()!=c>
                    <option value="${c}">${c.getText()}</option>
                </#if>
            </#list>

        </select>
    </div>

    <div class="form-group">
        <label for="inseminationList">Insemination</label>
        <select class="custom-select custom-select-sm"
                id="inseminationList"
                name="inseminationId">

            <#if insemination=="None">

                <option value="-1">None</option>
                <#list calf.getInseminationList() as i>
                    <option value="${i.getId()}">${i.getDate()} / ${i.getType().getText()}</option>
                </#list>

            <#else>

                <option selected value="${insemination.getId()}">
                    ${insemination.getDate()} / ${insemination.getType().getText()}</option>
                <#list calf.getInseminationList() as i>
                    <#if insemination.getId()!=i.getId()>
                        <option value="${i.getId()}">${i.getDate()} / ${i.getType().getText()}</option>
                    </#if>
                </#list>
                <option value="-1">None</option>

            </#if>

        </select>
    </div>

    <div class="form-group">
        <label for="dryingList">Drying Off</label>

        <select class="custom-select custom-select-sm"
                id="dryingList"
                name="dryingId">

            <#if drying=="None">
                <option value="-1">None</option>
                <#list calf.getDryingOffList() as d>
                    <option value="${d.getId()}">${d}</option>
                </#list>

            <#else>
                <option selected value="${drying.getId()}">${drying}</option>
                <#list calf.getDryingOffList() as d>
                    <#if drying.getId()!=d.getId()>
                        <option value="${d.getId()}">${d}</option>
                    </#if>
                </#list>
                <option value="-1">None</option>
            </#if>

        </select>
    </div>

    <div class="form-group">
        <label for="notes">Notes</label>
        <textarea class="form-control form-control-sm"
                  name="notes"
                  id="notes"
                  rows="1"><#if calving.getNotes()?has_content>${calving.getNotes()}</#if></textarea>
    </div>

    <div class="form-group">
        <button type="submit" class="btn btn-outline-secondary btn-sm">Accept</button>
    </div>

</@e.page>
<script>

    $(".date").change(function () {

        let today = new Date();
        let dateToCheck = new Date(this.value);
        let bDay = new Date("${calf.birthDate}");

        if (dateToCheck > today) {
            alert("You cannot enter a date in the future!");
            this.value = "${calving.date}";

        }

        if (bDay > dateToCheck) {
            alert("You cannot enter a date before the calf was born! (" + bDay.toDateString() + ")");
            this.value = "${calving.date}";
        }

    });

</script>
