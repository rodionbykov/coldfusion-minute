<cfoutput>
<div class="container">
    <cfif IsDefined("rc.message") and Len(rc.message) gt 0>
        <div class="alert alert-warning" role="alert">
            #rc.message#
        </div>
    </cfif>
    <form action="index.cfm?action=main.save" method="post">
        <input type="hidden" id="id" name="id" value="#encodeForHTMLAttribute(rc.user.getID())#">  

        <div class="form-group row">
            <label for="login" class="col-sm-2 col-form-label">Login</label>
            <div class="col-sm-6">
                <input id="login" name="login" type="text" class="form-control" placeholder="Login" value="#encodeForHTMLAttribute(rc.user.getLogin())#">
            </div>
        </div>
        <div class="form-group row">
            <label for="firstname" class="col-sm-2 col-form-label">First name</label>
            <div class="col-sm-6">
                <input id="firstname" name="firstname" type="text" class="form-control" placeholder="First name" value="#encodeForHTMLAttribute(rc.user.getFirstname())#">
            </div>
        </div>
        <div class="form-group row">
            <label for="lastname" class="col-sm-2 col-form-label">Last name</label>
            <div class="col-sm-6">
                <input type="text" id="lastname" name="lastname" placeholder="Lastname" class="form-control" value="#encodeForHTMLAttribute(rc.user.getLastname())#">  
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-10">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </div>      
    </form>
</div>
</cfoutput>
