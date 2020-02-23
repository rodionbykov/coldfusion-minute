<div class="container">
<p></p>
<cfoutput>
    <cfif isDefined("rc.message") and NOT isEmpty(rc.message)>
        <div class="alert alert-danger" role="alert">
            #rc.message#
        </div>
    </cfif>
    <form action="index.cfm?action=main.save" method="POST">
        <div class="form-group row">
            <label for="firstname" class="col-sm-2 col-form-label">First name</label>
            <div class="col-sm-6">
                <input id="firstname" name="firstname" type="text" class="form-control" placeholder="First name" value="#encodeForHTML(rc.actor.getFirstname())#">
            </div>
        </div>
        <div class="form-group row">
            <label for="lastname" class="col-sm-2 col-form-label">Last name</label>
            <div class="col-sm-6">
                <input type="text" id="lastname" name="lastname" placeholder="Lastname" class="form-control" value="#encodeForHTML(rc.actor.getLastname())#">  
            </div>
        </div>
        <fieldset class="form-group">
            <div class="row">
            <legend class="col-form-label col-sm-2 pt-0"></legend>
            <div class="col-sm-6">
                <div class="form-check">
                <input class="form-check-input" type="radio" name="active" value="1" <cfif rc.actor.getActive() EQ 1> checked </cfif> >
                <label class="form-check-label" for="active">
                    Active
                </label>
                </div>
                <div class="form-check">
                <input class="form-check-input" type="radio" name="active" value="0" <cfif rc.actor.getActive() EQ 0> checked </cfif> >
                <label class="form-check-label" for="gridRadios2">
                    Inactive
                </label>
                </div>
            </div>
            </div>
        </fieldset>
        <input type="hidden" id="id" name="id" value="#encodeForHTML(rc.actor.getId())#">  
        <div class="form-group row">
            <div class="col-sm-10">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </div>      
    </form>
</cfoutput>
</div>

