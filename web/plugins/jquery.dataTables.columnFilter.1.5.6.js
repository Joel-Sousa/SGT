$.extend($.fn.dataTable.defaults, {
	"bSort": true
});

$.extend($.fn.dataTableExt.oSort, {
	"date-uk-pre": function (a) {
		var x;
		try {
			var dateA = a.replace(/ /g, '').split("/");
			var day = parseInt(dateA[0], 10);
			var month = parseInt(dateA[1], 10);
			var year = parseInt(dateA[2], 10);
			var date = new Date(year, month - 1, day)
			x = date.getTime();
		}
		catch (err) {
			x = new Date().getTime();
		}		
		return x;
	},
	"date-uk-asc": function (a, b) {
		return a - b;
	},
	"date-uk-desc": function (a, b) {
		return b - a;
	}
});
		
jQuery.fn.dataTableExt.oSort['slo-asc'] = function(a,b) {
	var x = (a == "-") ? 0 : a.replace( /\./g, "" ).replace( /,/, "." );
	var y = (b == "-") ? 0 : b.replace( /\./g, "" ).replace( /,/, "." );
	x = parseFloat( x );
	y = parseFloat( y );
	return ((x < y) ? -1 : ((x > y) ? 1 : 0));
};
				
jQuery.fn.dataTableExt.oSort['slo-desc'] = function(a,b) {
	var x = (a == "-") ? 0 : a.replace( /\./g, "" ).replace( /,/, "." );
	var y = (b == "-") ? 0 : b.replace( /\./g, "" ).replace( /,/, "." );
	x = parseFloat( x );
	y = parseFloat( y );
	return ((x < y) ? 1 : ((x > y) ? -1 : 0));
};


$.extend( $.fn.dataTableExt.oSort, {
	"image-pre": function ( a ) {
		return a.match(/title="([^"]*)"/)
	},
	"image-asc": function ( a, b ) {
		return ((a < b) ? -1 : ((a > b) ? 1 : 0));
	},
	"image-desc": function ( a, b ) {
		return ((a > b) ? -1 : ((a < b) ? 1 : 0));
	}
});

/**
 * Just like the _hidden title numeric sorting_ plug-in, this sorting plug-in
 * will take the information to be sorted on from the title attribute of a span
 * element. The only difference is that it is string based sorting rather than
 * numeric.
 *
 * Note that the HTML5 `data-sort` attribute can be [used to supply sorting data
 * to DataTables](//datatables.net/manual/orthogonal-data) and is preferable to
 * using this method, which is therefore marked as deprecated.
 * 
 *  @name Hidden title string sorting
 *  @summary Sort data as a string based on an attribute on an empty element.
 *  @author [Allan Jardine](http://sprymedia.co.uk)
 *  @deprecated
 *
 *  @example
 *    $('#example').dataTable( {
 *       columnDefs: [
 *         { type: 'title-string', targets: 0 }
 *       ]
 *    } );
 */

jQuery.extend( jQuery.fn.dataTableExt.oSort, {
	"title-string-pre": function ( a ) {
		return a.match(/title="(.*?)"/)[1].toLowerCase();
	},

	"title-string-asc": function ( a, b ) {
		return ((a < b) ? -1 : ((a > b) ? 1 : 0));
	},

	"title-string-desc": function ( a, b ) {
		return ((a < b) ? 1 : ((a > b) ? -1 : 0));
	}
} );

/** 
$.extend( $.fn.dataTableExt.oSort, {
	"title-string-pre": function ( a ) {
		return a.match(/title="(.*?)"/)[1].toLowerCase();
	},
	"title-string-asc": function ( a, b ) {
		return ((a < b) ? -1 : ((a > b) ? 1 : 0));
	},
	"title-string-desc": function ( a, b ) {
		return ((a < b) ? 1 : ((a > b) ? -1 : 0));
	}
});
*/

