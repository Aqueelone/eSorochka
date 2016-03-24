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
//= require Smooth-jQuery-Parallax
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
//= require tinymce-jquery
//= require turbolinks

jQuery(document).ready(function(callback) {
 	var $ = jQuery;
    var screenRes = $(window).width(),
        screenHeight = $(window).height(),
        html = $('html');
// wow
    new WOW().init();

    $('html').perfectScrollbar({
        wheelSpeed: 0.5,
        wheelPropagation: true,
        suppressScrollX: true,
        minScrollbarLength: 20,
        theme: 'sorochka'
    }).perfectScrollbar('update');

    $('.scroll a').on('click', function() {
        obj = $(this);
        target = $(obj).attr('href');
        if(target.indexOf('#') < 0) target = 'home';
        $.smoothScroll({
            offset: -50,
            scrollElement: $('html'),
            scrollTarget: $(target),
            easing: 'swing',
            speed: 1000,
            afterScroll: function() {
                $('html').perfectScrollbar('update');
                startEditor();
            }
        });
        return false;
    });

// IE<8 Warning
    if (html.hasClass("ie7")) {
        $("body").empty().html('Please, Update your Browser to at least IE8');
    }

// Disable Empty Links
    $("[href=#]").click(function(event){
        event.preventDefault();
    });

// Body Wrap
    $(window).resize(function() {
        screenHeight = $(window).height();
        $(".body").css("min-height", screenHeight, function(){
            //Contact form
            $('select#contact-name').chosen({ width: "100%" });
            jQuery('#commentForm .link-reset').click(function(){
                jQuery("select#contact-name").trigger("chosen:updated");
            });
        });
    });

// buttons
	$('a.btn, span.btn').on('mousedown', function(){
		$(this).addClass('active')
	});
	$('a.btn, span.btn').on('mouseup mouseout', function(){
		$(this).removeClass('active')
	});

// Menu
    $(".menu ul").parents("li").addClass("parent");

    $(".menu li").hover(function(){
        $(this).addClass('hover');
    },function(){
        $(this).removeClass('hover');
    });

// Tabs
    var $tabs_on_page = $('.tabs').length;
    var $bookmarks = 0;

    for(var i = 1; i <= $tabs_on_page; i++){
        $('.tabs').eq(i-1).addClass('tab-id'+i);
        $bookmarks = $('.tab-id'+i+' li').length;
        $('.tab-id'+i).addClass('bookmarks'+$bookmarks);
    };


    $('.tabs li, .payment-form .btn').click(function() {
        setTimeout(function () {
            for(var i = 1; i <= $tabs_on_page; i++){
                $bookmarks = $('.tab-id'+i+' li').length;
                for(var j = 1; j <= $bookmarks; j++){
                    $('.tab-id'+i).removeClass('active-bookmark'+j);

                    if($('.tab-id'+i+' li').eq(j-1).hasClass('active')){
                        $('.tab-id'+i).addClass('active-bookmark'+j);
                    }
                }
            }
        }, 0)
    });

// topnavbar activity
    $('.main-nav .navbar-nav a.scroll').click( function() {
        setActive($(this));
    });

// inveiw activity
    $('.inview-observer').bind('inview', function(event, isInView) {
        name = $(event.target).id();
        if (isInView) {
            alert('name');
            // element is now visible in the viewport
        } else {
            // element has gone out of viewport
        }
    });

// prettyPhoto lightbox, check if <a> has atrr data-rel and hide for Mobiles
    if($('a').is('[data-rel]') && screenRes > 600) {
        $('a[data-rel]').each(function() {
            $(this).attr('rel', $(this).data('rel'));
        });
        $("a[rel^='prettyPhoto']").prettyPhoto({social_tools:false});
    };

// Rating Stars
    var star = $(".rating span.star");

    star.hover(
        function() {
            $(this).addClass("over");
            $(this).prevAll().addClass("over");
        }
        , function() {
            $(this).removeClass("over");
            $(this).prevAll().removeClass("over");
        }
    );
    star.click( function() {
        $(this).parent().children(".star").removeClass("voted");
        $(this).prevAll().addClass("voted");
        $(this).addClass("voted");
    });

    startEditor();
    // binds ready event and turbolink page:load event
    $(window).on('load', callback);
    $(document).on('page:load',callback);


});

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