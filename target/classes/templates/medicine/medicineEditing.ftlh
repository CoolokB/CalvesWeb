<#import "../parts/editPageTemplate.ftlh" as e>

<@e.page "Edit Medicine">

    <div class="form-group">
        <label for="name">Name</label>
        <input type="text"
               class="form-control form-control-sm"
               id="name"
               value="${medicine.getName()}"
               name="name" required>
    </div>

    <div class="form-group">

        <label for="type">Type</label>

        <select class="custom-select custom-select-sm"
                id="type"
                name="type">
            <option selected value="${medicine.getType()}">${medicine.getType().getText()}</option>
            <#list medicineType as t>

                <#if medicine.getType()!=t>
                    <option value="${t}">${t.getText()}</option>
                </#if>

            </#list>
        </select>

    </div>

    <div id="normalInfo">

        <div class="form-group">

            <label for="withdrawalMilkNormal">withdrawal Milk Normal</label>
            <input type="text"
                   class="form-control form-control-sm number"
                   id="withdrawalMilkNormal"
                   name="withdrawalMilkNormal"
                   value="${medicine.getWithdrawalMilkNormal()}">
        </div>

    </div>

    <div id="slaughterNumber">

        <div class="form-group">
            <label for="withdrawalSlaughter">Withdrawal Slaughter</label>
            <input type="text"
                   class="form-control form-control-sm number"
                   id="withdrawalSlaughter"
                   name="withdrawalSlaughter"
                   value="${medicine.getWithdrawalSlaughter()}">
        </div>

    </div>

    <div id="complexInfo">

        <div class="form-group">

            <label for="calvingLessX">Calving <= X</label>
            <input type="text"
                   class="form-control form-control-sm number"
                   id="calvingLessX"
                   name="calvingLessX"
                   value="${medicine.getCalvingLessX()}">
        </div>

        <div class="form-group">

            <label for="calvingFromX">Calving from X</label>
            <input type="text"
                   class="form-control form-control-sm number"
                   id="calvingFromX"
                   name="calvingFromX"
                   value="${medicine.getCalvingFromX()}">
        </div>

        <div class="form-group">

            <label for="calvingToX">Calving to X</label>
            <input type="text"
                   class="form-control form-control-sm number"
                   id="calvingToX"
                   name="calvingToX"
                   value="${medicine.getCalvingToX()}">
        </div>

        <div class="form-group">

            <label for="calvingMoreX">Calving >= X</label>
            <input type="text"
                   class="form-control form-control-sm number"
                   id="calvingMoreX"
                   name="calvingMoreX"
                   value="${medicine.getCalvingMoreX()}">
        </div>

        <div class="form-group">

            <label for="milkLessX">Milk <= X</label>
            <input type="text"
                   class="form-control form-control-sm number"
                   id="milkLessX"
                   name="milkLessX"
                   value="${medicine.getMilkLessX()}">
        </div>

        <div class="form-group">

            <label for="milkFromToX">Milk from to X</label>
            <input type="text"
                   class="form-control form-control-sm number"
                   id="milkFromToX"
                   name="milkFromToX"
                   value="${medicine.getMilkFromToX()}">
        </div>

        <div class="form-group">

            <label for="milkMoreX">Milk >= X</label>
            <input type="text"
                   class="form-control form-control-sm number"
                   id="milkMoreX"
                   name="milkMoreX"
                   value="${medicine.getMilkMoreX()}">
        </div>

    </div>

    <div class="form-group">

        <label for="link">Link</label>
        <textarea class="form-control form-control-sm"
                  name="link"
                  id="link"
                  rows="1">${medicine.getLink()}</textarea>
    </div>

    <div class="form-group">
        <button type="submit"
                onclick="return validateFields()"
                class="btn btn-outline-secondary btn-sm">Accept</button>
    </div>

    <input type="hidden" name="medicineHidden" value="false"/>

</@e.page>

