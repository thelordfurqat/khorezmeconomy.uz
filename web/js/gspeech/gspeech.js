//
// jQueryRotate.2.1.js
// 

(function($) {
var supportedCSS,styles=document.getElementsByTagName("head")[0].style,toCheck="transformProperty WebkitTransform OTransform msTransform MozTransform".split(" ");
for (var a=0;a<toCheck.length;a++) if (styles[toCheck[a]] !== undefined) supportedCSS = toCheck[a];
// Bad eval to preven google closure to remove it from code o_O
// After compresion replace it back to var IE = 'v' == '\v'
var IE = eval('"v"=="\v"');

$.fn.extend({
ImageRotate:function(parameters)
{
	// If this element is already a Wilq32.PhotoEffect object, skip creation
	if (this.Wilq32&&this.Wilq32.PhotoEffect) return;
	// parameters might be applied to many objects - so because we use them later - a fresh instance is needed 
	var paramClone = $.extend(true, {}, parameters); 
	return (new Wilq32.PhotoEffect(this.get(0),paramClone))._rootObj;
},
rotate:function(parameters)
{
	if (this.length===0||typeof parameters=="undefined") return;
	if (typeof parameters=="number") parameters={angle:parameters};
	var returned=[];
	for (var i=0,i0=this.length;i<i0;i++)
	{
	    var element=this.get(i);	
		if (typeof element.Wilq32 == "undefined") 
			returned.push($($(element).ImageRotate(parameters)));
		else 
            element.Wilq32.PhotoEffect._handleRotation(parameters);
	}
	return returned;
}
});

// Library agnostic interface

Wilq32=window.Wilq32||{};
Wilq32.PhotoEffect=(function(){

	if (supportedCSS) {
		return function(img,parameters){
			img.Wilq32 = {
				PhotoEffect: this
			};
            
            this._img = this._rootObj = this._eventObj = img;
            this._handleRotation(parameters);
		}
	} else {
		return function(img,parameters) {
			// Make sure that class and id are also copied - just in case you would like to refeer to an newly created object
            this._img = img;

			this._rootObj=document.createElement('span');
			this._rootObj.style.display="inline-block";
			this._rootObj.Wilq32 = 
				{
					PhotoEffect: this
				};
			img.parentNode.insertBefore(this._rootObj,img);
			
			if (img.complete) {
				this._Loader(parameters);
			} else {
				var self=this;
				// TODO: Remove $ dependency
				$(this._img).bind("load", function()
				{
					self._Loader(parameters);
				});
			}
		}
	}
})();

Wilq32.PhotoEffect.prototype={
    _setupParameters : function (parameters){
		this._parameters = this._parameters || {};
        if (typeof this._angle !== "number") this._angle = 0 ;
        if (typeof parameters.angle==="number") this._angle = parameters.angle;
        this._parameters.animateTo = (typeof parameters.animateTo==="number") ? (parameters.animateTo) : (this._angle); 

		this._parameters.easing = parameters.easing || this._parameters.easing || function (x, t, b, c, d) { return -c * ((t=t/d-1)*t*t*t - 1) + b; }
		this._parameters.duration = parameters.duration || this._parameters.duration || 1000;
        this._parameters.callback = parameters.callback || this._parameters.callback || function(){};
        if (parameters.bind && parameters.bind != this._parameters.bind) this._BindEvents(parameters.bind); 
	},
	_handleRotation : function(parameters){
          this._setupParameters(parameters);
          if (this._angle==this._parameters.animateTo) {
              this._rotate(this._angle);
          }
          else { 
              this._animateStart();          
          }
	},

	_BindEvents:function(events){
		if (events && this._eventObj) 
		{
            // Unbinding previous Events
            if (this._parameters.bind){
                var oldEvents = this._parameters.bind;
                for (var a in oldEvents) if (oldEvents.hasOwnProperty(a)) 
                        // TODO: Remove $ dependency
                        $(this._eventObj).unbind(a,oldEvents[a]);
            }

            this._parameters.bind = events;
			for (var a in events) if (events.hasOwnProperty(a)) 
				// TODO: Remove $ dependency
					$(this._eventObj).bind(a,events[a]);
		}
	},

	_Loader:(function()
	{
		if (IE)
		return function(parameters)
		{
			var width=this._img.width;
			var height=this._img.height;
			this._img.parentNode.removeChild(this._img);
							
			this._vimage = this.createVMLNode('image');
			this._vimage.src=this._img.src;
			this._vimage.style.height=height+"px";
			this._vimage.style.width=width+"px";
			this._vimage.style.position="absolute"; // FIXES IE PROBLEM - its only rendered if its on absolute position!
			this._vimage.style.top = "0px";
			this._vimage.style.left = "0px";

			/* Group minifying a small 1px precision problem when rotating object */
			this._container =  this.createVMLNode('group');
			this._container.style.width=width;
			this._container.style.height=height;
			this._container.style.position="absolute";
			this._container.setAttribute('coordsize',width-1+','+(height-1)); // This -1, -1 trying to fix ugly problem with small displacement on IE
			this._container.appendChild(this._vimage);
			
			this._rootObj.appendChild(this._container);
			this._rootObj.style.position="relative"; // FIXES IE PROBLEM
			this._rootObj.style.width=width+"px";
			this._rootObj.style.height=height+"px";
			this._rootObj.setAttribute('id',this._img.getAttribute('id'));
			this._rootObj.className=this._img.className;			
		    this._eventObj = this._rootObj;	
		    this._handleRotation(parameters);	
		}
		else
		return function (parameters)
		{
			this._rootObj.setAttribute('id',this._img.getAttribute('id'));
			this._rootObj.className=this._img.className;
			
			this._width=this._img.width;
			this._height=this._img.height;
			this._widthHalf=this._width/2; // used for optimisation
			this._heightHalf=this._height/2;// used for optimisation
			
			var _widthMax=Math.sqrt((this._height)*(this._height) + (this._width) * (this._width));

			this._widthAdd = _widthMax - this._width;
			this._heightAdd = _widthMax - this._height;	// widthMax because maxWidth=maxHeight
			this._widthAddHalf=this._widthAdd/2; // used for optimisation
			this._heightAddHalf=this._heightAdd/2;// used for optimisation
			
			this._img.parentNode.removeChild(this._img);	
			
			this._aspectW = ((parseInt(this._img.style.width,10)) || this._width)/this._img.width;
			this._aspectH = ((parseInt(this._img.style.height,10)) || this._height)/this._img.height;
			
			this._canvas=document.createElement('canvas');
			this._canvas.setAttribute('width',this._width);
			this._canvas.style.position="relative";
			this._canvas.style.left = -this._widthAddHalf + "px";
			this._canvas.style.top = -this._heightAddHalf + "px";
			this._canvas.Wilq32 = this._rootObj.Wilq32;
			
			this._rootObj.appendChild(this._canvas);
			this._rootObj.style.width=this._width+"px";
			this._rootObj.style.height=this._height+"px";
            this._eventObj = this._canvas;
			
			this._cnv=this._canvas.getContext('2d');
            this._handleRotation(parameters);
		}
	})(),

	_animateStart:function()
	{	
		if (this._timer) {
			clearTimeout(this._timer);
		}
		this._animateStartTime = +new Date;
		this._animateStartAngle = this._angle;
		this._animate();
	},
_animate:function()
     {
         var actualTime = +new Date;
         var checkEnd = actualTime - this._animateStartTime > this._parameters.duration;

         // TODO: Bug for animatedGif for static rotation ? (to test)
         if (checkEnd && !this._parameters.animatedGif) 
         {
             clearTimeout(this._timer);
         }
         else 
         {
             if (this._canvas||this._vimage||this._img) {
                 var angle = this._parameters.easing(0, actualTime - this._animateStartTime, this._animateStartAngle, this._parameters.animateTo - this._animateStartAngle, this._parameters.duration);
                 this._rotate((~~(angle*10))/10);
             }
             var self = this;
             this._timer = setTimeout(function()
                     {
                     self._animate.call(self);
                     }, 10);
         }

         // To fix Bug that prevents using recursive function in callback I moved this function to back
         if (this._parameters.callback && checkEnd){
             this._angle = this._parameters.animateTo;
             this._rotate(this._angle);
             this._parameters.callback.call(this._rootObj);
         }
     },

	_rotate : (function()
	{
		var rad = Math.PI/180;
		if (IE)
		return function(angle)
		{
            this._angle = angle;
			this._container.style.rotation=(angle%360)+"deg";
		}
		else if (supportedCSS)
		return function(angle){
            this._angle = angle;
			this._img.style[supportedCSS]="rotate("+(angle%360)+"deg)";
		}
		else 
		return function(angle)
		{
            this._angle = angle;
			angle=(angle%360)* rad;
			// clear canvas	
			this._canvas.width = this._width+this._widthAdd;
			this._canvas.height = this._height+this._heightAdd;
						
			// REMEMBER: all drawings are read from backwards.. so first function is translate, then rotate, then translate, translate..
			this._cnv.translate(this._widthAddHalf,this._heightAddHalf);	// at least center image on screen
			this._cnv.translate(this._widthHalf,this._heightHalf);			// we move image back to its orginal 
			this._cnv.rotate(angle);										// rotate image
			this._cnv.translate(-this._widthHalf,-this._heightHalf);		// move image to its center, so we can rotate around its center
			this._cnv.scale(this._aspectW,this._aspectH); // SCALE - if needed ;)
			this._cnv.drawImage(this._img, 0, 0);							// First - we draw image
		}

	})()
}

if (IE)
{
Wilq32.PhotoEffect.prototype.createVMLNode=(function(){
document.createStyleSheet().addRule(".rvml", "behavior:url(#default#VML)");
		try {
			!document.namespaces.rvml && document.namespaces.add("rvml", "urn:schemas-microsoft-com:vml");
			return function (tagName) {
				return document.createElement('<rvml:' + tagName + ' class="rvml">');
			};
		} catch (e) {
			return function (tagName) {
				return document.createElement('<' + tagName + ' xmlns="urn:schemas-microsoft.com:vml" class="rvml">');
			};
		}		
})();
}

})(jQuery);

//
// easing.js
// 

jQuery.easing['jswing'] = jQuery.easing['swing'];

