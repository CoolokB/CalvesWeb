<div class="modal fade smallText" id="weaningModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add Weaning</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <form method="post" action="/addOccurrence" enctype="multipart/form-data">

                        <div class="container">

                            <div class="form-group">
                                <label for="weaningModalDate">Date</label>
                                <input type="date" required
                                       value="${aDate?string.iso}"
                                       id="date"
                                       data-date-format=yyyy-MM-dd" class="form-control form-control-sm date"
                                       name="date">
                            </div>

                            <div class="form-group">

                                <div class="custom-control custom-switch">
                                    <input type="checkbox"
                                           class="custom-control-input"
                                           id="weaningMilking"
                                           name="weaningMilking">
                                    <label class="custom-control-label"
                                           for="weaningMilking">Drinking Milk Again</label>
                                </div>

                            </div>
                            

                        </div>

                        <div class="form-group submitForm">
                            <button type="submit"
                                    class="btn btn-outline-secondary btn-sm">Accept
                            </button>
                        </div>

                        <input type="hidden" name="calf" value="${calf.id}">
                        <input type="hidden" name="occurrenceType" value="WEANING">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    $("#addWeaningOEI").click(function () {

        $("#weaningOEIPanel").slideToggle(100);

        $('#addWeaningOEI').toggleClass("fas fa-plus");
        $('#addWeaningOEI').toggleClass("fas fa-minus");

    })

</script>

