jQuery(document).ready ->
  $ = jQuery
  screenRes = $(window).width()
  screenHeight = $(window).height()
  
  $.lookForCheck
  
  # Turn customInputCheckBox
  if $('input#user_remember_me').is(':checked') 
     $('label.turnedable').addClass('checked') 
  else  
     $('label.turnedable').removeClass('checked checkedHover checkedFocus')  
  
  $('label.turnedable').click (event) ->
    event.preventDefault()
    chk = !$('input#user_remember_me').is(':checked')
    $('input#user_remember_me').click()
    $('label.turnedable').toggleClass('checked')
    return
   
  # Smooth Scroling of ID anchors

  filterPath = (string) ->
    string.replace(/^\//, '').replace(/(index|default).[a-zA-Z]{3,4}$/, '').replace /\/$/, ''

  # use the first element that is "scrollable"

  scrollableElement = (els) ->
    i = 0
    argLength = arguments.length
    while i < argLength
      el = arguments[i]
      $scrollElement = $(el)
      if $scrollElement.scrollTop() > 0
        return el
      else
        $scrollElement.scrollTop 1
        isScrollable = $scrollElement.scrollTop() > 0
        $scrollElement.scrollTop 0
        if isScrollable
          return el
      i++
    []

  switchSong = ->
    setTimeout (->
      i = 1
      while i <= $players_on_page
        $('.jp-audio' + i + ' .jp-previous, .jp-audio' + i + ' .jp-next').removeClass 'disabled'
        if $('.jp-audio' + i + ' .jp-playlist ul li:last-child').hasClass('jp-playlist-current')
          $('.jp-audio' + i + ' .jp-next').addClass 'disabled'
        if $('.jp-audio' + i + ' .jp-playlist ul li:first-child').hasClass('jp-playlist-current')
          $('.jp-audio' + i + ' .jp-previous').addClass 'disabled'
        $song_title = $('.jp-audio' + i + ' .jp-playlist ul li.jp-playlist-current .jp-playlist-item').html()
        $('.jp-audio' + i + ' .song_title').html $song_title
        i++
      return
    ), 0
    return

  imageSize = ->
    setTimeout (->
      i = 1
      while i <= carousels_on_page
        carouselWidth = $('.carousel-inner.id' + i + ' .item').width()
        carouselHeight = $('.carousel-inner.id' + i + ' .item').height()
        ratio = carouselWidth / carouselHeight
        images_in_carousel = $('.carousel-inner.id' + i + ' .item img').length
        j = 1
        while j <= images_in_carousel
          this_image = $('.carousel-inner.id' + i + ' .item img').eq(j - 1)
          imgWidth = this_image.naturalWidth()
          imgHeight = this_image.naturalHeight()
          imgRatio = imgWidth / imgHeight
          if ratio <= imgRatio
            imgMargin = parseInt((carouselHeight / imgHeight * imgWidth - carouselWidth) / 2, 10)
            this_image.css 'cssText', 'height: ' + carouselHeight + 'px; margin-left:-' + imgMargin + 'px;'
          else
            imgMargin = parseInt((carouselWidth / imgWidth * imgHeight - carouselHeight) / 2, 10)
            this_image.css 'cssText', 'width: ' + carouselWidth + 'px; margin-top:-' + imgMargin + 'px;'
          j++
        i++
      return
    ), 1000
    return

  $('[href=#]').click (event) ->
    event.preventDefault()
    return
  # Body Wrap
  $('.body_wrap').css 'min-height', screenHeight
  $(window).resize ->
    screenHeight = $(window).height()
    $('.body_wrap').css 'min-height', screenHeight
    return
  # Remove outline in IE
  $('a, input, textarea').attr('hideFocus', 'true').css 'outline', 'none'
  # Add gradient to IE
  setTimeout (->
    $('input, textarea, .select_styled, .body_wrap, .boxed-velvet .inner, .widget_categories li, .dropdown > li a, .tabs li a, .tab-pane, .comment-body .inner, .chzn-container, .carousel-title, .note').addClass 'gradient'
    return
  ), 0
  # First Child, Last Child
  $('.widget-container li:first-child, .pricing_box li:first-child, .dropdown li:first-child, ol li:first-child').addClass 'first'
  $('.widget-container li:last-child, .pricing_box li:last-child, .dropdown li:last-child, ol li:last-child').addClass 'last'
  # buttons
  $('.btn').not('.btn-round').hover (->
    $(this).stop().animate 'opacity': 0.8
    return
  ), ->
    $(this).stop().animate 'opacity': 1
    return
  $('a.btn, span.btn').on 'mousedown', ->
    $(this).addClass 'active'
    return
  $('a.btn, span.btn').on 'mouseup mouseout', ->
    $(this).removeClass 'active'
    return
  # style Select, Radio, Checkbox
  if $('select').hasClass('select_styled')
    cuSel
      changedEl: '.select_styled'
      visRows: 10
  if $('div,p').hasClass('input_styled')
    $('.input_styled input').customInput()
  # NavBar Parents Arrow
  $('.dropdown ul').parent('li').addClass 'parent'
  # NavBar
  $('.dropdown ul li:first-child, .cusel span:first-child').addClass 'first'
  $('.dropdown ul li:last-child, .cusel span:last-child').addClass 'last'
  # Tabs
  $tabs_on_page = $('.tabs').length
  $bookmarks = 0
  i = 1
  while i <= $tabs_on_page
    $('.tabs').eq(i - 1).addClass 'tab_id' + i
    $bookmarks = $('.tab_id' + i + ' li').length
    $('.tab_id' + i).addClass 'bookmarks' + $bookmarks
    i++
  $('.tabs li, .payment-form .btn').click ->
    setTimeout (->
      `var i`
      i = 1
      while i <= $tabs_on_page
        $bookmarks = $('.tab_id' + i + ' li').length
        j = 1
        while j <= $bookmarks
          $('.tab_id' + i).removeClass 'active_bookmark' + j
          if $('.tab_id' + i + ' li').eq(j - 1).hasClass('active')
            $('.tab_id' + i).addClass 'active_bookmark' + j
          j++
        i++
      return
    ), 0
    return
  # Payment Form
  $('.payment-form #billing .btn, .payment-form #payment .btn-left').click ->
    $('a[href="#shipping"]').tab 'show'
    return
  $('.payment-form #shipping .btn-left').click ->
    $('a[href="#billing"]').tab 'show'
    return
  $('.payment-form #shipping .btn-red').click ->
    $('a[href="#payment"]').tab 'show'
    return
  # Service List 2
  $('.service_list_2 .service_item').not(':even').addClass 'even'
  $('.service_list_2 .service_item').not(':odd').addClass 'odd'
  # prettyPhoto lightbox, check if <a> has atrr data-rel and hide for Mobiles
  if $('a').is('[data-rel]') and screenRes > 600
    $('a[data-rel]').each ->
      $(this).attr 'rel', $(this).data('rel')
      return
    $('a[rel^=\'prettyPhoto\']').prettyPhoto social_tools: false
  locationPath = filterPath(location.pathname)
  scrollElem = scrollableElement('html', 'body')
  $('a[href*=#].anchor').each ->
    `var i`
    $(this).click (event) ->
      thisPath = filterPath(@pathname) or locationPath
      if locationPath == thisPath and (location.hostname == @hostname or !@hostname) and @hash.replace(/#/, '')
        $target = $(@hash)
        target = @hash
        if target and $target.length != 0
          targetOffset = $target.offset().top
          event.preventDefault()
          $(scrollElem).animate { scrollTop: targetOffset }, 400, ->
            location.hash = target
            return
      return
    return
  # Audio Player
  $players_on_page = $('.jp-audio').length
  $song_title = ''
  if $players_on_page > 0
    i = 1
    while i <= $players_on_page
      $('.jp-audio').eq(i - 1).addClass 'jp-audio' + i
      i++
    setTimeout (->
      `var i`
      i = 1
      while i <= $players_on_page
        $song_title = $('.jp-audio' + i + ' .jp-playlist ul li.jp-playlist-current .jp-playlist-item').html()
        $('.jp-audio' + i + ' .song_title').html $song_title
        i++
      return
    ), 500
    $('.jp-previous, .jp-next, .jp-playlist ul').click ->
      switchSong()
      return
    $('.jp-jplayer').on $.jPlayer.event.ended, (event) ->
      switchSong()
      return
  # Placeholders
  setTimeout (->
    `var i`
    if $('[placeholder]').size() > 0
      $.Placeholder.init color: '#ededed'
    return
  ), 0
  # Scroll Bars
  $scrolls_on_page = $('.scrollbar.style2').length
  $scroll_height = 0
  i = 1
  while i <= $scrolls_on_page
    $('.scrollbar.style2').eq(i - 1).addClass 'id' + i
    i++
  setTimeout (->
    $('.jspTrack').append '<div class=\'jspProgress\'></div>'
    $(document).on 'jsp-scroll-y', '.scrollbar.style2', ->
      `var i`
      i = 1
      while i <= $scrolls_on_page
        $scroll_height = $('.scrollbar.style2.id' + i + ' .jspDrag').css('top')
        $('.scrollbar.style2.id' + i + ' .jspDrag').siblings('.jspProgress').css 'height': parseInt($scroll_height, 10) + 10 + 'px'
        i++
      return
    return
  ), 0
  # Rating Stars
  $('.rating span.star').hover (->
    $('.rating span.star').removeClass('on').addClass 'off'
    $(this).prevAll().addClass 'over'
    return
  ), ->
    $(this).removeClass 'over'
    return
  $('.rating').mouseleave ->
    $(this).parent().find('.over').removeClass 'over'
    return
  $('.rating span.star').click ->
    $(this).prevAll().removeClass('off').addClass 'on'
    $(this).removeClass('off').addClass 'on'
    return
  # Crop Images in Image Slider
  # adds .naturalWidth() and .naturalHeight() methods to jQuery for retrieving a normalized naturalWidth and naturalHeight.
  (($) ->
    `var i`
    props = [
      'Width'
      'Height'
    ]
    prop = undefined
    while prop = props.pop()
      ((natural, prop) ->
        $.fn[natural] = if natural of new Image then (->
          @[0][natural]
        ) else (->
          node = @[0]
          img = undefined
          value = undefined
          if node.tagName.toLowerCase() == 'img'
            img = new Image
            img.src = node.src
            value = img[prop]
          value
        )
        return
      ) 'natural' + prop, prop.toLowerCase()
    return
  ) jQuery
  carousels_on_page = $('.carousel-inner').length
  carouselWidth = undefined
  carouselHeight = undefined
  ratio = undefined
  imgWidth = undefined
  imgHeight = undefined
  imgRatio = undefined
  imgMargin = undefined
  this_image = undefined
  images_in_carousel = undefined
  i = 1
  while i <= carousels_on_page
    $('.carousel-inner').eq(i - 1).addClass 'id' + i
    i++
  imageSize()
  $(window).resize ->
    $('.carousel-indicators .first').click()
    imageSize()
    return
  return

# ---
# generated by js2coffee 2.1.0 by Aqueelone