jQuery.extend( jQuery.easing,
{
	def: 'easeOutQuad',
	swing: function (x, t, b, c, d) {
		//alert(jQuery.easing.default);
		return jQuery.easing[jQuery.easing.def](x, t, b, c, d);
	},
	easeInQuad: function (x, t, b, c, d) {
		return c*(t/=d)*t + b;
	},
	easeOutQuad: function (x, t, b, c, d) {
		return -c *(t/=d)*(t-2) + b;
	},
	easeInOutQuad: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t + b;
		return -c/2 * ((--t)*(t-2) - 1) + b;
	},
	easeInCubic: function (x, t, b, c, d) {
		return c*(t/=d)*t*t + b;
	},
	easeOutCubic: function (x, t, b, c, d) {
		return c*((t=t/d-1)*t*t + 1) + b;
	},
	easeInOutCubic: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t*t + b;
		return c/2*((t-=2)*t*t + 2) + b;
	},
	easeInQuart: function (x, t, b, c, d) {
		return c*(t/=d)*t*t*t + b;
	},
	easeOutQuart: function (x, t, b, c, d) {
		return -c * ((t=t/d-1)*t*t*t - 1) + b;
	},
	easeInOutQuart: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t*t*t + b;
		return -c/2 * ((t-=2)*t*t*t - 2) + b;
	},
	easeInQuint: function (x, t, b, c, d) {
		return c*(t/=d)*t*t*t*t + b;
	},
	easeOutQuint: function (x, t, b, c, d) {
		return c*((t=t/d-1)*t*t*t*t + 1) + b;
	},
	easeInOutQuint: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t*t*t*t + b;
		return c/2*((t-=2)*t*t*t*t + 2) + b;
	},
	easeInSine: function (x, t, b, c, d) {
		return -c * Math.cos(t/d * (Math.PI/2)) + c + b;
	},
	easeOutSine: function (x, t, b, c, d) {
		return c * Math.sin(t/d * (Math.PI/2)) + b;
	},
	easeInOutSine: function (x, t, b, c, d) {
		return -c/2 * (Math.cos(Math.PI*t/d) - 1) + b;
	},
	easeInExpo: function (x, t, b, c, d) {
		return (t==0) ? b : c * Math.pow(2, 10 * (t/d - 1)) + b;
	},
	easeOutExpo: function (x, t, b, c, d) {
		return (t==d) ? b+c : c * (-Math.pow(2, -10 * t/d) + 1) + b;
	},
	easeInOutExpo: function (x, t, b, c, d) {
		if (t==0) return b;
		if (t==d) return b+c;
		if ((t/=d/2) < 1) return c/2 * Math.pow(2, 10 * (t - 1)) + b;
		return c/2 * (-Math.pow(2, -10 * --t) + 2) + b;
	},
	easeInCirc: function (x, t, b, c, d) {
		return -c * (Math.sqrt(1 - (t/=d)*t) - 1) + b;
	},
	easeOutCirc: function (x, t, b, c, d) {
		return c * Math.sqrt(1 - (t=t/d-1)*t) + b;
	},
	easeInOutCirc: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return -c/2 * (Math.sqrt(1 - t*t) - 1) + b;
		return c/2 * (Math.sqrt(1 - (t-=2)*t) + 1) + b;
	},
	easeInElastic: function (x, t, b, c, d) {
		var s=1.70158;var p=0;var a=c;
		if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
		if (a < Math.abs(c)) { a=c; var s=p/4; }
		else var s = p/(2*Math.PI) * Math.asin (c/a);
		return -(a*Math.pow(2,10*(t-=1)) * Math.sin( (t*d-s)*(2*Math.PI)/p )) + b;
	},
	easeOutElastic: function (x, t, b, c, d) {
		var s=1.70158;var p=0;var a=c;
		if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
		if (a < Math.abs(c)) { a=c; var s=p/4; }
		else var s = p/(2*Math.PI) * Math.asin (c/a);
		return a*Math.pow(2,-10*t) * Math.sin( (t*d-s)*(2*Math.PI)/p ) + c + b;
	},
	easeInOutElastic: function (x, t, b, c, d) {
		var s=1.70158;var p=0;var a=c;
		if (t==0) return b;  if ((t/=d/2)==2) return b+c;  if (!p) p=d*(.3*1.5);
		if (a < Math.abs(c)) { a=c; var s=p/4; }
		else var s = p/(2*Math.PI) * Math.asin (c/a);
		if (t < 1) return -.5*(a*Math.pow(2,10*(t-=1)) * Math.sin( (t*d-s)*(2*Math.PI)/p )) + b;
		return a*Math.pow(2,-10*(t-=1)) * Math.sin( (t*d-s)*(2*Math.PI)/p )*.5 + c + b;
	},
	easeInBack: function (x, t, b, c, d, s) {
		if (s == undefined) s = 1.70158;
		return c*(t/=d)*t*((s+1)*t - s) + b;
	},
	easeOutBack: function (x, t, b, c, d, s) {
		if (s == undefined) s = 1.70158;
		return c*((t=t/d-1)*t*((s+1)*t + s) + 1) + b;
	},
	easeInOutBack: function (x, t, b, c, d, s) {
		if (s == undefined) s = 1.70158; 
		if ((t/=d/2) < 1) return c/2*(t*t*(((s*=(1.525))+1)*t - s)) + b;
		return c/2*((t-=2)*t*(((s*=(1.525))+1)*t + s) + 2) + b;
	},
	easeInBounce: function (x, t, b, c, d) {
		return c - jQuery.easing.easeOutBounce (x, d-t, 0, c, d) + b;
	},
	easeOutBounce: function (x, t, b, c, d) {
		if ((t/=d) < (1/2.75)) {
			return c*(7.5625*t*t) + b;
		} else if (t < (2/2.75)) {
			return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b;
		} else if (t < (2.5/2.75)) {
			return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b;
		} else {
			return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b;
		}
	},
	easeInOutBounce: function (x, t, b, c, d) {
		if (t < d/2) return jQuery.easing.easeInBounce (x, t*2, 0, c, d) * .5 + b;
		return jQuery.easing.easeOutBounce (x, t*2-d, 0, c, d) * .5 + c*.5 + b;
	}
});

jQuery.extend( jQuery.easing,
{
	easeIn: function (x, t, b, c, d) {
		return jQuery.easing.easeInQuad(x, t, b, c, d);
	},
	easeOut: function (x, t, b, c, d) {
		return jQuery.easing.easeOutQuad(x, t, b, c, d);
	},
	easeInOut: function (x, t, b, c, d) {
		return jQuery.easing.easeInOutQuad(x, t, b, c, d);
	},
	expoin: function(x, t, b, c, d) {
		return jQuery.easing.easeInExpo(x, t, b, c, d);
	},
	expoout: function(x, t, b, c, d) {
		return jQuery.easing.easeOutExpo(x, t, b, c, d);
	},
	expoinout: function(x, t, b, c, d) {
		return jQuery.easing.easeInOutExpo(x, t, b, c, d);
	},
	bouncein: function(x, t, b, c, d) {
		return jQuery.easing.easeInBounce(x, t, b, c, d);
	},
	bounceout: function(x, t, b, c, d) {
		return jQuery.easing.easeOutBounce(x, t, b, c, d);
	},
	bounceinout: function(x, t, b, c, d) {
		return jQuery.easing.easeInOutBounce(x, t, b, c, d);
	},
	elasin: function(x, t, b, c, d) {
		return jQuery.easing.easeInElastic(x, t, b, c, d);
	},
	elasout: function(x, t, b, c, d) {
		return jQuery.easing.easeOutElastic(x, t, b, c, d);
	},
	elasinout: function(x, t, b, c, d) {
		return jQuery.easing.easeInOutElastic(x, t, b, c, d);
	},
	backin: function(x, t, b, c, d) {
		return jQuery.easing.easeInBack(x, t, b, c, d);
	},
	backout: function(x, t, b, c, d) {
		return jQuery.easing.easeOutBack(x, t, b, c, d);
	},
	backinout: function(x, t, b, c, d) {
		return jQuery.easing.easeInOutBack(x, t, b, c, d);
	}
});

//
// MediaElement.js
// 

/*!
* MediaElement.js

* HTML5 <video> and <audio> shim and player
* http://mediaelementjs.com/
*
* Creates a JavaScript object that mimics HTML5 MediaElement API
* for browsers that don't understand HTML5 or can't play the provided codec
* Can play MP4 (H.264), Ogg, WebM, FLV, WMV, WMA, ACC, and MP3
*
* Copyright 2010-2011, John Dyer (http://j.hn)
* Dual licensed under the MIT or GPL Version 2 licenses.
*
*/

