$(document).ready ->
  $(".carousel").carousel()
  $("a[href='submit']").live 'click', ->
    $(this).closest('form').submit()
    return false
  $('.datepicker').datepicker()
