$(document).on 'page:change page:load', ->
  $(".collapse").on 'hide.bs.collapse', ->
    $(@).parent().find("span.notification-header").addClass("collapsed")
  $(".collapse").on 'show.bs.collapse', ->
    $(@).parent().find("span.notification-header").removeClass("collapsed")

  $('#variables_filter').keyup ->
    rex = new RegExp($(@).val(), 'i')
    $('.variables_searchable tr.searchable_data').hide()
    $(".variables_searchable tr.searchable_data").filter(->
      rex.test $(@).text()
    ).show()

  $.fn.editable.defaults.mode = 'inline'
  $(".editable").editable type: 'text'
  $(".variable-editable").editable ajaxOptions:
    type: "put"


  $("a.fancybox").on 'click', ->
    $("#diagramContainer").load @.dataset.url
    $.fancybox
      content: $("#diagramContainer")
      type: 'ajax'
      scrolling: 'auto'
      margin: [70, 60, 20, 60]
      autoResize: true

  url = document.location.toString()
  if url.match('#')
    panelBody = $('#collapse_' + url.split('#')[1])
    panelBody.addClass 'in'
    panelBody.parent().find("span.notification-header").removeClass("collapsed")
  return