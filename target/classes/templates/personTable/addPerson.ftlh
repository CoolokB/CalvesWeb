<div class="modal fade" id="addPerson">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <h4 class="modal-title">Add Person</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body">
                <form method="post">

                    <div class="container">

                        <div class="form-group">

                            <label for="name">Name</label>
                            <input type="text" class="form-control form-control-sm"
                                   id="name"
                                   name="name" required>
                        </div>

                        <div class="form-group">

                            <label for="personPosition">Position</label>
                            <select class="custom-select custom-select-sm" name="personPosition" id="personPosition">

                                <#list personPosition as pp>
                                    <option value="${pp}">${pp.getText()}</option>
                                </#list>

                            </select>
                        </div>

                    </div>

                    <div class="form-group submitForm">
                        <button type="submit" class="btn btn-outline-secondary btn-sm" onclick="return validate()">Accept
                        </button>
                    </div>

                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                </form>
            </div>
        </div>
    </div>
</div>
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
