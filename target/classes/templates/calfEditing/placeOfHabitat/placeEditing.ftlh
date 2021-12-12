<#import "../../parts/common.ftlh" as c>

<@c.page>

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/edit/${calf.id}#habitat/" style="color: white">Place Of Habitat
                    History</a>
            </li>
            <li class="breadcrumb-item active" aria-current="page" style="color: #000000">Edit Place Of Habitat</li>
        </ol>
    </nav>

    <div class="card shadow mx-auto editCard">

        <div class="card-header">
            <h4 class="card-title">Edit Place Of Habitat</h4>
        </div>
        <div class="card-body">
            <form method="post">

                <div class="container">
                    <div class="form-group">
                        <label for="startDate">Start Date</label>
                        <input type="date" required value="${place.startDate}" id="startDate"
                               data-date-format=yyyy-MM-dd"
                               class="form-control form-control-sm"
                               name="startDate">
                    </div>

                    <div class="form-group">
                        <label for="first">Place</label>
                        <select class="custom-select custom-select-sm" id="first" name="place">
                            <option selected value="${place.place}">${place.place.getText()}</option>
                            <#list placeOfHabitatList as p>
                                <#if place.place!=p>
                                    <option value="${p}">${p.getText()}</option>
                                </#if>
                            </#list>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="gField">Field</label>
                        <input type="text"
                               class="form-control form-control-sm"
                               value="${place.grazing_field_number}"
                               placeholder="${place.grazing_field_number}"
                               name="grazing_field_number"
                               id="gField"/>
                    </div>

                    <div class="form-group">
                        <label for="Textarea">Notes</label>
                        <textarea class="form-control form-control-sm" name="about"
                                  id="Textarea" rows="1">${place.about}</textarea>
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
</@c.page>
<script>

    $("#startDate").change(function () {

        let dateToCheck = new Date(this.value);

        if (dateToCheck > today) {
            alert("You cannot enter a date in the future!");
            this.value = "${place.startDate}";
        }

        <#if lastStartDate??>

        let lastStart = new Date("${lastStartDate}")

        if (dateToCheck < lastStart) {
            this.value = "${place.startDate}";
            alert("You cannot enter a date before last start date!");
        }

        <#else>
        if (dateToCheck < birthDay) {
            this.value = "${place.startDate}";
            alert("You cannot enter a date before the calf was born! (" + birthDay.toDateString() + ")");
        }
        </#if>

    })

</script>


