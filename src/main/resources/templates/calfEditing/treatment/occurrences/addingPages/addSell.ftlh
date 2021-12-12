<div class="modal fade smallText" id="sellModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add Sell</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <form method="post" action="/addOccurrence" enctype="multipart/form-data">

                        <div class="container">

                            <div class="form-group">
                                <label for="sellModalDate">Date</label>
                                <input type="date" required
                                       value="${aDate?string.iso}"
                                       id="date"
                                       data-date-format=yyyy-MM-dd" class="form-control form-control-sm date"
                                       name="date">
                            </div>

                            <div class="form-group">

                                <label for="sellWhoTo">Who To</label>
                                <select class="custom-select custom-select-sm"
                                        name="OEIList"
                                        id="sellWhoTo">

                                    <#if sellWhoTo?has_content>

                                        <#list sellWhoTo as swt>
                                            <option value="${swt.getId()}">${swt.getName()}</option>
                                        </#list>

                                    <#else>

                                        <option value="-1"> No Data for this occurrence</option>

                                    </#if>

                                </select>

                            </div>

                            <div class="form-group">

                                <label for="OEIList">Occurrence extra info</label>
                                <span>
                                        <i type="button" class="fas fa-plus" id="addOEI"></i>
                                    </span>
                                <select class="custom-select custom-select-sm"
                                        multiple="multiple"
                                        name="OEIList"
                                        id="OEIList">

                                    <#if sellOther?has_content>

                                        <#list sellOther as so>
                                            <option value="${so.getId()}">${so.getName()}</option>
                                        </#list>

                                    <#else>

                                        <option value="-1"> No Data for this occurrence</option>

                                    </#if>

                                </select>

                            </div>

                            <div id="OEIPanel" class="hidden">

                                <div class="form-group">

                                    <label for="name">Name</label>
                                    <input type="text"
                                           class="form-control form-control-sm noSpace"
                                           id="name"
                                           name="name">
                                </div>

                                <div class="form-group">

                                    <label for="commentary">Commentary</label>
                                    <textarea class="form-control form-control-sm noSpace"
                                              name="commentary"
                                              id="commentary"
                                              rows="1"></textarea>
                                </div>

                            </div>

                            <div class="form-group">
                                <label>File</label>
                                <div class="custom-file">
                                    <input type="file"
                                           id="customFile"
                                           name="files"
                                           multiple="multiple"
                                           class="custom-file-input form-control-sm">
                                    <label class="custom-file-label col-form-label-sm" for="customFile">Choose file</label>
                                </div>
                            </div>

                        </div>

                        <div class="form-group submitForm">
                            <button type="submit"
                                    class="btn btn-outline-secondary btn-sm">Accept
                            </button>
                        </div>

                        <input type="hidden" name="calf" value="${calf.id}">
                        <input type="hidden" name="occurrenceType" value="SELL">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

