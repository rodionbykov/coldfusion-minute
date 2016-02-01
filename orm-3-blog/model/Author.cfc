// AUTHOR.CFC

component persistent="true" table="users" {

    property name="id" column="id" fieldtype="id" generator="identity";
    property name="login" column="login" ormtype="string";
    property name="firstname" column="firstname" ormtype="string";
    property name="lastname" column="lastname" ormtype="string";
    property name="description" column="description" ormtype="string";

    property name="posts" type="array" fieldtype="one-to-many" cfc="Post" fkcolumn="id_author" orderby="id desc";
    property name="comments" type="array" fieldtype="one-to-many" cfc="Comment" fkcolumn="id_author" orderby="id desc";

    public any function toStruct(){
        var result = {};

        result.id = THIS.getID();
        result.firstname = THIS.getFirstName();
        result.lastname = THIS.getLastName();

        result.posts = [];
        var posts = THIS.getPosts();
        for (var p in LOCAL.posts){
            ArrayAppend(result.posts, p.toStruct());
        }

        result.comments = [];
        var comments = THIS.getComments();
        for (var c in LOCAL.comments){
            ArrayAppend(result.comments, c.toStruct());
        }

        return result;
    }

    public any function serialize(){
        var serializer = new JsonSerializer()
                            .asInteger("id");
        return serializer.serialize(THIS.toStruct());
    }

}