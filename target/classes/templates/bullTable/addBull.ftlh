<div class="modal fade" id="addBull">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <h4 class="modal-title">Add Bull</h4>
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

                            <label for="bullBreed">Breed</label>
                            <select class="custom-select custom-select-sm" name="bullBreed" id="bullBreed">

                                <#list bullBreed as breed>
                                    <option>${breed}</option>
                                </#list>

                            </select>
                        </div>

                        <div class="form-group">

                            <label for="link">Link</label>
                            <textarea class="form-control form-control-sm" name="link"
                                      id="link" rows="1"></textarea>
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
