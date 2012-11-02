$.fn.droppable = (opts) ->
  $this = this

  settings = $.extend true,
    threshold = 50
    onHover: (target) ->
    onBlur: (target) ->
    onDrop: (target) ->
  , opts

  hovering = false

  isHovering = (data) ->
    pos = $this.position()
    pos.left <= data.x <= (pos.left + threshold) and pos.top <= data.y <= (pos.top + threshold)

  $(window).on 'drag', (event, data) ->
    return if $this[0] == data.target

    if isHovering(data) and hovering == false
      hovering = true
      settings.onHover data.target

    if ! isHovering(data) and hovering == true
      hovering = false
      settings.onBlur data.target

  $(window).on 'drop', (event, data) ->
    return if $this[0] == data.target

    if isHovering(data)
      settings.onDrop data.target

  $this