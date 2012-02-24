$(document).ready ->
  $("a[href='submit']").live 'click', ->
    $(this).closest('form').submit()
    return false
