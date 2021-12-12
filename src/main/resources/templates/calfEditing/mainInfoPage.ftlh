<div class="card shadow bg-white">

    <form method="post" enctype="multipart/form-data">
        <div class="form-group mt-3 ml-3 mr-3">
            <div class="row row-cols-2">

                <div class="col">
                    <div class="form-group">
                        <label class="label" for="mainInfoBDate">Date of Birth</label>
                        <div class="input-group input-group-sm">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Age - ${calf.getRealAge()}</span>
                            </div>
                            <div class="input-group-prepend">
                                <span class="input-group-text">${calf.getStatus().getText()}</span>
                            </div>
                            <input type="date" required class="form-control form-control-sm"
                                   value="${calf.getBirthDate()}"
                                   id="mainInfoBDate"
                                   data-date-format=yyyy-MM-dd"
                                   name="birthDate">
                        </div>
                    </div>
                </div>

<#--                <div class="col">-->
<#--                    <div class="form-group">-->
<#--                        <label class="label" for="breed">Breed</label>-->
<#--                        <select class="custom-select custom-select-sm" id="breed" name="breed">-->
<#--                            <option selected>${calf.getBreed()}</option>-->
<#--                            <#list breed as b>-->
<#--                                <#if calf.getBreed()!=b>-->
<#--                                    <option>${b}</option>-->
<#--                                </#if>-->
<#--                            </#list>-->
<#--                        </select>-->
<#--                    </div>-->
<#--                </div>-->

                <div class="col">
                    <div class="form-group">
                        <label class="label" for="ID">ID</label>
                        <input type="text" class="form-control form-control-sm"
                               value="${calf.getCalfId()}" name="calfId" id="ID" required>
                    </div>
                </div>

                <div class="col">
                    <div class="form-group">
                        <label class="label" for="quantity">Quantity</label>
                        <select class="custom-select custom-select-sm" id="quantity" name="quantity">
                            <option selected value="${calf.getQuantity()}">${calf.getQuantity().getText()}</option>
                            <#list quantity as q>
                                <#if calf.getQuantity()!=q>
                                    <option value="${q}">${q.getText()}</option></#if>
                            </#list>
                        </select>
                    </div>
                </div>

                <div class="col">
                    <div class="form-group">
                        <label class="label" for="gender">Gender</label>
                        <select class="custom-select custom-select-sm" id="gender" name="gender">
                            <option selected value="${calf.getGender()}">${calf.getGender().getText()}</option>
                            <#list gender as g>
                                <#if calf.getGender()!=g>
                                    <option value="${g}">${g.getText()}</option></#if>
                            </#list>
                        </select>
                    </div>
                </div>

                <div class="col">
                    <div class="form-group">
                        <label class="label" for="birthPlace">Place of birth</label>
                        <select class="custom-select custom-select-sm" id="birthPlace" name="birthPlace">
                            <option selected value="${calf.getBirthPlace()}">${calf.getBirthPlace().getText()}</option>
                            <#list placeOfBirth as p>
                                <#if calf.getBirthPlace()!=p>
                                    <option value="${p}">${p.getText()}</option></#if>
                            </#list>
                        </select>
                    </div>
                </div>

                <div class="col">
                    <div class="form-group">
                        <label class="label" for="born">Born</label>
                        <select class="custom-select custom-select-sm" id="born" name="born">
                            <option selected value="${calf.getBorn()}">${calf.getBorn().getText()}</option>
                            <#list born as b>
                                <#if calf.getBorn()!=b>
                                    <option value="${b}">${b.getText()}</option></#if>
                            </#list>
                        </select>
                    </div>
                </div>

                <div class="col">
                    <div class="form-group">
                        <label class="label" for="gestation">Gestation</label>
                        <input type="text" class="form-control form-control-sm" value="${calf.getGestation()}"
                               name="gestation" id="gestation">
                    </div>
                </div>

                <div class="col">

                    <div class="form-group">
                        <label for="father">Father</label>
                        <select class="custom-select custom-select-sm" id="father" name="father">


                                <option selected
                                        value="${calf.getFather().getId()}">${calf.getFather().getName()}</option>

                            <#if fathers?has_content>
                                <#list fathers as father>
                                        <#if calf.getFather()!=father>
                                            <option value="${father.getId()}">${father.getName()}</option>
                                        </#if>
                                </#list>
                            </#if>

                        </select>

                    </div>

                </div>

                <div class="col">
                    <div class="form-group">
                        <label class="label" for="colostrum">Colostrum</label>
                        <select class="custom-select custom-select-sm" id="colostrum" name="colostrum">
                            <option selected value="${calf.getColostrum()}">${calf.getColostrum().getText()}</option>
                            <#list colostrum as c>
                                <#if calf.getColostrum()!=c>
                                    <option value="${c}">${c.getText()}</option></#if>
                            </#list>
                        </select>
                    </div>
                </div>

                <div class="col">
                    <div class="form-group">
                        <label class="label" for="birth">Birth</label>
                        <select class="custom-select custom-select-sm" multiple="multiple" id="birthList" name="birthList"
                                required>

                            <#list birth as b>

                                <#if calf.getBirthList()?seq_contains(b)>

                                    <option selected value="${b}">${b.getText()}</option>

                                <#else>

                                    <option value="${b}">${b.getText()}</option>

                                </#if>

                            </#list>
                        </select>
                    </div>
                </div>

            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-outline-secondary btn-sm">Save
                    Changes
                </button>
            </div>
        </div>

        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    </form>
</div>

<script>

    $("#mainInfoBDate").change(function () {

        let today = new Date();
        let dateToCheck = new Date(this.value);

        if (dateToCheck > today) {
            alert("You cannot enter a date in the future!");
            this.value = "${calf.birthDate}";

        }

    });

</script>
