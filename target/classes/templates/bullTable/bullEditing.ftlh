<#import "../parts/editPageTemplate.ftlh" as e>

<@e.page "Edit Bull">

    <div class="form-group">

        <label for="name">Name</label>
        <input type="text"
               class="form-control form-control-sm"
               id="name"
               name="name"
               value="${bull.getName()}" required>
    </div>

    <div class="form-group">

        <label for="bullBreed">Breed</label>
        <select class="custom-select custom-select-sm"
                name="bullBreed"
                id="bullBreed">
            <option selected>${bull.getBullBreed()}</option>
            <#list bullBreed as breed>

                <#if bull.getBullBreed()!=breed>
                    <option>${breed}</option>
                </#if>

            </#list>

        </select>
    </div>

    <div class="form-group">

        <label for="link">Link</label>
        <textarea class="form-control form-control-sm"
                  name="link"
                  id="link"
                  rows="1">${bull.getLink()}</textarea>
    </div>

    <div class="form-group">
        <button type="submit"
                onclick="return validate()"
                class="btn btn-outline-secondary btn-sm">Accept</button>
    </div>

</@e.page>

<script>

    $("#name").change(function () {
        this.value = $.trim(this.value);
    });

    let names = [];

    <#list bullsNames as name>

    names.push("${name}");

    </#list>

    function validate() {

        let name = $("#name").val().toLowerCase();

        if (names.includes(name)) {

            alert("This name already exists");
            return false;

        }

    }

</script>