<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Shop&amp;Meals</title>
<script type="text/javascript"
	src="<c:url value="/resources/js/json2.js" /> "></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-1.9.1.min.js" /> "></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/underscore-min.js" /> "></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/backbone-min.js" /> "></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,800'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="/shopandmeals/resources/css/fontello.css">
<link rel="stylesheet" href="/shopandmeals/resources/css/animation.css">
<link rel="stylesheet" href="/shopandmeals/resources/css/editbox.css">

</head>
<style>
html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,a,abbr,acronym,address,big,cite,code,del,dfn,em,font,img,ins,kbd,q,s,samp,small,strike,strong,sub,sup,tt,var,dl,dt,dd,ol,ul,li,fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td,center,u,b,i
	{
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
	color: #5e6d81;
	background: #fff;
	text-align: center;
	margin: 0 auto 0 auto;
	font-size: 65.5%;
	font-family: 'Open Sans', sans-serif;
}

div.logo {
	display: block;
	color: #ffffff;
	padding: 0.5em;
	text-shadow: -2px -2px 0px #048f29;
	border: solid #0ccc6f 1px;
	background: -webkit-gradient(linear, 0 0, 0 100%, from(#58A72A),
		to(#36c77b));
	background: -moz-linear-gradient(top, #58A72A, #36c77b);
	height: 1.2em;
	font-size: 1.2em;
	font-family: 'Open Sans', sans-serif;
}

div.list-content,div.list-items {
	background-color: #fff;
	display: block;
	width: 100%;
	margin: auto;
	text-align: center;
	font-size: 1.5em;
}

ul {
	color: #58A72A;
	width: 95%;
	text-align: left;
	list-style: none;
	padding: 0;
	margin: auto;
}

ul li {
	border-bottom: 1px inset #B6B6B5;
	padding: 0.6em;
}

ul li:last-child {
	border-bottom: none;
}

ul li a.title {
	color: #58A72A;
}

ul li a span.title:before {
	before {content: "-  ";
	color: #58A72A;
	color: #58A72A;
}

}
ul li span {
	display: block;
}

ul li span.items {
	float: left;
	color: #B6B6B5;
	font-size: 0.7em;
	font-style: italic;
	display: block
}

ul li span.date {
	float: left;
	clear: left;
	color: #B6B6B5;
	font-size: 0.7em;
	font-style: italic;
	display: inline
}

ul li span.clear {
	clear: both;
}

/* LIGHT BOX */
.fadebox {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 1001;
	-moz-opacity: 0.8;
	opacity: .80;
	filter: alpha(opacity =       30);
}

.overbox {
	position: absolute;
	top: 5%;
	width: 100%;
	z-index: 1002;
	background-color: white;
	overflow: auto;
	margin: auto;
	text-align: center;
	font-family: 'Open Sans', sans-serif;
	font-size: 1.5em;
}

.block {
	display: block;
}

.none {
	display: none;
}

/* FONTS */
.medium {
	font-size: 1.2em;
	font-family: 'Open Sans', sans-serif;
}
/******END OF FONTS ****/

/****** ANCHORS ********/

/*anchors will not have decoration*/
a {
	text-decoration: none;
}

/* Any link in a logo layer would be white*/
.logo a {
	color: white;
}

/******** END OF ANCHOR *****/
.left {
	float: left;
}

.right {
	float: right;
}

.center {
	margin: auto;
	text-align: center;
}

.clear {
	clear: both;
}

.add-on {
	color: #fff;
	font-weight: bold;
	background: transparent;
	border: 0;
	margin: 1em 1.5em 0 0;
	text-shadow: none;
}

.green {
	color: #36c77b; !
	important width: 10%;
	background: #fff;
	height: 10%;
	padding: 0;
	margin: 1em 1.5em 0 0;
}

.red {
	color: red; !
	important width: 5%;
	background: #fff;
	height: 10%;
	padding: 0;
	margin: 1em 0.5em 0 0;
}

.rounded_img {
	width: 10em;
	-moz-border-radius: 60px;
	border-radius: 60px;
	margin: 1.5em 0 0.5em 3em;
}

.welcome {
	color: white;
	font-size: 1em;
}

.no-margin {
	margin: 0;
	paddgin: 0;
}

.list-bubble {
	width: 95%;
	padding: 10x 10px 10px 10px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	border: 1px solid #cccccc;
	margin: 10px auto;
	-moz-box-shadow: 0 0 3px 1px #cccccc;
	-webkit-box-shadow: 0 0 3px 1px #cccccc;
	box-shadow: 0 0 3px 1px #cccccc;
}

h3 {
	color: grey;
	padding: 5px 0px 5px 0px;
	font-size: 1.3em;
	font-weight: normal;
}
</style>

<body>

	<div class="list-content" id="lists"></div>

	<div class="list-items" id="items"></div>

	<div class="lightbox"></div>



	<script type="text/template" id="add-list-template">
 <div id="over" class="overbox medium">
<div class="logo">{{Shop&amp;Meals}}</div>

<h3 ><?= list ? 'Actualiza tu ' : 'Crea tu nueva ' ?>  <span class="highlight">{{lista}}</span></h3>
<div class="separation"><hr/></div>
<div class="login-bubble">

<div class="login">
  
  
   <form class="add-list">
    
    <input type = "text" placeholder="Nombre Lista" name="description"  value="<?= list ? list.get('description') : '' ?>" />
    <div class="center no-margin">
    <button type="submit" id="btn-add-list" href="#"><span class=" icon-ok-circled2 green  add-on-edit mediuum-button left"></span></button> 
    <button type="button" id="btn-hide-lightbox" href="#"><span class="add-on-edit icon-cancel-circled2 red add-on-edit left mediuum-button"></span></button>
    </div>
    <div class="clear"></div>
    <? if (list) { ?>
     <input type="hidden"  id="hidden-id" name="id" value="<?=list.id?>" />
    <? } ?>
   </form>
  </div>
</div>
</div>
 <div id="fade" class="fadebox">&nbsp;</div>
 </script>

	<script type="text/template" id="share-list-template">
	<div id="over" class="overbox medium">
		<div class="logo">Shop&amp;Meals</div>
			<span> <?= error ? error : '' ?> </span>
			<form class="share-list">
				<legend>Search user to share</legend>
				<input type = "text" name="username"  id="username" value='' />
				<? if (id) { ?>
					<input type="hidden"  id="hidden-id" name="id" value="<?=id?>" />
				<? } ?>
				<button type="submit" id="btn-share-list" href="#">Aceptar</button> 
				<button type="button" id="btn-hide-lightbox" href="#">HideLightBox</button>
			</form>
		</div>
	<div id="fade" class="fadebox">&nbsp;</div>
	</script>






	<script type="text/template" id="add-item-template">


<div id="over" class="overbox medium">

<div class="login-bubble">

<div class="login">
  <div class="logo">Shop&amp;Meals</div>
  
   <form class="add-list">
    <legend><?= list ? 'Actualizar ' : 'Crear Nueva' ?> Lista</legend>


 <div class="input-prepend">
  <span class="add-on icon-lock"></span>
  <input  type="text" placeholder="Nombre Item" name="description" value="<?= list ? list.get('description') : '' ?>">
 </div>
 <? if (list) { ?>
     <input type="hidden"  name="id" value="<?=list.id?>" />
    <? } ?>
     <button type="submit" id="btn-add-list" href="#">Aceptar</button> 
    <button type="button" id="btn-hide-lightbox" href="#">HideLightBox</button>
    
   </form>
  </div>
</div>
</div>
 <div id="fade" class="fadebox">&nbsp;</div>
 </script>


	<script type="text/template" id="edit-item-template">
	<div id="over" class="overbox medium">
		<div class="logo">Shop&amp;Meals</div>
		
<div class="separation"><hr/></div>
<div class="login-bubble">

<div class="login">

			<form class="add-list">
				<legend><?= item.description ? 'Edita tu ' : 'Crea tu' ?> Item</legend>

				<input type = "text" name="description" id="description" value="<?= item ? item.description : '' ?>" />
 <div class="center no-margin">	
	<button type="submit" id="btn-edit-item" href="#"><span class=" icon-ok-circled2 green  add-on-edit mediuum-button left"></span></button> 
    <button type="button" id="btn-hide-lightboxEdit" href="#" ><span class="add-on-edit icon-cancel-circled2 red add-on-edit left mediuum-button"></span></button>
    </div>
    <div class="clear"></div>

			</form>
		</div>
</div>
</div>
</div>
<div id="fade" class="fadebox">&nbsp;</div>
	
	</script>


	<script type="text/template" id="list-template">
  <header>
   
   <div class="logo">
    
    <a href="#/add" class="right"><span class="add-on icon-plus-circled welcome no-margin"></span></a>
    <a href="#/gohome" class="left"><span class="add-on icon-home welcome no-margin"></span></a>
    
   </div>
   
  </header>
<h4> Bienvenido,<span class="highlight">{{ <?var user = JSON.parse(localStorage.getItem('user'));?><?=user.username?> }}</span> .Echa un vistazo a tus listas</h4>
 <div class="list-bubble">
  <ul> 
    <? 
	if(lists != null){
	_.each(lists,function (list){ 
    
    /* Storing a copy of every list object so we do not call the database unnecessarily */
    localStorage.setItem(list.id,JSON.stringify(list)) ?>
    <li>
     <div class="left">
      <a href="#/items/<?=list.id?>" class="title"><span class="title"><?= list.description ?></span></a>
      <span class="items"><?= !!list.items  ? list.items.length: 0?> Items</span>
      <span class="date"><?=  !!list.date  ? new Date(list.date).toDateString() : ''?></span>
      <span class="clear"></span>
     </div>
     <div class="right" >
      <form class="edit-list-item">
       <a id="edit-list" ><span class="add-on icon-edit-alt green left "></span></a>
       <a  href="#" id="remove-list" remove-id="<?=list.id?>"><span class="add-on icon-cancel-circled2 red left"></span></a>
      <input href="#" type="hidden" id ="hidden-id" name="id" value="<?=list.id?>" />
      </form>
     </div>
     <div class="clear"></div>
    </li>
   <? }); } else {
console.log('no tienes');?>
  <li>Aún no tienes ninguna lista, comienza a añadirlas</li>
 <? } ?>
  </ul>
</div>  
   </script>

	<script type="text/template" id="list-items-template">
		<header>
			<div class="logo">
				<a href="#/gohome" class="left"><span class="add-on icon-home welcome no-margin"></span></a>
				<a href="#/addItem/<?=items.id?>" class="right"><span class="add-on icon-plus-circled welcome no-margin"></span></a>
				<a href="#/itemsdone"  id="edit-items-done" class="right"><span class="add-on icon-floppy welcome no-margin"></span></a>
			</div>
		</header>
		<h4> Estos son los elementos que tienes en <span class="highlight">{{ <?=items.description?> }}</span></h4>
		<hr/>
 		<div class="list-bubble">
		<ul>
		
		<? if (items.items !==  null) {  
			
			 _.each(items.items,function (item){ 
				/*Storing a copy of every list object so we do not call the database unnecessarily*/ ?>
				
				<li>
					<div class="left">
						<span class="title"><?=item?></span>
					</div>
					<div class="right">
						<form class = "list-items">
						<input type="hidden" id ="hidden-desc" name="description" value="<?=item?>" />
						
						<a id="edit-item" ><span class="add-on icon-edit-alt green left "></span></a>
 						<a  href="#" id="remove-item"><span class="add-on icon-cancel-circled2 red left"></span></a>
						</form>
					</div>
					<div class="clear"></div>
				</li>
			<? }); ?>
		</form>
		</ul>
 			
		<?} else { ?>
			<li>Aún no tienes elementos en esta list, comienza a añadirlos</li>
		<? }?>
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
						o[this.name] = [ o[this.name] ];
					}
					o[this.name].push(this.value || '');
				} else {
					o[this.name] = this.value || '';
				}
			});
			return o;
		};

		var SmUtils = function(){};
		 
		 SmUtils.prototype.isUserLogged = function() {
		  
		  return !!localStorage.getItem('user');
		 };
		 
		 SmUtils.prototype.redirectToLogin = function(){
		  if(!this.isUserLogged()){
		   
		   window.location.href=window.location.protocol + "//" +window.location.host+ "/shopandmeals";
		  } 
		  
		  return true;
		 };
		 var smUtils = new SmUtils();

		/*END OF PLUGINS*/
		/* $.ajaxPrefilter( function( options, originalOptions, jqXHR ) {
		 	  options.url = "http://localhost:8080/planmymeals/" +  options.url;
		 });*/


		_.templateSettings = {
			interpolate : /\<\?\=(.+?)\?\>/gim,
			evaluate : /\<\?([\s\S]+?)\?\>/gim,
			escape : /\<\?\-(.+?)\?\>/gim
		};

		var ShoppingListsCollection = Backbone.Collection.extend({
			url : 'user'
		});


		var ShoppingShareListModel = Backbone.Model.extend({
			urlRoot : 'share',
		/*initialize: function(id, userShared){
			this.username= userShared.username;
		}*/
		});
		var ShoppingListModel = Backbone.Model.extend({
			  urlRoot: 'list',
			  initialize: function(){
			   smUtils.redirectToLogin();
			  }
			   });
			    
			    var ShoppingListUserModel = Backbone.Model.extend({
			  urlRoot: 'user',
			  initialize: function(){   
			   smUtils.redirectToLogin();      
			  }
			    });

		var ShoppingNewListModel = Backbone.Model.extend({
			urlRoot : 'user/new',
			initialize : function() {
				var user = JSON.parse(localStorage.getItem("user"));
				var username = [];
				username.push(user["username"]);
				console.log("user in add List:" + username);
				this.set('users', username);
			}
		});

		var ListItemsCollection = Backbone.Collection.extend({
			url : 'items'
		});
		var ListItemsModel = Backbone.Model.extend({
		     urlRoot: 'items',
		  initialize: function(){
		   smUtils.redirectToLogin();
		      
		  }
		    });
		    
		    var ItemsDoneModel = Backbone.Model.extend({
		     urlRoot: 'items',
		  initialize: function(){
		   smUtils.redirectToLogin();
		  }
		    });
		    
		var Router = Backbone.Router.extend({
			routes : {
				'' : 'shopping',
				'home' : 'shopping',
				'add' : 'addList',
				'edit/:id' : 'editList',
				'share/:id' : 'shareList',
				'items/:id' : 'getItems',
				'user/:id' : 'addList',
				'user' : 'addList',
				'removedItem/:id' : 'getItems',
				'editItem/:id/:item' : 'editItem',
				'addItem/:id' : 'addItem',

			}

		});

		var ListItemsView = Backbone.View
				.extend({
					el : '.list-content',
					listId : '',
					render : function(options) {
						this.listId = options.id;
						console.log("options" + options + "listId"
								+ this.listId);
						var listJSONobj = JSON.parse(localStorage
								.getItem(options.id));
						var template = _.template($('#list-items-template')
								.html(), {
							items : listJSONobj
						});
						this.$el.html(template).hide().fadeIn('slow');
					},
					events : {
						'click #remove-item' : 'deleteList',
						'click #edit-item' : 'editList',
						'click #edit-items-done' : 'saveItems',
						'submit form#list-items' : 'saveItems'
					},
					editList : function(ev) {

						router.navigate('editItem/'
								+ this.listId
								+ "/"
								+ $(ev.currentTarget).parent().find(
										'#hidden-desc').val(), {
							trigger : true
						});
					},

					deleteList : function(ev) {

						var tempList = JSON.parse(localStorage
								.getItem(this.listId));
						var element = $(ev.currentTarget).parent().find(
								'#hidden-desc').val();

						var pos = tempList.items.indexOf(element);
						var spliceDone = tempList.items.splice(pos, 1);
						localStorage.setItem(this.listId, JSON
								.stringify(tempList));
						var route = (location.hash.indexOf('removed') != -1 ? 'items/'
								: 'removedItem/');
						router.navigate(route + this.listId, {
							trigger : true
						});
						return false;
					},
					doneItems : function(ev) {
						$('#list-items').trigger('submit');
					},
					saveItems : function(ev) {
						var idTemp = this.listId;
						//var listDetails = $(ev.currentTarget).serializeObject();
						var itemsDoneModel = new ItemsDoneModel({
							id : this.listId
						});
						var listDetails = JSON.parse(localStorage
								.getItem(this.listId));
						itemsDoneModel.save(listDetails, {
							success : function(itemsDoneModel) {
								router.navigate('home', {
									trigger : true
								});
							}
						});
						return false;
					}

				});

		var listItemsView = new ListItemsView();

		var ShoppingListsView = Backbone.View.extend({
			el : '.list-content',
			mode : 'moderna',
			render : function() {
				var that = this;

				var user = JSON.parse(localStorage.getItem("user"));
				var username = user ? user["username"] : null;
				console.log("user:" + username);
				//var shoppingListsCollection = new ShoppingListsCollection({id: username});
				var shoppingListUserModel = new ShoppingListUserModel({
					id : username
				});

				shoppingListUserModel.fetch({
					success : function(shoppingListUserModel) {
						//	success : function(shoppingListsCollection){
						shoppingListUserModel.unset('id', 'silent');

						var template = _.template($('#list-template').html(), {
							lists : shoppingListUserModel.toJSON()
						});
						//var template = _.template($('#list-template').html(), {lists: shoppingListsCollection.models});
						that.$el.html(template).hide().fadeIn('slow');
						},
					error : function(shoppingListUserModel){ 
						shoppingListUserModel.unset('id','silent');
						//console.log("lists: "+ JSON.stringify(menusModel));
						var template = _.template($('#list-template').html(), {
							lists : null
						});
						//var template = _.template($('#list-template').html(), {lists: shoppingListsCollection.models});
						that.$el.html(template).hide().fadeIn('slow');
	    			}
				});
			},
			events : {
				'click #remove-list' : 'deleteList',
				'click #edit-list' : 'editList',
				'click #share-list' : 'shareList',
			},
			editList : function(ev) {

				router.navigate(
						'edit/'
								+ $(ev.currentTarget).parent().find(
										'#hidden-id').val(), {
							trigger : true
						});
			},

			shareList : function(ev) {

				alert("compartimos lista");
				router.navigate(
						'share/'
								+ $(ev.currentTarget).parent().find(
										'#hidden-id').val(), {
							trigger : true
						});
			},

			deleteList : function(ev) {

				var shoppingListModel = new ShoppingListModel({
					id : $(ev.currentTarget).parent().find('#hidden-id').val()
				});

				shoppingListModel.destroy({
					success : function(shoppingListModel) {
						router.navigate('home', {
							trigger : true
						});

					}
				});
				return false;
			}

		});

		var shoppingListsView = new ShoppingListsView();

		var AddItemView = Backbone.View.extend({
			el : '.lightbox',
			render : function(options) {
				var user = JSON.parse(localStorage.getItem("user"));
				var username = user["username"];
				console.log("user in add new List:" + username);
				if (options.id) {
					var that = this;
					that.shoppingListModel = new ShoppingListModel({
						id : options.id
					});
					that.shoppingListModel.fetch({
						success : function(shoppingListModel) {

							var template = _.template($('#add-list-template')
									.html(), {
								list : shoppingListModel
							});
							that.$el.html(template);
							that.showLightbox();
						}
					});

				} else {

					var template = _.template($('#add-list-template').html(), {
						list : null
					});
					this.$el.html(template);
					this.showLightbox();
				}
			},
			events : {
				'click #btn-hide-lightbox' : 'hideLightbox',
				'submit form.add-list' : 'saveList',

			},
			showLightbox : function() {
				$('#over').removeClass('none').addClass('block');
				$('#fade').removeClass('none').addClass('block');

			},

			hideLightbox : function() {
				$('#over').removeClass('block').addClass('none');
				$('#fade').removeClass('block').addClass('none');
				router.navigate('', {
					trigger : true
				});
			},
			saveList : function(ev) {

				var that = this;
				var listDetails = $(ev.currentTarget).serializeObject();

				//alert("cond"+ $(ev.currentTarget).parent().find('#hidden-id').val());
				var modelOptions = !!$(ev.currentTarget).parent().find(
						'#hidden-id').val() ? {
					id : $(ev.currentTarget).parent().find('#hidden-id').val()
				} : {};
				//alert("modelOp" + JSON.stringify(modelOptions));
				var model = !!$(ev.currentTarget).parent().find('#hidden-id')
						.val() ? new ShoppingListUserModel(modelOptions)
						: new ShoppingNewListModel();
				//alert("listdetails" + JSON.stringify(listDetails));
				//listDetails.username=username;		

				model.save(listDetails, {
					success : function(model) {
						// localStorage.setItem(shoppingListUserModel.id,JSON.stringify(shoppingListUserModel));
						router.navigate('home', {
							trigger : true
						});
					}
				});
				this.hideLightbox();
				return false;
			}

		});

		var addItemView = new AddItemView();

		var ShareItemView = Backbone.View.extend({
			el : '.lightbox',

			render : function(options) {

				console.log(JSON.stringify(options));
				/*var user = JSON.parse(localStorage.getItem("user"));
				var username = user["username"];
				console.log("user in add new List:" + username);*/
				if (options.id) {
					var that = this;
					var template;
					if (options.error)
						template = _.template($('#share-list-template').html(),
								{
									id : options.id,
									error : options.error
								});
					else
						template = _.template($('#share-list-template').html(),
								{
									id : options.id,
									error : null
								});
					that.$el.html(template);
					that.showLightbox();

				} else {
					if (options.error)
						var template = _.template($('#share-list-template')
								.html(), {
							list : null,
							error : options.error
						});
					else
						template = _.template($('#share-list-template').html(),
								{
									list : null,
									error : null
								});
					this.$el.html(template);
					this.showLightbox();
				}
			},
			events : {
				'click #btn-hide-lightbox' : 'hideLightbox',
				'submit form.share-list' : 'shareList',

			},
			showLightbox : function() {
				$('#over').removeClass('none').addClass('block');
				$('#fade').removeClass('none').addClass('block');

			},

			hideLightbox : function() {
				$('#over').removeClass('block').addClass('none');
				$('#fade').removeClass('block').addClass('none');
				router.navigate('', {
					trigger : true
				});
			},
			shareList : function(ev) {

				var that = this;
				var listDetails = $(ev.currentTarget).serializeObject();
				//alert("usuario es" + JSON.stringify(listDetails));
				//alert("cond"+ $(ev.currentTarget).parent().find('#hidden-id').val());
				//var userShared = $(ev.currentTarget).parent().find('#userShared').val();

				var shareShoppingListModel = new ShoppingShareListModel();
				shareShoppingListModel.save(listDetails, {
					success : function(shareShoppingListModel) {
					},
					error : function(shareShoppingListModel) {
						//alert("entramos error");
						shareItemView.render({
							id : $(ev.currentTarget).parent()
									.find('#hidden-id').val(),
							error : "User is not existing"
						});
						//var template = _.template($('#share-list-template').html(),{id: $(ev.currentTarget).parent().find('#hidden-id').val()});
						//that.$el.html(template);
						//that.showLightbox();	
					}

				});
				//console.log(JSON.stringify(listDetails));

				//alert("cond"+ $(ev.currentTarget).parent().find('#hidden-id').val());
				/*var modelOptions = !!$(ev.currentTarget).parent().find('#hidden-id').val() ? {id: $(ev.currentTarget).parent().find('#hidden-id').val()}: {};
				//alert("modelOp" + JSON.stringify(modelOptions));
				var model = !!$(ev.currentTarget).parent().find('#hidden-id').val() ? new ShoppingListUserModel(modelOptions): new ShoppingNewListModel();
				//alert("listdetails" + JSON.stringify(listDetails));
				//listDetails.username=username;		
				
				
				
				model.save(listDetails, {
					success : function(model)  {				
					   // localStorage.setItem(shoppingListUserModel.id,JSON.stringify(shoppingListUserModel));
						router.navigate('home', {trigger: true});
					}
				 });*/
				this.hideLightbox();
				return false;
			}

		});

		var shareItemView = new ShareItemView();

		/* EDIT ITEMS OF A LIST*/
		var EditItemView = Backbone.View.extend({
			el : '.lightbox',
			editOptions : {},
			render : function(options) {
				this.editOptions = options;
				var description = (!!options.item ? options.item : null);
				var item = {
					'description' : description
				};
				var template = _.template($('#edit-item-template').html(), {
					item : item
				});
				this.$el.html(template);
				this.showLightbox();
			},
			events : {
				'click #btn-hide-lightboxEdit' : 'hideLightbox',
				'click #btn-edit-item' : 'editItem',

			},
			showLightbox : function() {
				$('#over').removeClass('none').addClass('block');
				$('#fade').removeClass('none').addClass('block');

			},

			hideLightbox : function() {
				$('#over').removeClass('block').addClass('none');
				$('#fade').removeClass('block').addClass('none');
				router.navigate('items/' + this.editOptions.id, {
					trigger : true
				});
			},
			editItem : function(ev) {

				var tempList = JSON.parse(localStorage
						.getItem(this.editOptions.id));
				//	if(tempList.items == null)
				//	alert("No hay items!");

				if (!!this.editOptions.item) {
					var pos = tempList.items.indexOf(this.editOptions.item);
					var spliceDone = tempList.items.splice(pos, 1);

				}
				if (tempList.items == null)
					tempList.items = new Array();

				//tempList.items = tempList.items || [];
				tempList.items.push($("#description").val());

				localStorage.setItem(this.editOptions.id, JSON
						.stringify(tempList));
				this.hideLightbox();
				return false;
			}

		});

		var editItemView = new EditItemView();

		/*END OF EDIT ITEMS OF A LIST*/

		var router = new Router();
		router.on('route:shopping', function() {
			shoppingListsView.render();
		});

		router.on('route:editList', function(id) {
			addItemView.render({
				id : id
			});
		});

		router.on('route:shareList', function(id, error) {
			shareItemView.render({
				id : id,
				error : error
			});
		});

		router.on('route:addList', function(id) {

			addItemView.render({
				id : id
			});
		});

		router.on('route:getItems', function(id) {
			listItemsView.render({
				id : id
			});
		});

		router.on('route:editItem', function(id, item) {
			editItemView.render({
				id : id,
				item : item
			});
		});

		router.on('route:addItem', function(id, item) {
			editItemView.render({
				id : id,
				item : item
			});
		});

		Backbone.history.start();
	</script>
</body>
</html>
