<div class="card shadow treatmentCard ${oc.getOccurrenceType()}">

    <div class="form-group ml-3 mt-3 mr-3">

        <div class="row">

            <div class="col-md-auto">
                <b>Date</b>
                <p>${oc.getDate()}
            </div>

            <div class="col-md-auto">
                <b>Age</b>
                <p>${oc.getAge()}
            </div>

            <div class="col-md-auto">
                <b>Occurrence</b>
                <p>${oc.getOccurrenceType().getText()}
            </div>

            <#if oc.getOccurrenceType()=="CASTRATION_DEHORNING">

                <div class="col-md-auto">
                    <b>Type</b>
                    <p>${oc.getCastrationType().getText()}
                </div>

            </#if>

            <#if oc.getOccurrenceType()=="MILK_YIELD">

                <div class="col-md-auto">
                    <b>Lactation Number</b>
                    <p>${oc.getLactationNumber()}
                </div>

                <div class="col-md-auto">
                    <b>Kilograms</b>
                    <p>${oc.getKilograms()}
                </div>

            </#if>

            <#if oc.getOccurrenceType()=="CONDITION_SCORE">

                <div class="col-md-auto">
                    <b>Score</b>
                    <p>${oc.getScore()}
                </div>

            </#if>

            <#if oc.getOccurrenceType()=="FOOT_BATH">

                <div class="col-md-auto">
                    <b>Place</b>
                    <p>${oc.getFootBathPlace().getText()}
                </div>

            </#if>

            <#if oc.getOccurrenceType()=="PREGNANCY_TEST">

                <div class="col-md-auto">
                    <b>Method</b>
                    <p>${oc.getMethod().getText()}
                </div>

                <div class="col-md-auto">
                    <b>Pregnant</b>
                    <p>${oc.getPregnant().getText()}
                </div>

            </#if>

            <#if oc.getOccurrenceType()=="DEATH">

                <div class="col-md-auto">
                    <b>Method</b>
                    <p>${oc.getDeathMethod().getText()}
                </div>

                <#if oc.getDeathMethod().getText()=="Slaughter">

                    <div class="col-md-auto">
                        <b>Reason</b>
                        <p>${oc.getDeathReason().getText()}
                    </div>

                    <div class="col-md-auto">
                        <b>Carcass Rating</b>
                        <p>${oc.getCarcassRating().getText()}
                    </div>

                    <div class="col-md-auto">
                        <b>Fat rating</b>
                        <p>${oc.getFatRating()}
                    </div>

                </#if>

            </#if>

            <#if oc.getOccurrenceType()=="DRYING_OFF">

                <#if oc.isFl()>
                    <div class="col-md-auto">
                        <b>FL</b>
                        <p>✓
                    </div>
                </#if>

                <#if oc.isFr()>
                    <div class="col-md-auto">
                        <b>FR</b>
                        <p>✓
                    </div>
                </#if>

                <#if oc.isRl()>
                    <div class="col-md-auto">
                        <b>RL</b>
                        <p>✓
                    </div>
                </#if>

                <#if oc.isRr()>
                    <div class="col-md-auto">
                        <b>RR</b>
                        <p>✓
                    </div>
                </#if>

            </#if>

            <#if oc.getOccurrenceType()=="HOOF_CARE">

                <div class="col-md-auto">
                    <b>Movement</b>
                    <p>${oc.getMovement().getText()}
                </div>

            </#if>

            <#if oc.getOccurrenceType()=="INSEMINATION">

                <div class="col-md-auto">
                    <b>Type</b>
                    <p>${oc.getInseminationType().getText()}
                </div>

                <div class="col-md-auto">
                    <b>Person</b>
                    <p>${oc.getInseminationPerson().getText()}
                </div>

                <div class="col-md-auto">
                    <b>Pregnant</b>
                    <p>${oc.getPregnantText()}
                </div>

                <div class="col-md-auto">
                    <b>Bull name</b>
                    <p>${oc.getBull().getName()}
                </div>

                <div class="col-md-auto">
                    <b>Breed</b>
                    <p>${oc.getBull().getBullBreed()}
                </div>

                <div class="col-md-auto">
                    <b>Link</b>
                    <p><a href="${oc.getBull().getLink()}" target="_blank">Go To Bull</a>
                </div>

            </#if>

        </div>

        <div class="row big-icon">

            <div class="editIcon">
                    <span>
                      <a href
                         onclick="openNewWindowWideTest('/editOccurrence/${oc.getId()}/?calf=${calf.getId()}'); return false">
                    <i class="far fa-edit"></i></a>
                </span>
            </div>

            <#if oc.getOEIList()?has_content||oc.getHoofCareInfo()?has_content>

                <div class="extraInfoIcon button">

                <span>

                    <i type="button" class="far fa-sticky-note" id="${oc.getId()}extraButton"></i>

                </span>

                </div>

            </#if>

            <#if oc.getMedicineInputSequenceList()?has_content>

                <div class="medicineIcon button">

                <span>
                    <i type="button" class="far fa-plus-square" id="${oc.getId()}medicineButton"></i>
                </span>

                </div>

            </#if>

            <#if oc.getFileList()?has_content>

                <div class="fileIcon button">

                <span>
                    <i type="button" class="far fa-file" id="${oc.getId()}fileButton"></i>
                </span>

                </div>

            </#if>

            <div class="deleteIcon">
                    <span>
                    <a href="/deleteOccurrence/${oc.getId()}/?calf=${calf.getId()}"
                       onclick="return confirm('Are you sure you want to delete ${oc.getOccurrenceType().getText()}?')">
                     <i class="far fa-trash-alt"></i></a>
                </span>
            </div>

        </div>

        <#if oc.getOEIList()?has_content||oc.getHoofCareInfo()?has_content>

            <div id="${oc.getId()}extraPanel" class="hidden">

                <hr class="bottomLine">

                <div class="row">

                    <#list oc.getOEIList() as extra>

                        <div class="col-md-auto">
                            <p>${extra.getExtraInfoField().getText()} - ${extra.getName()}<#sep>, </#sep></p>
                        </div>

                    </#list>

                </div>

                <#if oc.getHoofCareInfo()?has_content>

                    <table class="table table-sm">

                        <thead>
                        <tr>

                            <th>Hoof</th>
                            <th>Shape</th>
                            <th>Problem</th>
                            <th>Treatment</th>

                        </tr>
                        </thead>

                        <tbody>
                        <#list oc.getHoofCareInfo() as info>

                            <tr>

                                <td>${info.getHoof()}</td>
                                <td>${info.getShape().getText()}</td>
                                <td>
                                    <#if info.getProblem()??>

                                        <#list info.getProblem() as extra>
                                            ${extra.getName()}<#sep>,
                                        </#list>

                                    <#else>
                                        None
                                    </#if>
                                </td>
                                <td>
                                    <#if info.getTreatment()??>

                                        <#list info.getTreatment() as extra>
                                            ${extra.getName()}<#sep>,
                                        </#list>

                                    <#else>
                                        None
                                    </#if>
                                </td>

                            </tr>

                        </#list>

                        </tbody>

                    </table>

                </#if>

            </div>

        </#if>

        <#if oc.getMedicineInputSequenceList()?has_content>

            <div id="${oc.getId()}medicinePanel" class="hidden">

                <hr class="bottomLine">

                <table class="table table-sm">

                    <thead>
                    <tr>

                        <th>Person</th>
                        <th>Medicine</th>
                        <th>Amount</th>
                        <th>Milk Days</th>
                        <th>Milk Date</th>
                        <th>Slaughter Days</th>
                        <th>Slaughter Date</th>

                    </tr>
                    </thead>

                    <tbody>
                    <#list oc.getMedicineInputSequenceList() as info>

                        <tr>
                            <td>${info.getPerson().getName()}</td>
                            <td>${info.getMedicine().getName()}</td>
                            <td>${info.getAmount()}</td>
                            <td>
                                <#if info.getUntilMilkDays()??>
                                    ${info.getUntilMilkDays()}
                                </#if>
                            </td>

                            <td>
                                <#if info.getUntilMilk()??>
                                    ${info.getUntilMilk()}
                                </#if>
                            </td>

                            <td>
                                <#if info.getUntilSlaughterDays()??>
                                    ${info.getUntilSlaughterDays()}
                                </#if>
                            </td>

                            <td>
                                <#if info.getUntilSlaughter()??>
                                    ${info.getUntilSlaughter()}
                                </#if>
                            </td>

                        </tr>

                    </#list>

                    </tbody>

                </table>

            </div>

        </#if>

        <#if oc.getFileList()?has_content>

            <div id="${oc.getId()}filePanel" class="hidden">

                <hr class="bottomLine">

                <div class="row row-cols-4">

                    <#list oc.getFileList() as file>

                        <div class="col fileCard mb-3">

                            <div>
                                <a href="/img/${file.fileName}" download>
                                    <img class="fileImage" src="../../../static/media/fileIcon.png" alt="file"
                                         data-toggle="tooltip" data-placement="top"
                                         title="Uploaded : ${file.date}">
                                </a>
                            </div>

                            <span class="fileName">${file.fileOriginalName}</span>

                            <a class="hidden deleteFileButton"
                               href="/deleteOccurrenceFile?calf=${calf.getId()}&fileName=${file.getFileName()}"
                               onclick="return confirm('Are you sure you want to delete ${file.getFileOriginalName()}?')">
                                <i class="far fa-trash-alt"></i>
                            </a>

                        </div>

                    </#list>

                </div>

            </div>

        </#if>

    </div>

</div>

<script>

    $('#${oc.getId()}medicineButton').click(function () {
        $('#${oc.getId()}medicinePanel').slideToggle(400);
    });

    $('#${oc.getId()}extraButton').click(function () {
        $('#${oc.getId()}extraPanel').slideToggle(400);
    });

    $('#${oc.getId()}fileButton').click(function () {
        $('#${oc.getId()}filePanel').slideToggle(400);
    });

    function openNewWindowWideTest(url) {

        let occurrenceEditingWindow = window.open(url, "Edit", "top=300");

        window.onunload = function () {

            if (occurrenceEditingWindow && !occurrenceEditingWindow.closed) {
                occurrenceEditingWindow.close();
            }
        };
    }

</script>
