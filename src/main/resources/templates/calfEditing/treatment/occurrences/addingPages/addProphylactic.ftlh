<div class="modal fade smallText" id="prophylacticModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add Prophylactic</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <form method="post" action="/addOccurrence" enctype="multipart/form-data">

                        <div class="container">

                            <div class="form-group">
                                <label for="prophylacticModalDate">Date</label>
                                <input type="date" required
                                       value="${aDate?string.iso}"
                                       data-date-format=yyyy-MM-dd" class="form-control form-control-sm date"
                                       name="date">
                            </div>

                            <div class="form-group">

                                <label for="footBathProblem">Reason</label>
                                <select class="custom-select custom-select-sm"
                                        multiple="multiple"
                                        name="OEIList"
                                        id="prophylacticReason">

                                    <#if prophylacticReason?has_content>

                                        <#list prophylacticReason as pr>
                                            <option value="${pr.getId()}">${pr.getName()}</option>
                                        </#list>

                                    <#else>

                                        <option value="-1"> No Data for this occurrence</option>

                                    </#if>

                                </select>

                            </div>

                            <div class="form-group">
                                <label for="medicine">Medicine</label>
                                <select class="custom-select custom-select-sm"
                                        name="medicine"
                                        id="medicine">

                                    <option>None</option>
                                    <#list noneAndNormalWithdrawalMedicines as m>
                                        <option value="${m.getId()}">${m.getName()}</option>
                                    </#list>

                                </select>
                            </div>

                            <div id="medicineInfo" class="hidden">
                                <div class="form-group">
                                    <label for="person">Person</label>
                                    <select class="custom-select custom-select-sm"
                                            name="person"
                                            id="person">
                                        <option>None</option>
                                        <#list people as p>
                                            <option value="${p.getId()}">${p.getName()}</option>
                                        </#list>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="amount">Amount</label>
                                    <input type="text"
                                           class="form-control form-control-sm noSpace"
                                           name="amount"
                                           id="amount"/>
                                </div>

                                <div class="form-group">

                                    <table class="table table-sm">
                                        <thead>
                                        <tr>

                                            <th>Medicine</th>
                                            <th>Amount</th>
                                            <th>Person</th>

                                        </tr>
                                        </thead>
                                        <tbody id="medicineTable">

                                        </tbody>

                                    </table>

                                </div>

                                <div class="form-group">

                                    <div class="button-bar">

                                    <span style="margin-left: 0.3vw">
                                        <i type="button" class="fas fa-plus" id="addMedicine"></i>
                                    </span>

                                        <span style="margin-left: 2vw">
                                        <i type="button" class="fas fa-minus" id="deleteMedicine"></i>
                                    </span>

                                    </div>

                                </div>
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

                                    <#if prophylacticOther?has_content>

                                        <#list prophylacticOther as poei>
                                            <option value="${poei.getId()}">${poei.getName()}</option>
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
                                    <label class="custom-file-label col-form-label-sm" for="customFile">Choose
                                        file</label>
                                </div>
                            </div>

                        </div>

                        <div class="form-group submitForm">
                            <button type="submit"
                                    class="btn btn-outline-secondary btn-sm">Accept
                            </button>
                        </div>

                        <input type="hidden" name="calf" value="${calf.id}">
                        <input type="hidden" name="occurrenceType" value="PROPHYLACTIC">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

