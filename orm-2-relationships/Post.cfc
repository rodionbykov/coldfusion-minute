component persistent="true" table="posts" {

    property name="id" column="id" fieldtype="id" generator="identity";
    property name="title" column="title" ormtype="string";
    property name="subtitle" column="subtitle" ormtype="string";
    property name="body" column="body" ormtype="text";
    property name="moment" column="moment" ormtype="timestamp";

    property name="author" fieldtype="many-to-one" cfc="User" fkcolumn="id_author";

}