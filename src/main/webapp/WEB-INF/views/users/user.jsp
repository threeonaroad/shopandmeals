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

div.list-content {
	background-color:#F9F9F8;
	display:block;
	width:95%;
	margin:auto;
	text-align: center;
	border: solid #B6B6B5 1px;
	margin: 0.8em;
	font-size: 1.9em;
}

div.login-content {
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
		<a href="#/add">Add new user |</a>
		<a href="#"  id="edit-mode">Edit user | </a> 
		<a href="#" class="none" id="edit-done">Done</a>
	</div>
	</header>
    <div class="list-content"></div>
    <div class="login-content"></div>
    <div class="lightbox"></div>
    
	

	<script type="text/template" id="add-item-template">
	<div id="over" class="overbox medium">
		<div class="logo">Shop&amp;Meals</div>
		
			<form class="add-user">
				<legend><?= list ? 'Update ' : 'Create New' ?> Usuario</legend>
				<label for="email">Email</label> <input type = "text" name="email"  value="<?= list ? list.get('email') : '' ?>" /> <br>
				<label for="username">Username</label> <input type = "text" name="username"  value="<?= list ? list.get('id') : '' ?>" /> <br>
				<label for="name">Name</label> <input type = "text" name="name"  value="<?= list ? list.get('name') : '' ?>" /> <br>
				
				<label for="password">Password</label> <input type = "text" name="password"  value="<?= list ? list.get('password') : '' ?>" /> <br> 

				<? if (list) { ?>
					<input type="hidden"  name="id" value="<?=list.id?>" />
				<? } ?>
				<button type="submit" id="btn-add-list" href="#">Aceptar</button> 
				<button type="button" id="btn-hide-lightbox" href="#">HideLightBox</button>
			</form>
		</div>
	<div id="fade" class="fadebox">&nbsp;</div>
	</script>

    <script type="text/template" id="list-template">
		<ul>	
			<? _.each(lists,function (list){ ?>
				<li>
					<div class="left">
						<a href="#" class="title"><span class="title"><?= list.get("id")?></span></a>
						<span class="name">Name: <?= !!list.get("name")  ? list.get("name"): ''?> </span>
						<span class="email">Email: <?=  !!list.get("email")  ? list.get("email"): ''?> </span>
						<span class="password">Pass: <?=  !!list.get("password")  ? list.get("password"): ''?> </span>
						<span class="clear"></span>
					</div>
					<div class="right btn-edit-none none">
						<form class="edit-list-item">
							<button type="button" id="edit-user"> Edit user</button>
							<input type="hidden" id ="hidden-id" name="id" value="<?=list.get('id')?>" />
							
						<button type="button" id="remove-user" remove-id="<?=list.get('id')?>"> Remove user</button>
						</form>
					</div>
					<div class="clear"></div>
				</li>
			<? }); ?>
		</ul>		
   </script>
   

   <script type="text/template" id="edit-template">
		<legend><?= list ? 'Update ' : 'Create new' ?> User</legend>
		<form class="edit-user">
			<label for="email">Email</label> <input type = "text" name="email"  value="<?= list ? list.get('email') : '' ?>" /> <br>
				<label for="username">Username</label> <input type = "text" name="username"  value="<?= list ? list.get('id') : '' ?>" /> <br>
				<label for="name">Name</label> <input type = "text" name="name"  value="<?= list ? list.get('name') : '' ?>" /> <br>
				
				<label for="password">Password</label> <input type = "text" name="password"  value="<?= list ? list.get('password') : '' ?>" /> <br> 

			<button type="submit" class="button"><?= list ? 'Update' : 'Create' ?></button>
			<?  if (list){ ?>
				<input type="hidden"  name="id" value="<?=list.id?>" />
				<button class="button delete" >Delete</button>
			<? } ?> 
			
		</form>
   </script>
   
    <script type="text/template" id="login-template">
		<legend>Login User</legend>
		<form class="login-user">
				<label for="username">Username</label> <input type = "text" name="username"  value="" /> <br>
				<label for="password">Password</label> <input type = "text" name="password"  value="" /> <br> 
		
			<button type="submit" class="button register">Login</button>
			<br>
				<button type="button" id="register-user"> Register user</button>
			 
			
		</form>
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
    
    
    var UsersCollection = Backbone.Collection.extend({
		url: 'users/list'
    });
    
    var UsersModel = Backbone.Model.extend({
		urlRoot: 'users/list'
    });
    
    var UsersLogin = Backbone.Model.extend({
		urlRoot: 'users/login'
    });
    
    var Router = Backbone.Router.extend({
      routes :  {
	  
        ''         : 'login',
        'loginOK'  : 'home',
        'home'     : 'users',
        'add'      : 'addList',
        'edit/:id' : 'editList' 
      }

    });
    
    var UsersView = Backbone.View.extend({
		el : '.list-content',
		mode:'moderna',
		render : function(){
			$('.login-content').html('');
			var that = this;
			var usersCollection = new UsersCollection();			
			usersCollection.fetch({
				success : function(usersCollection){
					var template = _.template($('#list-template').html(), {lists: usersCollection.models});
					that.$el.html(template).hide().fadeIn('slow');	
				}
			});
			
		},
		events :{
			'click #remove-user' : 'deleteList',
			'click #edit-user' : 'editList'
		},
		editList : function(ev) {
			router.navigate('edit/' + $(ev.currentTarget).parent().find('#hidden-id').val(), {trigger:true});
		} ,
				
		deleteList : function(ev) {
			var usersModel = new UsersModel({id: $(ev.currentTarget).parent().find('#hidden-id').val()});
			
			usersModel.destroy({
				success:function(usersModel){
					router.navigate('home', {trigger: true});
					
				}
			});
			return false;
		} 
		
    });
        
    
    var usersView = new UsersView();
    
    var AddItemView = Backbone.View.extend({
    	el:'.lightbox',
    	render: function(options){
    		if(options.id){
    			var that = this;
				that.usersModel = new UsersModel({id : options.id});
				that.usersModel.fetch({
					success : function(usersModel){
						
						var template = _.template($('#add-item-template').html(),{list: usersModel});
						that.$el.html(template);
						that.showLightbox();		
					} 
				});
  
    		} else {
    			
	    		var template = _.template($('#add-item-template').html(),{list:null});
	    		this.$el.html(template);
	    		this.showLightbox();	
    		}
    	},
    	events : {
			'click #btn-hide-lightbox' : 'hideLightbox',
			'submit form.add-user' : 'saveList',
			
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
			var usersModel = new UsersModel();
			usersModel.save(listDetails, {
				success : function(usersModel)  {
					localStorage.clear();
					localStorage.setItem("user",JSON.stringify(listDetails));
					window.location.href="http://localhost:8080/shopandmeals/shopping/lists";
					//router.navigate('home', {trigger: true});
				}
			 });
			console.log(listDetails);
			this.hideLightbox();
			return false;
  		}
    	
    });
    
    
    var LoginView = Backbone.View.extend({
    	el:'.login-content',
    	render: function(options){    			
	    		var template = _.template($('#login-template').html(),{list:null});
	    		this.$el.html(template);
	    		this.showLightbox();	
    	},
    	events : {
			'submit form.login-user' : 'checkUser',
			'click #register-user' : 'newUser',
			
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
  		checkUser : function(ev){
  			var listDetails = $(ev.currentTarget).serializeObject();
			var usersLogin = new UsersLogin();
			usersLogin.save(listDetails, {
				success : function(usersLogin)  {
					//router.navigate('home', {trigger: true});
					//window.location("http://localhost:8080/shopandmeals");
					localStorage.clear();
					localStorage.setItem("user",JSON.stringify(listDetails));
					window.location.href="http://localhost:8080/shopandmeals/shopping/lists";
				}
			 });
			console.log(listDetails);
			this.hideLightbox();
			return false;
  		},
  		newUser : function(ev) {
			router.navigate('add', {trigger:true});
			
		} 
    	
    });
    
    
    
    
    var addItemView = new AddItemView();
    var loginView = new LoginView();
    
    var EditListView = Backbone.View.extend({
		el : '.users',
		render : function(options){
			if(options.id) {
				var that = this;
				that.usersModel = new UsersModel({id : options.id});
				that.usersModel.fetch({
					success : function(usersModel){
						var template = _.template($('#edit-template').html(),{list: usersModel});
						that.$el.html(template);
					} 
				});
				
			} else { 
				var template = _.template($('#edit-template').html(),{list: null});
				this.$el.html(template);
			}
				
			
		},
		events :{
			'submit form.edit-user' : 'saveList',
			'click .delete' : 'deleteList'
			
		},
		
		saveList : function(ev){
			
			var listDetails = $(ev.currentTarget).serializeObject();
			var usersModel = new UsersModel();
			usersModel.save(listDetails, {
				success : function(usersModel)  {
					router.navigate('home', {trigger: true});
				}
			 });
			console.log(listDetails);
			return false;
		},
		
		deleteList : function(ev) {
			this.usersModel.destroy({
				success:function(){
					router.navigate('', {trigger: true});
				}
			});
			return false;
		} 
    });
    
    var editListView = new EditListView();
    
    var router = new Router();
    router.on('route:users', function(){
    	usersView.render();
    });
    
    router.on('route:editList', function(id){
        addItemView.render({id:id});
    });
    
    router.on('route:addList',function(id){
    	
    	addItemView.render({id:id});
    });
    
    router.on('route:login', function(){
        loginView.render();
    });
    
    Backbone.history.start();
    </script>
  </body>

</html>