jQuery.extend(jQuery.fn.dataTableExt.oSort, {
	"date-euro-pre": function ( a ) {
		if ($.trim(a) != '') {
			var frDatea = $.trim(a).split(' ');
			var frTimea = frDatea[1].split(':');
			var frDatea2 = frDatea[0].split('/');
			var x = (frDatea2[2] + frDatea2[1] + frDatea2[0] + frTimea[0] + frTimea[1] + frTimea[2]) * 1;
		}
		else {
			var x = 10000000000000; // = l'an 1000 ...
		}
		return x;
	},
	"date-euro-asc": function ( a, b ) {
		return a - b;
	},
	"date-euro-desc": function ( a, b ) {
		return b - a;
	}
}); 

/**
 * This sorting plug-in for DataTables will correctly sort data in date time or date
 * format typically used in Germany:
 * date and time:`dd.mm.YYYY HH:mm`
 * just date:`dd.mm.YYYY`.
 *
 * Please note that this plug-in is **deprecated*. The
 * [datetime](//datatables.net/blog/2014-12-18) plug-in provides enhanced
 * functionality and flexibility.
 *
 *  @name Date (dd.mm.YYYY) or date and time (dd.mm.YYYY HH:mm)
 *  @summary Sort date / time in the format `dd.mm.YYYY HH:mm` or `dd.mm.YYYY`.
 *  @author [Ronny Vedrilla](http://www.ambient-innovation.com)
 *  @deprecated
 *
 *  @example
 *    $('#example').dataTable( {
 *       columnDefs: [
 *         { type: 'de_datetime', targets: 0 },
 *         { type: 'de_date', targets: 1 }
 *       ]
 *    } );
 */

 jQuery.extend( jQuery.fn.dataTableExt.oSort, {
	"de_datetime-asc": function ( a, b ) {
		var x, y;
		if (jQuery.trim(a) !== '') {
			var deDatea = jQuery.trim(a).split(' ');
			var deTimea = deDatea[1].split(':');
			var deDatea2 = deDatea[0].split('.');
			x = (deDatea2[2] + deDatea2[1] + deDatea2[0] + deTimea[0] + deTimea[1]) * 1;
		} else {
			x = Infinity; // = l'an 1000 ...
		}

		if (jQuery.trim(b) !== '') {
			var deDateb = jQuery.trim(b).split(' ');
			var deTimeb = deDateb[1].split(':');
			deDateb = deDateb[0].split('.');
			y = (deDateb[2] + deDateb[1] + deDateb[0] + deTimeb[0] + deTimeb[1]) * 1;
		} else {
			y = Infinity;
		}
		var z = ((x < y) ? -1 : ((x > y) ? 1 : 0));
		return z;
	},

	"de_datetime-desc": function ( a, b ) {
		var x, y;
		if (jQuery.trim(a) !== '') {
			var deDatea = jQuery.trim(a).split(' ');
			var deTimea = deDatea[1].split(':');
			var deDatea2 = deDatea[0].split('.');
			x = (deDatea2[2] + deDatea2[1] + deDatea2[0] + deTimea[0] + deTimea[1]) * 1;
		} else {
			x = Infinity;
		}

		if (jQuery.trim(b) !== '') {
			var deDateb = jQuery.trim(b).split(' ');
			var deTimeb = deDateb[1].split(':');
			deDateb = deDateb[0].split('.');
			y = (deDateb[2] + deDateb[1] + deDateb[0] + deTimeb[0] + deTimeb[1]) * 1;
		} else {
			y = Infinity;
		}
		var z = ((x < y) ? 1 : ((x > y) ? -1 : 0));
		return z;
	},

	"de_date-asc": function ( a, b ) {
		var x, y;
		if (jQuery.trim(a) !== '') {
			var deDatea = jQuery.trim(a).split('.');
			x = (deDatea[2] + deDatea[1] + deDatea[0]) * 1;
		} else {
			x = Infinity; // = l'an 1000 ...
		}

		if (jQuery.trim(b) !== '') {
			var deDateb = jQuery.trim(b).split('.');
			y = (deDateb[2] + deDateb[1] + deDateb[0]) * 1;
		} else {
			y = Infinity;
		}
		var z = ((x < y) ? -1 : ((x > y) ? 1 : 0));
		return z;
	},

	"de_date-desc": function ( a, b ) {
		var x, y;
		if (jQuery.trim(a) !== '') {
			var deDatea = jQuery.trim(a).split('.');
			x = (deDatea[2] + deDatea[1] + deDatea[0]) * 1;
		} else {
			x = Infinity;
		}

		if (jQuery.trim(b) !== '') {
			var deDateb = jQuery.trim(b).split('.');
			y = (deDateb[2] + deDateb[1] + deDateb[0]) * 1;
		} else {
			y = Infinity;
		}
		var z = ((x < y) ? 1 : ((x > y) ? -1 : 0));
		return z;
	}
} );