(function($) {

var mejs=mejs||{};mejs.version="2.1.9";mejs.meIndex=0;mejs.plugins={silverlight:[{version:[3,0],types:["video/mp4","video/m4v","video/mov","video/wmv","audio/wma","audio/m4a","audio/mp3","audio/wav","audio/mpeg"]}],flash:[{version:[9,0,124],types:["video/mp4","video/m4v","video/mov","video/flv","video/x-flv","audio/flv","audio/x-flv","audio/mp3","audio/m4a","audio/mpeg"]}]};
mejs.Utility={encodeUrl:function(a){return encodeURIComponent(a)},escapeHTML:function(a){return a.toString().split("&").join("&amp;").split("<").join("&lt;").split('"').join("&quot;")},absolutizeUrl:function(a){var b=document.createElement("div");b.innerHTML='<a href="'+this.escapeHTML(a)+'">x</a>';return b.firstChild.href},getScriptPath:function(a){for(var b=0,c,d="",e="",f,g=document.getElementsByTagName("script");b<g.length;b++){f=g[b].src;for(c=0;c<a.length;c++){e=a[c];if(f.indexOf(e)>-1){d=f.substring(0,
f.indexOf(e));break}}if(d!=="")break}return d},secondsToTimeCode:function(a,b){a=Math.round(a);var c,d=Math.floor(a/60);if(d>=60){c=Math.floor(d/60);d%=60}c=c===undefined?"00":c>=10?c:"0"+c;d=d>=10?d:"0"+d;a=Math.floor(a%60);a=a>=10?a:"0"+a;return(c>0||b===true?c+":":"")+d+":"+a},timeCodeToSeconds:function(a){a=a.split(":");return a[0]*60*60+a[1]*60+parseFloat(a[2].replace(",","."))}};
mejs.PluginDetector={hasPluginVersion:function(a,b){var c=this.plugins[a];b[1]=b[1]||0;b[2]=b[2]||0;return c[0]>b[0]||c[0]==b[0]&&c[1]>b[1]||c[0]==b[0]&&c[1]==b[1]&&c[2]>=b[2]?true:false},nav:window.navigator,ua:window.navigator.userAgent.toLowerCase(),plugins:[],addPlugin:function(a,b,c,d,e){this.plugins[a]=this.detectPlugin(b,c,d,e)},detectPlugin:function(a,b,c,d){var e=[0,0,0],f;if(typeof this.nav.plugins!="undefined"&&typeof this.nav.plugins[a]=="object"){if((c=this.nav.plugins[a].description)&&
!(typeof this.nav.mimeTypes!="undefined"&&this.nav.mimeTypes[b]&&!this.nav.mimeTypes[b].enabledPlugin)){e=c.replace(a,"").replace(/^\s+/,"").replace(/\sr/gi,".").split(".");for(a=0;a<e.length;a++)e[a]=parseInt(e[a].match(/\d+/),10)}}else if(typeof window.ActiveXObject!="undefined")try{if(f=new ActiveXObject(c))e=d(f)}catch(g){}return e}};
mejs.PluginDetector.addPlugin("flash","Shockwave Flash","application/x-shockwave-flash","ShockwaveFlash.ShockwaveFlash",function(a){var b=[];if(a=a.GetVariable("$version")){a=a.split(" ")[1].split(",");b=[parseInt(a[0],10),parseInt(a[1],10),parseInt(a[2],10)]}return b});
mejs.PluginDetector.addPlugin("silverlight","Silverlight Plug-In","application/x-silverlight-2","AgControl.AgControl",function(a){var b=[0,0,0,0],c=function(d,e,f,g){for(;d.isVersionSupported(e[0]+"."+e[1]+"."+e[2]+"."+e[3]);)e[f]+=g;e[f]-=g};c(a,b,0,1);c(a,b,1,1);c(a,b,2,1E4);c(a,b,2,1E3);c(a,b,2,100);c(a,b,2,10);c(a,b,2,1);c(a,b,3,1);return b});
mejs.MediaFeatures={init:function(){var a=mejs.PluginDetector.nav,b=mejs.PluginDetector.ua.toLowerCase(),c,d=["source","track","audio","video"];this.isiPad=b.match(/ipad/i)!==null;this.isiPhone=b.match(/iphone/i)!==null;this.isAndroid=b.match(/android/i)!==null;this.isBustedAndroid=b.match(/android 2\.[12]/)!==null;this.isIE=a.appName.toLowerCase().indexOf("microsoft")!=-1;this.isChrome=b.match(/chrome/gi)!==null;this.isFirefox=b.match(/firefox/gi)!==null;for(a=0;a<d.length;a++)c=document.createElement(d[a]);
this.hasNativeFullScreen=typeof c.webkitRequestFullScreen!=="undefined";if(this.isChrome)this.hasNativeFullScreen=false;if(this.hasNativeFullScreen&&b.match(/mac os x 10_5/i))this.hasNativeFullScreen=false}};mejs.MediaFeatures.init();
mejs.HtmlMediaElement={pluginType:"native",isFullScreen:false,setCurrentTime:function(a){this.currentTime=a},setMuted:function(a){this.muted=a},setVolume:function(a){this.volume=a},stop:function(){this.pause()},setSrc:function(a){if(typeof a=="string")this.src=a;else{var b,c;for(b=0;b<a.length;b++){c=a[b];if(this.canPlayType(c.type))this.src=c.src}}},setVideoSize:function(a,b){this.width=a;this.height=b}};mejs.PluginMediaElement=function(a,b,c){this.id=a;this.pluginType=b;this.src=c;this.events={}};
mejs.PluginMediaElement.prototype={pluginElement:null,pluginType:"",isFullScreen:false,playbackRate:-1,defaultPlaybackRate:-1,seekable:[],played:[],paused:true,ended:false,seeking:false,duration:0,error:null,muted:false,volume:1,currentTime:0,play:function(){if(this.pluginApi!=null){this.pluginApi.playMedia();this.paused=false}},load:function(){if(this.pluginApi!=null){this.pluginApi.loadMedia();this.paused=false}},pause:function(){if(this.pluginApi!=null){this.pluginApi.pauseMedia();this.paused=
true}},stop:function(){if(this.pluginApi!=null){this.pluginApi.stopMedia();this.paused=true}},canPlayType:function(a){var b,c,d,e=mejs.plugins[this.pluginType];for(b=0;b<e.length;b++){d=e[b];if(mejs.PluginDetector.hasPluginVersion(this.pluginType,d.version))for(c=0;c<d.types.length;c++)if(a==d.types[c])return true}return false},setSrc:function(a){if(typeof a=="string"){this.pluginApi.setSrc(mejs.Utility.absolutizeUrl(a));this.src=mejs.Utility.absolutizeUrl(a)}else{var b,c;for(b=0;b<a.length;b++){c=
a[b];if(this.canPlayType(c.type)){this.pluginApi.setSrc(mejs.Utility.absolutizeUrl(c.src));this.src=mejs.Utility.absolutizeUrl(a)}}}},setCurrentTime:function(a){if(this.pluginApi!=null){this.pluginApi.setCurrentTime(a);this.currentTime=a}},setVolume:function(a){if(this.pluginApi!=null){this.pluginApi.setVolume(a);this.volume=a}},setMuted:function(a){if(this.pluginApi!=null){this.pluginApi.setMuted(a);this.muted=a}},setVideoSize:function(a,b){if(this.pluginElement.style){this.pluginElement.style.width=
a+"px";this.pluginElement.style.height=b+"px"}this.pluginApi!=null&&this.pluginApi.setVideoSize(a,b)},setFullscreen:function(a){this.pluginApi!=null&&this.pluginApi.setFullscreen(a)},addEventListener:function(a,b){this.events[a]=this.events[a]||[];this.events[a].push(b)},removeEventListener:function(a,b){if(!a){this.events={};return true}var c=this.events[a];if(!c)return true;if(!b){this.events[a]=[];return true}for(i=0;i<c.length;i++)if(c[i]===b){this.events[a].splice(i,1);return true}return false},
dispatchEvent:function(a){var b,c,d=this.events[a];if(d){c=Array.prototype.slice.call(arguments,1);for(b=0;b<d.length;b++)d[b].apply(null,c)}}};
mejs.MediaPluginBridge={pluginMediaElements:{},htmlMediaElements:{},registerPluginElement:function(a,b,c){this.pluginMediaElements[a]=b;this.htmlMediaElements[a]=c},initPlugin:function(a){var b=this.pluginMediaElements[a],c=this.htmlMediaElements[a];switch(b.pluginType){case "flash":b.pluginElement=b.pluginApi=document.getElementById(a);break;case "silverlight":b.pluginElement=document.getElementById(b.id);b.pluginApi=b.pluginElement.Content.MediaElementJS}b.pluginApi!=null&&b.success&&b.success(b,
c)},fireEvent:function(a,b,c){var d,e;a=this.pluginMediaElements[a];a.ended=false;a.paused=true;b={type:b,target:a};for(d in c){a[d]=c[d];b[d]=c[d]}e=c.bufferedTime||0;b.target.buffered=b.buffered={start:function(){return 0},end:function(){return e},length:1};a.dispatchEvent(b.type,b)}};
mejs.MediaElementDefaults={mode:"auto",plugins:["flash","silverlight"],enablePluginDebug:false,type:"",pluginPath:mejs.Utility.getScriptPath(["mediaelement.js","mediaelement.min.js","mediaelement-and-player.js","mediaelement-and-player.min.js"]),flashName:"flashmediaelement.swf",enablePluginSmoothing:false,silverlightName:"silverlightmediaelement.xap",defaultVideoWidth:480,defaultVideoHeight:270,pluginWidth:-1,pluginHeight:-1,timerRate:250,success:function(){},error:function(){}};
mejs.MediaElement=function(a,b){return mejs.HtmlMediaElementShim.create(a,b)};
mejs.HtmlMediaElementShim={create:function(a,b){var c=mejs.MediaElementDefaults,d=typeof a=="string"?document.getElementById(a):a,e=d.tagName.toLowerCase()=="video",f=typeof d.canPlayType!="undefined",g={method:"",url:""},k=d.getAttribute("poster"),h=d.getAttribute("autoplay"),l=d.getAttribute("preload"),j=d.getAttribute("controls"),m;for(m in b)c[m]=b[m];k=typeof k=="undefined"||k===null?"":k;l=typeof l=="undefined"||l===null||l==="false"?"none":l;h=!(typeof h=="undefined"||h===null||h==="false");
j=!(typeof j=="undefined"||j===null||j==="false");g=this.determinePlayback(d,c,e,f);if(g.method=="native"){if(mejs.MediaFeatures.isBustedAndroid){d.src=g.url;d.addEventListener("click",function(){d.play()},true)}return this.updateNative(d,c,h,l,g)}else if(g.method!=="")return this.createPlugin(d,c,e,g.method,g.url!==null?mejs.Utility.absolutizeUrl(g.url):"",k,h,l,j);else this.createErrorMessage(d,c,g.url!==null?mejs.Utility.absolutizeUrl(g.url):"",k)},determinePlayback:function(a,b,c,d){var e=[],
f,g,k={method:"",url:""},h=a.getAttribute("src"),l,j;if(h=="undefined"||h==""||h===null)h=null;if(typeof b.type!="undefined"&&b.type!=="")e.push({type:b.type,url:h});else if(h!==null){g=this.checkType(h,a.getAttribute("type"),c);e.push({type:g,url:h})}else for(f=0;f<a.childNodes.length;f++){g=a.childNodes[f];if(g.nodeType==1&&g.tagName.toLowerCase()=="source"){h=g.getAttribute("src");g=this.checkType(h,g.getAttribute("type"),c);e.push({type:g,url:h})}}if(mejs.MediaFeatures.isBustedAndroid)a.canPlayType=
function(m){return m.match(/video\/(mp4|m4v)/gi)!==null?"maybe":""};if(d&&(b.mode==="auto"||b.mode==="native"))for(f=0;f<e.length;f++)if(a.canPlayType(e[f].type).replace(/no/,"")!==""||a.canPlayType(e[f].type.replace(/mp3/,"mpeg")).replace(/no/,"")!==""){k.method="native";k.url=e[f].url;return k}if(b.mode==="auto"||b.mode==="shim")for(f=0;f<e.length;f++){g=e[f].type;for(a=0;a<b.plugins.length;a++){h=b.plugins[a];l=mejs.plugins[h];for(c=0;c<l.length;c++){j=l[c];if(mejs.PluginDetector.hasPluginVersion(h,
j.version))for(d=0;d<j.types.length;d++)if(g==j.types[d]){k.method=h;k.url=e[f].url;return k}}}}if(k.method==="")k.url=e[0].url;return k},checkType:function(a,b,c){if(a&&!b){a=a.substring(a.lastIndexOf(".")+1);return(c?"video":"audio")+"/"+a}else return b&&~b.indexOf(";")?b.substr(0,b.indexOf(";")):b},createErrorMessage:function(a,b,c,d){var e=document.createElement("div");e.className="me-cannotplay";try{e.style.width=a.width+"px";e.style.height=a.height+"px"}catch(f){}e.innerHTML=d!==""?'<a href="'+
c+'"><img src="'+d+'" /></a>':'<a href="'+c+'"><span>Download File</span></a>';a.parentNode.insertBefore(e,a);a.style.display="none";b.error(a)},createPlugin:function(a,b,c,d,e,f,g,k,h){var l=f=1,j="me_"+d+"_"+mejs.meIndex++,m=new mejs.PluginMediaElement(j,d,e),o=document.createElement("div"),n;for(n=a.parentNode;n!==null&&n.tagName.toLowerCase()!="body";){if(n.parentNode.tagName.toLowerCase()=="p"){n.parentNode.parentNode.insertBefore(n,n.parentNode);break}n=n.parentNode}if(c){f=b.videoWidth>0?b.videoWidth:
a.getAttribute("width")!==null?a.getAttribute("width"):b.defaultVideoWidth;l=b.videoHeight>0?b.videoHeight:a.getAttribute("height")!==null?a.getAttribute("height"):b.defaultVideoHeight}else if(b.enablePluginDebug){f=320;l=240}m.success=b.success;mejs.MediaPluginBridge.registerPluginElement(j,m,a);o.className="me-plugin";a.parentNode.insertBefore(o,a);c=["id="+j,"isvideo="+(c?"true":"false"),"autoplay="+(g?"true":"false"),"preload="+k,"width="+f,"startvolume="+b.startVolume,"timerrate="+b.timerRate,
"height="+l];if(e!==null)d=="flash"?c.push("file="+mejs.Utility.encodeUrl(e)):c.push("file="+e);b.enablePluginDebug&&c.push("debug=true");b.enablePluginSmoothing&&c.push("smoothing=true");h&&c.push("controls=true");switch(d){case "silverlight":o.innerHTML='<object data="data:application/x-silverlight-2," type="application/x-silverlight-2" id="'+j+'" name="'+j+'" width="'+f+'" height="'+l+'"><param name="initParams" value="'+c.join(",")+'" /><param name="windowless" value="true" /><param name="background" value="black" /><param name="minRuntimeVersion" value="3.0.0.0" /><param name="autoUpgrade" value="true" /><param name="source" value="'+
b.pluginPath+b.silverlightName+'" /></object>';break;case "flash":if(mejs.MediaFeatures.isIE){d=document.createElement("div");o.appendChild(d);d.outerHTML='<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab" id="'+j+'" width="'+f+'" height="'+l+'"><param name="movie" value="'+b.pluginPath+b.flashName+"?x="+new Date+'" /><param name="flashvars" value="'+c.join("&amp;")+'" /><param name="quality" value="high" /><param name="bgcolor" value="#000000" /><param name="wmode" value="transparent" /><param name="allowScriptAccess" value="always" /><param name="allowFullScreen" value="true" /></object>'}else o.innerHTML=
'<embed id="'+j+'" name="'+j+'" play="true" loop="false" quality="high" bgcolor="#000000" wmode="transparent" allowScriptAccess="always" allowFullScreen="true" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" src="'+b.pluginPath+b.flashName+'" flashvars="'+c.join("&")+'" width="'+f+'" height="'+l+'"></embed>'}a.style.display="none";return m},updateNative:function(a,b){for(var c in mejs.HtmlMediaElement)a[c]=mejs.HtmlMediaElement[c];b.success(a,a);return a}};
window.mejs=mejs;window.MediaElement=mejs.MediaElement;

/*!
 * MediaElementPlayer
 * http://mediaelementjs.com/
 *
 * Creates a controller bar for HTML5 <video> add <audio> tags
 * using jQuery and MediaElement.js (HTML5 Flash/Silverlight wrapper)
 *
 * Copyright 2010-2011, John Dyer (http://j.hn/)
 * Dual licensed under the MIT or GPL Version 2 licenses.
 *
 */if(typeof $!="undefined")mejs.$=$;else if(typeof ender!="undefined")mejs.$=ender;
(function(f){mejs.MepDefaults={poster:"",defaultVideoWidth:480,defaultVideoHeight:270,videoWidth:-1,videoHeight:-1,audioWidth:400,audioHeight:30,startVolume:0.8,loop:false,enableAutosize:true,alwaysShowHours:false,alwaysShowControls:false,iPadUseNativeControls:true,features:["playpause","current","progress","duration","tracks","volume","fullscreen"]};mejs.mepIndex=0;mejs.MediaElementPlayer=function(a,c){if(!(this instanceof mejs.MediaElementPlayer))return new mejs.MediaElementPlayer(a,c);this.options=
f.extend({},mejs.MepDefaults,c);this.$media=this.$node=f(a);this.node=this.media=this.$media[0];if(typeof this.node.player!="undefined")return this.node.player;else this.node.player=this;this.isVideo=this.media.tagName.toLowerCase()==="video";this.init();return this};mejs.MediaElementPlayer.prototype={init:function(){var a=this,c=mejs.MediaFeatures,b=f.extend(true,{},a.options,{success:function(d,e){a.meReady(d,e)},error:function(d){a.handleError(d)}});if(c.isiPad&&a.options.iPadUseNativeControls||
c.isiPhone){a.$media.attr("controls","controls");a.$media.removeAttr("poster");if(c.isiPad&&a.media.getAttribute("autoplay")!==null){a.media.load();a.media.play()}}else if(!(c.isAndroid&&a.isVideo)){a.$media.removeAttr("controls");a.id="mep_"+mejs.mepIndex++;a.container=f('<div id="'+a.id+'" class="mejs-container"><div class="mejs-inner"><div class="mejs-mediaelement"></div><div class="mejs-layers"></div><div class="mejs-controls"></div><div class="mejs-clear"></div></div></div>').addClass(a.$media[0].className).insertBefore(a.$media);
a.container.find(".mejs-mediaelement").append(a.$media);a.controls=a.container.find(".mejs-controls");a.layers=a.container.find(".mejs-layers");if(a.isVideo){a.width=a.options.videoWidth>0?a.options.videoWidth:a.$media[0].getAttribute("width")!==null?a.$media.attr("width"):a.options.defaultVideoWidth;a.height=a.options.videoHeight>0?a.options.videoHeight:a.$media[0].getAttribute("height")!==null?a.$media.attr("height"):a.options.defaultVideoHeight}else{a.width=a.options.audioWidth;a.height=a.options.audioHeight}a.setPlayerSize(a.width,
a.height);b.pluginWidth=a.height;b.pluginHeight=a.width}mejs.MediaElement(a.$media[0],b)},meReady:function(a,c){var b=this,d=mejs.MediaFeatures,e;if(!b.created){b.created=true;b.media=a;b.domNode=c;if(!d.isiPhone&&!d.isAndroid&&!(d.isiPad&&b.options.iPadUseNativeControls)){b.buildposter(b,b.controls,b.layers,b.media);b.buildoverlays(b,b.controls,b.layers,b.media);b.findTracks();for(e in b.options.features){d=b.options.features[e];if(b["build"+d])try{b["build"+d](b,b.controls,b.layers,b.media)}catch(g){}}b.container.trigger("controlsready");
b.setPlayerSize(b.width,b.height);b.setControlsSize();if(b.isVideo){b.container.bind("mouseenter",function(){if(!b.options.alwaysShowControls){b.controls.css("visibility","visible");b.controls.stop(true,true).fadeIn(200)}}).bind("mouseleave",function(){!b.media.paused&&!b.options.alwaysShowControls&&b.controls.stop(true,true).fadeOut(200,function(){f(this).css("visibility","hidden");f(this).css("display","block")})});b.domNode.getAttribute("autoplay")!==null&&!b.options.alwaysShowControls&&b.controls.css("visibility",
"hidden");b.options.enableAutosize&&b.media.addEventListener("loadedmetadata",function(h){if(b.options.videoHeight<=0&&b.domNode.getAttribute("height")===null&&!isNaN(h.target.videoHeight)){b.setPlayerSize(h.target.videoWidth,h.target.videoHeight);b.setControlsSize();b.media.setVideoSize(h.target.videoWidth,h.target.videoHeight)}},false)}b.media.addEventListener("ended",function(){b.media.setCurrentTime(0);b.media.pause();b.setProgressRail&&b.setProgressRail();b.setCurrentRail&&b.setCurrentRail();
if(b.options.loop)b.media.play();else b.options.alwaysShowControls||b.controls.css("visibility","visible")},true);b.media.addEventListener("loadedmetadata",function(){b.updateDuration&&b.updateDuration();b.updateCurrent&&b.updateCurrent();b.setControlsSize()},true);setTimeout(function(){b.setControlsSize();b.setPlayerSize(b.width,b.height)},50)}b.options.success&&b.options.success(b.media,b.domNode)}},handleError:function(a){this.options.error&&this.options.error(a)},setPlayerSize:function(a,c){this.width=
parseInt(a,10);this.height=parseInt(c,10);this.container.width(this.width).height(this.height);this.layers.children(".mejs-layer").width(this.width).height(this.height)},setControlsSize:function(){var a=0,c=0,b=this.controls.find(".mejs-time-rail"),d=this.controls.find(".mejs-time-total");this.controls.find(".mejs-time-current");this.controls.find(".mejs-time-loaded");others=b.siblings();others.each(function(){if(f(this).css("position")!="absolute")a+=f(this).outerWidth(true)});c=this.controls.width()-
a-(b.outerWidth(true)-b.outerWidth(false));b.width(c);d.width(c-(d.outerWidth(true)-d.width()));this.setProgressRail&&this.setProgressRail();this.setCurrentRail&&this.setCurrentRail()},buildposter:function(a,c,b,d){var e=f('<div class="mejs-poster mejs-layer"><img /></div>').appendTo(b);c=a.$media.attr("poster");b=e.find("img").width(a.width).height(a.height);if(a.options.poster!="")b.attr("src",a.options.poster);else c!==""&&c!=null?b.attr("src",c):e.remove();d.addEventListener("play",function(){e.hide()},
false)},buildoverlays:function(a,c,b,d){if(a.isVideo){var e=f('<div class="mejs-overlay mejs-layer"><div class="mejs-overlay-loading"><span></span></div></div>').hide().appendTo(b),g=f('<div class="mejs-overlay mejs-layer"><div class="mejs-overlay-error"></div></div>').hide().appendTo(b),h=f('<div class="mejs-overlay mejs-layer mejs-overlay-play"><div class="mejs-overlay-button"></div></div>').appendTo(b).click(function(){d.paused?d.play():d.pause()});d.addEventListener("play",function(){h.hide();
g.hide()},false);d.addEventListener("pause",function(){h.show()},false);d.addEventListener("loadstart",function(){mejs.MediaFeatures.isChrome&&d.getAttribute&&d.getAttribute("preload")==="none"||e.show()},false);d.addEventListener("canplay",function(){e.hide()},false);d.addEventListener("error",function(){e.hide();g.show();g.find("mejs-overlay-error").html("Error loading this resource")},false)}},findTracks:function(){var a=this,c=a.$media.find("track");a.tracks=[];c.each(function(){a.tracks.push({srclang:f(this).attr("srclang").toLowerCase(),
src:f(this).attr("src"),kind:f(this).attr("kind"),entries:[],isLoaded:false})})},changeSkin:function(a){this.container[0].className="mejs-container "+a;this.setPlayerSize();this.setControlsSize()},play:function(){this.media.play()},pause:function(){this.media.pause()},load:function(){this.media.load()},setMuted:function(a){this.media.setMuted(a)},setCurrentTime:function(a){this.media.setCurrentTime(a)},getCurrentTime:function(){return this.media.currentTime},setVolume:function(a){this.media.setVolume(a)},
getVolume:function(){return this.media.volume},setSrc:function(a){this.media.setSrc(a)}};if(typeof $!="undefined")$.fn.mediaelementplayer=function(a){return this.each(function(){new mejs.MediaElementPlayer(this,a)})};window.MediaElementPlayer=mejs.MediaElementPlayer})(mejs.$);
(function(f){MediaElementPlayer.prototype.buildplaypause=function(a,c,b,d){var e=f('<div class="mejs-button mejs-playpause-button mejs-play" type="button"><button type="button"></button></div>').appendTo(c).click(function(g){g.preventDefault();d.paused?d.play():d.pause();return false});d.addEventListener("play",function(){e.removeClass("mejs-play").addClass("mejs-pause")},false);d.addEventListener("playing",function(){e.removeClass("mejs-play").addClass("mejs-pause")},false);d.addEventListener("pause",
function(){e.removeClass("mejs-pause").addClass("mejs-play")},false);d.addEventListener("paused",function(){e.removeClass("mejs-pause").addClass("mejs-play")},false)}})(mejs.$);
(function(f){MediaElementPlayer.prototype.buildstop=function(a,c,b,d){f('<div class="mejs-button mejs-stop-button mejs-stop"><button type="button"></button></div>').appendTo(c).click(function(){d.paused||d.pause();if(d.currentTime>0){d.setCurrentTime(0);c.find(".mejs-time-current").width("0px");c.find(".mejs-time-handle").css("left","0px");c.find(".mejs-time-float-current").html(mejs.Utility.secondsToTimeCode(0));c.find(".mejs-currenttime").html(mejs.Utility.secondsToTimeCode(0));b.find(".mejs-poster").show()}})}})(mejs.$);
(function(f){MediaElementPlayer.prototype.buildprogress=function(a,c,b,d){f('<div class="mejs-time-rail"><span class="mejs-time-total"><span class="mejs-time-loaded"></span><span class="mejs-time-current"></span><span class="mejs-time-handle"></span><span class="mejs-time-float"><span class="mejs-time-float-current">00:00</span><span class="mejs-time-float-corner"></span></span></span></div>').appendTo(c);var e=c.find(".mejs-time-total");b=c.find(".mejs-time-loaded");var g=c.find(".mejs-time-current"),
h=c.find(".mejs-time-handle"),j=c.find(".mejs-time-float"),l=c.find(".mejs-time-float-current"),o=function(k){k=k.pageX;var n=e.offset(),q=e.outerWidth(),p=0;p=0;if(k>n.left&&k<=q+n.left&&d.duration){p=(k-n.left)/q;p=p<=0.02?0:p*d.duration;m&&d.setCurrentTime(p);j.css("left",k-n.left);l.html(mejs.Utility.secondsToTimeCode(p))}},m=false,i=false;e.bind("mousedown",function(k){m=true;o(k);return false});c.find(".mejs-time-rail").bind("mouseenter",function(){i=true}).bind("mouseleave",function(){i=false});
f(document).bind("mouseup",function(){m=false}).bind("mousemove",function(k){if(m||i)o(k)});d.addEventListener("progress",function(k){a.setProgressRail(k);a.setCurrentRail(k)},false);d.addEventListener("timeupdate",function(k){a.setProgressRail(k);a.setCurrentRail(k)},false);this.loaded=b;this.total=e;this.current=g;this.handle=h};MediaElementPlayer.prototype.setProgressRail=function(a){var c=a!=undefined?a.target:this.media,b=null;if(c&&c.buffered&&c.buffered.length>0&&c.buffered.end&&c.duration)b=
c.buffered.end(0)/c.duration;else if(c&&c.bytesTotal!=undefined&&c.bytesTotal>0&&c.bufferedBytes!=undefined)b=c.bufferedBytes/c.bytesTotal;else if(a&&a.lengthComputable&&a.total!=0)b=a.loaded/a.total;if(b!==null){b=Math.min(1,Math.max(0,b));this.loaded&&this.total&&this.loaded.width(this.total.width()*b)}};MediaElementPlayer.prototype.setCurrentRail=function(){if(this.media.currentTime!=undefined&&this.media.duration)if(this.total&&this.handle){var a=this.total.width()*this.media.currentTime/this.media.duration,
c=a-this.handle.outerWidth(true)/2;this.current.width(a);this.handle.css("left",c)}}})(mejs.$);
(function(f){MediaElementPlayer.prototype.buildcurrent=function(a,c,b,d){f('<div class="mejs-time"><span class="mejs-currenttime">'+(a.options.alwaysShowHours?"00:":"")+"00:00</span></div>").appendTo(c);this.currenttime=this.controls.find(".mejs-currenttime");d.addEventListener("timeupdate",function(){a.updateCurrent()},false)};MediaElementPlayer.prototype.buildduration=function(a,c,b,d){if(c.children().last().find(".mejs-currenttime").length>0)f(' <span> | </span> <span class="mejs-duration">'+(a.options.alwaysShowHours?
"00:":"")+"00:00</span>").appendTo(c.find(".mejs-time"));else{c.find(".mejs-currenttime").parent().addClass("mejs-currenttime-container");f('<div class="mejs-time mejs-duration-container"><span class="mejs-duration">'+(a.options.alwaysShowHours?"00:":"")+"00:00</span></div>").appendTo(c)}this.durationD=this.controls.find(".mejs-duration");d.addEventListener("timeupdate",function(){a.updateDuration()},false)};MediaElementPlayer.prototype.updateCurrent=function(){if(this.currenttime)this.currenttime.html(mejs.Utility.secondsToTimeCode(this.media.currentTime|
0,this.options.alwaysShowHours||this.media.duration>3600))};MediaElementPlayer.prototype.updateDuration=function(){this.media.duration&&this.durationD&&this.durationD.html(mejs.Utility.secondsToTimeCode(this.media.duration,this.options.alwaysShowHours))}})(mejs.$);
(function(f){MediaElementPlayer.prototype.buildvolume=function(a,c,b,d){var e=f('<div class="mejs-button mejs-volume-button mejs-mute"><button type="button"></button><div class="mejs-volume-slider"><div class="mejs-volume-total"></div><div class="mejs-volume-current"></div><div class="mejs-volume-handle"></div></div></div>').appendTo(c);c=e.find(".mejs-volume-slider");var g=e.find(".mejs-volume-total"),h=e.find(".mejs-volume-current"),j=e.find(".mejs-volume-handle"),l=function(i){i=g.height()-g.height()*
i;j.css("top",i-j.height()/2);h.height(g.height()-i+parseInt(g.css("top").replace(/px/,""),10));h.css("top",i)},o=function(i){var k=g.height(),n=g.offset(),q=parseInt(g.css("top").replace(/px/,""),10);i=i.pageY-n.top;n=(k-i)/k;if(i<0)i=0;else if(i>k)i=k;j.css("top",i-j.height()/2+q);h.height(k-i);h.css("top",i+q);if(n==0){d.setMuted(true);e.removeClass("mejs-mute").addClass("mejs-unmute")}else{d.setMuted(false);e.removeClass("mejs-unmute").addClass("mejs-mute")}n=Math.max(0,n);n=Math.min(n,1);d.setVolume(n)},
m=false;c.bind("mousedown",function(i){o(i);m=true;return false});f(document).bind("mouseup",function(){m=false}).bind("mousemove",function(i){m&&o(i)});e.find("button").click(function(){if(d.muted){d.setMuted(false);e.removeClass("mejs-unmute").addClass("mejs-mute");l(1)}else{d.setMuted(true);e.removeClass("mejs-mute").addClass("mejs-unmute");l(0)}});d.addEventListener("volumechange",function(i){m||l(i.target.volume)},true);l(a.options.startVolume);d.pluginType==="native"&&d.setVolume(a.options.startVolume)}})(mejs.$);
(function(f){mejs.MediaElementDefaults.forcePluginFullScreen=false;MediaElementPlayer.prototype.isFullScreen=false;MediaElementPlayer.prototype.buildfullscreen=function(a,c,b,d){if(a.isVideo){mejs.MediaFeatures.hasNativeFullScreen&&a.container.bind("webkitfullscreenchange",function(){document.webkitIsFullScreen?a.setControlsSize():a.exitFullScreen()});var e=0,g=0,h=a.container,j=document.documentElement,l,o=f('<div class="mejs-button mejs-fullscreen-button"><button type="button"></button></div>').appendTo(c).click(function(){(mejs.MediaFeatures.hasNativeFullScreen?
document.webkitIsFullScreen:a.isFullScreen)?a.exitFullScreen():a.enterFullScreen()});a.enterFullScreen=function(){if(a.pluginType!=="native"&&(mejs.MediaFeatures.isFirefox||a.options.forcePluginFullScreen))d.setFullscreen(true);else{mejs.MediaFeatures.hasNativeFullScreen&&a.container[0].webkitRequestFullScreen();l=j.style.overflow;j.style.overflow="hidden";e=a.container.height();g=a.container.width();h.addClass("mejs-container-fullscreen").width("100%").height("100%").css("z-index",1E3);if(a.pluginType===
"native")a.$media.width("100%").height("100%");else{h.find("object embed").width("100%").height("100%");a.media.setVideoSize(f(window).width(),f(window).height())}b.children("div").width("100%").height("100%");o.removeClass("mejs-fullscreen").addClass("mejs-unfullscreen");a.setControlsSize();a.isFullScreen=true}};a.exitFullScreen=function(){if(a.pluginType!=="native"&&mejs.MediaFeatures.isFirefox)d.setFullscreen(false);else{mejs.MediaFeatures.hasNativeFullScreen&&document.webkitIsFullScreen&&document.webkitCancelFullScreen();
j.style.overflow=l;h.removeClass("mejs-container-fullscreen").width(g).height(e).css("z-index",1);if(a.pluginType==="native")a.$media.width(g).height(e);else{h.find("object embed").width(g).height(e);a.media.setVideoSize(g,e)}b.children("div").width(g).height(e);o.removeClass("mejs-unfullscreen").addClass("mejs-fullscreen");a.setControlsSize();a.isFullScreen=false}};f(window).bind("resize",function(){a.setControlsSize()});f(document).bind("keydown",function(m){a.isFullScreen&&m.keyCode==27&&a.exitFullScreen()})}}})(mejs.$);
(function(f){f.extend(mejs.MepDefaults,{startLanguage:"",translations:[],translationSelector:false,googleApiKey:""});f.extend(MediaElementPlayer.prototype,{buildtracks:function(a,c,b,d){if(a.isVideo)if(a.tracks.length!=0){var e,g="";a.chapters=f('<div class="mejs-chapters mejs-layer"></div>').prependTo(b).hide();a.captions=f('<div class="mejs-captions-layer mejs-layer"><div class="mejs-captions-position"><span class="mejs-captions-text"></span></div></div>').prependTo(b).hide();a.captionsText=a.captions.find(".mejs-captions-text");
a.captionsButton=f('<div class="mejs-button mejs-captions-button"><button type="button" ></button><div class="mejs-captions-selector"><ul><li><input type="radio" name="'+a.id+'_captions" id="'+a.id+'_captions_none" value="none" checked="checked" /><label for="'+a.id+'_captions_none">None</label></li></ul></div></button>').appendTo(c).delegate("input[type=radio]","click",function(){lang=this.value;if(lang=="none")a.selectedTrack=null;else for(e=0;e<a.tracks.length;e++)if(a.tracks[e].srclang==lang){a.selectedTrack=
a.tracks[e];a.captions.attr("lang",a.selectedTrack.srclang);a.displayCaptions();break}});a.options.alwaysShowControls?a.container.find(".mejs-captions-position").addClass("mejs-captions-position-hover"):a.container.bind("mouseenter",function(){a.container.find(".mejs-captions-position").addClass("mejs-captions-position-hover")}).bind("mouseleave",function(){d.paused||a.container.find(".mejs-captions-position").removeClass("mejs-captions-position-hover")});a.trackToLoad=-1;a.selectedTrack=null;a.isLoadingTrack=
false;if(a.tracks.length>0&&a.options.translations.length>0)for(e=0;e<a.options.translations.length;e++)a.tracks.push({srclang:a.options.translations[e].toLowerCase(),src:null,kind:"subtitles",entries:[],isLoaded:false,isTranslation:true});for(e=0;e<a.tracks.length;e++)a.tracks[e].kind=="subtitles"&&a.addTrackButton(a.tracks[e].srclang,a.tracks[e].isTranslation);a.loadNextTrack();d.addEventListener("timeupdate",function(){a.displayCaptions()},false);d.addEventListener("loadedmetadata",function(){a.displayChapters()},
false);a.container.hover(function(){a.chapters.css("visibility","visible");a.chapters.fadeIn(200)},function(){d.paused||a.chapters.fadeOut(200,function(){f(this).css("visibility","hidden");f(this).css("display","block")})});a.node.getAttribute("autoplay")!==null&&a.chapters.css("visibility","hidden");if(a.options.translationSelector){for(e in mejs.language.codes)g+='<option value="'+e+'">'+mejs.language.codes[e]+"</option>";a.container.find(".mejs-captions-selector ul").before(f('<select class="mejs-captions-translations"><option value="">--Add Translation--</option>'+
g+"</select>"));a.container.find(".mejs-captions-translations").change(function(){lang=f(this).val();if(lang!=""){a.tracks.push({srclang:lang,src:null,entries:[],isLoaded:false,isTranslation:true});if(!a.isLoadingTrack){a.trackToLoad--;a.addTrackButton(lang,true);a.options.startLanguage=lang;a.loadNextTrack()}}})}}},loadNextTrack:function(){this.trackToLoad++;if(this.trackToLoad<this.tracks.length){this.isLoadingTrack=true;this.loadTrack(this.trackToLoad)}else this.isLoadingTrack=false},loadTrack:function(a){var c=
this,b=c.tracks[a],d=function(){b.isLoaded=true;c.enableTrackButton(b.srclang);c.loadNextTrack()};b.isTranslation?mejs.TrackFormatParser.translateTrackText(c.tracks[0].entries,c.tracks[0].srclang,b.srclang,c.options.googleApiKey,function(e){b.entries=e;d()}):f.ajax({url:b.src,success:function(e){b.entries=mejs.TrackFormatParser.parse(e);d();b.kind=="chapters"&&c.media.duration>0&&c.drawChapters(b)},error:function(){c.loadNextTrack()}})},enableTrackButton:function(a){this.captionsButton.find("input[value="+
a+"]").prop("disabled",false).siblings("label").html(mejs.language.codes[a]||a);this.options.startLanguage==a&&f("#"+this.id+"_captions_"+a).click();this.adjustLanguageBox()},addTrackButton:function(a,c){var b=mejs.language.codes[a]||a;this.captionsButton.find("ul").append(f('<li><input type="radio" name="'+this.id+'_captions" id="'+this.id+"_captions_"+a+'" value="'+a+'" disabled="disabled" /><label for="'+this.id+"_captions_"+a+'">'+b+(c?" (translating)":" (loading)")+"</label></li>"));this.adjustLanguageBox();
this.container.find(".mejs-captions-translations option[value="+a+"]").remove()},adjustLanguageBox:function(){this.captionsButton.find(".mejs-captions-selector").height(this.captionsButton.find(".mejs-captions-selector ul").outerHeight(true)+this.captionsButton.find(".mejs-captions-translations").outerHeight(true))},displayCaptions:function(){if(typeof this.tracks!="undefined"){var a,c=this.selectedTrack;if(c!=null&&c.isLoaded)for(a=0;a<c.entries.times.length;a++)if(this.media.currentTime>=c.entries.times[a].start&&
this.media.currentTime<=c.entries.times[a].stop){this.captionsText.html(c.entries.text[a]);this.captions.show();return}this.captions.hide()}},displayChapters:function(){var a;for(a=0;a<this.tracks.length;a++)if(this.tracks[a].kind=="chapters"&&this.tracks[a].isLoaded){this.drawChapters(this.tracks[a]);break}},drawChapters:function(a){var c=this,b,d,e=d=0;c.chapters.empty();for(b=0;b<a.entries.times.length;b++){d=a.entries.times[b].stop-a.entries.times[b].start;d=Math.floor(d/c.media.duration*100);
if(d+e>100||b==a.entries.times.length-1&&d+e<100)d=100-e;c.chapters.append(f('<div class="mejs-chapter" rel="'+a.entries.times[b].start+'" style="left: '+e.toString()+"%;width: "+d.toString()+'%;"><div class="mejs-chapter-block'+(b==a.entries.times.length-1?" mejs-chapter-block-last":"")+'"><span class="ch-title">'+a.entries.text[b]+'</span><span class="ch-time">'+mejs.Utility.secondsToTimeCode(a.entries.times[b].start)+"&ndash;"+mejs.Utility.secondsToTimeCode(a.entries.times[b].stop)+"</span></div></div>"));
e+=d}c.chapters.find("div.mejs-chapter").click(function(){c.media.setCurrentTime(parseFloat(f(this).attr("rel")));c.media.paused&&c.media.play()});c.chapters.show()}});mejs.language={codes:{af:"Afrikaans",sq:"Albanian",ar:"Arabic",be:"Belarusian",bg:"Bulgarian",ca:"Catalan",zh:"Chinese","zh-cn":"Chinese Simplified","zh-tw":"Chinese Traditional",hr:"Croatian",cs:"Czech",da:"Danish",nl:"Dutch",en:"English",et:"Estonian",tl:"Filipino",fi:"Finnish",fr:"French",gl:"Galician",de:"German",el:"Greek",ht:"Haitian Creole",
iw:"Hebrew",hi:"Hindi",hu:"Hungarian",is:"Icelandic",id:"Indonesian",ga:"Irish",it:"Italian",ja:"Japanese",ko:"Korean",lv:"Latvian",lt:"Lithuanian",mk:"Macedonian",ms:"Malay",mt:"Maltese",no:"Norwegian",fa:"Persian",pl:"Polish",pt:"Portuguese",ro:"Romanian",ru:"Russian",sr:"Serbian",sk:"Slovak",sl:"Slovenian",es:"Spanish",sw:"Swahili",sv:"Swedish",tl:"Tagalog",th:"Thai",tr:"Turkish",uk:"Ukrainian",vi:"Vietnamese",cy:"Welsh",yi:"Yiddish"}};mejs.TrackFormatParser={pattern_identifier:/^[0-9]+$/,pattern_timecode:/^([0-9]{2}:[0-9]{2}:[0-9]{2}(,[0-9]{1,3})?) --\> ([0-9]{2}:[0-9]{2}:[0-9]{2}(,[0-9]{3})?)(.*)$/,
split2:function(a,c){return a.split(c)},parse:function(a){var c=0;a=this.split2(a,/\r?\n/);for(var b={text:[],times:[]},d,e;c<a.length;c++)if(this.pattern_identifier.exec(a[c])){c++;if((d=this.pattern_timecode.exec(a[c]))&&c<a.length){c++;e=a[c];for(c++;a[c]!==""&&c<a.length;){e=e+"\n"+a[c];c++}b.text.push(e);b.times.push({start:mejs.Utility.timeCodeToSeconds(d[1]),stop:mejs.Utility.timeCodeToSeconds(d[3]),settings:d[5]})}}return b},translateTrackText:function(a,c,b,d,e){var g={text:[],times:[]},
h,j;this.translateText(a.text.join(" <a></a>"),c,b,d,function(l){h=l.split("<a></a>");for(j=0;j<a.text.length;j++){g.text[j]=h[j];g.times[j]={start:a.times[j].start,stop:a.times[j].stop,settings:a.times[j].settings}}e(g)})},translateText:function(a,c,b,d,e){for(var g,h=[],j,l="",o=function(){if(h.length>0){j=h.shift();mejs.TrackFormatParser.translateChunk(j,c,b,d,function(m){if(m!="undefined")l+=m;o()})}else e(l)};a.length>0;)if(a.length>1E3){g=a.lastIndexOf(".",1E3);h.push(a.substring(0,g));a=a.substring(g+
1)}else{h.push(a);a=""}o()},translateChunk:function(a,c,b,d,e){a={q:a,langpair:c+"|"+b,v:"1.0"};if(d!==""&&d!==null)a.key=d;f.ajax({url:"https://ajax.googleapis.com/ajax/services/language/translate",data:a,type:"GET",dataType:"jsonp",success:function(g){e(g.responseData.translatedText)},error:function(){e(null)}})}};if("x\n\ny".split(/\n/gi).length!=3)mejs.TrackFormatParser.split2=function(a,c){var b=[],d="",e;for(e=0;e<a.length;e++){d+=a.substring(e,e+1);if(c.test(d)){b.push(d.replace(c,""));d=""}}b.push(d);
return b}})(mejs.$);
})(jQuery);

