<cfoutput>
<h1>#rc.title#</h1>
<form>
  <div class="form-group">
    <label for="exampleInputEmail1">Login</label>
    <input type="text" class="form-control" id="userLogin" aria-describedby="emailHelp" placeholder="Enter login">
    <small id="emailHelp" class="form-text text-muted">Login to be used by User</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  <div class="form-group">
    <input type="text" id="userFirstName" name="userLastName">
  </div>
  <div class="form-group">
    <input type="text" id="userLastName" name="userLastName">
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</cfoutput>