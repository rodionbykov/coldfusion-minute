component persistent="true" table="posts" {

    property name="id" column="id" fieldtype="id" generator="identity";
    property name="title" column="title" ormtype="string";
    property name="subtitle" column="subtitle" ormtype="string";
    property name="body" column="body" ormtype="text";
    property name="moment" column="moment" ormtype="timestamp";

    property name="author" fieldtype="many-to-one" cfc="Author" fkcolumn="id_author";
    property name="comments" type="array" fieldtype="one-to-many" cfc="Comment" fkcolumn="id_post" orderby="id desc";

    public any function toStruct(){
        var result = {};

        result.id = THIS.getID();
        result.title = THIS.getTitle();
        result.body = THIS.getBody();
        result.moment = THIS.getMoment();

        result.author = {};
        result.author.id = THIS.getAuthor().getID();
        result.author.firstname = THIS.getAuthor().getFirstName();
        result.author.lastname = THIS.getAuthor().getLastName();

        var comments = THIS.getComments();
        result.comments = [];
        for(var c in LOCAL.comments){
            ArrayAppend(result.comments, c.toStruct());
        }

        return result;
    }

    public any function serialize(){
        var serializer = new JsonSerializer()
                            .asInteger("id")
                            .asDate("moment");
        return serializer.serialize(THIS.toStruct());
    }

}