//
// gspeech.js
//

(function($) {
	
$(document).ready(function() {
	
	$("#sexy_tooltip").mousedown(function(e){
		return false;
	});

	$(document).mousedown(function(e){
		var w = parseInt(e.which);
		if(w == 3) {
			return false;
		}
		if(!isMyDiv(e) && isVissible()) {
			hide_speaker();
			clearSelection();
		}
		else {
			if(isVissible() && isMyDiv(e)) {
				if(!sound_container_clicked) {
					 
					var isIE = document.all?true:false;
					make_audio();
					if(isIE)
						blink_speaker();
					else
						rotate_speaker();
					//user clicks on my speaker
					sound_container_clicked = true;
				}
				else {
					clearSelection();
					hide_speaker();
				}
				
				e.preventDefault();
			}
			else
				clearSelection();
		}
	});
	
	$("body").keydown(function(e) {
		if(e.keyCode == 13) {
			if(isVissible()) {
				if(!sound_container_clicked) {
					if(!check_pro_version()) {
						alert('To hide a backlink please purchase a GSpeech PRO version');
						return false;
					}
					var isIE = document.all?true:false;
					make_audio();
					if(isIE)
						blink_speaker();
					else
						rotate_speaker();
					//user clicks on my speaker
					sound_container_clicked = true;
				}
				else {
					clearSelection();
					hide_speaker();
				}
			}
		}
	});
	
	function clearSelection() {
		if (window.getSelection) {
			  if (window.getSelection().empty) {  // Chrome
			    window.getSelection().empty();
			  } else if (window.getSelection().removeAllRanges) {  // Firefox
			    window.getSelection().removeAllRanges();
			  }
			} else if (document.selection) {  // IE
			  document.selection.empty();
			}
	};

	function hide_speaker() {
		clearAllPlayers();
		$('#sound_container').fadeTo(10,1);
		$('#sound_container').fadeOut(300);
		for(f in blink_timer) {
			clearTimeout(blink_timer[f]);
		}
		for(ff in rotate_timer) {
    		clearInterval(rotate_timer[ff]);
		}
		sound_container_clicked = false;
		blinking_enable = true;
		sound_container_visible = true;
		
		hide_tooltip_basic($('#sexy_tooltip'));
	};
	
	function stop_speaker() {
		clearAllPlayers();
		$("#sound_container").rotate({animateTo:360});
		$('#sound_container').fadeTo(10,1);
		for(f in blink_timer) {
			clearTimeout(blink_timer[f]);
		}
		for(f in rotate_timer) {
    		clearInterval(rotate_timer[f]);
		}
		sound_container_clicked = false;
		blinking_enable = true;
		sound_container_visible = true;
	};

	document.onmouseup = function(e){
		if(!basic_plg_enable)
			return;
		selected_txt = GetSelectedText ();
		if(!isMyDiv(e) && !sound_container_clicked) {
			var patt1=/^(\s)*$/gi;
			var txt_empty = patt1.test(selected_txt);
			if(txt_empty)
				selected_txt = '';
			if(selected_txt != '' && selected_txt != undefined &&  selected_txt.length > 1 && !txt_empty) {
				var coords = get_coord (e);
				var x = coords[0];
				var y = coords[1];
				move_sound_container(x,y,selected_txt);
			}
		}
	};
	
	function check_pro_version() {  
			return true; 
	};
	
	$("#sexy_tooltip").mouseup(function(e){
		return false;
	});

	function rotate_speaker() {
		var angle = 0;
		rotate_timer_element = setInterval(function(){
		      angle+=3;
		     $("#sound_container").rotate(angle);
		},15);
		rotate_timer.push(rotate_timer_element);
		
	};
	
	function blink_speaker() {
		if(sound_container_visible) {
			$('#sound_container').fadeTo(200,0.2);
			sound_container_visible = false;
		}
		else {
			$('#sound_container').fadeTo(200,1);
			sound_container_visible = true;
		}
		blink_timer.push(setTimeout(blink_speaker,800));
	};

	function change_speaker_animation() {
		if(!($("#sound_container").is(":visible")))
			return;
		if(blinking_enable) {
			for(f in rotate_timer) {
	    		clearInterval(rotate_timer[f]);
			}
        	$("#sound_container").rotate({animateTo:0});
        	blink_speaker();
		}
		blinking_enable = false;
	};

	function isVissible()
	{
		var dis = $('#sound_container').css('display');
		if(dis == 'block') 
			return true;
		else
			return false; 
	};

	function isMyDiv(e) {
		if(typeof event=="undefined")
			var x = e.target||e.srcElement;
		else 
			var x = event.target||event.srcElement;
		var id_clicked = x.id;
		if(id_clicked == 'sound_container')
			return true;
		else 
			return false; 
	};
	
	function navigate_tooltip_basic($tooltip,sound_x,sound_y) {
		
		var center_offset_x = parseFloat($('#sound_container ').width() / 2);
		var tooltip_width = parseFloat($tooltip.find('.tooltip_inner').width());
		var tooltip_height = parseFloat($tooltip.show().find('.tooltip_inner').height());
		var container_height = parseFloat($tooltip.next('#sound_container ').height());
		$tooltip.hide();
		
		if($tooltip.find('.the-tooltip').hasClass('left')) {
			var final_offset = -32 * 1 + center_offset_x * 1 + sound_x * 1;
			$tooltip.css({'left': final_offset, opacity: 0, 'display': 'block'});
		}
		
		if($tooltip.find('.the-tooltip').hasClass('top')) {
			var top_0 = sound_y - 200 * 1;
			var top_1 = sound_y ;
			$tooltip.css({'top': top_0, display: 'block'});
			var new_opacity = 0.95;
			$tooltip.stop().animate( {
				top: top_1,
				opacity: new_opacity
			},300,'easeOutBack',function () {
				$tooltip.css({'display': 'block'});
			});
		}
		else if($tooltip.find('.the-tooltip').hasClass('bottom')) {
			if($tooltip.find('.tooltip_inner').hasClass('powered_by'))
				var new_opacity = 0.95;
			else
				var new_opacity = 0.95;
			
			var top_0 = sound_y + 200 * 1;
			var top_1 = sound_y + container_height * 1 + 16 * 1 ;
			$tooltip.css({'top': top_0,display: 'block'});
			$tooltip.stop().animate( {
				top: top_1,
				opacity: new_opacity
			},300,'easeOutBack',function () {
				$tooltip.css({'display': 'block'});
			});
		}
	};
	
	function hide_tooltip_basic($tooltip) {
		if($tooltip.find('.the-tooltip').hasClass('top')) {
			$tooltip.stop(true,true).delay(200).animate( {
				top: '-=200px',
				opacity: 0
			},300,'easeInBack',function() {
				$(this).hide();
			});
		}
		else if($tooltip.find('.the-tooltip').hasClass('bottom')) {
			$tooltip.stop(true,true).delay(130).animate( {
				top: '+=200px',
				opacity: 0
			},300,'easeInBack',function() {
				$(this).hide();
			});
		}
	}
	
	$("#sound_container").hover(function() {
		var sound_x = parseFloat($(this).css('left'));
		var sound_y = parseFloat($(this).css('top'));
		navigate_tooltip_basic($('#sexy_tooltip_title'),sound_x,sound_y);
	},function() {
		var sound_x = parseFloat($(this).css('left'));
		var sound_y = parseFloat($(this).css('top'));
		hide_tooltip_basic($('#sexy_tooltip_title'),sound_x,sound_y);
	});
	
	function move_sound_container(x,y,txt) {
		var sound_x = x * 1 + 5;
		var sound_y = y * 1 - 5;
		$('#sound_container').css({
		    left: sound_x,
		    top: sound_y
		});
		$("#sound_container").rotate(0);
		$('#sound_container').fadeIn(400);
		$('#sound_text').html(txt);
		
		navigate_tooltip_basic($('#sexy_tooltip'),sound_x,sound_y);
	};
	
	//main function which creates audio
	function make_audio() {
		selected_txt = $('#sound_text').html();
		var 
			words_array = new Array(),
			sent_array = new Array(),
			sent_index = 0;
		
		words_array = selected_txt.split(/[^\S]+/);

		for(var i = 0; i < words_array.length; i++) {
			if(sent_array[sent_index] == undefined) {
				sent_array[sent_index] = '';
			}

			var total_l = sent_array[sent_index].length + words_array[i].length;
			if(sent_array[sent_index].length < speech_text_length && total_l < speech_text_length) {
    				sent_array[sent_index] += words_array[i] + ' ';
			}
			else {
				++sent_index;
				sent_array[sent_index] = words_array[i] + ' ';
			}
		};

		var players_count = sent_array.length;

		var htm_cont = '';
		for(var i = 0; i < players_count; i++) {
			htm_cont += '<audio id="player' + i + '" src="' + streamerphp_folder + 'speech.mpeg" type="' + translation_audio_type + '" controls="controls"></audio>';
		}
		$("#sound_audio").html(htm_cont);

		for(var i = 0; i < players_count; i++) {
			create_htm(i,players_count);
		};

		function create_htm(i,players_count) {
			$('#player' + i).mediaelementplayer({
				success: function (mediaElement, domObject) {
					//detect media end
					players[i] = mediaElement;


		            // sets src
					var encoded_text = encodeURIComponent(sent_array[i]);
					var embed_url = streamerphp_folder + 'streamer.php?q=' + encoded_text + '&l=' + lang_identifier + '&tr_tool=' +translation_tool;
		            mediaElement.setSrc(embed_url);

		            //play next audio, when current ends
		            mediaElement.addEventListener('pause', function(e) {
    	        		try {
    	        			players[i + 1].play()
    	        		} catch(e){}
		        	}, false);

		        	players[0].addEventListener('progress', function(e) {
    		            	change_speaker_animation();
		        	}, false);

		        	if(i == players_count - 1) {
    		        	players[players_count - 1].addEventListener('pause', function(e) {
    		        		stop_speaker();
    		        	}, false);
		        	}
		        	
		            mediaElement.load();
		            
		            if(i == 0) {
		            	mediaElement.play();
		            }
		        }
			});
		}
		
	};
	
	function GetSelectedText() {
	    var selText = "", selTextParts = [];

	    function getNodeText(node) {
	        if (node.nodeType == 3) {
	            selTextParts.push(node.data);
	        } else if (node.hasChildNodes()
	        && !(node.nodeType == 1 && /^(script|style)$/i.test(node.tagName))) {
	            for (var child = node.firstChild; !!child; child = child.nextSibling) {
	                getNodeText(child);
	            }
	        }
	    };

	    if (window.getSelection) {
	        var sel = window.getSelection(), rangeCount = sel.rangeCount;
	        if (rangeCount) {
	            for (var i = 0; i < rangeCount; ++i) {
	                getNodeText(sel.getRangeAt(i).cloneContents());
	            }
	            selText = selTextParts.join("");
	        }
	    } 
	    else if (document.selection && document.selection.type == "Text") {
	        selText = document.selection.createRange().text;
	    }
	    return selText;
	};

	function get_coord (e) {
		var isIE = document.all?true:false;
		var pos_x, pos_y;
		if (!isIE) {
			pos_x = e.pageX;
			pos_y = e.pageY;
		}
		if (isIE) {
			var left = document.documentElement.scrollLeft ? 
					document.documentElement.scrollLeft : 
						document.body.scrollLeft;
			pos_x = event.clientX + left;
			
			var top = document.documentElement.scrollTop ? 
		              document.documentElement.scrollTop : 
		              document.body.scrollTop;
			pos_y = event.clientY + top;
		}
		return [pos_x,pos_y];
	};
	
	function clearAllPlayers() {
		for(var c in players) {
			players[c] = '';
		}
		$('#sound_audio').html('');
	};
	

				
});
})(jQuery);


