<#import "../parts/common.ftlh" as c>
<@c.page>

    <#assign aDateTime = .now>
    <#assign aDate = aDateTime?date>

    <div class="row mt-5 mr-5 ml-5">

        <div class="card-columns">

            <div class="card text-white">
                <img src="../../static/media/table.jpg" class="card-img"/>

                <a href="/mainTable" class="stretched-link"></a>

                <div class="card-img-overlay">
                    <h5 class="card-title">Calves Table</h5>
                </div>
            </div>

            <div class="card text-dark">
                <img src="../../static/media/graphs.jpg" class="card-img" alt="..."/>

                <a href="/mainTable" class="stretched-link"></a>

                <div class="card-img-overlay">
                    <h5 class="card-title">Graphs</h5>
                </div>
            </div>

            <div class="card text-white">
                <img src="../../static/media/1.jpg"
                     class="card-img"
                     alt="..."/>
                <div class="card-img-overlay">
                    <h5 class="card-title">Feed Controller</h5>
                </div>
            </div>

            <div class="card text-white">
                <img src="../../static/media/1.jpg"
                     class="card-img"
                     alt="..."/>
                <div class="card-img-overlay">
                    <h5 class="card-title">Place Controller</h5>
                </div>
            </div>

            <div class="card text-white">
                <img src="../../static/media/1.jpg"
                     class="card-img"
                     alt="..."/>

                <a href="/bullingCalendar" class="stretched-link"></a>

                <div class="card-img-overlay">
                    <h5 class="card-title">Bulling Calendar</h5>
                </div>
            </div>

            <div class="card text-dark">
                <img src="../../static/media/1233.jpg"
                     class="card-img"
                     alt="..."/>

                <a href="/medicineTable" class="stretched-link"></a>

                <div class="card-img-overlay">
                    <h5 class="card-title">Medicine</h5>
                </div>
            </div>

        </div>

    </div>
</@c.page>

