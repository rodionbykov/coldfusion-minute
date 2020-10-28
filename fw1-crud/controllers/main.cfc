component accessors = "true" {

  property name = "userService";

  public any function init(fw) {
    variables.fw = fw
    return this
  }

  public void function before(rc) {
    param name="rc.word" default="";

    rc.title = "Prototype"
  }

  public void function default(rc) {
    rc.message = "Proceed to user list"
  }

  public void function list(rc) {
    param name="rc.page" default="1";
    param name="rc.pagesize" default="10";

    rc.title = "List Users"

    if (not IsNumeric(rc.page) or rc.page lt 1)
      rc.page = 1

    rc.recordCount = userService.getCount();
    rc.lastPage = rc.recordCount \ rc.pagesize; // integer division operator

    if ((rc.recordCount mod rc.pagesize) gt 0) 
      rc.lastPage = rc.lastPage + 1
    
    if (rc.page GT rc.lastPage) 
      rc.page = rc.lastPage(rc.pagesize)
    
    rc.users = userService.getAll(rc.page, rc.pagesize)
  }

  public void function form(rc){
    param name="rc.id" default="0";
    param name="rc.message" default="";
    
    if(rc.id eq 0){
      rc.title = "Create User"
      rc.user = userService.new()
    } else {
      rc.title = "Edit User"
      rc.user = userService.get(rc.id)
    }
  }

  public void function view(rc){
    param name="rc.id" default="0";

    rc.title = "View User"

    rc.user = userService.get(rc.id)
  }

  public void function save(rc){
    param name="rc.id" default="0";
    param name="rc.message" default="";
    param name="rc.login" default="";
    param name="rc.firstname" default="";
    param name="rc.lastname" default="";

    var user = userService.new()

    if (rc.login eq ""){
      rc.message = "Login cannot be empty";
      variables.fw.redirect("main.form", "all")
    }

    if (rc.firstname eq "" or rc.lastname eq ""){
      rc.message = "Firstname and Lastname cannot be empty"
      variables.fw.redirect("main.form", "all")
    }

    if(IsNumeric(rc.id) and rc.id gt 0)
      user.setID(rc.id)

    variables.fw.populate(user, "login, firstname, lastname")

    userService.saveUser(user)
    
    if (rc.id eq 0)
      rc.message = "has been added"
    else
      rc.message = "has been updated"
    
    rc.message = rc.firstname & " " & rc.lastname & " " & rc.message

    variables.fw.redirect("main.list", "message")
  }

  public void function delete(rc){
    param name="rc.id" default="0";

    userService.delete(rc.id)
    variables.fw.redirect("main.list")
  }

  public void function search(rc){
    param name="rc.page" default="1";
    param name="rc.pagesize" default="10";
    param name="rc.word" default="";

    rc.title = "Search Users"

    if (not IsNumeric(rc.page) or rc.page lt 1)
      rc.page = 1

    rc.recordCount = userService.getCount();
    rc.lastPage = rc.recordCount \ rc.pagesize; // integer division operator

    if ((rc.recordCount mod rc.pagesize) gt 0) 
      rc.lastPage = rc.lastPage + 1
    
    if (rc.page GT rc.lastPage) 
      rc.page = rc.lastPage(rc.pagesize)

    rc.users = userService.find(rc.word)
    variables.fw.setView("main.list")
  }
}