//
// gspeech_pro.js
// 

(function($) {
$(document).ready(function() {
	
	function check_pro_version_by_class() { 
			return true; 
	}
	
	$('.greeting_block').each(function(i){
		if(i > 1) {
			$(this).next('.sound_container_pro').remove();
			$(this).prev('.gspeech_selection').remove();
		}
	});
	
	function navigate_tooltip($tooltip) {
		
		
		var center_offset_x = parseFloat($tooltip.parent('span').find('.sound_container_pro ').width() / 2);
		var tooltip_width = parseFloat($tooltip.find('.tooltip_inner').width());
		
		if($tooltip.find('.the-tooltip').hasClass('center')) {
			var final_offset = -1 * ((tooltip_width / 2) * 1 + 14 * 1 - center_offset_x * 1);
			$tooltip.css({'left': final_offset, opacity: 0,display: 'block'});
		}
		else if($tooltip.find('.the-tooltip').hasClass('left')) {
			var final_offset = -32 * 1 + center_offset_x * 1;
			$tooltip.css({'left': final_offset, opacity: 0,display: 'block'});
		}
		else if($tooltip.find('.the-tooltip').hasClass('right')) {
			var final_offset = 32 * 1 + center_offset_x * 1;
			$tooltip.css({'left': final_offset, opacity: 0,display: 'block'});
		}
		
		
		if($tooltip.find('.the-tooltip').hasClass('top')) {
			$tooltip.css({'top': -200});
			var new_opacity = 0.95;
			$tooltip.stop(false,false).animate( {
				top: 1,
				opacity: new_opacity
			},300,'easeOutBack');
		}
		else if($tooltip.find('.the-tooltip').hasClass('bottom')) {
			if($tooltip.find('.tooltip_inner').hasClass('powered_by'))
				var new_opacity = 0.95;
			else
				var new_opacity = 0.95;
			
			var h = -1 * parseFloat($tooltip.parent('span').find('.sound_container_pro ').height());
			$tooltip.css({'bottom': -200});
			$tooltip.stop(false,false).animate( {
				bottom: h,
				opacity: new_opacity
			},300,'easeOutBack');
		}
	}
	function hide_tooltip($tooltip) {
		if($tooltip.find('.the-tooltip').hasClass('top')) {
			$tooltip.stop(true,true).delay(200).animate( {
				top: -200,
				opacity: 0
			},300,'easeInBack',function() {
				$(this).hide();
			});
		}
		else if($tooltip.find('.the-tooltip').hasClass('bottom')) {
			$tooltip.stop(true,true).delay(200).animate( {
				bottom: -200,
				opacity: 0
			},300,'easeInBack',function() {
				$(this).hide();
			});
		}
	}
	
	//show backlinks
	function show_backlinks() {
		$('.sound_container_pro').each(function() {
			$tooltip = $(this).next('.sexy_tooltip');
			setTimeout(function() {
				navigate_tooltip($tooltip);
			},1500);
		})
	};
	show_backlinks();
	
	$('.sound_container_pro').each(function(i) {
		$elem = $(this);
		var autoplay = $(this).attr("autoplaypro");
		var speechtimeout =$(this).attr("speechtimeout");
		if(isNaN(speechtimeout))
			speechtimeout = 0;
		speechtimeout = parseFloat(speechtimeout);
		var selector =$(this).attr("selector");
		var event =$(this).attr("eventpro");
		
		if(selector != '' && event != '' && createtriggerspeechcount < 1) {
			createtriggerspeech($elem,speechtimeout,selector,event);
			createtriggerspeechcount ++;
		}
		else if(autoplay == 1) {
			triggerspeech($elem,speechtimeout);
		};
		
	});
	
	function triggerspeech($elem,speechtimeout) {
		speechtimeoutfinal = speechtimeoutfinal + speechtimeout*1 + 200*1;
		setTimeout(function() {
			stop_all_speakers_pro($('.sound_container_pro'));
			clearAllPlayers();
			setTimeout(function() {
				make_speeching($elem);
			},10);
		},speechtimeoutfinal);
	};
	
	function createtriggerspeech($elem,speechtimeout,selector,event) {
		$("" + selector + "").bind(event, function() {
			var $active_elem = $(this);
			var new_htm = $active_elem.html().replace(/<\/?[^>]+>/gi, '');
			var new_val = $active_elem.val().replace(/<\/?[^>]+>/gi, '');
			stop_all_speakers_pro($('.sound_container_pro'));
			clearAllPlayers();
			
			var htm = $elem.children('.sound_text_pro').html();
			if(htm == 'gspeech_html' || $elem.children('.sound_text_pro').attr("htm") == 'gspeech_html') {
				$elem.children('.sound_text_pro').attr("htm","gspeech_html");
				$elem.children('.sound_text_pro').html(new_htm);
			}
			else if(htm == 'gspeech_value' || $elem.children('.sound_text_pro').attr("htm") == 'gspeech_value') {
					$elem.children('.sound_text_pro').attr("htm","gspeech_value");
					$elem.children('.sound_text_pro').html(new_val);
			}
			setTimeout(function() {
				make_speeching($elem);
			},speechtimeout);
		});
	};
	
	var speech_enable_count = 1;
	$('.sound_container_pro').each(function(i) {
		$this = $(this);
		if($(this).hasClass("greeting_block"))
			++speech_enable_count;
		if(i < speech_enable_count) {
			var h1 = $(this).parent('span').height();
			var h2 = $(this).height();
			var w = $(this).width();
			var delta_w = w - 8;
			var delta = (h1 - h2)/2;
			$(this).parent('span').css({top: delta + 'px'});
			var delta_htm = '<label style="width: ' + delta_w + 'px;display: inline-block">&nbsp;</label>';
			$(this).parent('span').after(delta_htm);
			
		} else {
			$(this).remove();
		}
	});
	
	$('.sound_container_pro').hover(function() {
		var $selection = $(this).parent('span').prev('.gspeech_selection');
		var roll = $selection.attr("roll");
		roll = roll == '' ? 1 : roll;
		--roll;
		
		var an_time = parseFloat(gspeech_animation_time[roll]);
		var speaker_op = parseFloat(gspeech_spoa[roll] / 100);
		
		$(this).stop().animate({
			opacity: speaker_op
		},an_time);
		
		$selection.stop().animate({
			backgroundColor: gspeech_bca[roll],
			color: gspeech_ca[roll]
		},an_time);
		
		navigate_tooltip($(this).prev('.sexy_tooltip'));
		
	},function() {
		var $selection = $(this).parent('span').prev('.gspeech_selection');
		var roll = $selection.attr("roll");
		roll = roll == '' ? 1 : roll;
		--roll;
		
		
		
		//onmouseleave, fade back
		if(! $(this).hasClass('active')) {
			var an_time = parseFloat(gspeech_animation_time[roll]);
			var speaker_op = parseFloat(gspeech_spop[roll] / 100);
			$(this).stop().animate({
				opacity: speaker_op
			},an_time);
		};
		
		if(! $selection.hasClass('active')) {
			$selection.stop().animate({
				backgroundColor: gspeech_bcp[roll],
				color: gspeech_cp[roll]
			},an_time);
		};
		
		//hide_tooltip
		hide_tooltip($(this).prev('.sexy_tooltip'));
	});
	
	$('.sound_container_pro').mousedown(function() {
		pro_container_clicked = true;
		basic_plg_enable = false;
	});
	
	$("body").mousedown(function() {
		if($('.sound_container_pro.active').length > 0 && !pro_container_clicked)
			basic_plg_enable = true;
			
		stop_all_speakers_pro($('.sound_container_pro'));
		clearAllPlayers();
		reset_opacities();
		$('.sound_container_pro').removeClass('active');
		$('.gspeech_selection').removeClass('active');
	});
	
	$('.sound_container_pro').click(function() {
		if(!check_pro_version_by_class()) {
			alert('To hide a backlink please purchase a GSpeech PRO version');
			return false;
		}
		make_speeching($(this));
	});
	
	function reset_opacities() {
		$('.sound_container_pro').each(function() {
			var $selection = $(this).parent('span').prev('.gspeech_selection');
			var roll = $selection.attr("roll");
			roll = roll == '' ? 1 : roll;
			--roll;
			var an_time = parseFloat(gspeech_animation_time[roll]);
			var speaker_op = parseFloat(gspeech_spop[roll] / 100);
			$(this).animate({opacity: speaker_op},an_time)
		})
	}
	
	function make_speeching($elem) {
		
		var sel_txt = $elem.children('.sound_text_pro').html();
		if(speechtxt != sel_txt) {
			var $selection = $elem.parent('span').prev('.gspeech_selection');
			$selection.stop().removeAttr("style").addClass('active');
			$elem.addClass('active');
			
			var lang = $elem.attr("language");
			lang = lang == '' ? lang_identifier : lang;
			
			blinking_enable_pro = true;
			blink_start_enable_pro = true;
			
			//animate to active opacity
			var roll = $elem.attr("roll");
			roll = roll == '' ? 1 : roll;
			--roll;
			var speaker_op = parseFloat(gspeech_spoa[roll] / 100);
			$elem.stop().fadeTo(400,speaker_op);
			
			//rotate me
			rotate_speaker_pro($elem);
			
			clearAllPlayers();
			make_audio_pro($elem.children('.sound_text_pro'),$elem,lang);
		}
		speechtxt = sel_txt;
		setTimeout(function() {
			speechtxt = '';
		},100);
	};
	
	function stop_speaker_pro($elem) {
		basic_plg_enable = true;
		clearAllPlayers();
		$elem.rotate({animateTo:360});
		
		var roll = $elem.attr("roll");
		roll = roll == '' ? 1 : roll;
		--roll;
		var speaker_op = parseFloat(gspeech_spop[roll] / 100);
		$elem.stop().fadeTo(400,speaker_op).removeClass('active');
		
		for(f in blink_timer) {
			clearTimeout(blink_timer[f]);
		}
		for(f in rotate_timer) {
			clearInterval(rotate_timer[f]);
		}
	};
	
	function stop_all_speakers_pro($elem) {
		clearAllPlayers();
		$('.sound_container_pro.active').rotate({animateTo:360});
		
		var roll = $elem.attr("roll");
		roll = roll == '' ? 1 : roll;
		--roll;
		
		var speaker_op = parseFloat(gspeech_spop[roll] / 100);
		$elem.stop().removeClass('active');
		
		for(f in blink_timer) {
			clearTimeout(blink_timer[f]);
		}
		for(f in rotate_timer) {
    		clearInterval(rotate_timer[f]);
		}
	};

	function rotate_speaker_pro($elem) {
		var angle = 0;
		rotate_timer_element = setInterval(function(){
		      angle+=3;
		      $elem.rotate(angle);
		},15);
		rotate_timer.push(rotate_timer_element);
	};
	
	function blink_speaker_pro($elem) {
		if(blink_start_enable_pro) {
			$elem.fadeTo(200,0.2);
			blink_start_enable_pro = false;
		}
		else {
			$elem.fadeTo(200,1);
			blink_start_enable_pro = true;
		}
		var t = setTimeout(function() {
			blink_speaker_pro($elem);
		},800);
		blink_timer.push(t);
	};
	
	function change_speaker_animation_pro($elem) {
		if(blinking_enable_pro) {
			for(f in rotate_timer) {
	    		clearInterval(rotate_timer[f]);
			}
			$elem.rotate({animateTo:0});
        	blink_speaker_pro($elem);
		}
		blinking_enable_pro = false;
	};

	//main function which creates audio
	function make_audio_pro($txt_element,$elem,lang) {
		selected_txt = $txt_element.html();
		var 
			words_array = new Array(),
			sent_array = new Array(),
			sent_index = 0;
		
		words_array = selected_txt.split(/[^\S]+/);

		for(var i = 0; i < words_array.length; i++) {
			if(sent_array[sent_index] == undefined) {
				sent_array[sent_index] = '';
			}

			var total_l = sent_array[sent_index].length + words_array[i].length;
			if(sent_array[sent_index].length < speech_text_length && total_l < speech_text_length) {
    				sent_array[sent_index] += words_array[i] + ' ';
			}
			else {
				++sent_index;
				sent_array[sent_index] = words_array[i] + ' ';
			}
		};

		var players_count = sent_array.length;

		var htm_cont = '';
		for(var i = 0; i < players_count; i++) {
			htm_cont += '<audio id="player' + i + '" src="' + streamerphp_folder + 'gspeech.mpeg" type="' + translation_audio_type + '" controls="controls"></audio>';
		};
		$("#sound_audio").html(htm_cont);

		for(var i = 0; i < players_count; i++) {
			create_htm(i,players_count);
		};

		function create_htm(i,players_count) {
			$('#player' + i).mediaelementplayer({
				success: function (mediaElement, domObject) {
					//detect media end
					players[i] = mediaElement;


		            // sets src
					var encoded_text = encodeURIComponent(sent_array[i]);
					var embed_url = streamerphp_folder + 'streamer.php?q=' + encoded_text + '&l=' + lang + '&tr_tool=' +translation_tool;
					mediaElement.setSrc(embed_url);

		            //play next audio, when current ends
		            mediaElement.addEventListener('pause', function(e) {
    	        		try {
    	        			players[i + 1].play()
    	        		} catch(e){}
		        	}, false);

		        	players[0].addEventListener('progress', function(e) {
    		            	change_speaker_animation_pro($elem);
		        	}, false);

		        	if(i == players_count - 1) {
    		        	players[players_count - 1].addEventListener('pause', function(e) {
    		        		stop_speaker_pro($elem);
    		        	}, false);
		        	}
		        	
		            mediaElement.load();
		            
		            if(i == 0) {
		            	mediaElement.play();
		            }
		        }
			});
		}
		
	};
	
	function clearAllPlayers() {
		for(var c in players) {
			players[c] = '';
		}
		$('#sound_audio').html('');
	};
	
				
});
})(jQuery);

