<div class="container">
  <div class="row">
    <div class="col">
      <h2>User details: <cfoutput>#rc.user.getLogin()#</cfoutput>
    </div>
  </div>
  <div class="row">
    <div class="col">
      <table class="table table-hover">
        <tbody>
          <cfoutput>
            <tr>
              <td>ID</td>
              <td scope="row">#rc.user.getId()#</td>
            </tr>
            <tr>
              <td>Login</td>
              <td>#encodeForHTML(rc.user.getLogin())#</td>
            </tr>
            <tr>
              <td>First name</td>
              <td>#encodeForHTML(rc.user.getFirstName())#</td>
            </tr>
            <tr>
              <td>Last name</td>
              <td>#encodeForHTML(rc.user.getLastName())#</td>
            </tr>
            <tr>
              <td>Description</td>
              <td>#encodeForHTML(rc.user.getDescription())#</td>
            </tr>
            <tr>
              <td><a class="btn btn-primary" href="index.cfm?action=main.form&amp;id=#rc.user.getId()#">Edit</a></td>
              <td><a class="btn btn-danger" href="index.cfm?action=main.delete&amp;id=#rc.user.getId()#">Delete</a></td>
            </tr>
          </cfoutput>
        </tbody>
      </table>
    </div>
  </div>
</div>
