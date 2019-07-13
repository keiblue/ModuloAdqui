// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require popper
//= require bootstrap
//= require_tree .

$(document).on('turbolinks:load',function() {

    $('#click tbody tr').click(function() {
        var href = $(this).attr("data-href");
        if(href) {
            window.location = href;
            stopPropagation();
        }  
    });
});

// Validar rut 

;(function($){
	var defaults = {
		validateOn: 'blur',
		formatOn: 'blur',
		ignoreControlKeys: true,
		useThousandsSeparator: true,
		minimumLength: 2
	};

	//private methods
	function clearFormat(value) {
		return value.replace(/[\.\-]/g, "");
	}

	function format(value, useThousandsSeparator) {
		var rutAndDv = splitRutAndDv(value);
		var cRut = rutAndDv[0]; var cDv = rutAndDv[1];
		if(!(cRut && cDv)) { return cRut || value; }
		var rutF = "";
		var thousandsSeparator = useThousandsSeparator ? "." : "";
		while(cRut.length > 3) {
			rutF = thousandsSeparator + cRut.substr(cRut.length - 3) + rutF;
			cRut = cRut.substring(0, cRut.length - 3);
		}
		return cRut + rutF + "-" + cDv;
	}

	function isControlKey(e) {
		return e.type && e.type.match(/^key(up|down|press)/) &&
			(
				e.keyCode ===  8 || // del
				e.keyCode === 16 || // shift
				e.keyCode === 17 || // ctrl
				e.keyCode === 18 || // alt
				e.keyCode === 20 || // caps lock
				e.keyCode === 27 || // esc
				e.keyCode === 37 || // arrow
				e.keyCode === 38 || // arrow
				e.keyCode === 39 || // arrow
				e.keyCode === 40 || // arrow
				e.keyCode === 91    // command
			);
	}

	function isValidRut(rut, options) {
		if(typeof(rut) !== 'string') { return false; }
		var cRut = clearFormat(rut);
		// validar por largo mínimo, sin guiones ni puntos:
		// x.xxx.xxx-x
		if ( typeof options.minimumLength === 'boolean' ) {
			if ( options.minimumLength && cRut.length < defaults.minimumLength ) {
				return false;
			}
		} else {
			var minLength = parseInt( options.minimumLength, 10 );
			if ( cRut.length < minLength ) {
				return false;
			}
		}
		var cDv = cRut.charAt(cRut.length - 1).toUpperCase();
		var nRut = parseInt(cRut.substr(0, cRut.length - 1));
		if(isNaN(nRut)){ return false; }
		return computeDv(nRut).toString().toUpperCase() === cDv;
	}

	function computeDv(rut) {
		var suma	= 0;
		var mul		= 2;
		if(typeof(rut) !== 'number') { return; }
		rut = rut.toString();
		for(var i=rut.length -1;i >= 0;i--) {
			suma = suma + rut.charAt(i) * mul;
			mul = ( mul + 1 ) % 8 || 2;
		}
		switch(suma % 11) {
			case 1	: return 'k';
			case 0	: return 0;
			default	: return 11 - (suma % 11);
		}
	}

	function formatInput($input, useThousandsSeparator) {
		$input.val(format($input.val(), useThousandsSeparator));
	}

	function validateInput($input) {
		if(isValidRut($input.val(), $input.opts)) {
			$input.trigger('rutValido', splitRutAndDv($input.val()));
		} else {
			$input.trigger('rutInvalido');
		}
	}

	function splitRutAndDv(rut) {
		var cValue = clearFormat(rut);
		if(cValue.length === 0) { return [null, null]; }
		if(cValue.length === 1) { return [cValue, null]; }
		var cDv = cValue.charAt(cValue.length - 1);
		var cRut = cValue.substring(0, cValue.length - 1);
		return [cRut, cDv];
	}

	// public methods
	var methods = {
		init: function(options) {
			if (this.length > 1) {
				/* Valida multiples objetos a la vez */
				for (var i = 0; i < this.length; i++) {
					console.log(this[i]);
					$(this[i]).rut(options);
				}
			} else {
				var that = this;
				that.opts = $.extend({}, defaults, options);
				that.opts.formatOn && that.on(that.opts.formatOn, function(e) {
					if(that.opts.ignoreControlKeys && isControlKey(e)) { return; }
					formatInput(that, that.opts.useThousandsSeparator);
				});
				that.opts.validateOn && that.on(that.opts.validateOn, function() {
					validateInput(that);
				});
			}
			return this;
		}
	};

	$.fn.rut = function(methodOrOptions) {
		if(methods[methodOrOptions]) {
			return methods[methodOrOptions].apply(this, Array.prototype.slice.call( arguments, 1 ));
		} else if ( typeof methodOrOptions === 'object' || ! methodOrOptions ) {
			return methods.init.apply( this, arguments );
		} else {
			$.error("El método " + methodOrOptions + " no existe en jQuery.rut");
		}
	};

	$.formatRut = function (rut, useThousandsSeparator) {
		if(useThousandsSeparator===undefined) { useThousandsSeparator = true; }
		return format(rut, useThousandsSeparator);
	};

	$.computeDv = function(rut){
		var cleanRut = clearFormat(rut);
		return computeDv( parseInt(cleanRut, 10) );
	};

	$.validateRut = function(rut, fn, options) {
		options = options || {};
		if(isValidRut(rut, options)) {
			var rd = splitRutAndDv(rut);
			$.isFunction(fn) && fn(rd[0], rd[1]);
			return true;
		} else {
			return false;
		}
    };
    
    $.formatRutV2 = function(rut, formatrut){
		//var dv = $.computeDv(rut);
		//var newrut = (rut.toString())+dv;
		var result = $.validateRut(rut, null, { minimumLength: 8 });
		switch(formatrut){
			case true:
				if(result){
					return $.formatRut(newrut);
				}else{
					return rut;
				}
			default: return result;
		}
	}

	$.clearFormat = function(rut){
		return clearFormat(rut);
	}
})(jQuery);


function validateRut(enviar)
{
    rut = document.getElementById('user_rutito').value;
    verificador = document.getElementById('user_rutito_dv').value;
    if ( rut != '' && verificador != '' )
    {
        $("#submitbutton").removeAttr("disabled");
        rut = (rut.toString()) + verificador;
        resultado = $.formatRutV2(rut, false);
        if ( resultado ){
            if (enviar) document.getElementById("form").submit();
        }else{
            alert('El Rut ingresado es incorrecto');
        }
    }else{
        alert('El Rut ingresado es incorrecto');
    }
}


/** filter items for provider */
function filter_items()
{
	provider = $('#order_provider_id').val();
	$.post('/provider/'+provider+'/items/', function(data, status){
		if(status){
			items = data;
			$('#table > tbody').empty();
			tabla = document.getElementById("body_table");
			items.forEach(function(item, index){
				$('#table > tbody:last-child').append('<tr><td><input type="checkbox" name="items[][id]" id="items__id" value="'+item.id+'"></td><td>'+item.nombre+'</td><td>'+item.precio+'</td><td><input type="number" name="items[][cant]" id="items__cant"></td></tr>');
			});
		}
	});
}