//
// Config
//

var players = new Array(),
            	blink_timer = new Array(),
            	rotate_timer = new Array(),
            	lang_identifier = 'ru',
            	selected_txt = '',
            	sound_container_clicked = false,
            	sound_container_visible = true,
            	blinking_enable = true,
            	basic_plg_enable = true,
            	pro_container_clicked = false,
				streamerphp_folder = 'https://csm.gov.uz/plugins/system/gspeech/includes/',
            	translation_tool = 'g',
            	//translation_audio_type = 'audio/x-wav',
            	translation_audio_type = 'audio/mpeg',
            	speech_text_length = 100,
            	blink_start_enable_pro = false,
            	createtriggerspeechcount = 0,
				speechtimeoutfinal = 0,
				speechtxt = '',
            	userRegistered = "0",
            	gspeech_bcp = ["#ffffff","#ffffff","#ffffff","#ffffff","#ffffff"],
		    	gspeech_cp = ["#111111","#3284c7","#fc0000","#0d7300","#ea7d00"],
		    	gspeech_bca = ["#545454","#3284c7","#ff3333","#0f8901","#ea7d00"],
		    	gspeech_ca = ["#ffffff","#ffffff","#ffffff","#ffffff","#ffffff"],
		    	gspeech_spop = ["90","80","90","90","90"],
		    	gspeech_spoa = ["100","100","100","100","100"],
		    	gspeech_animation_time = ["400","400","400","400","400"];	