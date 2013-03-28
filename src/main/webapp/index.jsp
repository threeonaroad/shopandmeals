<!DOCTYPE html>
<html>

  <head>
    <title>Backbone MVC(ollection): Shopping List</title>
    <!--  <link href="todos.css" media="all" rel="stylesheet" type="text/css"/> -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/json2/20121008/json2.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.4.4/underscore-min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/backbone.js/0.9.10/backbone-min.js"></script>
    
  </head>
  <style>
  
  table {
   width: 100%;
   border: 1px solid #000;
}
th, td {
   width: 25%;
   text-align: left;
   vertical-align: top;
   border: 1px solid #000;
   
   padding: 0.9em;
   caption-side: bottom;
}
caption {
   padding: 0.3em;
   color: #fff;
    background: #000;
}
th {
   background: #eee;
}

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

    <div class="shopping-lists"></div>


    <script type="text/template" id="list-template">
<br/><br/>
		<a href="#/new" class="button">New Shopping List</a>
<br/><br/>
		<table>
			<thead>
				<tr>
					<th>Id</th>
					<th>Description</th>
					<th>Active</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<? _.each(lists,function (list){ ?>
					<tr style:"border-bottom:1px solid grey">
					<td><?= list.get("id")?></td>
					<td><?= list.get("description")?></td>
					<td><?= list.get("active")?></td>
					<td><a href="#/edit/<?=list.get('id')?>" class="button">Edit</a></td>
				</tr>
				
					
			<? }); ?>
				
			</tbody>
		</table>
   </script>
   
   <script type="text/template" id="edit-template">
		<legend><?= list ? 'Update ' : 'Create new' ?> List</legend>
		<form class="edit-form">
			<label for="description">Description</label> <input type = "text" name="description"  value="<?= list ? list.get('description') : '' ?>" />
			<label for="active">Active list</label><input type="checkbox" name="active" /> 
		
			<hr/>
			<button type="submit" class="button"><?= list ? 'Update' : 'Create' ?></button>
			<?  if (list){ ?>
				<input type="hidden" name="id" value="<?=list.id?>" />
				<button class="button delete">Delete</button>
			<? } ?> 
			
		</form>
   </script>

    <script>
    
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
   /* $.ajaxPrefilter( function( options, originalOptions, jqXHR ) {
    	  options.url = "http://localhost:8080/planmymeals/" +  options.url;
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
    
    var Router = Backbone.Router.extend({
      routes :  {
        ''         : 'shopping',
        'new'      : 'editList',
        'edit/:id' : 'editList' 
      }

    });

    var ShoppingListsView = Backbone.View.extend({
		el : '.shopping-lists',
		render : function(){
			var that = this;
			var shoppingListsCollection = new ShoppingListsCollection();
			shoppingListsCollection.fetch({
				success : function(shoppingListsCollection){
					var template = _.template($('#list-template').html(), {lists: shoppingListsCollection.models});
					that.$el.html(template);	
				}
			})
			
		}


    });
    
    var shoppingListsView = new ShoppingListsView();
    
    var EditListView = Backbone.View.extend({
		el : '.shopping-lists',
		render : function(options){
			if(options.id) {
				var that = this;
				that.shoppingListModel = new ShoppingListModel({id : options.id});
				that.shoppingListModel.fetch({
					success : function(shoppingListModel){
						var template = _.template($('#edit-template').html(),{list: shoppingListModel});
						that.$el.html(template);
					} 
				})
				
			} else { 
				var template = _.template($('#edit-template').html(),{list: null});
				this.$el.html(template);
			}
				
			
		},
		events :{
			'submit form.edit-form' : 'saveList',
			'click .delete' : 'deleteList'
			
		},
		
		saveList : function(ev){
			
			var listDetails = $(ev.currentTarget).serializeObject();
			var shoppingListModel = new ShoppingListModel();
			shoppingListModel.save(listDetails, {
				success : function(shoppingListModel)  {
					router.navigate('', {trigger: true});
				}
			 });
			console.log(listDetails);
			return false;
		},
		
		deleteList : function(ev) {
			this.shoppingListModel.destroy({
				success:function(){
					router.navigate('', {trigger: true});
				}
			});
			return false;
		} 
    });
    var editListView = new EditListView();
    
    var router = new Router();
    router.on('route:shopping', function(){
      shoppingListsView.render();
    });
    
    router.on('route:editList', function(id){
        editListView.render({id:id});
    });
    
    Backbone.history.start();


    var ShoppingListsModel = Backbone.Model.extend({




    });


   



    </script>
  </body>

</html>
