component extends="framework.one" {

  this.name = "XiostHR"
  this.datasource = "test"
  this.mappings["/model"]="model"
  this.customtagpaths="customtags"

  variables.framework = {
    reloadApplicationOnEveryRequest = true
  }

}
