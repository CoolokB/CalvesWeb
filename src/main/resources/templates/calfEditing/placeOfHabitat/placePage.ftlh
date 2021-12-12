<#if calf.getPlaces()?size==0>

<button class="btn btn-light btn-sm" data-toggle="modal" id="addPlaceButton" data-target="#myModal">Add Place Of Habitat</button>

<#else>
<div class="card shadow">
        <div class="tableFixHead calfEdit hiddenScrollBar">
            <table class="table table-sm">
                <thead>
                <tr>
                    <th>Place</th>
                    <th>Grazing №</th>
                    <th>Start</th>
                    <th>End</th>
                    <th>Food Type</th>
                    <th></th>
                    <th><a href="#" data-toggle="modal"
                           data-target="#myModal"><i class="fas fa-plus"></i></a></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <#list calf.getPlaces() as place>
                    <td>${place.place.getText()}</td>
                    <td>${place.grazing_field_number}</td>
                    <td>${place.startDate}</td>
                    <td><#if place.endDate??>${place.endDate}</#if></td>
                    <td>${place.foodType.getText()}</td>

                    <td><a href="/editPlace?id=${place_index}&calf=${calf.id}"><i class="far fa-edit"></i></a></td>

                    <td><a href="/deletePlace?id=${place_index}&calf=${calf.id}" onclick="return confirm('Are you sure you want to delete?')">
                            <i class="far fa-trash-alt"></i></a></td>
                </tr>
                </#list>
                </tbody>
            </table>
        </div>
    </div>
</#if>
<#include "addPlace.ftlh" />

<script>

    $("#addPlaceButton").click(function () {

        if (status === "Dead") {
            alert("This calf is Dead , You can't add new Place Of Habitat!");
            return false;
        }

        if (status === "Sold") {
            alert("This calf is Sold , You can't add new Place Of Habitat!");
            return false;
        }

    });

</script>
