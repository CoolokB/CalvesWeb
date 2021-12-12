<#import "../parts/common.ftlh" as c>

<@c.page>
    <#assign aDateTime = .now>
    <#assign aDate = aDateTime?date>

    <div class="container ml-3">
        <ul class="nav calfEditTabs" id="myTab" role="tablist">

            <li class="nav-item">

                <a class="nav-link disabled">
                    ID - ${calf.getCalfId()}
                </a>

            </li>

            <#if !calf.isBornByCalving()>
                <li class="nav-item">
                    <a class="nav-link active"
                       id="main-tab"
                       data-toggle="tab"
                       href="#main"
                       role="tab"
                       aria-controls="main"
                       aria-selected="true">Main</a>
                </li>
            </#if>

            <li class="nav-item">
                <a class="nav-link"
                   id="habitat-tab"
                   data-toggle="tab"
                   href="#habitat"
                   role="tab"
                   aria-controls="habitat"
                   aria-selected="false">Habitat</a>
            </li>

            <li class="nav-item">
                <a class="nav-link"
                   id="treatment-tab"
                   data-toggle="tab"
                   href="#treatment"
                   role="tab"
                   aria-controls="treatment"
                   aria-selected="false">Occurrence</a>
            </li>

            <li class="nav-item">
                <a class="nav-link"
                   id="files-tab"
                   data-toggle="tab"
                   href="#files"
                   role="tab"
                   aria-controls="files"
                   aria-selected="false">Files</a>
            </li>

            <li class="nav-item">
                <a class="nav-link"
                   id="bullingCalendar-tab"
                   data-toggle="tab"
                   href="#bullingCalendar"
                   role="tab"
                   aria-controls="bullingCalendar"
                   aria-selected="false">Bulling Calendar</a>
            </li>

        </ul>

        <div class="tab-content mytab-content" id="myTabContent">

            <#if !calf.isBornByCalving()>
                <div class="tab-pane fade show active" id="main" role="tabpanel" aria-labelledby="main-tab">
                <#include "mainInfoPage.ftlh" />
                </div>
            </#if>

            <div class="tab-pane fade" id="habitat" role="tabpanel" aria-labelledby="habitat-tab">
                <#include "placeOfHabitat/placePage.ftlh" />
            </div>

            <div class="tab-pane fade" id="treatment" role="tabpanel" aria-labelledby="treatment-tab">
                <#include "treatment/treatmentPage.ftlh" />

<#--                <#include "placeOfHabitat/placePage.ftlh" />-->

            </div>

            <div class="tab-pane fade" id="files" role="tabpanel" aria-labelledby="files-tab">
                <#include "treatment/filePage.ftlh" />


            </div>

            <div class="tab-pane fade" id="bullingCalendar" role="tabpanel" aria-labelledby="bullingCalendar-tab">
                <#include "treatment/bullingCalendarPage.ftlh" />

<#--                <#include "placeOfHabitat/placePage.ftlh" />-->

            </div>

        </div>
    </div>

    <script>

        let newWindow;

        function openNewWindow(url) {

            newWindow = window.open(url, "Edit", "top=300,width=500,height=430");
        }

        function openNewWindowWide(url) {

            newWindow = window.open(url, "Edit", "top=300,width=850,height=500");
        }

        window.onunload = function () {
            if (newWindow && !newWindow.closed) {
                newWindow.close();
            }
        };

        $(document).ready(() => {

            let url = location.href.replace(/\/$/, "");

            if (location.hash) {
                const hash = url.split("#");
                $('#myTab a[href="#' + hash[1] + '"]').tab("show");
                url = location.href.replace(/\/#/, "#");
                history.replaceState(null, null, url);
            }

            $('a[data-toggle="tab"]').on("click", function () {
                let newUrl;
                const hash = $(this).attr("href");
                if (hash === "#home") {
                    newUrl = url.split("#")[0];
                } else {
                    newUrl = url.split("#")[0] + hash;
                }
                newUrl += "/";
                history.replaceState(null, null, newUrl);
            });
        });

    </script>

</@c.page>




