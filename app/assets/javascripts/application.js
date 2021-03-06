// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require widget
//= require jquery.documentsize
//= require jquery.isinview
//= require wow
//= require jquery-mousewheel
//= require jquery-placeholder
//= require jquery-textchange
//= require vanilla-masker
//= require perfect-scrollbar
//= require jquery-smooth-scroll
//= require jquery.elastic
//= require autosize
//= require blueimp-gallery
//= require bootstrap-image-gallery.min
//= require canvas-to-blob.min
//= require load-image.all.min
//= require tmpl.min
//= require blueimp-file-upload
//= require jquery.jscroll
//= require gravtastic
//= require bootstrap-wysihtml5
//= require bootstrap-wysihtml5/wysihtml5x-toolbar.js
//= require bootstrap-wysihtml5/handlebars.runtime.min.js
//= require bootstrap-wysihtml5/locales/tr-TR
//= require bootstrap-wysihtml5/locales/ru-RU
//= require bootstrap-wysihtml5/locales/ua-UA
//= require jquery.minicolors
//= require jquery.minicolors.simple_form
//= require refile
//= require turbolinks
//= require_tree


jQuery(document).ready(function(callback) {
 	var $ = jQuery;
    var screenRes = $(window).width(),
        screenHeight = $(window).height(),
        html = $('html');
// wow
    new WOW().init();

    if($('#adminpanel').length > 0 || $('.top_box').length > 0) {
        $('#adminpanel').perfectScrollbar({
            wheelSpeed: 2,
            wheelPropagation: false,
            suppressScrollX: true,
            minScrollbarLength: 20,
            theme: 'sorochka'
        }).perfectScrollbar('update');
    } else {
    $('html').perfectScrollbar({
        wheelSpeed: 2,
        wheelPropagation: true,
        suppressScrollX: true,
        minScrollbarLength: 20,
        theme: 'sorochka'
    }).perfectScrollbar('update'); }
    renew_hash();
// IE<8 Warning
    if (html.hasClass("ie7")) {
        $("body").empty().html('Please, Update your Browser to at least IE8');
    }

// Disable Empty Links
    $("[href=#]").click(function(event){
        event.preventDefault();
    });

// Body Wrap
  /* $(window).resize(function() {
        screenHeight = $(window).height();
        $(".body").css("min-height", screenHeight, function(){
            //Contact form
            $('select#contact-name').chosen({ width: "100%" });
            jQuery('#commentForm .link-reset').click(function(){
                jQuery("select#contact-name").trigger("chosen:updated");
            });
        });
    }); */

// buttons
	$('a.btn, span.btn').on('mousedown', function(){
		$(this).addClass('active');
	});
	$('a.btn, span.btn').on('mouseup mouseout', function(){
		$(this).removeClass('active');
	});

// Menu
    $(".menu ul").parents("li").addClass("parent");

    $(".menu li").hover(function(){
        $(this).addClass('hover');
    },function(){
        $(this).removeClass('hover');
    });

// topnavbar activity
    $('.main-nav .navbar-nav a.scroll').click( function() {
        setActive($(this));
    });

//colorchooser
    $('#color_color_gid').minicolors( {theme: 'bootstrap' })

//gallery
    $('#gallery_color_id').on('change', function() {
        $.ajax({
            type: 'GET',
            dataType: 'json',
            url: '/colors/' + $(this).val() + '/gid?locale=' + locale,
            success: function(data) {
                $('.color_choose .color_square').css('background-color', data.gid);
            }
        });
    });
    $('#gallery_fabric_id').on('change', function() {
        $.ajax({
            type: 'GET',
            url: '/fabrics/' + $(this).val() + '/image?locale=' + locale,
            success: function(data) {
            $('.fabric_insert').html(data);
        }
    });
    });
    $('.select_gallery select').on('change', function() {
        $.ajax({
            type: 'GET',
            url: '/galleries/' + $(this).val() + '/gallery?locale=' + locale,
            success: function(data) {
                $('.gallery_insert_box').html(data);
            }
        });
    });
    $('.table-product-gallery-form .button').on('click', function() {
        if($('.select_gallery select').val() > 0) {
        $.ajax({
            type: 'POST',
            url: '/galleries/' + $('.select_gallery select').val() + '/product?locale=' + locale,
            data: "gallery[product_id]=" + $('#product_id').val() + "&gallery[id]=" + $('.select_gallery select').val()
        }); }
    });
    $('.btn-gallery-remove').on('click', function() {
            $.ajax({
                type: 'POST',
                url: '/galleries/' + $(this).parent().children('#gallery_id').val() + '/product?locale=' + locale,
                data: "gallery[product_id]=0&gallery[id]=" + $('.select_gallery select').val()
            });
    });
    $('.btn-picture-set').on('click', function() {
        number = $(this).parent().children('#image_id').val();
        $('input[name="product[picture_id]"]').attr('value', number);
        $('form').submit();
    });
    $('#product_code_product_id').on('change', function() {
        $.ajax({
            type: 'GET',
            url: '/product_codes/1/get_free_gallery?locale=' + locale,
            data: "product_code[product_id]=" + $('#product_code_product_id').val(),
            success: function(data) {
                $('.gallery_insert').html(data);
                $('.category_insert').append($('.category_name'));
                $('#product_code_gallery_id').on('change', function() {
                    $.ajax({
                        type: 'GET',
                        url: '/product_codes/1/set_gallery',
                        data: "product_code[gallery_id]=" + $('#product_code_gallery_id').val(),
                        success: function(data) {
                            $('.gallery').html(data);

                            $('.btn-image-set').on('click', function() {
                                number = $(this).parent().children('#image_id').val();
                                $('input[name="product_code[picture_id]"]').attr('value', number);
                                $('form').submit();
                            });
                        }
                    });
                });
            }
        });
    });
//  HomeFaces
    $('#catalog').waypoint(function() {
        catalog_choose();
        show_catalog();
    }, {
        offset: '300px'
    });
    $('#order').waypoint(function() {
        get_order();
    }, {
        offset: '200px'
    });

    choose_category();
    choose_view();
    catalog_choose();
    startEditor();

    locale = getLocale();
    $(window).on('load', callback);
    $(document).on('page:load',callback);


});

