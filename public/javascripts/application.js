// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
// check box for check and uncheck all
// dom id for table remember apply this id to all tables when they have check boxes
$(document).ready(function() {
    $("#main_table :checkbox").change(function() {
        var chkAll = this;
        if (chkAll.id == "checkall") {
            $("#main_table :checkbox").filter("[id^='data_']").each(function() {
                this.checked = chkAll.checked;
            });
        } else {
            $("#checkall")[0].checked = false;
        }
    });
});