<script>

    $("#name").change(function () {
        this.value = $.trim(this.value);
    });

    let names = [];

    <#list medicineNames as name>

    names.push("${name}");

    </#list>

    $("#name").change(function () {
        this.value = $.trim(this.value);
    });

    $(window).on("load", function () {

        let none = "${medicineType[0]}";
        let normal = "${medicineType[1]}";
        let complex = "${medicineType[2]}";

        let selected = $("#type").val();

        switch (selected) {

            case none :

                $("#normalInfo").hide();
                $("#complexInfo").hide();
                $("#slaughterNumber").hide();
                break;

            case normal :

                $("#normalInfo").show();
                $("#slaughterNumber").show();
                $("#complexInfo").hide();
                break;

            case complex :

                $("#normalInfo").hide();
                $("#slaughterNumber").show();
                $("#complexInfo").show();
                break;

        }

    });

    let none = "${medicineType[0]}";
    let normal = "${medicineType[1]}";
    let complex = "${medicineType[2]}";

    $("#type").change(function () {

        let selected = $("#type").val();

        let normalInfoPanel = $("#normalInfo");
        let complexInfoPanel = $("#complexInfo");
        let slaughterInfoPanel = $("#slaughterNumber");

        switch (selected) {

            case none :
                normalInfoPanel.hide();
                complexInfoPanel.hide();
                slaughterInfoPanel.hide();
                break;

            case normal :
                normalInfoPanel.show();
                slaughterInfoPanel.show();
                complexInfoPanel.hide();
                break;

            case complex :
                complexInfoPanel.show();
                slaughterInfoPanel.show();
                normalInfoPanel.hide();
                break;

        }

    });

    function validateFields() {

        let name = $("#name").val().toLowerCase();

        if (names.includes(name)) {

            alert("This name already exists");
            return false;

        }

        let ws = $("#withdrawalSlaughter");
        let wm = $("#withdrawalMilkNormal");

        let selected = $("#type").val();

        let calvingLessX = $("#calvingLessX");
        let calvingFromX = $("#calvingFromX");
        let calvingToX = $("#calvingToX");
        let calvingMoreX = $("#calvingMoreX");
        let milkLessX = $("#milkLessX");
        let milkFromToX = $("#milkFromToX");
        let milkMoreX = $("#milkMoreX");


        let calvingLessXValue = calvingLessX.val();
        let calvingFromXValue = calvingFromX.val();
        let calvingToXValue = calvingToX.val();
        let calvingMoreXValue = calvingMoreX.val();

        let cond1 = calvingFromXValue - calvingLessXValue !== 1;
        let cond2 = Number(calvingFromXValue) >= Number(calvingToXValue);
        let cond3 = calvingMoreXValue - calvingToXValue !== 1;

        if (selected === complex) {

            if (cond1 || cond2 || cond3) {

                alert("X input is incorrect\n" + "\n" +
                    "Calving from X should be calving <=X + 1\n" +
                    "\n" +
                    "Calving to X should be greater than Calving from X\n" +
                    "\n" +
                    "Calving >=X should be Calving to X + 1");
                return false;

            }

        }

        let condition1 = calvingLessXValue === "";
        let condition2 = calvingFromXValue === "";
        let condition3 = calvingToXValue === "";
        let condition4 = calvingMoreXValue === "";
        let condition5 = milkLessX.val() === "";
        let condition6 = milkFromToX.val() === "";
        let condition7 = milkMoreX.val() === "";

        switch (selected) {

            case none :
                wm.val("");
                ws.val("");

                calvingLessX.val("");
                calvingFromX.val("");
                calvingToX.val("");
                calvingMoreX.val("");
                milkLessX.val("");
                milkFromToX.val("");
                milkMoreX.val("");
                break;

            case normal :

                calvingLessX.val("");
                calvingFromX.val("");
                calvingToX.val("");
                calvingMoreX.val("");
                milkLessX.val("");
                milkFromToX.val("");
                milkMoreX.val("");

                if (ws.val() === "" || wm.val() === "") {
                    alert("Fields are empty");
                    return false;
                }
                break;

            case complex :

                wm.val("");

                if (condition1 || condition2 || condition3 || condition4 || condition5 || condition6 || condition7) {
                    alert("Fields must not be empty");
                    return false;
                }
                break;

        }

    }

</script>