var keys = new Array();
var aspect = new Array();
var prod_pos = new Array();
var new_prod_position = new Array();
var cat_first = 'undefined';
var cat_last = 'undefined';
var should_count = true;
var could_click = true;
var turn_stop = 0;
var working = false;
var locale = 'uk';

var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
};
var getLocale = function getLocale() {
    return getUrlParameter('locale') === undefined ? $('body > #locale').val() : getUrlParameter('locale');
}
function choose_category(){
    $('#category_category_id').on('change', function(event){
        event.stopPropagation();
        event.preventDefault();
        $.ajax({
            type: 'GET',
            url: '/categories/'+ $(event.currentTarget).val() +'/session_update&locale=' + getLocale(),
            cache: false
        }).done(function(data){$(event.currentTarget).parent().append(data).show(500)});
    });
}
function choose_view(){
    $('.nav-view a').on('click', function(event){
        event.stopPropagation();
        event.preventDefault();
        $.ajax({
            type: 'GET',
            url: '/products/1/show_mode.js?product[view]='+$(event.currentTarget).attr('data-view') + '&locale=' + getLocale()});
    });
}
function catalog_choose(){
    $('#navpanel0 .catalog-toggle').on('click', function(event){
        id = $(event.currentTarget).attr('id').replace('catalog-', '');
        $('#navpanel0 li').removeClass('active');
        $(event.currentTarget).parent('li').addClass('active');
        event.stopPropagation();
        event.preventDefault();
        $('#catalog').hide(500, function(){
            $('#catalog').html('');
            $.ajax({
                type: 'GET',
                url: '/categories/'+ id +'/session_update?locale=' + getLocale(),
                cache: false
            }).done(function(data){
                show_catalog();
                $('#catalog').show(1500);
            });
        });
    })
}
function renew_hash(){
    $('.scroll a').on('click', function() {
        obj = $(this);
        target = $(obj).attr('href');
        if(target.indexOf('#') < 0) target = 'home';
        $.smoothScroll({
            offset: -200,
            scrollElement: $('html'),
            scrollTarget: $(target),
            easing: 'swing',
            speed: 100,
            afterScroll: function() {
                $('html').perfectScrollbar('update');
                startEditor();
            }
        });
        return false;
    });
}
function startEditor(){
      $('.wysihtml5').each( function(){
          if($(this).parent('.form-group').children('.wysihtml5-toolbar').length == 0) {
            $(this).wysihtml5({'toolbar': {
                'font-styles': false,
                'color': false,
                'emphasis': {
                    'small': true
                },
                'blockquote': true,
                'lists': false,
                'html': false,
                'link': false,
                'image': false,
                'smallmodals': false
            }, "events": {
                focus: function (){
                    $('.wysihtml5-toolbar').addClass('focused');
                },
                blur: function(){
                    $('.wysihtml5-toolbar').removeClass('focused');
                }
            }
            });
          }
      });
}

