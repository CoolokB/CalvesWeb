<div class="card">
    <div class="card-header" id="headingTwo">
        <h2 class="mb-0">
            <button class="btn btn-link btn-block text-left" type="button"
                    data-toggle="collapse"
                    data-target="#collapseTwo"
                    aria-expanded="false"
                    aria-controls="collapseTwo">
                Main Info
            </button>
        </h2>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
         data-parent="#accordionExample">

        <div class="card-body">

            <div class="form-group ml-1">

                <div class="form-group">

                    <i id="statusArrow" class="fas fa-chevron-down"></i>
                    <a onclick="switchArrow('#statusArrow')"
                       href="#"
                       id="statusMenu">Status</a>

                </div>

                <div id="collapseStatus" class="collapse ml-1">

                    <#list status as s>

                        <div class="form-group">
                            <div class="form-check">
                                <input class="form-check-input statusCheck"
                                       type="checkbox"
                                       value="${s}">
                                <label class="form-check-label">
                                    ${s.getText()}
                                </label>
                            </div>
                        </div>

                    </#list>

                </div>

                <hr>

                <div class="form-group">

                    <i id="breedArrow" class="fas fa-chevron-down"></i>
                    <a onclick="switchArrow('#breedArrow')"
                       href="#"
                       id="breedMenu">Breed</a>

                </div>

                <div id="collapseBreed" class="collapse ml-1">

                    <#list breed as b>
                        <div class="form-group">
                            <div class="form-check">
                                <input class="form-check-input breedCheck"
                                       type="checkbox"
                                       value="${b}">
                                <label class="form-check-label">
                                    ${b}
                                </label>
                            </div>
                        </div>
                    </#list>

                </div>

                <hr>

                <div class="form-group">

                    <i id="quantityArrow" class="fas fa-chevron-down"></i>
                    <a onclick="switchArrow('#quantityArrow')"
                       href="#"
                       id="quantityMenu">Quantity</a>

                </div>

                <div id="collapseQuantity" class="collapse ml-1">

                    <#list quantity as q>
                        <div class="form-group">

                            <div class="form-check">
                                <input class="form-check-input quantityCheck"
                                       type="checkbox"
                                       value="${q}">
                                <label class="form-check-label">
                                    ${q.getText()}
                                </label>
                            </div>
                        </div>

                    </#list>

                </div>

                <hr>

                <div class="form-group">

                    <i id="genderArrow" class="fas fa-chevron-down"></i>
                    <a onclick="switchArrow('#genderArrow')"
                       href="#"
                       id="genderMenu">Gender</a>

                </div>

                <div id="collapseGender" class="collapse ml-1">

                    <#list gender as g>

                        <div class="form-group">
                            <div class="form-check">
                                <input class="form-check-input genderCheck"
                                       type="checkbox"
                                       value="${g}">
                                <label class="form-check-label">
                                    ${g.getText()}
                                </label>
                            </div>
                        </div>

                    </#list>

                </div>

                <hr>

                <div class="form-group">

                    <i id="pobArrow" class="fas fa-chevron-down"></i>
                    <a onclick="switchArrow('#pobArrow')"
                       href="#"
                       id="pobMenu">Place Of Birth</a>

                </div>

                <div id="collapsePOB" class="collapse ml-1">

                    <#list placeOfBirth as p>
                        <div class="form-group">
                            <div class="form-check">
                                <input class="form-check-input pobCheck"
                                       type="checkbox"
                                       value="${p}">
                                <label class="form-check-label">
                                    ${p.getText()}
                                </label>
                            </div>
                        </div>

                    </#list>

                </div>

                <hr>

                <div class="form-group">

                    <i id="birthArrow" class="fas fa-chevron-down"></i>
                    <a onclick="switchArrow('#birthArrow')"
                       href="#"
                       id="birthMenu">Birth</a>

                </div>

                <div id="collapseBirth" class="collapse ml-1">

                    <#list birth as bi>
                        <div class="form-group">
                            <div class="form-check">
                                <input class="form-check-input birthCheck"
                                       type="checkbox"
                                       value="${bi}">
                                <label class="form-check-label">
                                    ${bi.getText()}
                                </label>
                            </div>

                        </div>

                    </#list>

                </div>

                <hr>

                <div class="form-group">

                    <i id="bornArrow" class="fas fa-chevron-down"></i>
                    <a onclick="switchArrow('#bornArrow')"
                       href="#"
                       id="bornMenu">Born</a>

                </div>

                <div id="collapseBorn" class="collapse ml-1">

                    <#list born as bo>
                        <div class="form-group">

                            <div class="form-check">
                                <input class="form-check-input bornCheck"
                                       type="checkbox"
                                       value="${bo}">
                                <label class="form-check-label">
                                    ${bo.getText()}
                                </label>

                            </div>
                        </div>
                    </#list>

                </div>

                <hr>

                <div class="form-group">

                    <i id="colostrumArrow" class="fas fa-chevron-down"></i>
                    <a onclick="switchArrow('#colostrumArrow')"
                       href="#"
                       id="colostrumMenu">Colostrum</a>

                </div>

                <div id="collapseColostrum" class="collapse ml-1">

                    <#list colostrum as col>
                        <div class="form-group">

                            <div class="form-check">
                                <input class="form-check-input colostrumCheck"
                                       type="checkbox"
                                       value="${col}">
                                <label class="form-check-label">
                                    ${col.getText()}
                                </label>
                            </div>
                        </div>
                    </#list>

                </div>

            </div>

        </div>
    </div>
</div>
<script>

    $('#statusMenu').click(function () {

        $('#collapseStatus').slideToggle(400);

    });

    $('#breedMenu').click(function () {

        $('#collapseBreed').slideToggle(400);

    });

    $('#quantityMenu').click(function () {

        $('#collapseQuantity').slideToggle(400);

    });

    $('#genderMenu').click(function () {

        $('#collapseGender').slideToggle(400);

    });

    $('#pobMenu').click(function () {

        $('#collapsePOB').slideToggle(400);

    });

    $('#birthMenu').click(function () {

        $('#collapseBirth').slideToggle(400);

    });

    $('#bornMenu').click(function () {

        $('#collapseBorn').slideToggle(400);

    });

    $('#colostrumMenu').click(function () {

        $('#collapseColostrum').slideToggle(400);

    });

    function setMainInfoParameters() {

            if ($('#statusArrow').hasClass("fas fa-chevron-up")) {

                addToResult($(".statusCheck"), "Status");

            }

            if ($('#breedArrow').hasClass("fas fa-chevron-up")) {

                addToResult($(".breedCheck"), "Breed");

            }

            if ($('#quantityArrow').hasClass("fas fa-chevron-up")) {

                addToResult($(".quantityCheck"), "Quantity");

            }

            if ($('#genderArrow').hasClass("fas fa-chevron-up")) {

                addToResult($(".genderCheck"), "Gender");

            }

            if ($('#pobArrow').hasClass("fas fa-chevron-up")) {

                addToResult($(".pobCheck"), "Place Of Birth");

            }

            if ($('#birthArrow').hasClass("fas fa-chevron-up")) {

                addToResult($(".birthCheck"), "Birth");

            }

            if ($('#bornArrow').hasClass("fas fa-chevron-up")) {

                addToResult($(".bornCheck"), "Born");

            }

            if ($('#colostrumArrow').hasClass("fas fa-chevron-up")) {

                addToResult($(".colostrumCheck"), "Colostrum");

            }

    }

</script>