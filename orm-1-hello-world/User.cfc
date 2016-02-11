component accessors="true" output="false" persistent="true" table="users" {

    property name="id" column="id" fieldtype="id" generator="identity";
    property name="login" column="login" ormtype="string";
    property name="password" column="passwd" ormtype="string";
    property name="firstname" column="firstname" ormtype="string";
    property name="lastname" column="lastname" ormtype="string";
    property name="description" column="description" ormtype="string";

}