function setActive(obj) {
    $('.main-nav li.active').removeClass('active');
    $(obj).parent('li').addClass('active');
}

function isValidEmailAddress(emailAddress) {
    var pattern = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;
    return pattern.test(emailAddress);
};

function isValidCell(tel) {
    var pattern = /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/;
    return pattern.test(tel);
}

function show_catalog(){
    width = $(window).width();
    height = $(window).height();
    if($('.prodall').length == 0) {
        $.ajax({
            type: 'GET',
            url: '/products/1/get_catalog?locale=' + getLocale(),
            data: "width=" + width,
            success: function(data) {
                $('#catalog').html(data);
                keys = [];
                aspect = [];
                prod_pos = [];
                new_prod_position = [];
                if(should_count) {
                    get_catalog();
                    $('.nav-cat a').on( 'click', function(event){catalog_click(event);});
                    $('body').on( 'keydown', function(event){catalog_click(event);});
                }
                $('#catalog a.btn-product').on('click', function(event){
                    event.stopPropagation();
                    event.preventDefault();
                    go_product($(event.currentTarget));
                });
                $("body").keydown(function(event) {
                    event.stopPropagation();
                    could_click == true;
                    if(event.keyCode == 13 && turn_stop == 0) { go_product($("div[data-aspect = '0']")); }
                });
                choose_view();
                get_deffered();
            }
        });
    }
}
function go_product(el){
    show_product($(el).attr('data-id').replace('prod_cel',''));
    renew_hash();
    $('html, body').animate({
        scrollTop: $("#product").offset().top + 50
    }, 300);
    $('#order').waypoint(function() {
        get_order();
    }, {
        offset: '200px'
    });
    could_click == true;
    if(should_count) {
        get_catalog();
        $('.nav-cat a').on( 'click', function(event){catalog_click(event);});
        $('body').on( 'keydown', function(event){catalog_click(event);});
    }
}
function catalog_click(event){
    if(working == true) return;
    obj = $(event.currentTarget);
    value = 0;
    $(obj).on('dblclick', function(event2){
        event2.stopPropagation();
        event2.preventDefault();
    });
    if(obj.hasClass('btn-cat-nav-left') || event.keyCode == 37) value = 1;
    if(obj.hasClass('btn-cat-nav-right') || event.keyCode == 39) value = -1;
    event.stopPropagation();
    event.preventDefault();
    if(could_click == true && working == false) {
        spin_catalog(value);
        $(obj).animate(
        {'border-right-width': '78px'},
        {"queue": false, "duration": 50,
            complete: function(){
                $(obj).animate({'border-right-width': '80px'},150);
            }});}
};
function get_catalog(){
    var len = $('#catalog > div.prod_cel').length;
    $('#catalog > div.prod_cel').each(function(ind, el){
        get_product($(el));
    });
}
function get_product(ob){
    should_count - false;
    if(!$(ob).hasClass('counted')) {
        $(ob).addClass('counted');
        data_aspect = $(ob).attr('data-aspect')/1;
        if (cat_last == 'undefined' || data_aspect > cat_last) cat_last = data_aspect;
        if (cat_first == 'undefined' || data_aspect < cat_first) cat_first = data_aspect;
        keys.push(data_aspect);
        aspect.push($(ob).attr('style'));
        prod_pos.push($(ob).attr('data-id'));
    }
}
function spin_catalog(count) {
    could_click = false;
    new_prod_position = [];
    turn_stop = keys.length*Math.abs(count);
    while (count != 0) {
        if (count > 0) {
            if(!working) catalog_turn_left();
            count--;
        } else {
            if(!working) catalog_turn_right();
            count++;
        }
    }
    return true;
}
function catalog_turn_left(){
    working = true;
    max = keys.length;
    for (var i = 0; i < max; i++){
        if(i==1) new_prod_position.push(prod_pos[i-1]);
        else if(i==(max - 2*(max-1)%2 -1)) new_prod_position.push(prod_pos[max - (max%2) - 1]);
        else new_prod_position.push(prod_pos[i - 4*(i%2) + 2]);
    }
    prod_pos = new_prod_position;
    synchro_catalog();
    return true;
}
function catalog_turn_right(){
    working = true;
    max = keys.length;
    for (var i = 0; i < max; i++){
        if(i==0) new_prod_position.push(prod_pos[i+1]);
        else if(i==(max + (max-1)%2 -2)) new_prod_position.push(prod_pos[max - 2*(max%2) + 1]);
        else new_prod_position.push(prod_pos[i + 4*(i%2) - 2]);
    }
    prod_pos = new_prod_position;
    synchro_catalog();
    return true;
}
function synchro_catalog(){
    for (var i = 0; i < keys.length; i++){
        obj = "." + prod_pos[i];
        style = aspect[i];
        $(obj).attr('data-aspect', keys[i]);
        if(keys[i] == 0) { $(obj).focus();  }
        aspect_catalog(obj, style);
    }
    working = false;
    return true;
}
function aspect_catalog(obj, style){
        styleA = style.split('; ')
        pointXN = styleA[0].split(': ');
        pointXNR = pointXN[1].replace('px', '');
        pointXO = $(obj).css('left').replace('px', '');
        pointXDelta = pointXNR/1 - pointXO/1;
        if(pointXNR > pointXO) pointX = '+=' + (pointXNR/1 - pointXO/1);
        else  pointX = '-=' + (pointXO/1 - pointXNR/1);
        pointY = styleA[1].split(': ');
        pointZ = styleA[2].split(': ');
        $(obj).animate({'left': pointX, 'top': pointY[1], 'z-index': pointZ[1]},
                {"queue": true, "duration": 500,
                    complete: function() {
                        $(obj).attr('style', style);
                        turn_stop--;
                        if(turn_stop == 0) {
                            could_click = true;
                            return true;
                        }
                    }
                });
}

