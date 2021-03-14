<#import "commonPage.ftlh" as c>
<@c.page title="Главная страница">
    <div class="container my-3">
        <div class="form-row">
            <div class="form-group col-md-6">
                <form method="post" class="form-inline>
                    <label class="form-control">Reminder's text : <input type="text" name="text"/></label>
                    <input type="submit" value="Добавить" class="btn btn-primary ml-2"/>
                </form>
            </div>
        </div>


        <div class="form-row my-2">
            <div class="form-group col-md-6">
                <form method = "get">
                    <label for="statuses">Choose a status:</label>
                    <select name="status" id="statuses">
                        <option value="NONE">Все</option>
                        <option value="PENDING">В ожидании</option>
                        <option value="IN_PROGRESS">В процессе</option>
                        <option value="DONE">Выполнено</option>
                    </select>
                    <input type="submit" value="Найти" class="btn btn-secondary btn-sm">
                </form>
            </div>
        </div>

        <div class="card-columns mt-5 flex-wrap d-flex justify-content-between">
            <#list reminders as reminder>
            <div class="card mb-3">
                <div class="card-header">
                    <#if reminder.status = "PENDING">
                        <h5 class="card-title">В ожидании</h5>
                    <#elseif reminder.status = "IN_PROGRESS">
                        <h5 class="card-title">В процессе</h5>
                    <#elseif reminder.status = "DONE">
                        <h5 class="card-title">Выполнено</h5>
                    </#if>
                </div>
                <div class="card-body">
                    <p class="card-text">${reminder.text}</p>
                </div>
                <div class = "card-footer">
                    <a href = "/edit/${reminder.id}" class="card-link text-decoration-none">Редактировать</a>
                    <a href = "/delete/${reminder.id}" class="card-link text-decoration-none">Удалить</a>
                 </div>
            </div>
        <#else>
        <div class="m-2">
            <div class="card-body">
                <p class="card-text">Напоминаний нет!</p>
            </div>
        </div>
    </#list>
    </div>
    <script type="text/javascript">
        var divRed = $("div.card:contains('В ожидании')");
            divRed.addClass("bg-danger text-white");
        var aDivRed = divRed.find('a');
            aDivRed.addClass("text-white");

        var divYellow = $("div.card:contains('В процессе')");
            divYellow.addClass("text-dark bg-warning");
        var aDivYellow = divYellow.find('a');
            aDivYellow.addClass("text-dark");

        var divGreen = $("div.card:contains('Выполнено')");
            divGreen.addClass("text-white bg-success");
        var aDivGreen = divGreen.find('a');
            aDivGreen.addClass("text-white");
    </script>
</@c.page>