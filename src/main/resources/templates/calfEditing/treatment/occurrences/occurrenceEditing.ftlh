<#import "../../../parts/editPageTemplate.ftlh" as e>

<@e.page "Edit ${occurrence.getOccurrenceType().getText()}">

    <#assign aDateTime = .now>
    <#assign aDate = aDateTime?date>

    <div class="form-group">
        <label for="temperamentDate">Date</label>
        <input type="date"
               required value="${occurrence.getDate()}"
               data-date-format=yyyy-MM-dd"
               class="form-control form-control-sm date"
               id="temperamentDate"
               name="date">
    </div>

    <#if occurrence.getOccurrenceType()=="CASTRATION_DEHORNING">

        <div class="form-group">
            <label for="castrationType">Type</label>
            <select class="custom-select custom-select-sm"
                    id="castrationType"
                    name="castrationType">

                <option selected
                        value="${occurrence.getCastrationType()}">${occurrence.getCastrationType().getText()}</option>
                <#list castrationDehorningType as cdt>
                    <#if occurrence.getCastrationType()!=cdt>
                        <option value="${cdt}">${cdt.getText()}</option></#if>
                </#list>

            </select>
        </div>

    </#if>

    <#if occurrence.getOccurrenceType()="CONDITION_SCORE">

        <div class="form-group">
            <label for="range">Score</label>
            <input type="range"
                   class="custom-range"
                   min="1"
                   max="5"
                   step="0.5"
                   value="${occurrence.getScore()}"
                   id="range"
                   name="score">
            <p>Value: <span id="number"></span></p>
        </div>

    </#if>

    <#if occurrence.getOccurrenceType()="MILK_YIELD">

        <div class="form-group">
            <label for="lactationRange">Lactation Number</label>
            <input type="range"
                   class="custom-range"
                   min="1"
                   max="10"
                   value="${occurrence.getLactationNumber()}"
                   step="1"
                   id="lactationRange"
                   name="lactationNumber">
            <p>Value: <span id="lactationValue"></span></p>
        </div>

        <div class="form-group">
            <label for="kilograms">Milk Yield Kg</label>
            <input type="text"
                   class="form-control form-control-sm number"
                   value="${occurrence.getKilograms()}"
                   name="kilograms"
                   id="kilograms">
        </div>

    </#if>

    <#if occurrence.getOccurrenceType()="PREGNANCY_TEST">

        <div class="form-group">
            <label for="pregnant">Pregnant</label>
            <select class="custom-select custom-select-sm"
                    name="pregnant"
                    id="pregnant">

                <option selected value="${occurrence.getPregnant()}">${occurrence.getPregnant().getText()}</option>

                <#list pregnantList as p>
                    <#if occurrence.getPregnant()!=p>
                        <option value="${p}">${p.getText()}</option></#if>
                </#list>

            </select>

        </div>

        <div class="form-group">
            <label for="method">Method</label>
            <select class="custom-select custom-select-sm"
                    name="method"
                    id="method">

                <option selected value="${occurrence.getMethod()}">${occurrence.getMethod().getText()}</option>
                <#list methodList as m>
                    <#if occurrence.getMethod()!=m>
                        <option value="${m}">${m.getText()}</option></#if>
                </#list>

            </select>
        </div>

        <div class="form-group">
            <label for="inseminationList">Insemination</label>
            <select class="custom-select custom-select-sm"
                    id="inseminationList"
                    name="inseminationId">

                <#if insemination=="None">
                    <option selected>None</option>
                    <#list calf.getInseminationList() as i>
                        <option value="${i.getId()}">${i.getDate()} / ${i.getType().getText()}</option>
                    </#list>

                <#else>

                    <option selected>
                        ${insemination.getDate()} / ${insemination.getInseminationType().getText()}
                    </option>
                    <#list calf.getInseminationList() as i>
                        <#if insemination.getId()!=i.id>
                            <option value="${i.getId()}">${i.getDate()} / ${i.getType().getText()}</option>
                        </#if>
                    </#list>

                </#if>

            </select>
        </div>

    </#if>

    <#if occurrence.getOccurrenceType()="DRYING_OFF">

        <div class="form-group">

            <div class="label mb-1">Teat</div>

            <div class="custom-control custom-switch">
                <input type="checkbox"
                       class="custom-control-input"
                       id="flSwitch"
                       <#if occurrence.isFl() >checked="checked"</#if> name="fl">
                <label class="custom-control-label" for="flSwitch">FL</label>
            </div>

            <div class="custom-control custom-switch">
                <input type="checkbox"
                       class="custom-control-input"
                       id="frSwitch"
                       <#if occurrence.isFr() >checked="checked"</#if> name="fr">
                <label class="custom-control-label" for="frSwitch">FR</label>
            </div>

            <div class="custom-control custom-switch">
                <input type="checkbox"
                       class="custom-control-input"
                       id="rlSwitch"
                       <#if occurrence.isRl() >checked="checked"</#if> name="rl">
                <label class="custom-control-label" for="rlSwitch">RL</label>
            </div>

            <div class="custom-control custom-switch">
                <input type="checkbox"
                       class="custom-control-input"
                       id="rrSwitch"
                       <#if occurrence.isRr() >checked="checked"</#if> name="rr">
                <label class="custom-control-label" for="rrSwitch">RR</label>
            </div>

        </div>

    </#if>

    <#if occurrence.getOccurrenceType()="HOOF_CARE">

        <div class="form-group">
            <label for="movement">Movement</label>
            <select class="custom-select custom-select-sm"
                    name="movement"
                    id="movement">

                <option selected value="${occurrence.getMovement()}">${occurrence.getMovement().getText()}</option>
                <#list hoofCareMovement as m>
                    <#if occurrence.getMovement()!=m>
                        <option value="${m}">${m.getText()}</option>
                    </#if>
                </#list>

            </select>
        </div>

        <div class="form-group">
            <label for="hoofCareType">Type</label>
            <select class="custom-select custom-select-sm"
                    name="hoofCareType"
                    id="hoofCareType">

                <option selected
                        value="${occurrence.getHoofCareType()}">${occurrence.getHoofCareType().getText()}</option>

                <#list hoofCareType as hct>
                    <#if occurrence.getHoofCareType()!=hct>
                        <option value="${hct}">${hct.getText()}</option>
                    </#if>
                </#list>

            </select>
        </div>

        <hr class="bottomLine">

        <table class="table table-sm">
            <thead>
            <tr>

                <th>Hoof</th>
                <th>Shape</th>
                <th>Problem</th>
                <th>Treatment</th>
                <th><i type="button" class="fas fa-plus" id="addHoofCareInputSequence"></i></th>

            </tr>
            </thead>

            <tbody id="hoofCareInputSequenceTable">

            <#if occurrence.getHoofCareInfo()??>

                <#list occurrence.getHoofCareInfo() as info>

                    <tr>

                        <td>

                            <div class="form-group">
                                <select class="custom-select custom-select-sm"
                                        name="hoof">

                                    <option selected>${info.getHoof()}</option>

                                    <#list hoof as h>

                                        <#if info.getHoof()!=h>

                                            <option>${h}</option>

                                        </#if>

                                    </#list>
                                </select>
                            </div>

                        </td>
                        <td>

                            <div class="form-group">
                                <select class="custom-select custom-select-sm"
                                        name="shape">

                                    <option selected
                                            value="${info.getShape()}">${info.getShape().getText()}</option>

                                    <#list shape as s>

                                        <#if info.getShape()!=s>

                                            <option>${s}</option>

                                        </#if>

                                    </#list>

                                </select>
                            </div>

                        </td>
                        <td>
                            <div class="form-group">
                                <select class="custom-select custom-select-sm"
                                        multiple
                                        name="problem">

                                    <#if info.getProblem()??>

                                        <#list hoofCareProblem as hcp>

                                            <#if info.getProblem()?seq_contains(hcp)>

                                                <option selected
                                                        value="${hcp.getId()}">${hcp.getName()}</option>

                                            <#else>

                                                <option value="${hcp.getId()}">${hcp.getName()}</option>

                                            </#if>

                                        </#list>

                                    <#else>

                                        <option value="-1"> No Data for this occurrence</option>

                                    </#if>

                                    <option value="-1">None</option>

                                </select>
                            </div>
                        </td>
                        <td>
                            <div class="form-group">
                                <select class="custom-select custom-select-sm"
                                        multiple
                                        name="treatment">

                                    <#if info.getTreatment()??>

                                        <#list hoofCareTreatment as hct>

                                            <#if info.getTreatment()?seq_contains(hct)>

                                                <option selected
                                                        value="${hct.getId()}">${hct.getName()}</option>

                                            <#else>

                                                <option value="${hct.getId()}">${hct.getName()}</option>

                                            </#if>

                                        </#list>

                                    <#else>

                                        <option value="-1"> No Data for this occurrence</option>

                                    </#if>

                                    <option value="-1">None</option>

                                </select>
                            </div>
                        </td>

                    </tr>

                </#list>

            </#if>

            </tbody>

        </table>

        <hr class="bottomLine">

    </#if>

    <#if occurrence.getOccurrenceType()="ACCIDENT_ILLNESS"
    || occurrence.getOccurrenceType()="CASTRATION_DEHORNING"
    || occurrence.getOccurrenceType()="DRYING_OFF">

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
                <th><i type="button" class="fas fa-plus" id="addMedicineSequence"></i></th>

            </tr>
            </thead>
            <tbody id="accidentTable">

            <#if occurrence.getMedicineInputSequenceList()??>

                <#list occurrence.getMedicineInputSequenceList() as info>

                    <tr>

                        <td>
                            <div class="form-group">
                                <select class="custom-select custom-select-sm"
                                        name="person">

                                    <option selected
                                            value="${info.getPerson().getId()}">${info.getPerson().getName()}</option>

                                    <#list people as p>

                                        <#if info.getPerson()!=p>

                                            <option value="${p.getId()}">${p.getName()}</option>

                                        </#if>

                                    </#list>

                                </select>
                            </div>
                        </td>

                        <td>

                            <div class="form-group">
                                <select class="custom-select custom-select-sm"
                                        name="medicine">

                                    <option selected value="${info.getMedicine().getId()}">
                                        ${info.getMedicine().getName()}</option>

                                    <#list noneAndNormalWithdrawalMedicines as m>

                                        <#if info.getMedicine()!=m>

                                            <option value="${m.getId()}">${m.getName()}</option>

                                        </#if>

                                    </#list>

                                </select>
                            </div>

                        </td>

                        <td>

                            <div class="form-group">
                                <input type="text"
                                       class="form-control form-control-sm noSpace"
                                       name="amount"
                                       value="${info.getAmount()}"/>
                            </div>

                        </td>

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

                        <td>
                            <i type="button" class="far fa-trash-alt deleteRow"></i>
                        </td>

                    </tr>

                </#list>

            </#if>

            </tbody>

        </table>

        <hr class="bottomLine">

    </#if>

    <#if occurrence.getOccurrenceType()=="DEATH">

        <div class="form-group">

            <label for="deathMethod">Method</label>
            <select class="custom-select custom-select-sm"
                    name="deathMethod"
                    id="deathMethod">

                <option selected
                        value="${occurrence.getDeathMethod()}">${occurrence.getDeathMethod().getText()}</option>

                <#list deathMethod as m>
                    <#if occurrence.getDeathMethod()!=m>
                        <option value="${m}">${m.getText()}</option>
                    </#if>
                </#list>

            </select>

        </div>

        <div class="form-group">

            <label for="deathReason">Reason</label>
            <select class="custom-select custom-select-sm"
                    name="deathReason"
                    id="deathReason">


                <option selected
                        value="${occurrence.getDeathReason()}">${occurrence.getDeathReason().getText()}</option>

                <#list deathReason as r>
                    <#if occurrence.getDeathReason()!=r>
                        <option value="${r}">${r.getText()}</option>
                    </#if>
                </#list>

            </select>
        </div>

        <div class="form-group">

            <label for="deathWhereTo">Where To</label>
            <select class="custom-select custom-select-sm"
                    name="OEIList"
                    id="deathWhereTo">

                <option selected
                        value="${deathWhereTo.getId()}">${deathWhereTo.getName()}</option>

                <#list deathWhereToList as dWT>

                    <#if deathWhereTo!=dWT>

                        <option value="${dWT.getId()}">${dWT.getName()}</option>

                    </#if>
                </#list>

            </select>

        </div>

        <div class="form-group">

            <label for="deathCause">Cause</label>
            <select class="custom-select custom-select-sm"
                    multiple="multiple"
                    name="OEIList"
                    id="deathCause">

                <#if deathCause?has_content>

                    <#list deathCause as cause>

                        <#if occurrenceDeathCause?seq_contains(cause)>

                            <option selected value="${cause.getId()}">${cause.getName()}</option>

                        <#else>

                            <option value="${cause.getId()}">${cause.getName()}</option>

                        </#if>

                    </#list>

                <#else>

                    <option value="-1"> No Data for this occurrence</option>

                </#if>

            </select>

        </div>

        <div class="form-group">

            <label for="deathReason">Veterinary Notes</label>
            <select class="custom-select custom-select-sm"
                    multiple="multiple"
                    name="OEIList"
                    id="OEIList">

                <#if deathVeterinaryNotes?has_content>

                    <#list deathVeterinaryNotes as vetNote>

                        <#if occurrenceDeathVeterinaryNotes?seq_contains(vetNote)>

                            <option selected value="${vetNote.getId()}">${vetNote.getName()}</option>

                        <#else>

                            <option value="${vetNote.getId()}">${vetNote.getName()}</option>

                        </#if>

                    </#list>

                <#else>

                    <option value="-1"> No Data for this occurrence</option>

                </#if>

            </select>

        </div>

        <div class="hidden" id="slaughterPanel">

            <div class="form-group">
                <label for="slaughterWeight">Slaughter weight</label>
                <input type="text"
                       class="form-control form-control-sm number"
                       value="${occurrence.getSlaughterWeight()}"
                       name="slaughterWeight"
                       id="slaughterWeight"/>
            </div>

            <div class="form-group">
                <label for="carcassRating">Carcass rating</label>
                <select class="custom-select custom-select-sm"
                        name="carcassRating"
                        id="carcassRating">

                    <option selected
                            value="${occurrence.getCarcassRating()}">${occurrence.getCarcassRating().getText()}</option>
                    <#list carcassRating as c>
                        <#if occurrence.getCarcassRating()!=c>
                            <option value="${c}">${c.getText()}</option>
                        </#if>
                    </#list>

                </select>
            </div>

            <div class="form-group">
                <label for="fatRating">Fat Rating</label>
                <input type="range"
                       class="custom-range"
                       value="${occurrence.getFatRating()}"
                       min="1"
                       max="9"
                       step="1"
                       id="fatRating"
                       name="fatRating">
                <p>Value: <span id="fatRatingValue"></span></p>
            </div>

        </div>

    </#if>

    <#if occurrence.getOccurrenceType()=="FOOT_BATH">

        <div class="form-group">
            <label for="footBathPlace">Place</label>
            <select class="custom-select custom-select-sm" id="footBathPlace" name="footBathPlace">

                <option selected value="${occurrence.getFootBathPlace()}">
                    ${occurrence.getFootBathPlace().getText()}</option>

                <#list placeOfHabitat as p>
                    <#if occurrence.getFootBathPlace()!=p>
                        <option value="${p}">${p.getText()}</option>
                    </#if>
                </#list>
            </select>
        </div>

        <div class="form-group">

            <label for="footBathChemical">Chemical</label>
            <select class="custom-select custom-select-sm"
                    multiple="multiple"
                    name="OEIList"
                    id="footBathChemical">

                <#if footBathChemical?has_content>

                    <#list footBathChemical as fbcl>

                        <#if occurrenceFootBathChemical?seq_contains(fbcl)>

                            <option selected value="${fbcl.getId()}">${fbcl.getName()}</option>

                        <#else>

                            <option value="${fbcl.getId()}">${fbcl.getName()}</option>

                        </#if>

                    </#list>

                <#else>

                    <option value="-1"> No Data for this occurrence</option>

                </#if>

            </select>

        </div>

        <div class="form-group">

            <label for="footBathProblem">Problem</label>
            <select class="custom-select custom-select-sm"
                    multiple="multiple"
                    name="OEIList"
                    id="footBathProblem">

                <#if footBathProblem?has_content>

                    <#list footBathProblem as fbp>

                        <#if occurrenceFootBathProblem?seq_contains(fbp)>

                            <option selected value="${fbp.getId()}">${fbp.getName()}</option>

                        <#else>

                            <option value="${fbp.getId()}">${fbp.getName()}</option>

                        </#if>

                    </#list>

                <#else>

                    <option value="-1"> No Data for this occurrence</option>

                </#if>

            </select>

        </div>

    </#if>

    <#if occurrence.getOccurrenceType()=="PROPHYLACTIC">

        <div class="form-group">

            <label for="prophylacticReason">Reason</label>

            <select class="custom-select custom-select-sm"
                    multiple="multiple"
                    name="OEIList"
                    id="prophylacticReason">

                <#if prophylacticReason?has_content>

                    <#list prophylacticReason as pr>

                        <#if occurrenceProphylacticReason?seq_contains(pr)>

                            <option selected value="${pr.getId()}">${pr.getName()}</option>

                        <#else>

                            <option value="${pr.getId()}">${pr.getName()}</option>

                        </#if>

                    </#list>

                <#else>

                    <option value="-1"> No Data for this occurrence</option>

                </#if>

            </select>

        </div>

    </#if>

    <#if occurrence.getOccurrenceType()=="SELL">

        <div class="form-group">

            <label for="sellWhoTo">Who To</label>
            <select class="custom-select custom-select-sm"
                    name="OEIList"
                    id="sellWhoTo">

                <option selected
                        value="${occurrenceSellWhoTo.getId()}">${occurrenceSellWhoTo.getName()}</option>

                <#if sellWhoToList?has_content>

                    <#list sellWhoToList as swt>

                        <#if occurrenceSellWhoTo!=swt>

                            <option value="${swt.getId()}">${swt.getName()}</option>

                        </#if>

                    </#list>

                </#if>

            </select>

        </div>

    </#if>

    <#if occurrence.getOccurrenceType()="CALVING">

        <div class="form-group">

            <label for="insemination">Insemination</label>
            <select class="custom-select custom-select-sm"
                    id="insemination"
                    name="insemination">

                <option selected value="${occurrence.getInsemination().getId()}">
                    ${occurrence.getInsemination().inseminationToString()}</option>

                <#list inseminationList as i>

                    <#if occurrence.getInsemination()!=i>

                        <option value="${i.id}">${i.inseminationToString()}</option>

                    </#if>

                </#list>

            </select>

        </div>

        <div class="form-group">
            <label for="calvingDryingId">Drying Off</label>

            <select class="custom-select custom-select-sm"
                    id="calvingDryingId"
                    name="calvingDryingId">
                <option value="-1">None</option>

                <#if dryingOffList?has_content>
                    <#list dryingOffList as d>
                        <option value="${d.id}">${d}</option>
                    </#list>
                </#if>

            </select>
        </div>

        <div class="form-group">

            <label>Files</label>
            <div class="custom-file">
                <input type="file"
                       multiple
                       id="customFile"
                       name="files"
                       class="custom-file-input form-control-sm">
                <label class="custom-file-label col-form-label-sm"
                       for="customFile">Choose
                    file</label>
            </div>

        </div>

        <hr class="bottomLine">

        <table class="table table-sm">
            <thead>
            <tr>

                <th>Date</th>
                <th>Id</th>
                <th>Place</th>
                <th>Born</th>
                <th>Birth</th>
                <th>Gender</th>
                <th>Status</th>
                <th>Colostrum</th>

                <th><i type="button" class="fas fa-plus" id="addCalvingInputSequence"></i></th>

            </tr>
            </thead>

            <tbody id="calvingInputSequenceTable">

            <#list children as cs>

                <tr>

                    <input type="hidden" name="dbID" value="${cs.getId()}">

                    <td>

                        <div class="form-group">
                            <input type="date"
                                   required value="${cs.getBirthDate()}"
                                   data-date-format=yyyy-MM-dd"
                                   class="form-control form-control-sm date"
                                   id="calvingDate"
                                   name="calvingDate">
                        </div>

                    </td>

                    <td>

                        <div class="form-group">
                            <input type="text"
                                   class="form-control form-control-sm number"
                                   name="newBornCalfId"
                                   value="${cs.getCalfId()}"/>
                        </div>

                    </td>

                    <td>

                        <div class="form-group">

                            <select class="custom-select custom-select-sm"
                                    name="calvingPlaceOfBirth">
                                <option selected
                                        value="${cs.getBirthPlace()}">${cs.getBirthPlace().getText()}</option>

                                <#list pob as p>

                                    <#if cs.getBirthPlace()!=p>

                                        <option value="${p}">${p.getText()}</option>

                                    </#if>

                                </#list>

                            </select>

                        </div>

                    </td>

                    <td>

                        <div class="form-group">
                            <select class="custom-select custom-select-sm"
                                    name="calvingBorn">
                                <option selected value="${cs.getBorn()}">${cs.getBorn().getText()}</option>

                                <#list born as b>

                                    <#if cs.getBorn()!=b>

                                        <option value="${b}">${b.getText()}</option>

                                    </#if>

                                </#list>
                            </select>
                        </div>

                    </td>

                    <td>

                        <div class="form-group">
                            <select class="custom-select custom-select-sm"
                                    multiple
                                    name="calvingBirth">

                                <#list birth as b>

                                    <#if cs.getBirthList()?seq_contains(b)>

                                        <option selected
                                                value="${b}">${b.getText()}</option>

                                    <#else>

                                        <option value="${b}">${b.getText()}</option>

                                    </#if>

                                </#list>

                            </select>
                        </div>

                    </td>

                    <td>

                        <div class="form-group">
                            <select class="custom-select custom-select-sm"
                                    name="calvingGender">
                                <option selected value="${cs.getGender()}">${cs.getGender().getText()}</option>

                                <#list gender as g>

                                    <#if cs.getGender()!=g>

                                        <option value="${g}">${g.getText()}</option>

                                    </#if>

                                </#list>
                            </select>
                        </div>

                    </td>

                    <td>

                        <div class="form-group">
                            <select class="custom-select custom-select-sm"
                                    name="calvingStatus">
                                <option selected value="${cs.getStatus()}">${cs.getStatus().getText()}</option>

                                <#list status as s>

                                    <#if cs.getStatus()!=s>

                                        <option value="${s}">${s.getText()}</option>

                                    </#if>

                                </#list>
                            </select>
                        </div>

                    </td>

                    <td>

                        <div class="form-group">
                            <select class="custom-select custom-select-sm"
                                    name="calvingColostrum">
                                <option selected value="${cs.getColostrum()}">${cs.getColostrum().getText()}</option>

                                <#list colostrum as c>

                                    <#if cs.getColostrum()!=c>

                                        <option value="${c}">${c.getText()}</option>

                                    </#if>

                                </#list>
                            </select>
                        </div>

                    </td>

                    <td>
                        <i type="button" class="far fa-trash-alt deleteRow"></i>
                    </td>

                </tr>

            </#list>

            </tbody>

        </table>

        <hr class="bottomLine">

    </#if>

    <#if occurrence.getOccurrenceType()="INSEMINATION">

        <div class="form-group">
            <label for="bull">Bull</label>
            <select class="custom-select custom-select-sm" id="bull" name="bull">

                <option selected
                        value="${occurrence.getBull().getId()}">${occurrence.getBull().getName()}</option>

                <#if fathers?has_content>
                    <#list fathers as father>
                        <#if occurrence.getBull()!=father>
                            <option value="${father.getId()}">${father.getName()}</option>
                        </#if>
                    </#list>
                </#if>

            </select>

        </div>

        <div class="form-group">
            <label for="type">Type</label>
            <select class="custom-select custom-select-sm"
                    name="inseminationType"
                    id="inseminationType">

                <option selected value="${occurrence.getInseminationType()}">
                    ${occurrence.getInseminationType().getText()}</option>

                <#list inseminationType as t>
                    <#if occurrence.getInseminationType()!=t>
                        <option value="${t}">${t.getText()}</option>
                    </#if>
                </#list>

            </select>
        </div>

        <div class="form-group">
            <label for="inseminationPerson">Person</label>
            <select class="custom-select custom-select-sm"
                    name="inseminationPerson"
                    id="inseminationPerson">

                <option selected value="${occurrence.getInseminationPerson()}">
                    ${occurrence.getInseminationPerson().getText()}</option>

                <#list person as p>
                    <#if occurrence.getInseminationPerson()!=p>
                        <option value="${p}">${p.getText()}</option>
                    </#if>
                </#list>

            </select>
        </div>


    </#if>

    <#if occurrence.getOccurrenceType()!="DEATH">

        <div class="form-group">
            <label for="OEIList">Occurrence extra info</label>
            <select class="custom-select custom-select-sm"
                    multiple="multiple"
                    name="OEIList"
                    id="OEIList">

                <#if OEIList?has_content>

                    <#list OEIList as oei>

                        <#if occurrenceOEIList?seq_contains(oei)>

                            <option selected
                                    value="${oei.getId()}">${oei.getName()}</option>

                        <#else>

                            <option value="${oei.getId()}">${oei.getName()}</option>

                        </#if>

                    </#list>

                <#else>

                    <option value="-1"> No Data for this occurrence</option>

                </#if>

            </select>
        </div>

    </#if>

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

    <div class="form-group">
        <button type="submit"
                onclick="return occurrenceEditingValidation()"
                class="btn btn-outline-secondary btn-sm">Accept
        </button>
    </div>

    <input type="hidden" name="fl" value="false"/>
    <input type="hidden" name="fr" value="false"/>
    <input type="hidden" name="rl" value="false"/>
    <input type="hidden" name="rr" value="false"/>

    <input type="hidden" name="medicineInputSequenceArray" id="medicineInputSequenceArray">
    <input type="hidden" name="hoofCareInputSequenceArray" id="hoofCareInputSequenceArray">
    <input type="hidden" name="calvingInputSequenceArray" id="calvingInputSequenceArray">

