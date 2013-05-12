<!DOCTYPE html>
<html>
  <head>
    <title>Backbone MVC(ollection): Users</title>
    <!--  <link href="todos.css" media="all" rel="stylesheet" type="text/css"/> -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/json2/20121008/json2.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.4.4/underscore-min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/backbone.js/0.9.10/backbone-min.js"></script>
    
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  </head>
  
  <style>
html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p,
blockquote, pre, a, abbr, acronym, address, big,
cite, code, del, dfn, em, font, img,
ins, kbd, q, s, samp, small, strike,
strong, sub, sup, tt, var, dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
center, u, b, i {
     margin: 0;
     padding: 0;
     border: 0;
     outline: 0;
     font-weight: normal;
     font-style: normal;
     font-size: 100%;
     font-family: inherit;
     vertical-align: baseline;
}

body {

	font-size: 65.5%;
	background-color: #F3F3F1;
} 

div.logo {
	display:block;
 	font-family: Courier, monospace;
	color: #ffffff;
	padding: 0.5em;
	font-size: 1.6em;
	text-shadow: -2px -2px 0px #048f29;
	border: solid #0ccc6f 1px;
	background: -webkit-gradient(linear, 0 0, 0 100%, from(#53DF00), to(#58A72A));
	background: -moz-linear-gradient(top, #53DF00, #58A72A);
	height: 1.2em;
}

div.list-menus {
	background-color:#F9F9F8;
	display:block;
	width:95%;
	margin:auto;
	text-align: center;
	border: solid #B6B6B5 1px;
	margin: 0.8em;
	font-size: 1.9em;
}
 

hr {
	
	border: 0;
	color: #B6B6B5;
	background-color: #B6B6B5;
	height: 1px;
	width: 95%;
	text-align: left;
}
ul { 
	color: #58A72A;
	width:95%;
	text-align:left;
	list-style: none;
	padding:0;
	margin:auto;
}
ul li { border-bottom: 1px solid  #B6B6B5;padding: 0.6em;}
ul li a.title{text-shadow:  -2px -2px 0px #F5F8EF; color: #58A72A;}
ul li a span.title:before{before {content: "-  ";color:#58A72A; color: #58A72A;}}
ul li span {display:block;}
ul li span.items { float:left;color:#B6B6B5; font-size: 0.7em;font-style: italic;display: block}

ul li span.date { float:left;clear:left;color:#B6B6B5; font-size: 0.7em;font-style: italic;display: inline}
ul li span.clear{clear: both;}

/* LIGHT BOX */

.fadebox {
    display: none;
    position: absolute;
    top: 0%;
    left: 0%;
    width: 100%;
    height: 100%;
    background-color: black;
    z-index:1001;
    -moz-opacity: 0.8;
    opacity:.80;
    filter: alpha(opacity=80);
}

.overbox {
   
    position: absolute;
    top: 25%;
    left: 25%;
    width: 50%;
    height: 50%;
    z-index:1002;
    background-color: white;
    overflow: auto;
    -webkit-border-radius: 7px;
	-moz-border-radius: 7px;
	border-radius: 7px;
}

.block {
	display:block;
}

.none {
	display:none;
}


/* FONTS */

.medium {

	font-size:1.2em;
}
/******END OF FONTS ****/

/****** ANCHORS ********/

/*anchors will not have decoration*/
a { 
	text-decoration: none;
}

/* Any link in a logo layer would be white*/
.logo a { 
	color:white;
}

/******** END OF ANCHOR *****/
.left{
	float: left;
}
.right {
	float: right;
}
.clear{
	clear:both;
}



</style>
<script>


</script>
  <style>

.button {
font-family: Arial;
color: #ffffff;
font-size: 14px;
padding: 10px;
text-decoration: none;
-webkit-border-radius: 7px;
-moz-border-radius: 7px;
border-radius: 7px;
-webkit-box-shadow: 0px 1px 3px #9e9e9e;
-moz-box-shadow: 0px 1px 3px #9e9e9e;
box-shadow: 0px 1px 3px #9e9e9e;
text-shadow: 1px undefinedpx 56px #048f29;
border: solid #0ccc6f 1px;
background: -webkit-gradient(linear, 0 0, 0 100%, from(#2cde73), to(#84fc7e));
background: -moz-linear-gradient(top, #2cde73, #84fc7e);
}
.button:hover {
background: #83f27b;
}

.delete {
 
  background: -webkit-gradient(linear, 0 0, 0 100%, from(#d91515), to(#fa6969));
  background: -moz-linear-gradient(top, #d91515, #fa6969 );
}
.delete:hover {
  background: #f24360;
}

a .button {
	margin:30px;
}
  
  </style>

  <body>
	<header>
		<div class="logo">Shop&amp;Meals | 
	</div>
	</header>
    <div class="list-menus" id="lists"></div>
    <div class="lightbox"></div>
    
    <script type="text/template" id="list-menus-template">
		<ul>	
			<? if(lists == null){ ?>
				<span class="noMenu">No tienes menus, pidelo! </span>
				<button id="new-menu"> Nuevos Menus</button> 
			<? }
			else{ ?>
				Tus ultimos menus estan abajo, si quieres nuevos pincha aqui <br>  <button id="new-menu">Nuevos Menus</button> 
			<?
			_.each(lists,function (list){  

			?>
				<li>
					<div class="left">
						<a href="#" class="title"><span class="title"><?= list.id?></span></a>
						<span class="breakfast">BreakFast: <?= !!list.breakfast  ? list.breakfast: ''?> </span>
						<span class="lunch">Lunch: <?=  !!list.lunch  ? list.lunch: ''?> </span>
						<span class="dinner">Dinner: <?=  !!list.dinner ? list.dinner: ''?> </span>
						<span class="clear"></span>
					</div>
					
					<div class="clear"></div>
				</li>
			<? }); } ?>
		</ul>		
   </script>
   
    <script>
    
   
	  
    /* PLUGINS */
    $.fn.serializeObject = function() {
        var o = {};
        var a = this.serializeArray();
        $.each(a, function() {
            if (o[this.name] !== undefined) {
                if (!o[this.name].push) {
                    o[this.name] = [o[this.name]];
                }
                o[this.name].push(this.value || '');
            } else {
                o[this.name] = this.value || '';
            }
        });
        return o;
    };
    
    jQuery.fn.createDOMField = function(desc,context){
		$(this).each(function(){
		      elem = $(this);
		      elem.data("desc",desc);
		      elem.click(function(e){
		      	if($('#' + desc).val() !== "" ) {
		      		context.hideLightbox();
		      		$("<li>").append(
					    $('<span>', {
					        class: 'title',
					        text: $('#' + desc).val()
					    }),
					    $('<span>', {
					        class: 'name',
					        text: $('#' + desc).val()  
					    }),
					     $('<span>', { 
					            class: 'email' ,
					            text: $('#' + desc).val()
					     }),
					     $('<span>', { 
					            class: 'passowrd' ,
					            text: $('#' + desc).val()
					     }),
					     $('<span>', { 
					            class: 'clear' ,
					     })
					    ).hide().prependTo('.list-content ul').fadeIn('slow');
		      		
			     }
				});
		   });
    	return this;

	};
	
   /*END OF PLUGINS*/
   /* $.ajaxPrefilter( function( options, originalOptions, jqXHR ) {
    	  options.url = "http://localhost:8080/planmymeals/" +  options.url;
    });*/
    
    $('#edit-mode').click(function(){
    	$('.btn-edit-none').removeClass('none').addClass('block').hide().fadeIn('slow');
    	$('#edit-done').removeClass('none').hide().fadeIn('slow');
    	$(this).addClass('none');
    });
    
    $('#edit-done').click(function(){
    	//$('.btn-edit-none').css({display:none});
    	$('#edit-mode').addClass('block').hide().fadeIn('slow');
    	$('#edit-done').addClass('none');
    });
        
    _.templateSettings = {
    	    interpolate: /\<\?\=(.+?)\?\>/gim,
    	    evaluate: /\<\?([\s\S]+?)\?\>/gim,
    	    escape: /\<\?\-(.+?)\?\>/gim
    	};
    
    
    var MenusModel = Backbone.Model.extend({
		urlRoot: 'menus/list'
    });
    
    
    var Router = Backbone.Router.extend({
      routes :  {
	  
        ''         : 'getMenus',
      }

    });
    
    var ListMenusView = Backbone.View.extend({
    	el:'.list-menus',
    	render: function(){    	
    		var that = this;
    		var user = JSON.parse(localStorage.getItem("user"));
    		var username = user["username"];
    		//console.log("user menu:" + JSON.stringify(user));
			var lastmenus = user["last_menus"];
			//favourites.push(user["favourite_menus"]);
			//console.log("fav:" + favourites);
			//var shoppingListsCollection = new ShoppingListsCollection({id: favourites});
			console.log("lastmenus"+lastmenus);
			
			
			var menusModel = new MenusModel({id:username});
			//var menusModel = new MenusModel();
			//shoppingListsCollection.fetch({
				
				
			menusModel.fetch({
				success : function(menusModel){  
										
					menusModel.unset('id','silent');
	    		var template = _.template($('#list-menus-template').html(),{lists:menusModel.toJSON()});
	    		that.$el.html(template);
	    		that.showLightbox();
				},
				error: function(menusModel){ 
					menusModel.unset('id','silent');
					//console.log("lists: "+ JSON.stringify(menusModel));
	    		var template = _.template($('#list-menus-template').html(),{lists:null});
	    		that.$el.html(template);
	    		that.showLightbox();
				}
			});
    	},
    	showLightbox : function() {
    		$('#over').removeClass('none').addClass('block');
    		$('#fade').removeClass('none').addClass('block');
    		
  		},
  		
    	hideLightbox : function() {
    		$('#over').removeClass('block').addClass('none');
    		$('#fade').removeClass('block').addClass('none');
    		router.navigate('', {trigger: true});
  		},
  		events :{
			'click #new-menu' : 'getNewMenus'
			
		},
		
		getNewMenus : function(ev){
			var that = this;
    		var user = JSON.parse(localStorage.getItem("user"));
    		var username = user["username"];
			var menusModel = new MenusModel({id:username});
				
				
			menusModel.save({
				success : function(menusModel){ 
					
				}
			});
		}
										
    	
    });
    
    
    
    
    var listMenusView = new ListMenusView();
    
    

    var router = new Router();
    router.on('route:getMenus', function(){
        listMenusView.render();
    });
    
    Backbone.history.start();
    </script>
  </body>

</html>
