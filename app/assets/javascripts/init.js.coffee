jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
  $('pre').each (i, e)->
    hljs.highlightBlock(e)
  $(".collapse").collapse()