</@e.page>

<script>

    let count = 0;

    $("#accidentTable").on("click", ".deleteRow", function () {
        $(this).closest("tr").remove();
    });

    let occurrenceName = "${occurrence.getOccurrenceType()}";

    $(window).on("load", function () {

        // let intElemOffsetHeight = document.getElementById('heightDetectionID').offsetHeight;
        // let intElemOffsetWidth = document.getElementById('heightDetectionID').offsetWidth;
        //
        // window.resizeTo(intElemOffsetWidth,intElemOffsetHeight)


        let problemArray = $('[name=problem]');
        let treatmentArray = $('[name=treatment]');

        problemArray.each(function (index, value) {
            value.id = count++;
        });

        treatmentArray.each(function (index, value) {
            value.id = count++;
        });

        let selected = $("#deathMethod").val();
        let slaughterPanel = $("#slaughterPanel");

        switch (selected) {

            case "DEATH":
            case "EUTHANASIA":
                slaughterPanel.hide();
                break;

            case "SLAUGHTER" :
                slaughterPanel.show();
                break;

        }

    });

    $(".noSpace").change(function () {
        this.value = $.trim(this.value);
    });

    //Hoof Care

    $("#hoofCareInputSequenceTable").on("click", ".deleteRow", function () {
        $(this).closest("tr").remove();
    });

    $('#addHoofCareInputSequence').click(function () {

        let row = document.createElement("tr");

        let td1 = document.createElement("td");
        let td2 = document.createElement("td");
        let td3 = document.createElement("td");
        let td4 = document.createElement("td");
        let td5 = document.createElement("td");

        //Hoof
        let hoofDiv = document.createElement('div');
        hoofDiv.className = 'form-group';

        let hoofSelect = document.createElement('select');
        hoofSelect.name = 'hoof';
        hoofSelect.className = 'custom-select custom-select-sm';
        hoofSelect.innerHTML = '<#list hoof as h><option>${h}</option></#list>'

        hoofDiv.append(hoofSelect);
        td1.append(hoofDiv);

        //Shape
        let shapeDiv = document.createElement('div');
        shapeDiv.className = 'form-group';

        let shapeSelect = document.createElement('select');
        shapeSelect.name = 'shape';
        shapeSelect.className = 'custom-select custom-select-sm';
        shapeSelect.innerHTML = '<#list shape as s><option value="${s}">${s.getText()}</option></#list>'

        shapeDiv.append(shapeSelect);
        td2.append(shapeDiv);

        //problem
        let problemDiv = document.createElement('div');
        problemDiv.className = 'form-group';

        let problemSelect = document.createElement('select');
        problemSelect.name = 'problem';
        problemSelect.multiple = true;
        problemSelect.id = 'p' + (count++);
        problemSelect.className = 'custom-select custom-select-sm';
        problemSelect.innerHTML = '<option value="-1">None</option>' +
            '<#list hoofCareProblem as hcp><option value="${hcp.getId()}">${hcp.getName()}</option></#list>';

        problemDiv.append(problemSelect);
        td3.append(problemDiv);

        //treatment
        let treatmentDiv = document.createElement('div');
        treatmentDiv.className = 'form-group';

        let treatmentSelect = document.createElement('select');
        treatmentSelect.name = 'treatment';
        treatmentSelect.multiple = true;
        treatmentSelect.id = 't' + (count++);
        treatmentSelect.className = 'custom-select custom-select-sm';
        treatmentSelect.innerHTML = '<option value="-1">None</option>' +
            '<#list hoofCareTreatment as hct><option value="${hct.getId()}">${hct.getName()}</option></#list>';

        treatmentDiv.append(treatmentSelect);
        td4.append(treatmentDiv);

        //Delete Button
        let deleteButton = document.createElement('div');
        deleteButton.innerHTML = '<i type="button" class="far fa-trash-alt deleteRow">'

        td5.append(deleteButton);

        row.append(td1, td2, td3, td4, td5);

        $("#hoofCareInputSequenceTable").append(row);

    });

    $(".date").change(function () {

        let today = new Date();
        let dateToCheck = new Date(this.value);
        let bDay = new Date("${calf.birthDate}");

        if (dateToCheck > today) {
            alert("You cannot enter a date in the future!");
            this.value = "${occurrence.date}";
        }

        if (bDay > dateToCheck) {
            alert("You cannot enter a date before the calf was born! (" + bDay.toDateString() + ")");
            this.value = "${occurrence.date}";
        }

    });

    //Condition Score

    $("#number").html($("#range").val())

    $("#range").change(function () {

        $("#number").html(this.value);

    });

    //MilkYield

    $("#lactationValue").html($("#lactationRange").val())

    $("#lactationRange").change(function () {

        $("#lactationValue").html(this.value);

    });

    $('#addMedicineSequence').click(function () {

        let row = document.createElement("tr");

        let td1 = document.createElement("td");
        let td2 = document.createElement("td");
        let td3 = document.createElement("td");
        let td4 = document.createElement("td");
        let td5 = document.createElement("td");
        let td6 = document.createElement("td");
        let td7 = document.createElement("td");
        let td8 = document.createElement("td");

        //Person
        let personDiv = document.createElement('div');
        personDiv.className = 'form-group';

        let personSelect = document.createElement('select');
        personSelect.name = 'person';
        personSelect.className = 'custom-select custom-select-sm';
        personSelect.innerHTML = '<#if people?has_content>' +
            '<#list people as p><option value="${p.getId()}">${p.getName()}</option></#list>' +
            '<#else><option value="-1">None</option></#if>';

        personDiv.append(personSelect);
        td1.append(personDiv);

        //Medicine
        let medicineDiv = document.createElement('div');
        medicineDiv.className = 'form-group';

        let medicineSelect = document.createElement('select');
        medicineSelect.name = 'medicine';
        medicineSelect.className = 'custom-select custom-select-sm';
        medicineSelect.innerHTML = '<#if noneAndNormalWithdrawalMedicines?has_content>' +
            '<#list noneAndNormalWithdrawalMedicines as m><option value="${m.getId()}">${m.getName()}</option></#list>' +
            '<#else><option value="-1">None</option></#if>';

        medicineDiv.append(medicineSelect);
        td2.append(medicineDiv);

        //Amount
        let amountDiv = document.createElement('div');
        amountDiv.className = 'form-group';

        let amountInput = document.createElement('input');
        amountInput.name = 'amount';
        amountInput.className = 'form-control form-control-sm noSpace';
        amountInput.type = 'text';

        amountDiv.append(amountInput);
        td3.append(amountDiv);

        //Delete Button
        let element = document.createElement('div');
        element.innerHTML = '<i type="button" class="far fa-trash-alt deleteRow">'

        td8.append(element);

        row.append(td1, td2, td3, td4, td5, td6, td7, td8);

        $("#accidentTable").append(row);

    });

    function occurrenceEditingValidation() {

        let editingAnswers = [];

        let length = $("#accidentTable tr").length;

        let personArray = $('[name=person]');
        let medicineArray = $('[name=medicine]');
        let amountArray = $('[name=amount]');

        for (let i = 0; i < length; i++) {

            if (amountArray[i].value === '') {

                alert('Amount is empty');
                return false;

            }

            if (personArray[i].value === '-1') {

                alert('Person is undefined');
                return false;

            }

            editingAnswers.push({

                medicineId: medicineArray[i].value,
                personId: personArray[i].value,
                amount: amountArray[i].value

            });

        }

        if (occurrenceName === "CASTRATION_DEHORNING") {

            if (editingAnswers.length < 3) {

                alert("Amount of medicine is less than 3");
                return false;

            }

        }

        $('#medicineInputSequenceArray').val(JSON.stringify(editingAnswers));

        if ($("#hoofCareType").val() !== 'INSPECTION') {

            let hoofCareInputSequence = [];

            let length = $("#hoofCareInputSequenceTable tr").length;

            let hoofArray = $('[name=hoof]');
            let shapeArray = $('[name=shape]');
            let problemArray = $('[name=problem]');
            let treatmentArray = $('[name=treatment]');

            for (let i = 0; i < length; i++) {

                let problemId = problemArray[i].id;
                let problemIdArray = $('#' + problemId + ' :selected');
                let problemTempIdArray = [];
                let problemIdString;

                problemIdArray.each(function (index, value) {
                    problemTempIdArray.push(value.value)
                });

                problemIdString = problemTempIdArray.join();

                let treatmentId = treatmentArray[i].id;
                let treatmentIdArray = $('#' + treatmentId + ' :selected');
                let treatmentTempIdArray = [];
                let treatmentIdString;

                treatmentIdArray.each(function (index, value) {
                    treatmentTempIdArray.push(value.value)
                });

                treatmentIdString = treatmentTempIdArray.join();

                hoofCareInputSequence.push({
                    hoof: hoofArray[i].value,
                    shape: shapeArray[i].value,
                    problemId: problemIdString,
                    treatmentId: treatmentIdString
                });

            }

            $('#hoofCareInputSequenceArray').val(JSON.stringify(hoofCareInputSequence));

        }

        if (occurrenceName === "CALVING") {

            let calvingInputSequence = [];

            let length = $("#calvingInputSequenceTable tr").length;

            if (length === 0) {

                alert('You should add at least 1 calf');
                return false;

            }

            let dateArray = $('[name=calvingDate]');
            let newBornCalfIdArray = $('[name=newBornCalfId]');
            let pobArray = $('[name=calvingPlaceOfBirth]');
            let bornArray = $('[name=calvingBorn]');
            let birthArray = $('[name=calvingBirth]');
            let genderArray = $('[name=calvingGender]');
            let statusArray = $('[name=calvingStatus]');
            let colostrumArray = $('[name=calvingColostrum]');
            let dbIDArray = $('[name=dbID]');

            for (let i = 0; i < length; i++) {

                if (newBornCalfIdArray[i].value === '') {
                    alert("Id is empty");
                    return false;
                }

                let innerId;

                if (i <= dbIDArray.length - 1) {

                    innerId = dbIDArray[i].value;

                } else {
                    innerId = -1;
                }

                let birthID = 'b' + i;

                birthArray[i].id = birthID;

                let birthValuesArray = $('#' + birthID + ' :selected');
                let birthTempArray = [];
                let birthString;

                if (birthValuesArray.length === 0) {
                    alert("Birth is not defined");
                    return false;
                }

                birthValuesArray.each(function (index, value) {
                    birthTempArray.push(value.value)
                });

                birthString = birthTempArray.join();

                calvingInputSequence.push({

                    dateOfBirth: dateArray[i].value,
                    calfId: newBornCalfIdArray[i].value,
                    placeOfBirth: pobArray[i].value,
                    born: bornArray[i].value,
                    dbId: innerId,
                    gender: genderArray[i].value,
                    status: statusArray[i].value,
                    colostrum: colostrumArray[i].value,
                    birth: birthString
                });

            }

            $('#calvingInputSequenceArray').val(JSON.stringify(calvingInputSequence));

        }

    }

    //Death

    $("#fatRatingValue").html($("#fatRating").val())

    $("#fatRating").change(function () {

        $("#fatRatingValue").html(this.value);

    });

    $("#deathMethod").change(function () {

        let selected = $("#deathMethod").val();
        let slaughterPanel = $("#slaughterPanel");

        switch (selected) {

            case "DEATH":
            case "EUTHANASIA" :
                slaughterPanel.hide();
                break;

            case "SLAUGHTER" :
                slaughterPanel.show();
                break;

        }

    });

    //Calving

    $("#calvingInputSequenceTable").on("click", ".number", function () {

        onkeydown =
            function f() {
                return (event.ctrlKey || event.altKey
                    || (47
                        < event.keyCode && event.keyCode < 58 && event.shiftKey == false)
                    || (95
                        < event.keyCode && event.keyCode < 106)
                    || (event.keyCode == 8) || (event.keyCode == 9)
                    || (event.keyCode > 34 && event.keyCode < 40)
                    || (event.keyCode == 46));
            }


    });

    $("#calvingInputSequenceTable").on("click", ".deleteRow", function () {
        $(this).closest("tr").remove();
        if ($("#calvingInputSequenceTable tr").length < 3) {
            $('#addCalvingInputSequence').show();
        }
    });

    $("#calvingInputSequenceTable").on("change", ".calvingDate", function () {

        let today = new Date();
        let dateToCheck = new Date(this.closest(".calvingDate").value);

        if (dateToCheck > today) {
            alert("You cannot enter a date in the future!");
            this.closest(".calvingDate").value = "${calf.birthDate}";

        }

    });

    $('#addCalvingInputSequence').click(function () {

        let row = document.createElement("tr");

        let td1 = document.createElement("td");
        let td2 = document.createElement("td");
        let td3 = document.createElement("td");
        let td4 = document.createElement("td");
        let td5 = document.createElement("td");
        let td6 = document.createElement("td");
        let td7 = document.createElement("td");
        let td8 = document.createElement("td");
        let td9 = document.createElement("td");

        //Date
        let dateDiv = document.createElement('div');
        dateDiv.className = 'form-group';

        let dateInput = document.createElement('input');
        dateInput.type = 'date';
        dateInput.name = 'calvingDate';
        dateInput.required = true;
        dateInput.className = 'form-control form-control-sm date';
        dateInput.value = '${aDate?string.iso}';

        dateDiv.append(dateInput);
        td1.append(dateDiv);

        //Id
        let idDiv = document.createElement('div');
        idDiv.className = 'form-group';

        let idInput = document.createElement('input');
        idInput.name = 'newBornCalfId';
        idInput.className = 'form-control form-control-sm number';
        idInput.type = 'text';

        idDiv.append(idInput);
        td2.append(idDiv);

        //place of birth
        let pobDiv = document.createElement('div');
        pobDiv.className = 'form-group';

        let pobSelect = document.createElement('select');
        pobSelect.name = 'calvingPlaceOfBirth';
        pobSelect.className = 'custom-select custom-select-sm';
        pobSelect.innerHTML = '<#list pob as p> <option value="${p}">${p.getText()}</option></#list>';

        pobDiv.append(pobSelect);
        td3.append(pobDiv);

        //born
        let bornDiv = document.createElement('div');
        bornDiv.className = 'form-group';

        let bornSelect = document.createElement('select');
        bornSelect.name = 'calvingBorn';
        bornSelect.className = 'custom-select custom-select-sm';
        bornSelect.innerHTML = '<#list born as bo> <option value="${bo}">${bo.getText()}</option></#list>';

        bornDiv.append(bornSelect);
        td4.append(bornDiv);

        //birth
        let birthDiv = document.createElement('div');
        birthDiv.className = 'form-group';

        let birthSelect = document.createElement('select');
        birthSelect.name = 'calvingBirth';
        birthSelect.multiple = true;
        birthSelect.className = 'custom-select custom-select-sm';
        birthSelect.innerHTML = '<#list birth as b><option value="${b}">${b.getText()}</option></#list>';

        birthDiv.append(birthSelect);
        td5.append(birthDiv);

        //gender
        let genderDiv = document.createElement('div');
        genderDiv.className = 'form-group';

        let genderSelect = document.createElement('select');
        genderSelect.name = 'calvingGender';
        genderSelect.className = 'custom-select custom-select-sm';
        genderSelect.innerHTML = '<#list gender as g><option value="${g}">${g.getText()}</option></#list>';

        genderDiv.append(genderSelect);
        td6.append(genderDiv);

        //status
        let statusDiv = document.createElement('div');
        statusDiv.className = 'form-group';

        let statusSelect = document.createElement('select');
        statusSelect.name = 'calvingStatus';
        statusSelect.className = 'custom-select custom-select-sm';
        statusSelect.innerHTML = '<#list status as s><option value="${s}">${s.getText()}</option></#list>';

        statusDiv.append(statusSelect);
        td7.append(statusDiv);

        //colostrum
        let colostrumDiv = document.createElement('div');
        colostrumDiv.className = 'form-group';

        let colostrumSelect = document.createElement('select');
        colostrumSelect.name = 'calvingColostrum';
        colostrumSelect.className = 'custom-select custom-select-sm';
        colostrumSelect.innerHTML = '<#list colostrum as c><option value="${c}">${c.getText()}</option></#list>';

        colostrumDiv.append(colostrumSelect);
        td8.append(colostrumDiv);

        //Delete Button
        let deleteButton = document.createElement('div');
        deleteButton.innerHTML = '<i type="button" class="far fa-trash-alt deleteRow">'

        td9.append(deleteButton);

        row.append(td1, td2, td3, td4, td5, td6, td7, td8, td9);

        $("#calvingInputSequenceTable").append(row);

        if ($("#calvingInputSequenceTable tr").length === 3) {
            $('#addCalvingInputSequence').hide();
        }

    });

</script>





