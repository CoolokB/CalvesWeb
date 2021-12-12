<div class="modal fade" id="addMedicineModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <h4 class="modal-title">Add Medicine</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body">
                <form method="post">

                    <div class="container scrollWindow">

                        <div class="form-group">

                            <label for="name">Name</label>
                            <input type="text" class="form-control form-control-sm noSpace"
                                   id="name" name="name" required>
                        </div>

                        <div class="form-group">

                            <label for="type">Type</label>

                            <select class="custom-select custom-select-sm" id="type" name="type">
                                <#list medicineTypes as t>
                                    <option value="${t}">${t.getText()}</option>
                                </#list>
                            </select>

                        </div>

                        <div id="normalInfo" class="hidden">

                            <div class="form-group">

                                <label for="withdrawalMilkNormal">Withdrawal Milk Normal</label>
                                <input type="text" class="form-control form-control-sm number"
                                       id="withdrawalMilkNormal"
                                       name="withdrawalMilkNormal">
                            </div>
                        </div>

                        <div id="slaughterNumber" class="hidden">
                            <div class="form-group">
                                <label for="withdrawalSlaughter">Withdrawal Slaughter</label>
                                <input type="text" class="form-control form-control-sm number" id="withdrawalSlaughter"
                                       name="withdrawalSlaughter">
                            </div>
                        </div>

                        <div id="complexInfo" class="hidden">

                            <div class="form-group">

                                <label for="calvingLessX">Calving <=X</label>
                                <input type="text" class="form-control form-control-sm number" id="calvingLessX"
                                       name="calvingLessX">
                            </div>

                            <div class="form-group">

                                <label for="calvingFromX">Calving from X</label>
                                <input type="text" class="form-control form-control-sm number" id="calvingFromX"
                                       name="calvingFromX">
                            </div>

                            <div class="form-group">

                                <label for="calvingToX">Calving to X</label>
                                <input type="text" class="form-control form-control-sm number" id="calvingToX"
                                       name="calvingToX">
                            </div>

                            <div class="form-group">

                                <label for="calvingMoreX">Calving >=X</label>
                                <input type="text" class="form-control form-control-sm number" id="calvingMoreX"
                                       name="calvingMoreX">
                            </div>

                            <div class="form-group">
                                <label for="milkLessX">Milk <=X</label>
                                <input type="text" class="form-control form-control-sm number" id="milkLessX"
                                       name="milkLessX">
                            </div>

                            <div class="form-group">

                                <label for="milkFromToX">Milk from to X</label>
                                <input type="text" class="form-control form-control-sm number" id="milkFromToX"
                                       name="milkFromToX">
                            </div>

                            <div class="form-group">
                                <label for="milkMoreX">Milk >=X</label>
                                <input type="text" class="form-control form-control-sm number" id="milkMoreX"
                                       name="milkMoreX">
                            </div>
                        </div>

                        <div class="form-group">

                            <label for="link">Link</label>
                            <textarea class="form-control form-control-sm noSpace" name="link"
                                      id="link" rows="1"></textarea>
                        </div>

                    </div>

                    <div class="form-group submitForm">
                        <button type="submit" class="btn btn-outline-secondary btn-sm"
                                onclick="return validateFields()">Accept
                        </button>
                    </div>

                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="onlyDigitsValidation.js"></script>
<script>

    $(".noSpace").change(function () {
        this.value = $.trim(this.value);
    });

    let names = [];

    <#list medicineNames as name>

    names.push("${name}");

    </#list>

    let none = "${medicineTypes[0]}";
    let normal = "${medicineTypes[1]}";
    let complex = "${medicineTypes[2]}";

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

        let cond1 = calvingFromXValue - calvingLessXValue !==1;
        let cond2 = Number(calvingFromXValue) >= Number(calvingToXValue);
        let cond3 = calvingMoreXValue - calvingToXValue !==1;

        if (selected===complex){

            if (cond1||cond2||cond3) {

                alert("X input is incorrect\n"+"\n" +
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
                    alert("Fields are empty");
                    return false;
                }
                break;

        }

    }

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

</script>