function show_product(id){
    prod = id.replace('#prod', '');
    url = '/products/' + prod;
    if($('.top_box').length == 0) $.ajax({
        type: 'GET',
        url: url + '/show_product?locale=' + getLocale(),
        beforeSend: function() { get_order(); }
    }).done( function(data){
        $('#product').html(data);
        get_gallery();
        ob = $('#product-image');
        zoom_action(ob);
        add_action($('.product-add'));
        renew_hash();
        get_deffered();
        $('#product .scroll').on('click', function(event) {
                event.stopPropagation();
                event.preventDefault();
                targ = $(event.currentTarget).attr('href').replace('/', '#');
                $('html, body').animate({
                    scrollTop: $(targ).offset().top
                }, 1000);
            });
    });
    else window.location.replace(url+ '/?locale=' + getLocale());
}
function zoom_action(ob){
    $(ob).on('mousemove', function(event){
        $('.cat-image-action-zone', ob).show();
        $('.cat-image-action-zoom', ob).show();
        if($(".top_box").length == 0) {
            $('.cat-image-action-zone', ob).css('left', get_zoomX(event));
            $('.cat-image-action-zone', ob).css('top', get_zoomY(event));
            $('.cat-image-action-zoom', ob).css('background-position', function(){
                return (-get_zoomX(event)*5).toString() + "px " + (-get_zoomY(event)*5).toString() + "px";
            });
        } else {
        $('.cat-image-action-zone', ob).css('left', get_zoomX(event));
        $('.cat-image-action-zone', ob).css('top', get_zoomY(event));
        $('.cat-image-action-zoom', ob).css('background-position', function(){
            return (-get_zoomX(event)*5).toString() + "px " + (-get_zoomY(event)*5).toString() + "px";
        });
        }
    });
    $(ob).on('mouseleave', function(){
        $('.cat-image-action-zone', ob).attr('style', 'top: 0px; left: 0px;').hide();
        $('.cat-image-action-zoom', ob).hide();
    });
}
function get_zoomX(event){
    x = event.pageX -90;
    if(x < 0) x = 0;
    if(x > 200) x = 200;
    return x;
}
function get_zoomY(event){
    y = event.pageY - $(event.currentTarget).offset().top - 55;
    if(y < 0) y = 0;
    if(y > 300) y = 300;
    return y;
}
function get2_zoomX(event){
    x = event.pageX -90;
    if(x < 0) x = 0;
    if(x > 200) x = 200;
    return x;
}
function get2_zoomY(event){
    y = event.pageY - 560;
    if(y < 0) y = 0;
    if(y > 300) y = 300;
    return y;
}
function get_gallery(){
    $('.product-gallery-image-action').on('click', function(event){
        ob =$(this);
        event.stopPropagation();
        event.preventDefault();
        $('.table-product-gallery-form a').removeClass('active');
        $(ob).addClass('active');
        $('#product-image img').attr('src', function(){ return $('img', ob).attr('src'); });
        $('#product-image .cat-image-action-zoom').css('background-image', function(){ return 'url(' + $(ob).parent().children('input').val() + ')'; });
        zoom_action($('#product-image'));
    });
    $('.gallery_color_chooser').on('click', function(event){
        ob =$(this);
        event.stopPropagation();
        event.preventDefault();
        $('.table-product-gallery-form a').removeClass('active');
        id = $(ob).attr('id').replace('color-', '');
        link = '.product-gallery-image-action.pgia-'+id;
        $(link).addClass('active').click();
    });
    nav_action($('.table-product-gallery-control a'));
}
function nav_action(ob){
    if($(ob).hasClass('left')) direction = 'left';
    left = $(ob).parent().children('a').first();
    $(ob).on('click', function(event){
        event.stopPropagation();
        event.preventDefault();
        next = false;
        $('.product-gallery-image-action').each(function(index, object){
            if($(this).hasClass('active')){
                $('.table-product-gallery-form a').removeClass('active');
                if(direction = 'left') {
                    if(index == 0) { $('.product-gallery-image-action:last').addClass('active').click(); return false;}
                    else { $(left).addClass('active').click(); return false; }
                } else next = true;
            } else {
                if(next == true) { $(this).addClass('active').click(); return false; }
            }
            left = $(this);
        });
    });
}
function add_action(obj){
    $(obj).on('click', function(event){
        event.stopPropagation();
        event.preventDefault();
        id = $(event.currentTarget).attr("id").replace("product-", "");
        order_id = $(event.currentTarget).parent('td').children('#order_id').val();
        $.ajax({
            type: 'GET',
            url: '/order_items/1/create_box',
            data: 'order_item[product_code_id]=' + id
                + '&order_item[amount]='+ $('#'+id).val()
                + '&order_item[order_id]='+ order_id + '&locale=' + getLocale()
        }).done(function(data) {
            $('.value-'+id).append(data);
            $('.value-'+id + ' .prod-add-sign').show();
        });
    });
}
function get_deffered(){
    $.ajax({
        type: 'GET',
        url: '/products/1/get_deffered?locale=' + getLocale(),
        cache: false
    }).done(function(data){
        $('.deffered-nav').html(data);
        remove_deffered();
        deffered_view();
        deffered_shift();
        if($('.top_box').length == 0) {
            $('.deffered-nav a.btn-product').on('click', function(event){
                event.stopPropagation();
                event.preventDefault();
                go_product($(event.currentTarget));
             });
            if($('#product .product_cart').length == 0) go_product($('.deffered-nav a.btn-product:last'));
        }
    });
}
function deffered_view(){
    width = $(window).width();
    count = width / 150 - $('.deffered-nav .prod_cel_deffered').length - 1;
    $('.deffered-nav .prod_cel_deffered').each(function(){
        if(count < 0) {
            $(this).hide();
            count++;
        }
    });
}
function deffered_shift(){
    $('.btn-nav-deff-left').on('click', function(event){
        event.stopPropagation();
        event.preventDefault();
        $.ajax({
            type: 'GET',
            url: '/products/1/get_deffered?product[shift]=left&locale=' + getLocale(),
            cache: false
        }).done(function(){ get_deffered();});
    });
    $('.btn-nav-deff-right').on('click', function(event){
        event.stopPropagation();
        event.preventDefault();
        $.ajax({
            type: 'GET',
            url: '/products/1/get_deffered?product[shift]=right&locale=' + getLocale(),
            cache: false
        }).done(function(){ get_deffered();});
    });
}
function remove_deffered(){
    $('.deffered-nav td.close a').on('click', function(event){
        event.stopPropagation();
        event.preventDefault();
        $.ajax({
            type: 'GET',
            url: '/products/1/remove_deffered?locale=' + getLocale(),
            data: 'product[deffered]=' + $(event.currentTarget).attr('data-id')
        }).done(function(data){
            $('.deffered-nav').html(data);
            remove_deffered();
            deffered_view();
            if($('.top_box').length == 0) $('.deffered-nav a.btn-product').on('click', function(event){
                event.stopPropagation();
                event.preventDefault();
                go_product($(event.currentTarget));
            });
        });
    });
}
function get_order(){
    $.ajax({
        type: 'GET',
        url: '/orders/1/newbox?locale=' + getLocale(),
        cache: false
    }).done(function(data) {
        $('#order').html(data);
        show_order_tab();
        get_order_info();
        toggle_history();
        $('#your_order .order-item-amount').on('change', function(event){
            item_amount($(this).parent(), event);
        });
        $('#your_order .btn-add-item').on('click', function(event){
            papa = $(this).parent().parent();
            item_amount($('form', papa), event);
        });
        $('#your_order .btn-item-remove').on('click', function(event){
            event.stopPropagation();
            event.preventDefault();
            $(this).parent().parent().submit();
            get_order();
        });
        $('#your_order .btn-order-approve').on('click', function(event){
            event.stopPropagation();
            event.preventDefault();
            $('#order .nav-tabs li').removeClass('active');
            $('#order .nav-tabs li:last').addClass('active');
            get_approve();
        });
    });
}
function show_order_tab(){
    $('#order .nav-tabs li.active a').tab('show');

    $('#order .nav-tabs a').click(function(event){
        event.stopPropagation();
        event.preventDefault();
        $(this).tab('show');
        form = $('#your_order > form');
        id = form.attr('id').replace('edit_order_', '');
        if($(this).attr('href') == '#your_order') get_last(id);
        if($(this).attr('href') == '#history') get_history(id);
    })
}
function get_order_info(){
    $('#your_order .order_field').on('change', function(event){
        obj = $(this);
        papa = obj.parent('td').parent('tr');
        form = $('#your_order > form');
        id = form.attr('id').replace('edit_order_', '');
        if(((obj.hasClass('email') && !isValidEmailAddress(obj.val()))) ||
            (obj.hasClass('cell') && !isValidCell(obj.val())))
            $('.ok_insert', papa)
                .html('<i class="glyphicon glyphicon-remove prod-add-sign prod-add-sign-red"></i>')
                .children().show(1500, function(){
                $(this).hide(1500);
            });
        else {
            $.ajax({
                type: 'PATCH',
                url: '/orders/'+id+'/add_attr?locale=' + getLocale(),
                cache: false,
                data: form.serialize()
            }).done(function(data){
                $('.ok_insert', papa).html(data)
                    .children().show(1500, function(){
                    $(this).hide(1500, function(){get_last(id); get_order();});
                });
            });
        }
    });
}
function item_amount(form, event){
    id = form.attr('id').replace('edit_order_item_', '');
    $.ajax({
        type: $('input[name="_method"]', form).val(),
        url: '/order_items/'+id+'/add_order_box?locale=' + getLocale(),
        cache: false,
        data: form.serialize() // serializes the form's elements.
        }).done(function(data){
        get_order();
    });
}
function get_approve(){
    id = $('#your_order form:first').attr('id').replace('edit_order_', '');
    $.ajax({
        type: 'GET',
        url: '/orders/'+id+'/approve',
        cache: false,
        data: "order[closed]=true&order[order_status_id]=2&locale=" + getLocale()
    }).done(function(data){
        if($('.modal').length == 0) {
            $("body").prepend(data);
        }
        $("#approve_modal").modal();
        $('#order .nav0-tabs a:last').tab('show');
        $('#order .tab-content #your_order')
            .removeClass('active in').queue(function(){
            $('#order .tab-content #history').addClass('active in');
            get_history(id);
        });
    });
}
function get_last(id){
    $.ajax({
        type: 'GET',
        url: '/orders/'+ id + '/last/?locale=' + getLocale()
    }).done(function(data){
        $('#order').html(data);
        show_order_tab();
    });
}
function get_history(id){
    $.ajax({
        type: 'GET',
        url: '/orders/'+ id + '/history/?locale=' + getLocale()
    }).done(function(data){
        $('#history').html(data);
        show_order_tab();
        toggle_history();
    });
}
function toggle_history(){
    $('.table-order-history-box .btn-toggle').on('click', function(event){
        event.stopPropagation();
        event.preventDefault();
        id = $(event.currentTarget).attr('id').replace('toggle-plus-', '').replace('toggle-minus-', '');
        $('#toggle-plus-'+id).toggleClass('btn-hide');
        $('#toggle-minus-'+id).toggleClass('btn-hide');
        $('#history table.toggle-'+id).toggleClass('table-hide');
    });
    $('.table-order-history-box .btn-toggle-all').on('click', function(event){
        event.stopPropagation();
        event.preventDefault();
        $('#toggle-plus').toggleClass('btn-hide');
        $('#toggle-minus').toggleClass('btn-hide');
        $('#history table.table-order-history-item').toggleClass('table-hide');
    });
    $('.table-order-history-box .btn-sort').on('click', function(event){
        event.stopPropagation();
        event.preventDefault();
        $.ajax({
            type: 'GET',
            url: $(event.currentTarget).attr('href')
        }).done(function(data){
            $('#history').html(data);
            show_order_tab();
            toggle_history();
        });
    });
}