<div class="container">
<div class="row">
  <div class="col">
    <cfif isDefined("rc.message") AND NOT isEmpty(rc.message)>
    <div class="alert alert-success" role="alert">
        <cfoutput>#rc.message#</cfoutput>
    </div>
    </cfif>
    <p><a class="btn btn-primary" href="index.cfm?action=main.form">Add New</a></td></p>
  </div>
</div>
<div class="row">
  <div class="col">
    <table class="table table-hover">
        <thead class="thead-dark">
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Login</th>
                <th scope="col">Name</th>
                <th scope="col">Description</th>
                <th scope="col">Edit</th>
                <th scope="col">Delete</th>
            </tr>
        </thead>
        <tbody>
            <cfloop array="#rc.users#" index="u">
                <cfoutput>
                    <tr>
                        <td scope="row">#u.getId()#</td>
                        <td><a href="index.cfm?action=main.view&id=#u.getId()#">#encodeForHTML(u.getLogin())#</a></td>
                        <td>#encodeForHTML(u.getLastFirstName())#</td>
                        <td>#encodeForHTML(u.getDescription())#</td>
                        <td><a class="btn btn-primary" href="index.cfm?action=main.form&id=#u.getId()#">Edit</a></td>
                        <td><a class="btn btn-danger" href="index.cfm?action=main.delete&id=#u.getId()#">Delete</a></td>
                    </tr>
                </cfoutput>
            </cfloop>
        </tbody>
    </table>
  </div>
</div>
<cf_paging url="#buildurl("main.list")#" currentPage="#rc.page#" lastPage="#rc.lastPage#" word="#rc.word#" pagesize="#rc.pagesize#">

</div>