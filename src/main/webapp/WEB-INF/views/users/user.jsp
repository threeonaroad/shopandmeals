<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>Backbone MVC(ollection): Shopping List</title>
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
<link rel="stylesheet" href="/shopandmeals/resources/css/login.css">
</head>


<body>

	<header>
	</header>
	
	<div class="list-content"></div>
	<div class="login-content"></div>
	<div class="register-content"></div>

	<div class="separation">
		<hr />
	</div>
	<p class="separation">Aplicaci&oacute;n desarrollada por el equipo
		técnico de s&M. Con la colaboración de la empresa de diseño Origami. Y
		v&aacute;monos para Jap&oacuten ya !!.Aplicaci&oacute;n desarrollada
		por el equipo técnico de s&M. Con la colaboración de la empresa de
		diseño Origami. Y v&aacute;monos para Jap&oacuten ya
		!!.Aplicaci&oacute;n desarrollada por el equipo técnico de s&M. Con la
		colaboración de la empresa de diseño Origami. Y v&aacute;monos para
		Jap&oacuten ya !!.Aplicaci&oacute;n desarrollada por el equipo técnico
		de s&M. Con la colaboración de la empresa de diseño Origami. Y
		v&aacute;monos para Jap&oacuten ya !!.Aplicaci&oacute;n desarrollada
		por el equipo técnico de s&M. Con la colaboración de la empresa de
		diseño Origami. Y v&aacute;monos para Jap&oacuten ya !!.</p>



	<script type="text/template" id="register-template">

<h3>Registrate y comienza a usar <span class="highlight">{{shop&amp;meals}}</span></h3>
  <form class="add-user">
    <div class="separation"><hr/></div>
<span class="login-error hidden" id="login-error">&nbsp;</span>
<div class="login-bubble">

<div class="login">
 
 <div class="input-prepend">
  <span class="add-on icon-user"></span>
  <input class="" id="" type="text" placeholder="Username" name="username" value="<?=list ? list.get('id'): ''?>">
 </div>
 <div class="input-prepend">
  <span class="add-on icon-mail"></span>
  <input class="" id="" type="text" placeholder="Email" name="email" value="<?=list ? list.get('email'): ''?>">
 </div>
 <div class="input-prepend">
  <span class="add-on icon-lock"></span>
  <input class="" id="" type="password" placeholder="Password" name="password" value="<?=list ? list.get('password'): ''?>">
 </div>
 <? if (list) { ?>
    <input type="hidden"  name="id" value="<?=list.id?>" />
   <? } ?>
 <div class="controls">
  <input type="submit" value="Registrate" />
 </div>
</div>
</div>
<h4>¿ Ya tienes usuario ?. <a class="highlight" id="register-user" href="">{{Entra}}</a></h4>


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
  <h3>Comienza a usar <span class="highlight">{{shop&amp;meals}}</span> ahora</h3>
  <form class="login-user">
    <div class="separation"><hr/></div>
<span class="login-error hidden" id="login-error">&nbsp;</span>
<div class="login-bubble">

<div class="login">
 
 <div class="input-prepend">
  <span class="add-on icon-user"></span>
  <input class="" id="" type="text" placeholder="Username" name="username">
 </div>
 <div class="input-prepend">
  <span class="add-on icon-lock"></span>
  <input class="" id="" type="password" placeholder="Password" name="password">
 </div>
 <div class="controls">
  <input type="submit" value="Entra" />
 </div>
