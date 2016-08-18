$ ->
  $("#add_file").on "ajax:success", (event, data) ->
    $("#attachments").append data
    $(this).data "params", { index: $("#attachments div.file").length } 