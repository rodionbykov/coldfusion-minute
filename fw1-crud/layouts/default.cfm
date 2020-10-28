<cfoutput>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5">
    <title>#rc.title# - FW/1 CRUD application</title>


    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="assets/css/styles.css" rel="stylesheet">
  </head>
  <body>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
  <a class="navbar-brand" href="#buildURL('')#">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="##navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarsExampleDefault">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#buildURL()#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#buildURL("main.list")#">List</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#buildURL("main.form")#">Add</a>
      </li>
      <!---
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="##" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
        <div class="dropdown-menu" aria-labelledby="dropdown01">
          <a class="dropdown-item" href="##">Action</a>
          <a class="dropdown-item" href="##">Another action</a>
          <a class="dropdown-item" href="##">Something else here</a>
        </div>
      </li>
      --->
    </ul>
    <cfoutput>
    <form class="form-inline my-2 my-lg-0" action="#buildurl("main.search")#" method="POST">
      <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search" name="word" value="#rc.word#">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
    </cfoutput>
  </div>
</nav>
<main role="main">
  <cfoutput>#body#</cfoutput>
</main>

<footer class="container">
  <p>&copy; #Year(Now())#</p>
</footer>
<script src="assets/js/jquery-3.3.1.slim.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
</cfoutput>