/**
 * Although DataTables' internal numeric sorting works no problem on negative
 * numbers, it does not accept positively signed numbers. This plug-in will
 * sort just such data numerically.
 *
 *  @name Fully signed numbers sorting 
 *  @summary Sort data numerically with a leading `+` symbol (as well as `-`).
 *  @author [Allan Jardine](http://sprymedia.co.uk)
 *
 *  @example
 *    $('#example').dataTable( {
 *       columnDefs: [
 *         { type: 'signed-num', targets: 0 }
 *       ]
 *    } );
 */

jQuery.extend( jQuery.fn.dataTableExt.oSort, {
	"signed-num-pre": function ( a ) {
		return (a=="-" || a==="") ? 0 : a.replace('+','')*1;
	},

	"signed-num-asc": function ( a, b ) {
		return ((a < b) ? -1 : ((a > b) ? 1 : 0));
	},

	"signed-num-desc": function ( a, b ) {
		return ((a < b) ? 1 : ((a > b) ? -1 : 0));
	}
} );

/**
 * This plug-in provides the ability to sort columns that contains time
 * information in the most common formats used. It will automatically detect
 * those date types.
 *
 * Please note that this plug-in is **deprecated*. The
 * [datetime](//datatables.net/blog/2014-12-18) plug-in provides enhanced
 * functionality and flexibility.
 *
 *  @name Time (dd/mm/YY)
 *  @summary Sort Times in the formats: `hh:mm, hh:mm:ss, hh:mm tt, hh:mm:ss tt`
 *    e.g. '22:50, 22:50:40, 10:50 pm, 10:50:40 pm' 
 *    am and pm are not case sensitive. white space is not compulsory
 *  @author David Stoneham
 *  @deprecated
 *
 *  @example
 *    $('#example').dataTable( {
 *       columnDefs: [
 *         { type: 'time-uni', targets: 0 }
 *       ]
 *    } );
 */

jQuery.extend(jQuery.fn.dataTableExt.oSort, {
    "time-uni-pre": function (a) {
        var uniTime;

        if (a.toLowerCase().indexOf("am") > -1 || (a.toLowerCase().indexOf("pm") > -1 && Number(a.split(":")[0]) === 12)) {
            uniTime = a.toLowerCase().split("pm")[0].split("am")[0];
            while (uniTime.indexOf(":") > -1) {
                uniTime = uniTime.replace(":", "");
            }
        } else if (a.toLowerCase().indexOf("pm") > -1 || (a.toLowerCase().indexOf("am") > -1 && Number(a.split(":")[0]) === 12)) {
            uniTime = Number(a.split(":")[0]) + 12;
            var leftTime = a.toLowerCase().split("pm")[0].split("am")[0].split(":");
            for (var i = 1; i < leftTime.length; i++) {
                uniTime = uniTime + leftTime[i].trim().toString();
            }
        } else {
            uniTime = a.replace(":", "");
            while (uniTime.indexOf(":") > -1) {
                uniTime = uniTime.replace(":", "");
            }
        }
        return Number(uniTime);
    },

    "time-uni-asc": function (a, b) {
        return ((a < b) ? -1 : ((a > b) ? 1 : 0));
    },

    "time-uni-desc": function (a, b) {
        return ((a < b) ? 1 : ((a > b) ? -1 : 0));
    }
});

/**
 * Sort numeric data which has a percent sign with it.
 *
 * DataTables 1.10+ has percentage data type detection and sorting abilities
 * built-in. As such this plug-in is marked as deprecated, but might be useful
 * when working with old versions of DataTables.
 * 
 *  @name Percentage
 *  @summary Sort numeric data with a postfixed percentage symbol
 *  @deprecated
 *  @author [Jonathan Romley](http://jonathanromley.org/)
 *
 *  @example
 *    $('#example').dataTable( {
 *       columnDefs: [
 *         { type: 'percent', targets: 0 }
 *       ]
 *    } );
 */

