component accessors = "true" {

    property name = "userService";

    public any function init(fw){
        variables.fw = fw
        return this
    }

    public void function before(rc){
        rc.title = "Prototype"
        param name="rc.word" default="";
    }

    public void function default(rc){
        rc.message = "Privet"
    }

    public void function list(rc){
        rc.title = "List Users"
        param name="rc.page" default="1";
        param name="rc.pagesize" default="10";

        if (not IsNumeric(rc.page) or rc.page LT 1){
            rc.page=1;
        }
        rc.recordCount = userService.getUsersCount(rc.page, rc.word, rc.pagesize);
        rc.lastPage = rc.recordCount \ rc.pagesize; // integer division operator
        if ((rc.recordCount mod rc.pagesize) gt 0){
            rc.lastPage=rc.lastPage+1;
        }
        if (rc.page GT rc.lastPage){
           rc.page=rc.lastPage;
        }

        rc.users = userService.getUsers(rc.page, rc.word);
    }

    public void function form(rc){
        param name="rc.id" default="0";
        rc.title = "Form"
        rc.actor = userService.getActor(rc.id)
    }

    public void function view(rc){
        param name="rc.id" default="0";
        rc.title = "View User"
        rc.user = userService.getUser(rc.id)
    }

    public void function save(rc){
        var actor = new model.beans.user();
        if (rc.firstname eq "" or rc.lastname eq ""){
            rc.message = "Firstname and Lastname cannot be empty"
            variables.fw.redirect('main.form', 'id,message')
        }
        variables.fw.populate(actor, "id,firstname,lastname,active")
        sakilaService.saveActor(actor)
        if (rc.id eq 0){
            rc.message = "has been added"
        }
        else {
            rc.message = "has been updated"
        }
        rc.message = rc.firstname & " " & rc.lastname & " " & rc.message
        variables.fw.redirect('main.list','message')
    }

    public void function delete(rc){
        param name="rc.id" default="0";
        sakilaService.deleteActor(rc.id)
        variables.fw.redirect('main.list')
    }

    // public void function search(rc){
    //     param name="rc.word" default="";
    //     rc.actors = sakilaService.searchActor(rc.word)
    //     //variables.fw.redirect('main.list')
    //     variables.fw.setView("main.list")
    // }
}