<!DOCTYPE html>
<html>
  <head>
    <title>Backbone MVC(ollection): Shopping List</title>
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
	font-size: 1em;
	text-shadow: -2px -2px 0px #048f29;
	border: solid #0ccc6f 1px;
	background: -webkit-gradient(linear, 0 0, 0 100%, from(#53DF00), to(#58A72A));
	background: -moz-linear-gradient(top, #53DF00, #58A72A);
	height: 1.2em;
}
h1 {
	font-family: Courier, monospace;
	color: #048f29;
	padding: 0.5em;
	font-size: 1.3em;
	text-shadow: -1px -1px 0px #B6B6B5;
}
div.list-content,div.list-items {
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
	
    <div class="list-content" id="lists"></div>
   
    <div class="list-items" id="items"></div>
 
    <div class="lightbox"></div>
    
	

	<script type="text/template" id="add-list-template">
	<div id="over" class="overbox medium">
		<div class="logo">Shop&amp;Meals</div>
		
			<form class="add-list">
				<legend><?= list ? 'Actualizar ' : 'Crear Nueva' ?> Lista</legend>
				<input type = "text" name="description"  value="<?= list ? list.get('description') : '' ?>" />
				<? if (list) { ?>
					<input type="hidden"  name="id" value="<?=list.id?>" />
				<? } ?>
				<button type="submit" id="btn-add-list" href="#">Aceptar</button> 
				<button type="button" id="btn-hide-lightbox" href="#">HideLightBox</button>
			</form>
		</div>
	<div id="fade" class="fadebox">&nbsp;</div>
	</script>
	
	
	<script type="text/template" id="add-item-template">
	<div id="over" class="overbox medium">
		<div class="logo">Shop&amp;Meals</div>
		
			<form class="add-list">
				<legend><?= list ? 'Actualizar ' : 'Crear Nueva' ?> Lista</legend>
				<input type = "text" name="description"  value="<?= list ? list.get('description') : '' ?>" />
				<? if (list) { ?>
					<input type="hidden"  name="id" value="<?=list.id?>" />
				<? } ?>
				<button type="submit" id="btn-add-list" href="#">Aceptar</button> 
				<button type="button" id="btn-hide-lightbox" href="#">HideLightBox</button>
			</form>
		</div>
	<div id="fade" class="fadebox">&nbsp;</div>
	</script>
	
	
	<script type="text/template" id="edit-item-template">
	<div id="over" class="overbox medium">
		<div class="logo">Shop&amp;Meals</div>
		
			<form class="add-list">
				<legend><?= item ? 'Editar ' : 'Crear Nuevo' ?> Item</legend>

				<input type = "text" name="description" id="description" value="<?= item ? item.description : '' ?>" />
				<button type="button" id="btn-edit-item" href="#">Aceptar</button> 
				<button type="button" id="btn-hide-lightbox" href="#">HideLightBox</button>
			</form>
		</div>
	<div id="fade" class="fadebox">&nbsp;</div>
	</script>

    <script type="text/template" id="list-template">
		<header>
			<div class="logo">Shop&amp;Meals |
				<a href="#/add">Add new list |</a>
				<a href="#"  id="edit-lists-mode">Edit lists | </a> 
				<a href="#"  id="edit-lists-done">Done</a>
			</div>
		</header>
		<ul>	
			<? _.each(lists,function (list){ 
				/* Storing a copy of every list object so we do not call the database unnecessarily */
				localStorage.setItem(list.get("id"),JSON.stringify(list)) ?>
				<li>
					<div class="left">
						<a href="#/items/<?=list.get('id')?>" class="title"><span class="title"><?= list.get("description")?></span></a>
						<span class="items"><?= !!list.get("items")  ? list.get("items").length: 0?> Items</span>
						<span class="date"><?=  !!list.get("date")  ? new Date(list.get("date")).toDateString() : ''?></span>
						<span class="clear"></span>
					</div>
					<div class="right btn-edit-none">
						<form class="edit-list-item">
							<button type="button" id="edit-list"> Edit list</button>
							<input type="hidden" id ="hidden-id" name="id" value="<?=list.get('id')?>" />
						<button type="button" id="remove-list" remove-id="<?=list.get('id')?>"> Remove</button>
						</form>
					</div>
					<div class="clear"></div>
				</li>
			<? }); ?>
		</ul>		
   </script>
   
   <script type="text/template" id="list-items-template">
		<header>
			<div class="logo">Shop&amp;Meals |
				<a href="#/addItem">Add new items |</a>
				<a href="#/editItem"  id="edit-items-mode">Edit item | </a> 
				<a href="#/itemsdone"  id="edit-items-done">Done</a>
			</div>
		</header>
		<h1><?=items.description?></h1>
		<hr/>
		<ul>
		<form id = "list-items">
		<? if (items.items !==  null) {  
			
			 _.each(items.items,function (item){ 
				/*Storing a copy of every list object so we do not call the database unnecessarily*/ ?>
				
				<li>
					<div class="left">
						<span class="title"><?=item?></span>
					</div>
					<div class="right">
						<input type="hidden" id ="hidden-desc" name="description" value="<?=item?>" />
						<button type="button" id="edit-item"> Edit Items</button>
						<button type="button" id="remove-item"> Remove</button>
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
   
   <!-- <script type="text/template" id="edit-template">
		<legend><?= list ? 'Update ' : 'Create new' ?> List</legend>
		<form class="edit-form">
			<label for="description">Description</label> <input type = "text" name="description"  value="<?= list ? list.get('description') : '' ?>" />
			<label for="active">Active list</label><input type="checkbox" name="active" /> 
		
			<hr/>
			<button type="submit" class="button"><?= list ? 'Update' : 'Create' ?></button>
			<?  if (list){ ?>
				<input type="hidden"  name="id" value="<?=list.id?>" />
				<button class="button delete" >Delete</button>
			<? } ?> 
			
		</form>
   </script>-->
   

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
					        class: 'items',
					        text:"0 items"  
					    }),
					     $('<span>', { 
					            class: 'date' ,
					            text: '29/Mar/2013'
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
    
   /* $('#edit-mode').click(function(){
    	$('.btn-edit-none').removeClass('none').addClass('block').hide().fadeIn('slow');
    	$('#edit-done').removeClass('none').hide().fadeIn('slow');
    	$(this).addClass('none');
    });
    
    $('#edit-done').click(function(){
    	//$('.btn-edit-none').css({display:none});
    	$('#edit-mode').addClass('block').hide().fadeIn('slow');
    	$('#edit-done').addClass('none');
    });*/
        
    _.templateSettings = {
    	    interpolate: /\<\?\=(.+?)\?\>/gim,
    	    evaluate: /\<\?([\s\S]+?)\?\>/gim,
    	    escape: /\<\?\-(.+?)\?\>/gim
    	};
    
    var ShoppingListsCollection = Backbone.Collection.extend({
		url: 'shopping'
    });
    
    var ShoppingListModel = Backbone.Model.extend({
		urlRoot: 'shopping'
    });
    
    var ListItemsCollection = Backbone.Collection.extend({
		url: 'shopping/items'
    });
    
    var ListItemsModel = Backbone.Model.extend({
    	urlRoot: 'shopping/items'
    });
    
    var ItemsDoneModel = Backbone.Model.extend({
    	urlRoot: 'shopping/items'
    });
    
    var Router = Backbone.Router.extend({
      routes :  {
        ''                       : 'shopping',
        'home'                   : 'shopping',
        'add'                    : 'addList',
        'edit/:id'               : 'editList',
        'items/:id'              : 'getItems',
        'items/removed/:id'		 : 'getItems',	
        'editItem/:id/:item'     : 'editItem'
      }

    });
    
    var ListItemsView = Backbone.View.extend({
		el     : '.list-content',
		listId : '',
		render : function(options){
			this.listId = options.id;
			console.log("options"+ options+ "listId"+ this.listId);
			var listJSONobj = JSON.parse(localStorage.getItem(options.id));
			var template = _.template($('#list-items-template').html(), {items: listJSONobj });
			this.$el.html(template).hide().fadeIn('slow');
		},
		events :{
			'click #remove-item' : 'deleteList',
			'click #edit-item' : 'editList',
			'click #edit-items-done' : 'doneItems',
			'submit form#list-items' : 'saveItems'
		},
		editList : function(ev) {
			
			router.navigate('editItem/' + this.listId + "/" + $(ev.currentTarget).parent().find('#hidden-desc').val(), {trigger:true});
		},
		
		
		
		deleteList : function(ev) {
			
			var tempList = JSON.parse(localStorage.getItem(this.listId));
			var element = $(ev.currentTarget).parent().find('#hidden-desc').val();
			
			var pos = tempList.items.indexOf(element);
  			var spliceDone = tempList.items.splice(pos,1);
  			localStorage.setItem(this.listId,JSON.stringify(tempList));
  			router.navigate('items/removed/'+ this.listId, {trigger: true});
  			return false;
		},
		doneItems: function(ev) {
			$('#list-items').trigger('submit');
		},
		saveItems: function(ev) {
			var idTemp = this.listId;
			//var listDetails = $(ev.currentTarget).serializeObject();
			var itemsDoneModel = new ItemsDoneModel({id: this.listId});
			var listDetails = JSON.parse(localStorage.getItem(this.listId));
			itemsDoneModel.save(listDetails, {
				success : function(itemsDoneModel)  {
					router.navigate('home', {trigger: true});
				}
			});
			return false;
		}
		
    });
    
    var listItemsView = new ListItemsView();
    
    
    

    var ShoppingListsView = Backbone.View.extend({
		el : '.list-content',
		mode:'moderna',
		render : function(){
			var that = this;
			var shoppingListsCollection = new ShoppingListsCollection();
			shoppingListsCollection.fetch({
				success : function(shoppingListsCollection){
					var template = _.template($('#list-template').html(), {lists: shoppingListsCollection.models});
					that.$el.html(template).hide().fadeIn('slow');
				}
			});
		},
		events :{
			'click #remove-list' : 'deleteList',
			'click #edit-list' : 'editList'
		},
		editList : function(ev) {
			router.navigate('edit/' + $(ev.currentTarget).parent().find('#hidden-id').val(), {trigger:true});
		} ,
		
		
		
		deleteList : function(ev) {
			
			var shoppingListModel = new ShoppingListModel({id: $(ev.currentTarget).parent().find('#hidden-id').val()});
			
			shoppingListModel.destroy({
				success:function(shoppingListModel){
					router.navigate('home', {trigger: true});
					
				}
			});
			return false;
		} 
		
    });
    
    var shoppingListsView = new ShoppingListsView();
    
    var AddItemView = Backbone.View.extend({
    	el:'.lightbox',
    	render: function(options){
    		if(options.id){
    			var that = this;
				that.shoppingListModel = new ShoppingListModel({id : options.id});
				that.shoppingListModel.fetch({
					success : function(shoppingListModel){
						
						var template = _.template($('#add-list-template').html(),{list: shoppingListModel});
						that.$el.html(template);
						that.showLightbox();		
					} 
				});
  
    		} else {
    			
	    		var template = _.template($('#add-list-template').html(),{list:null});
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
    		router.navigate('', {trigger: true});
  		},
  		saveList : function(ev){
  			var listDetails = $(ev.currentTarget).serializeObject();
			var shoppingListModel = new ShoppingListModel();
			shoppingListModel.save(listDetails, {
				success : function(shoppingListModel)  {
					router.navigate('home', {trigger: true});
				}
			 });
			this.hideLightbox();
			return false;
  		}
    	
    });
    
    var addItemView = new AddItemView();
    
    /* EDIT ITEMS OF A LIST*/
     var EditItemView = Backbone.View.extend({
    	el:'.lightbox',
    	editOptions : {},
    	render: function(options){
    		this.editOptions = options;
    		var description = (!!options.item ? options.item : null);
    		var item = { 'description': description };
    		var template = _.template($('#edit-item-template').html(),{ item:item });
	    	this.$el.html(template);
	    	this.showLightbox();	
    	},
    	events : {
			'click #btn-hide-lightbox' : 'hideLightbox',
			'click #btn-edit-item' : 'editItem',
			
    	},
    	showLightbox : function() {
    		$('#over').removeClass('none').addClass('block');
    		$('#fade').removeClass('none').addClass('block');
    		
  		},
  		
    	hideLightbox : function() {
    		$('#over').removeClass('block').addClass('none');
    		$('#fade').removeClass('block').addClass('none');
    		router.navigate('items/'+ this.editOptions.id, {trigger: true});
  		},
  		editItem : function(ev){
  			var tempList = JSON.parse(localStorage.getItem(this.editOptions.id));
  			var pos = tempList.items.indexOf(this.editOptions.item);
  			console.log("pos:" + pos);
  			var spliceDone = tempList.items.splice(pos,1);
  			console.log("splice: "+ spliceDone);
  			tempList.items.push($("#description").val());
  			console.log("temList: "+ tempList.items);
  			
  			localStorage.setItem(this.editOptions.id,JSON.stringify(tempList));
  			
  			//router.navigate('items/'+ this.editOptions.id, {trigger: true});
  			
  			this.hideLightbox();
  			return false;
  		}
    	
    });
    
    var editItemView = new EditItemView();
    
    /*END OF EDIT ITEMS OF A LIST*/
    
    
    var router = new Router();
    router.on('route:shopping', function(){
      shoppingListsView.render();
    });
    
    router.on('route:editList', function(id){
        addItemView.render({id:id});
    });
    
    router.on('route:addList',function(id){
    	
    	addItemView.render({id:id});
    });
    
    router.on('route:getItems',function(id){
    	listItemsView.render({id:id});
    });
    
    router.on('route:editItem',function(id,item){
    	editItemView.render({id:id,item:item});
    });

    Backbone.history.start();
    
    </script>
  </body>
</html>
