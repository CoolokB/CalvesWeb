<div class="container">
    <div class="modal fade" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add Place Of Habitat</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <form method="post" action="/addPlace">

                            <div class="container">
                                <div class="form-group">
                                    <label for="startDate">Start Date</label>
                                    <input type="date" required value="${aDate?string.iso}"
                                           id="startDate"
                                           data-date-format=yyyy-MM-dd" class="form-control form-control-sm"
                                           name="startDate">
                                </div>

                                <div class="form-group">
                                    <label for="first">Place</label>
                                    <select class="custom-select custom-select-sm" id="first" name="place">
                                        <#list placeOfHabitat as p>
                                            <option value="${p}">${p.getText()}</option>
                                        </#list>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="gField">Field</label>
                                    <input type="text"
                                           class="form-control form-control-sm"
                                           name="grazing_field_number"
                                           id="gField"/>
                                </div>

                                <div class="form-group">
                                    <label for="about">About</label>
                                    <textarea class="form-control form-control-sm" name="about"
                                              id="about" rows="1"></textarea>
                                </div>
                            </div>

                            <div class="form-group submitForm">
                                <button type="submit"
                                        class="btn btn-outline-secondary btn-sm">Accept
                                </button>
                            </div>

                            <input type="hidden" name="ids" value="${calf.id}">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

    let today = new Date();
    let birthDay = new Date("${calf.birthDate}");

    $("#startDate").change(function () {

        let dateToCheck = new Date(this.value);

        if (dateToCheck > today) {
            alert("You cannot enter a date in the future!");
            this.value = "${aDate?string.iso}";
        }

        <#if lastStartDate??>

        let lastStart = new Date("${lastStartDate}")

        if (dateToCheck < lastStart) {
            this.value = "${aDate?string.iso}";
            alert("You cannot enter a date before last start date!");
        }

        <#else>
        if (dateToCheck < birthDay ) {
            this.value = "${aDate?string.iso}";
            alert("You cannot enter a date before the calf was born! ("+birthDay.toDateString()+")");
        }
        </#if>

    })

</script>



