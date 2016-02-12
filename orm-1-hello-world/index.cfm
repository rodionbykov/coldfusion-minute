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
        <title>Lucee Minute: ORM 1 - Hello World</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <cfoutput>
                <h1>Load Entities</h1>
                <p class="lead">Get Users: function EntityLoad</p>

                <blockquote class="blockquote">
                    <p>EntityLoad("User");</p>
                </blockquote>

                <cfset users = EntityLoad("User") />
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th><th>Login</th><th>Full Name</th><th>Description</th>
                        </tr>
                    </thead>
                    <cfloop array="#users#" index="u">
                        <tr>
                            <td>#u.getID()#</td><td>#u.getLogin()#</td><td>#u.getFirstName()# #u.getLastName()#</td><td>#u.getDescription()#</td>
                        </tr>
                    </cfloop>
                </table>
            </div>
            <div class="row">
                <h1>Load Entity</h1>
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

                <h1>Update Entity</h1>
                <p class="lead">Update and Save User: function EntitySave</p>
                <p>We'll take random user and change user's description with random value</p>

                <blockquote class="blockquote">
                    <p>user.setDescription("some text"); EntitySave(user);</p>
                </blockquote>

                <!--- text database --->
                <cfset listAdjectives = "Brave,Great,Strong,Talented,Old,Young" />
                <cfset listNouns = "Apprentice,Grasshopper,Mentor,Master,Teacher,Warrior" />

                <!--- pick random user from users array we had retrieved before --->
                <cfset i = RandRange(1, ArrayLen(users)) />
                <cfset randomUser = users[i] />
            </div>
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
                                <td>#randomUser.getID()#</td><td>#randomUser.getLogin()#</td><td>#randomUser.getFirstName()# #randomUser.getLastName()#</td><td>#randomUser.getDescription()#</td>
                            </tr>
                    </table>
                </div>

                <!--- pick one random adjective and one random noun --->
                <cfset adjective = ListGetAt(listAdjectives, RandRange(1, ListLen( listAdjectives ))) />
                <cfset noun = ListGetAt(listNouns, RandRange(1, ListLen( listNouns ))) />

                <!--- set description field of user to new value --->
                <cfset randomUser.setDescription(adjective & " " & noun) />

                <!--- save to database --->
                <cfset EntitySave(randomUser) />

                <div class="col-md-6">
                    <h4>After</h4>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th><th>Login</th><th>Full Name</th><th>Description</th>
                            </tr>
                        </thead>
                            <tr>
                                <td>#randomUser.getID()#</td><td>#randomUser.getLogin()#</td><td>#randomUser.getFirstName()# #randomUser.getLastName()#</td><td>#randomUser.getDescription()#</td>
                            </tr>
                    </table>
                </div>
            </div>
            <div class="row">
                <h1>Loading Entities Again</h1>
                <p class="lead">Checking changes made</p>

                <blockquote class="blockquote">
                    <p>EntityLoad("User");</p>
                </blockquote>

                <cfset users = EntityLoad("User") />
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th><th>Login</th><th>Full Name</th><th>Description</th>
                        </tr>
                    </thead>
                    <cfloop array="#users#" index="u">
                        <tr>
                            <td>#u.getID()#</td><td>#u.getLogin()#</td><td>#u.getFirstName()# #u.getLastName()#</td><td>#u.getDescription()#</td>
                        </tr>
                    </cfloop>
                </table>
            </div>
            <div class="row">
                <h1>Inserting Entity</h1>
                <p class="lead">Adding new User: function EntityNew</p>
                <p>Create new entity and fill its properties:</p>

                <blockquote class="blockquote">
                    <p>newUser = EntityNew("User"); newUser.setLogin("sith"); newUser.setFirstName("Darth"); newUser.setLastName("Maul"); EntitySave(newUser);</p>
                </blockquote>
                <p>There's no ID, since ID is assigned by database server, and also we omitted Description field, which remained empty.</p>
                <cfset newUser = EntityNew("User") />
                <cfset newUser.setLogin("sith") />
                <cfset newUser.setFirstName("Darth") />
                <cfset newUser.setLastName("Maul") />
                <cfset EntitySave(newUser) />

                <p class="lead">Loading data again with EntityLoad function</p>
                <cfset users = EntityLoad("User") />
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th><th>Login</th><th>Full Name</th><th>Description</th>
                        </tr>
                    </thead>
                    <cfloop array="#users#" index="u">
                        <tr>
                            <td>#u.getID()#</td><td>#u.getLogin()#</td><td>#u.getFirstName()# #u.getLastName()#</td><td>#u.getDescription()#</td>
                        </tr>
                    </cfloop>
                </table>
            </div>
            <div class="row">
                <h1>Removing Entity</h1>
                <p class="lead">Deleting User: function EntityDelete</p>

                <blockquote class="blockquote">
                    <p>EntityDelete(newUser)</p>
                </blockquote>

                <p>After delete we use ORMFlush function to commit changes to database. Normally changes committed at page request end.</p>

                <blockquote class="blockquote">
                    <p>ORMFlush()</p>
                </blockquote>

                <p>Important to remember that after delete object still exists, but lost its connection with database</p>

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
                                    <td>#newUser.getID()#</td><td>#newUser.getLogin()#</td><td>#newUser.getFirstName()# #newUser.getLastName()#</td><td>#newUser.getDescription()#</td>
                                </tr>
                        </table>
                    </div>

                    <cfset EntityDelete(newUser) />
                    <!--- run ORMFlush to commit changes --->
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
                                    <td>#newUser.getID()#</td><td>#newUser.getLogin()#</td><td>#newUser.getFirstName()# #newUser.getLastName()#</td><td>#newUser.getDescription()#</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <p class="lead">Loading data again with EntityLoad function</p>
                    <p>Check that record is gone</p>
                    <cfset users = EntityLoad("User") />
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th><th>Login</th><th>Full Name</th><th>Description</th>
                            </tr>
                        </thead>
                        <tbody>
                            <cfloop array="#users#" index="u">
                            <tr>
                                <td>#u.getID()#</td><td>#u.getLogin()#</td><td>#u.getFirstName()# #u.getLastName()#</td><td>#u.getDescription()#</td>
                            </tr>
                            </cfloop>
                        </tbody>
                    </table>
                </div>
            </cfoutput>
        </div>
    </body>
</html>