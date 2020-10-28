component extends="framework.one" {

  this.name = "FW1Crud"
  this.datasource = "test"
  this.mappings["/model"] = "model"
  this.customtagpaths = "customtags"
  this.sessionmanagement = true
  this.sessiontimeout = CreateTimeSpan(0,0,45,0)

  variables.framework = {
    reloadApplicationOnEveryRequest = true
  }

}