jQuery.extend( jQuery.fn.dataTableExt.oSort, {
	"percent-pre": function ( a ) {
		var x = (a == "-") ? 0 : a.replace( /%/, "" );
		return parseFloat( x );
	},

	"percent-asc": function ( a, b ) {
		return ((a < b) ? -1 : ((a > b) ? 1 : 0));
	},

	"percent-desc": function ( a, b ) {
		return ((a < b) ? 1 : ((a > b) ? -1 : 0));
	}
} );

/**
 * When dealing with computer file sizes, it is common to append a post fix
 * such as B, KB, MB or GB to a string in order to easily denote the order of
 * magnitude of the file size. This plug-in allows sorting to take these
 * indicates of size into account.
 * 
 * A counterpart type detection plug-in is also available.
 *
 *  @name File size
 *  @summary Sort abbreviated file sizes correctly (8MB, 4KB, etc)
 *  @author Allan Jardine - datatables.net
 *
 *  @example
 *    $('#example').DataTable( {
 *       columnDefs: [
 *         { type: 'file-size', targets: 0 }
 *       ]
 *    } );
 */
/*
jQuery.fn.dataTable.ext.type.order['file-size-pre'] = function ( data ) {
    var units = data.replace( /[\d\.\s]/g, '' ).toLowerCase();
    var multiplier = 1;

    if ( units === 'kb' ) {
        multiplier = 1000;
    }
    else if ( units === 'mb' ) {
        multiplier = 1000000;
    }
    else if ( units === 'gb' ) {
        multiplier = 1000000000;
    }
    else if ( units === 'tb' ) {
        multiplier = 1000000000000;
    }
    else if ( units === 'pb' ) {
        multiplier = 1000000000000000;
    }

    return parseFloat( data ) * multiplier;
};
*/

/**
 * Sort on the 'alt' tag of images in a column. This is particularly useful if
 * you have a column of images (ticks and crosses for example) and you want to
 * control the sorting using the alt tag.
 *
 *  @name Alt string
 *  @summary Use the `alt` attribute of an image tag as the data to sort upon.
 *  @author _Jumpy_
 *
 *  @example
 *    $('#example').dataTable( {
 *       columnDefs: [
 *         { type: 'alt-string', targets: 0 }
 *       ]
 *    } );
 */

jQuery.extend( jQuery.fn.dataTableExt.oSort, {
	"alt-string-pre": function ( a ) {
		return a.match(/alt="(.*?)"/)[1].toLowerCase();
	},

	"alt-string-asc": function( a, b ) {
		return ((a < b) ? -1 : ((a > b) ? 1 : 0));
	},

	"alt-string-desc": function(a,b) {
		return ((a < b) ? 1 : ((a > b) ? -1 : 0));
	}
} );

/*
 * Adds a new sorting option to dataTables called `date-dd-mmm-yyyy`. Also
 * includes a type detection plug-in. Matches and sorts date strings in
 * the format: `dd/mmm/yyyy`. For example:
 * 
 * * 02-FEB-1978
 * * 17-MAY-2013
 * * 31-JAN-2014
 *
 * Please note that this plug-in is **deprecated*. The
 * [datetime](//datatables.net/blog/2014-12-18) plug-in provides enhanced
 * functionality and flexibility.
 *
 *  @name Date (dd-mmm-yyyy)
 *  @summary Sort dates in the format `dd-mmm-yyyy`
 *  @author [Jeromy French](http://www.appliedinter.net/jeromy_works/)
 *  @deprecated
 *
 *  @example
 *    $('#example').dataTable( {
 *       columnDefs: [
 *         { type: 'date-dd-mmm-yyyy', targets: 0 }
 *       ]
 *    } );
 */

