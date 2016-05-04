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
                    <p>user = EntityLoadByPK("User", 1);</p>
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

                <p class="lead">User has associated blog Posts, such relationship is called 'one-to-many'</p>

                <blockquote class="blockquote">
                    <p>posts = user.getPosts();</p>
                </blockquote>

                <cfset posts = user.getPosts() />

                <p>Associated entities are returned in array.</p>

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
                                
                <p class="lead">We can check if User entity has associated Posts entities</p>

                <blockquote class="blockquote">
                    <p>hasPost = user.hasPost();</p>
                </blockquote>

                <cfset hasPost = user.hasPost() />

                <p>Result of this operation is returned as boolean value, 'true' if Posts array has elements, and 'false' if it is empty</p>

                <cfdump var="#hasPost#" />                                
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

                <p>Lucee will add Post to User's Posts array, and automatically associate Post with User in database (fill <em>id_author</em> field). No need to save User entity - Lucee will do it for you.</p>

                <cfset user.addPost(post) />

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

                <h1>Remove related entity</h1>

                <p class="lead">Remove Post: function removePost</p>

                <blockquote class="blockquote">
                    <p>user.removePost(post);</p>
                </blockquote>

                <p>Lucee will remove Post from User's Posts array and de-associate Post with User (nullify <em>id_author</em> field in database).</p>

                <cfset user.removePost(post) />

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

                <p class="lead">Delete Post from database with EntityDelete</p>

                <blockquote class="blockquote">
                    <p>EntityDelete(post);</p>
                </blockquote>

                <p>Post will not be removed from database after de-association. You'll need to explicitly delete it.</p>

                <cfset EntityDelete(post) />

                <cfset ORMFlush() />

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

                <h1>Manipulate parent entity</h1>

                <p class="lead">Each of Post entities is aware of parent User (Author) entity through relationship called 'many-to-one'</p>

                <cfset post = posts[ RandRange(1, ArrayLen(posts)) ] />

                <p>Pick random Post and re-associate it with random User</p>

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

                <p class="lead">Get/Set Post's Author: getAuthor and setAuthor</p>

                <blockquote class="blockquote">
                    <p>author = post.getAuthor(); post.setAuthor(newAuthor);</p>
                </blockquote>

                <cfset author = post.getAuthor() />

                <p>In database Lucee will change <em>id_author</em> for Post, re-associating Post with new User (Author)</p>

                <div class="row">
                    <div class="col-md-6">
                        <h4>Before</h4>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th><th>Login</th><th>Full Name</th><th>Description</th>
                                </tr>
                            </thead>
                                <tr>
                                    <td>#author.getID()#</td><td>#author.getLogin()#</td><td>#author.getFirstName()# #author.getLastName()#</td><td>#author.getDescription()#</td>
                                </tr>
                        </table>
                    </div>

                    <cfset users = EntityLoad("User") />

                    <cfset newAuthor = users[ RandRange(1, ArrayLen(users)) ] />

                    <cfset post.setAuthor(newAuthor) />

                    <!--- it's not necessary to do, but to be sure data is changed in db --->
                    <cfset ORMFlush() />

                    <div class="col-md-6">
                        <h4>After</h4>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th><th>Login</th><th>Full Name</th><th>Description</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>#newAuthor.getID()#</td><td>#newAuthor.getLogin()#</td><td>#newAuthor.getFirstName()# #newAuthor.getLastName()#</td><td>#newAuthor.getDescription()#</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!--- for demo purposes returning post's author back --->
                    <cfset post.setAuthor(author) />
                    <cfset ORMFlush() />

                </div>

            </div>
        </div>
    </body>
    </cfoutput>
</html>