</div>
</div>
<h4>¿ A&uacute;n no tienes cuenta ?. <a class="highlight" href="#registerUser">{{Registrate}}</a></h4>

   
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
						o[this.name] = [ o[this.name] ];
					}
					o[this.name].push(this.value || '');
				} else {
					o[this.name] = this.value || '';
				}
			});
			return o;
		};

		/*END OF PLUGINS*/
		/* $.ajaxPrefilter( function( options, originalOptions, jqXHR ) {
		 	  options.url = "http://localhost:8080/planmymeals/" +  options.url;
		 });*/

		_.templateSettings = {
			interpolate : /\<\?\=(.+?)\?\>/gim,
			evaluate : /\<\?([\s\S]+?)\?\>/gim,
			escape : /\<\?\-(.+?)\?\>/gim
		};

		var UsersCollection = Backbone.Collection.extend({
			url : 'users/list'
		});

		var UsersModel = Backbone.Model.extend({
			urlRoot : 'users/list'
		});

		var UsersLogin = Backbone.Model.extend({
			urlRoot : 'users/login'
		});

		var Router = Backbone.Router.extend({
			routes : {

				'' : 'login',
				'loginOK' : 'home',
				'home' : 'users',
				'registerUser' : 'addList',
				'edit/:id' : 'editList'
			}

		});

		var UsersView = Backbone.View.extend({
			el : '.list-content',
			mode : 'moderna',
			render : function() {
				$('.login-content').html('');
				var that = this;
				var usersCollection = new UsersCollection();
				usersCollection.fetch({
					success : function(usersCollection) {
						var template = _.template($('#list-template').html(), {
							lists : usersCollection.models
						});
						that.$el.html(template).hide().fadeIn('slow');
					}
				});

			},
			events : {
				'click #remove-user' : 'deleteList',
				'click #edit-user' : 'editList'
			},
			editList : function(ev) {
				router.navigate(
						'edit/'
								+ $(ev.currentTarget).parent().find(
										'#hidden-id').val(), {
							trigger : true
						});
			},

			deleteList : function(ev) {
				var usersModel = new UsersModel({
					id : $(ev.currentTarget).parent().find('#hidden-id').val()
				});

				usersModel.destroy({
					success : function(usersModel) {
						router.navigate('home', {
							trigger : true
						});

					}
				});
				return false;
			}

		});

		var usersView = new UsersView();

		var AddItemView = Backbone.View
				.extend({
					el : '.login-content',
					render : function(options) {

						if (options.id) {
							var that = this;
							that.usersModel = new UsersModel({
								id : options.id
							});
							alert();
							that.usersModel.fetch({
								success : function(usersModel) {

									var template = _.template($(
											'#register-template').html(), {
										list : usersModel
									});

									this.$el.html(template).hide().fadeIn(
											'slow');
								}
							});
						} else {

							var template = _.template($('#register-template')
									.html(), {
								list : null
							});

							this.$el.html(template).hide().fadeIn('slow');
						}
					},
					events : {
						'submit form.add-user' : 'saveList',

					},
					saveList : function(ev) {
						var registrationDetails = $(ev.currentTarget)
								.serializeObject();
						var usersModel = new UsersModel();
						usersModel
								.save(
										registrationDetails,
										{
											success : function(usersModel) {
												if (usersModel != null) {
													localStorage.clear();
													localStorage
															.setItem(
																	"user",
																	JSON
																			.stringify(registrationDetails));
													window.location.href = window.location.protocol + "//" +window.location.host+ "/shopandmeals/shopping/lists";
												} else {
													//TODO mostrar error
													alert('User already Exit');
												}
											}

										});
						return false;
					}

				});

		var LoginView = Backbone.View
				.extend({
					el : '.login-content',
					render : function(options) {
						var template = _.template($('#login-template').html(),
								{
									list : null
								});
						this.$el.html(template).hide().fadeIn('slow');
						this.showLightbox();
					},
					events : {
						'submit form.login-user' : 'checkUser',
						'click #register-user' : 'newUser'

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
					checkUser : function(ev) {
						var listDetails = $(ev.currentTarget).serializeObject();
						var usersLogin = new UsersLogin();
						usersLogin
								.save(
										listDetails,
										{
											success : function(usersLogin) {
												//router.navigate('home', {trigger: true});
												//window.location("http://localhost:8080/shopandmeals");
												localStorage.clear();
												localStorage
														.setItem(
																"user",
																JSON
																		.stringify(listDetails));
												window.location.href = window.location.protocol + "//" +window.location.host+ "/shopandmeals/shopping/lists";
											}
										});
						console.log(listDetails);
						this.hideLightbox();
						return false;
					},
					newUser : function(ev) {
						router.navigate('registerUser', {
							trigger : true
						});

					}

				});

		var addItemView = new AddItemView();
		var loginView = new LoginView();

		var EditListView = Backbone.View.extend({
			el : '.users',
			render : function(options) {
				if (options.id) {
					var that = this;
					that.usersModel = new UsersModel({
						id : options.id
					});
					that.usersModel.fetch({
						success : function(usersModel) {
							var template = _.template($('#edit-template')
									.html(), {
								list : usersModel
							});
							that.$el.html(template);
						}
					});

				} else {
					var template = _.template($('#edit-template').html(), {
						list : null
					});
					this.$el.html(template);
				}

			},
			events : {
				'submit form.edit-user' : 'saveList',
				'click .delete' : 'deleteList'

			},

			saveList : function(ev) {

				var listDetails = $(ev.currentTarget).serializeObject();
				var usersModel = new UsersModel();
				usersModel.save(listDetails, {
					success : function(usersModel) {
						router.navigate('home', {
							trigger : true
						});
					}
				});
				console.log(listDetails);
				return false;
			},

			deleteList : function(ev) {
				this.usersModel.destroy({
					success : function() {
						router.navigate('', {
							trigger : true
						});
					}
				});
				return false;
			}
		});

		var editListView = new EditListView();

		var router = new Router();
		router.on('route:users', function() {
			usersView.render();
		});

		router.on('route:editList', function(id) {
			addItemView.render({
				id : id
			});
		});

		router.on('route:addList', function(id) {

			addItemView.render({
				id : id
			});
		});

		router
				.on(
						'route:login',
						function() {
							if (!!localStorage.getItem('user')) {
								window.location.href = window.location.protocol + "//" +window.location.host+ "/shopandmeals/shopping/lists";

							} else {
								loginView.render();
							}
						});

		Backbone.history.start();
	</script>
</body>

</html>
