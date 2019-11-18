component accessors = "true" {

    public any function init(fw){
        variables.fw =  fw
        return this
    }

    public void function before(rc){
        rc.title = "FW/1 CRUD app"
    }

    public void function default(rc){
        rc.message = "This is default page"
    }

    public void function second(rc){
        rc.title &= ": Second page"
        rc.message = "This is second page"
    }

}
