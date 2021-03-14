<#import "commonPage.ftlh" as c>
<@c.page title="Редактирование напоминания">
<div class="container my-3">
    <div class="form-group col-md-12">
        <form method="post">
            <label>Reminder's text : <input type="text" name="text" value = "${reminder.text}"/></label>
            <input type="hidden" value="${reminder.id}" name="reminderId">
            <label for="statuses">Choose a status:</label>
            <select name="status" id="statuses">
                <option value="PENDING">В ожидании</option>
                <option value="IN_PROGRESS">В процессе</option>
                <option value="DONE">Выполнено</option>
            </select>
            <input type="submit" value="Сохранить" class = "btn btn-primary ml-2"/>
        </form>
    </div>
</div>
</@c.page>