(function () {

var customDateDDMMMYYYYToOrd = function (date) {
	"use strict"; //let's avoid tom-foolery in this function
	// Convert to a number YYYYMMDD which we can use to order
	var dateParts = date.split(/-/);
	return (dateParts[2] * 10000) + ($.inArray(dateParts[1].toUpperCase(), ["JAN", "FEV", "MAR", "ABR", "MAI", "JUN", "JUL", "AGO", "SET", "OUT", "NOV", "DEZ"]) * 100) + (dateParts[0]*1);
};

// This will help DataTables magic detect the "dd-MMM-yyyy" format; Unshift
// so that it's the first data type (so it takes priority over existing)
jQuery.fn.dataTableExt.aTypes.unshift(
	function (sData) {
		"use strict"; //let's avoid tom-foolery in this function
		if (/^([0-2]?\d|3[0-1])-(jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec)-\d{4}/i.test(sData)) {
			return 'date-dd-mmm-yyyy';
		}
		return null;
	}
);

// define the sorts
jQuery.fn.dataTableExt.oSort['date-dd-mmm-yyyy-asc'] = function (a, b) {
	"use strict"; //let's avoid tom-foolery in this function
	var ordA = customDateDDMMMYYYYToOrd(a),
		ordB = customDateDDMMMYYYYToOrd(b);
	return (ordA < ordB) ? -1 : ((ordA > ordB) ? 1 : 0);
};

jQuery.fn.dataTableExt.oSort['date-dd-mmm-yyyy-desc'] = function (a, b) {
	"use strict"; //let's avoid tom-foolery in this function
	var ordA = customDateDDMMMYYYYToOrd(a),
		ordB = customDateDDMMMYYYYToOrd(b);
	return (ordA < ordB) ? 1 : ((ordA > ordB) ? -1 : 0);
};

})();

/**
 * An alternative to the formatted number sorting function above (particularly
 * useful when considering localisation which uses dots / periods for 10^3
 * separation rather than decimal places). Another method of overcoming it
 * difficulties of sorting formatted numbers is to have the data to be sorted
 * upon separate from the visual data. This sorting function pair will use the
 * 'title' attribute of en empty span element (or anything else) to sort
 * numerically (for example `<span title="1000000"><span>1'000'000`).
 *
 * Note that the HTML5 `data-sort` attribute can be [used to supply sorting data
 * to DataTables](//datatables.net/manual/orthogonal-data) and is preferable to
 * using this method, which is therefore marked as deprecated.
 * 
 *  @name Hidden title numeric sorting
 *  @summary Sort data numerically based on an attribute on an empty element.
 *  @deprecated
 *  @author [Allan Jardine](http://sprymedia.co.uk)
 *
 *  @example
 *    $('#example').dataTable( {
 *       columnDefs: [
 *         { type: 'title-numeric', targets: 0 }
 *       ]
 *    } );
 */

