// COMMENT.CFC

component persistent="true" table="comments" {

    property name="id" column="id" fieldtype="id" generator="identity";
    property name="body" column="body" ormtype="text";
    property name="moment" column="moment" ormtype="timestamp";

    property name="post" fieldtype="many-to-one" cfc="Post" fkcolumn="id_post";
    property name="author" fieldtype="many-to-one" cfc="Author" fkcolumn="id_author";

    public any function toStruct(){
        var result = {};

        result.id = THIS.getID();
        result.body = THIS.getBody();
        result.moment = THIS.getMoment();
        result.author = {};
        result.author.id = THIS.getAuthor().getID();
        result.author.firstname = THIS.getAuthor().getFirstName();
        result.author.lastname = THIS.getAuthor().getLastName();
        result.post = {};
        result.post.id = THIS.getPost().getID();
        result.post.title = THIS.getPost().getTitle();

        return result;
    }

    public any function serialize(){
        var serializer = new JsonSerializer()
                            .asInteger("id")
                            .asDate("moment");
        return serializer.serialize(THIS.toStruct());
    }

}