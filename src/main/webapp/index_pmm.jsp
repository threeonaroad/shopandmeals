<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

  <body>

    <div class="shopping-lists"></div>


    <script type="text/template" id="list-template">

      <p>
        <span class="<%= shopping_list.active ? active : '' %>"><%= shopping_list.description %></span>
      </p>
      <hr/>
      
    </script>

    <script>

    var Router = Backbone.Router.extend({
      routes :  {
        '': 'shopping'
      }

    });

    var router = new Router();
    router.on('route:shopping', function(){
      console.log('router activated')
    });

    Backbone.history.start();

    var ShoppingListsView = Backbone.View.extend({




    });

    var ShoppingListsModel = Backbone.Model.extend({




    });


    var ShoppingListsCollection = Backbone.Collection.extend({




    });



    </script>
  </body>

</html>
<% response.sendRedirect("shopping"); %>