jQuery.extend( jQuery.fn.dataTableExt.oSort, {
	"title-numeric-pre": function ( a ) {
		var x = a.match(/title="*(-?[0-9\.]+)/)[1];
		return parseFloat( x );
	},

	"title-numeric-asc": function ( a, b ) {
		return ((a < b) ? -1 : ((a > b) ? 1 : 0));
	},

	"title-numeric-desc": function ( a, b ) {
		return ((a < b) ? 1 : ((a > b) ? -1 : 0));
	}
} );

/**
 * Read information from a column of checkboxes (input elements with type
 * checkbox) and return an array to use as a basis for sorting.
 *
 *  @summary Sort based on the checked state of checkboxes in a column
 *  @name Checkbox data source
 *  @author [Allan Jardine](http://sprymedia.co.uk)
 */
/*
$.fn.dataTable.ext.order['dom-checkbox'] = function  ( settings, col )
{
	return this.api().column( col, {order:'index'} ).nodes().map( function ( td, i ) {
		return $('input', td).prop('checked') ? '1' : '0';
	} );
};
*/

/**
 * Read information from a column of select (drop down) menus and return an
 * array to use as a basis for sorting.
 *
 *  @summary Sort based on the value of the `dt-tag select` options in a column
 *  @name Select menu data source
 *  @requires DataTables 1.10+
 *  @author [Allan Jardine](http://sprymedia.co.uk)
 */
/*
$.fn.dataTable.ext.order['dom-select'] = function  ( settings, col )
{
	return this.api().column( col, {order:'index'} ).nodes().map( function ( td, i ) {
		return $('select', td).val();
	} );
};
*/

/**
 * Read information from a column of input (type text) elements and return an
 * array to use as a basis for sorting.
 *
 *  @summary Sorting based on the values of `dt-tag input` elements in a column.
 *  @name Input element data source
 *  @requires DataTables 1.10+
 *  @author [Allan Jardine](http://sprymedia.co.uk)
 */
/*
$.fn.dataTable.ext.order['dom-text'] = function  ( settings, col )
{
	return this.api().column( col, {order:'index'} ).nodes().map( function ( td, i ) {
		return $('input', td).val();
	} );
};
*/

/**
 * This sorting plug-in allows for HTML tags with numeric data. With the 'html'
 * type it will strip the HTML and then sorts by strings, with this type it 
 * strips the HTML and then sorts by numbers. Note also that this sorting 
 * plug-in has an equivalent type detection plug-in which can make integration
 * easier.
 * 
 * DataTables 1.10+ has HTML numeric data type detection and sorting abilities
 * built-in. As such this plug-in is marked as deprecated, but might be useful
 * when working with old versions of DataTables.
 *
 *  @name Numbers with HTML
 *  @summary Sort data which is a mix of HTML and numeric data.
 *  @deprecated
 *  @author [Allan Jardine](http://sprymedia.co.uk)
 *
 *  @example
 *    $('#example').dataTable( {
 *       columnDefs: [
 *         { type: 'num-html', targets: 0 }
 *       ]
 *    } );
 */

jQuery.extend( jQuery.fn.dataTableExt.oSort, {
	"num-html-pre": function ( a ) {
		var x = String(a).replace( /<[\s\S]*?>/g, "" );
		return parseFloat( x );
	},

	"num-html-asc": function ( a, b ) {
		return ((a < b) ? -1 : ((a > b) ? 1 : 0));
	},

	"num-html-desc": function ( a, b ) {
		return ((a < b) ? 1 : ((a > b) ? -1 : 0));
	}
} );

/**
 * Sorts a column containing IP addresses (IPv4 and IPv6) in typical dot
 * notation / colon. This can be most useful when using DataTables for a
 * networking application, and reporting information containing IP address.
 *
 *  @name IP addresses 
 *  @summary Sort IP addresses numerically
 *  @author Dominique Fournier
 *  @author Brad Wasson
 *
 *  @example
 *    $('#example').dataTable( {
 *       columnDefs: [
 *         { type: 'ip-address', targets: 0 }
 *       ]
 *    } );
 */

jQuery.extend( jQuery.fn.dataTableExt.oSort, {
	"ip-address-pre": function ( a ) {
		var i, item;
		var m = a.split("."),
			n = a.split(":"),
			x = "",
			xa = "";

		if (m.length == 4) {
			// IPV4
			for(i = 0; i < m.length; i++) {
				item = m[i];

				if(item.length == 1) {
					x += "00" + item;
				}
				else if(item.length == 2) {
					x += "0" + item;
				}
				else {
					x += item;
				}
			}
		}
		else if (n.length > 0) {
			// IPV6
			var count = 0;
			for(i = 0; i < n.length; i++) {
				item = n[i];

				if (i > 0) {
					xa += ":";
				}

				if(item.length === 0) {
					count += 0;
				}
				else if(item.length == 1) {
					xa += "000" + item;
					count += 4;
				}
				else if(item.length == 2) {
					xa += "00" + item;
					count += 4;
				}
				else if(item.length == 3) {
					xa += "0" + item;
					count += 4;
				}
				else {
					xa += item;
					count += 4;
				}
			}

			// Padding the ::
			n = xa.split(":");
			var paddDone = 0;

			for (i = 0; i < n.length; i++) {
				item = n[i];

				if (item.length === 0 && paddDone === 0) {
					for (var padding = 0 ; padding < (32-count) ; padding++) {
						x += "0";
						paddDone = 1;
					}
				}
				else {
					x += item;
				}
			}
		}

		return x;
	},

	"ip-address-asc": function ( a, b ) {
		return ((a < b) ? -1 : ((a > b) ? 1 : 0));
	},

	"ip-address-desc": function ( a, b ) {
		return ((a < b) ? 1 : ((a > b) ? -1 : 0));
	}
});