<#import "../parts/editPageTemplate.ftlh" as e>

<@e.page "Edit Person">

    <div class="form-group">

        <label for="name">Name</label>
        <input type="text"
               class="form-control form-control-sm"
               id="name"
               name="name"
               value="${person.getName()}" required>
    </div>

    <div class="form-group">

        <label for="personPosition">Position</label>
        <select class="custom-select custom-select-sm"
                name="personPosition"
                id="personPosition">
            <option selected value="${person.getPersonPosition()}">${person.getPersonPosition().getText()}</option>
            <#list personPosition as pp>

                <#if person.getPersonPosition()!=pp>
                    <option value="${pp}">${pp.getText()}</option>
                </#if>

            </#list>

        </select>
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

    <#list personNames as name>

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