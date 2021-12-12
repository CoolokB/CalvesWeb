<div class="card">

    <div class="card-header" id="headingFeedControlPanel">
        <h2 class="mb-0">

            <button class="btn btn-link btn-block text-left"
                    type="button"
                    data-toggle="collapse"
                    data-target="#collapseFeedControlPanel"
                    aria-expanded="true"
                    aria-controls="collapseFeedControlPanel">
                Feed Control
            </button>

        </h2>
    </div>
    <div id="collapseFeedControlPanel"
         class="collapse"
         aria-labelledby="headingFeedControlPanel"
         data-parent="#accordionExample">

        <div class="card-body">

            <div class="form-group ml-1">

                <div class="form-group">

                    <i id="feedControlArrow" class="fas fa-chevron-down"></i>
                    <a onclick="switchArrow('#feedControlArrow')"
                       href="#"
                       id="feedControlMenu">Place Of Habitat</a>

                </div>

                <div id="feedControlCollapse" class="collapse ml-1">

                    <#list placeOfHabitat as poh>

                        <div class="form-group">
                            <div class="form-check">
                                <input class="form-check-input pohCheck"
                                       type="checkbox"
                                       onclick="showHiddenField()"
                                       value="${poh}">
                                <label class="form-check-label">
                                    ${poh.getText()}
                                </label>
                            </div>
                        </div>

                    </#list>

                    <div class="form-group hidden" id="grazingField">
                        <label class="label">Field Number</label>
                        <input type="text" class="form-control form-control-sm"
                               name="grazingField">
                    </div>

                </div>

                <hr>

                <div class="form-group">
                    <label for="pohDateFrom">Date ></label>
                    <input type="date" required
                           value="${aDate?string.iso}"
                           data-date-format=yyyy-MM-dd"
                           id="pohDateFrom"
                           class="form-control form-control-sm smallText"
                           name="date">
                </div>

                <div class="form-group">
                    <label for="pohDateTo">Date <</label>
                    <input type="date" required
                           value="${aDate?string.iso}"
                           data-date-format=yyyy-MM-dd"
                           id="pohDateTo"
                           class="form-control form-control-sm smallText"
                           name="date">
                </div>

            </div>

        </div>

    </div>
</div>
<script>

    $('#feedControlMenu').click(function () {

        $('#feedControlCollapse').slideToggle(400);

    });

</script>