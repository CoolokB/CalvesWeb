<div class="modal fade" id="optionModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Multiple Choice</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form method="post" enctype="multipart/form-data">

                        <div class="form-group">
                            <label for="sixth">What To Do</label>
                            <select class="custom-select custom-select-sm" id="sixth" name="born">
                                    <option>Castration/Dehorning</option>
                                    <option>Foot Bath</option>
                                    <option>Hoof Care</option>
                                    <option>Habitat</option>
                                    <option>Accident/Illness</option>
                                    <option>Weaning</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="seventh">Other actions</label>
                            <select class="custom-select custom-select-sm" id="seventh" name="birth">
                                <#list birthList as b>
                                    <option>${b}</option>
                                </#list>
                            </select>
                        </div>

                        <div class="form-group">

                            <label for="gestation">Other actions</label>
                            <input type="text" class="form-control form-control-sm"
                                   name="gestation"
                                   id="gestation">
                        </div>


                    <div class="form-group submitForm">
                        <button type="submit" class="btn btn-outline-secondary btn-sm" onclick="return checkBDate('bDate')">Accept</button>
                    </div>

                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                </form>
            </div>
        </div>
    </div>
</div>
