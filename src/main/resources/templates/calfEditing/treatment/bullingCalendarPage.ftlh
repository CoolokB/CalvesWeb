<div class="container" style="margin-left: -0.92rem;opacity: 0.94">

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

</div>




