<!DOCTYPE html>
<html lang=en>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://bootswatch.com/flatly/bootstrap.min.css" />

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <title>Lucee Minute: ORM 2 - Relationships</title>
    </head>
    <cfset ORMReload() />
    <cfoutput>
    <body>
        <div class="container">
            <div class="jumbotron">
                <h1>Lucee Minute</h1>
                <p class="lead">ORM 2 - Relationships</p>
            </div>
            <div class="row">
                <h1>Load Entity and its related Entities</h1>
                <p class="lead">Get User: function EntityLoadByPK</p>

                <blockquote class="blockquote">
                    <p>EntityLoadByPK("User", 1);</p>
                </blockquote>

                <cfset user = EntityLoadByPK("User", 1) />

                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th><th>Login</th><th>Full Name</th><th>Description</th>
                        </tr>
                    </thead>
                        <tr>
                            <td>#user.getID()#</td><td>#user.getLogin()#</td><td>#user.getFirstName()# #user.getLastName()#</td><td>#user.getDescription()#</td>
                        </tr>
                </table>

                <p>User has associated blog Posts, such relationship is called 'one-to-many'. Associated entities are returned in array.</p>

                <blockquote class="blockquote">
                    <p>user.getPosts();</p>
                </blockquote>

                <cfset posts = user.getPosts() />

                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th><th>Title</th><th>Subtitle</th><th>Body</th><th>Moment</th>
                        </tr>
                    </thead>
                    <tbody>
                    <cfloop array="#posts#" index="p">
                        <tr>
                            <td>#p.getID()#</td><td>#p.getTitle()#</td><td>#Left(p.getSubtitle(), 40)#&hellip;</td><td>#Left(p.getBody(), 40)#&hellip;</td><td>#DateFormat(p.getMoment(), "long")#</td>
                        </tr>
                    </cfloop>
                    </tbody>
                </table>
            </div>
            <div class="row">
                <h1>Add related entity</h1>

                <p class="lead">Create Post entity</p>

                <blockquote class="blockquote">
                    <p>post = EntityNew("Post"); post.setTitle("Blah"); EntitySave(post);</p>
                </blockquote>

                <p>Hint: do not set NOT NULL to foreign key field, Posts.id_author in our case. Lucee will INSERT entity first, and later UPDATE it to associate with User.</p>

                <cfset post = EntityNew("Post") />
                <cfset post.setTitle("Blah") />
                <cfset post.setBody("Blah Blah Blah") />
                <cfset post.setMoment(Now()) />
                <cfset EntitySave(post) />

                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th><th>Title</th><th>Subtitle</th><th>Body</th><th>Moment</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>#post.getID()#</td><td>#post.getTitle()#</td><td>#Left(post.getSubtitle(), 40)#&hellip;</td><td>#Left(post.getBody(), 40)#&hellip;</td><td>#DateFormat(post.getMoment(), "long")#</td>
                        </tr>
                    </tbody>
                </table>

                <p class="lead">Add Post: function addPost</p>

                <blockquote class="blockquote">
                    <p>user.addPost(post);</p>
                </blockquote>

                <p>Lucee will add Post to User's Posts array, and automatically associate Post with User in database. No need to save User entity - Lucee will do it for you.</p>

                <cfset user.addPost(post) />

                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th><th>Title</th><th>Subtitle</th><th>Body</th><th>Moment</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>#post.getID()#</td><td>#post.getTitle()#</td><td>#Left(post.getSubtitle(), 40)#&hellip;</td><td>#Left(post.getBody(), 40)#&hellip;</td><td>#DateFormat(post.getMoment(), "long")#</td>
                        </tr>
                    </tbody>
                </table>

            </div>
        </div>
    </body>
    </cfoutput>
</html>