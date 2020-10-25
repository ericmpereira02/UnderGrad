// CERN Global Javascript

var cern = { // CERN namespace

	lang : (window.location.href.match('home.cern/fr')) ? 'fr' : 'en',

	init : function () { $(function () {

		cern.proto = window.location.href.split('://')[0];

		// global initial functions
//		cern.fontload();

		// responsive images
		cern.respimgs();

		// public theme subnav toggle
		$('#header .region .block-menu-block h2').click(function (e) {

			cern.togglesubnav(this);
			cern.prevent(e);

		});

	}); }, // end cern.init()

	togglesubnav : function(t) {

		$(t).closest('.block-menu-block').addClass('open-subnav');

		$(t).unbind('click').click(function (e) {

			$(this).click(function (e) {

				cern.togglesubnav(this);
				cern.prevent(e);

			}).closest('.block-menu-block').removeClass('open-subnav');

			cern.prevent(e);

		});

	},

	tips : function () {

	},

	fontload : function () {

		var fonts;

		switch (cern.proto) {

			case 'https' :
//				fonts = "<link href='https://framework.web.cern.ch/framework/2.0/fonts/PTSansWeb/PTSansWeb.css' rel='stylesheet' type='text/css'>";
				fonts = "<link href='https://fonts.googleapis.com/css?family=PT+Sans:400,400italic,700' rel='stylesheet' type='text/css' />";
				break;

			default:
//				fonts = "<link href='http://fonts.googleapis.com/css?family=PT+Sans:400,400italic,700' rel='stylesheet' type='text/css' />";
				break;

		}

		$('head style, head link').first().before(fonts);

	},

	respimgs : function () {

		var width = window.innerWidth,
		sizes = [320, 640, 1024, 1440]; // list of possible sizes from cds

		$('[src$="-320.gif"]').each(function () {

			var i = 0,
				clone = $(this).clone(),
				src = $(this).attr('src'),
				newsrc,
				link = src.replace('/files/', '/id/');

				link = link.replace(/\-320\.[a-zA-Z]+$/, '');

			while ( width > sizes[i] ) {

				newsrc = src.replace('-320', '-' + sizes[i]);
				i++;

			}

			$(this).replaceWith(

				$('<div/>').addClass('img-wrap').append(

					$(clone).attr({ src: newsrc })

				).append(

					$('<a/>').addClass('img-link').attr({ href: link, title: 'View this image on CDS' }).html('Image info')

				)
			);

		});

	},

	prevent : function (e) {

		if (e.preventDefault) e.preventDefault();
		else event.returnValue = false;

	},

	close : function (t) {

		$(t).remove();

		/*$(t).animate({ opacity: 0 }, 300, function () {

			$(this).remove();

		});*/

	}

},

// gotta fix these variables... no globals
$ = jQuery;

cern.init();
;
// CERN Drupal Theme JS

(function ($) {
	$(document).ready(function()
	{

  	$('#navlinks').click(function (e) { dropnav('#navlinks', '#navdrop', e.target); });

    dropnav = function (a, d, t) {
    	$(a + '.on').removeClass('on');
    	if ($(t).siblings(d + ':hidden').length) {
    		$(d).hide();
    		$(t).addClass('on').siblings(d + ':hidden').show();
    		$(document).unbind('click').bind('click', function(e) {
    			
    		    if (!$(e.target).closest(a + ', ' + d).length) dropoff(a, d);
    		});
    	}
    	else dropoff(a, d);
    };
    
    dropoff = function (a, d, t) {
    	$(a + '.on').removeClass('on');
    	$(d).hide();
    	$('body').unbind('click');	
    	setTimeout(function () { 
    		$(a).unbind('click').click(function (e) { dropnav(a, d, e.target); }); 
    	}, 10);
    };
	
	})
})(jQuery)

;
