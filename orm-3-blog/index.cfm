<cfset ORMReload() />
<cfparam name="URL.route" default="hello" />

<cfinclude template="views/_header.cfm" />

<cfswitch expression="#URL.route#">

    <cfcase value="posts">
        <cfset posts = EntityLoad("Post", {}, "id DESC") />
        <cfinclude template="views/posts.cfm" />
    </cfcase>

    <cfcase value="post">
        <cfparam name="URL.id" default="0" />
        <cfset post = EntityLoadByPK("Post", URL.id) />
        <cfset authors = EntityLoad("Author", {}, "firstname ASC")>
        <cfinclude template="views/post.cfm" />
    </cfcase>

    <cfcase value="new">
        <cfset authors = EntityLoad("Author", {}, "firstname ASC")>
        <cfinclude template="views/new.cfm" />
    </cfcase>

    <cfcase value="do_post">
        <cfparam name="FORM.authorid" default="0" />
        <cfparam name="FORM.posttitle" default="" />
        <cfparam name="FORM.postsubtitle" default="" />
        <cfparam name="FORM.postbody" default="" />
        <cfset post = EntityNew("Post") />
        <cfset post.setTitle(FORM.posttitle) />
        <cfif Len(FORM.postsubtitle) GT 0>
            <cfset post.setSubTitle(FORM.postsubtitle) />
        </cfif>
        <cfset post.setBody(FORM.postbody) />
        <cfset post.setMoment(Now()) />

        <cfset author = EntityLoadByPK("Author", FORM.authorid) />
        <cfif NOT IsNull(author)>
            <cfset post.setAuthor(author) />
            <cfset EntitySave(post) />

            <cflocation url="index.cfm?route=post&id=#post.getID()#" />
        <cfelse>
            <cfabort />
        </cfif>
    </cfcase>

    <cfcase value="authors">
        <cfset authors = EntityLoad("Author", {}, "firstname ASC")>
        <cfinclude template="views/authors.cfm" />
    </cfcase>

    <cfcase value="author">
        <cfparam name="URL.id" default="0" />
        <cfset author = EntityLoadByPK("Author", URL.id)>
        <cfinclude template="views/author.cfm" />
    </cfcase>

    <cfcase value="comments">
        <cfset comments = EntityLoad("Comment", {}, "id DESC")>
        <cfinclude template="views/comments.cfm" />
    </cfcase>

    <cfcase value="do_comment">
        <cfparam name="FORM.authorid" default="0" />
        <cfparam name="FORM.postid" default="0" />
        <cfparam name="FORM.commenttext" default="" />
        <cfset comment = EntityNew("Comment") />
        <cfset comment.setBody(FORM.commenttext) />
        <cfset comment.setMoment(Now()) />

        <cfset post = EntityLoadByPK("Post", FORM.postid) />
        <cfset author = EntityLoadByPK("Author", FORM.authorid) />
        <cfif NOT IsNull(post) AND NOT IsNull(author)>
            <cfset comment.setAuthor(author) />
            <cfset comment.setPost(post) />
            <cfset EntitySave(comment) />

            <cflocation url="index.cfm?route=post&id=#post.getID()#" />
        <cfelse>
            <cfabort />
        </cfif>
    </cfcase>

    <cfcase value="hello">
        <cfset posts = EntityLoad("Post", {}, "id DESC", {maxResults=1}) />
        <cfif ArrayLen(posts) GT 0>
          <cfset post = posts[1] />
        </cfif>
        <cfinclude template="views/hello.cfm" />
    </cfcase>

    <cfdefaultcase>
        <cfinclude template="views/hello.cfm" />
    </cfdefaultcase>
</cfswitch>

<cfinclude template="views/_footer.cfm" />