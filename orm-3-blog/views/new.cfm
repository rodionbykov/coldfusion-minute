<cfoutput>
    <!-- Page Header -->
    <!-- Set your background image for this header on the line below. -->
    <header class="intro-header" style="background-image: url('views/img/home-bg.jpg')">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <div class="site-heading">
                        <h1>Lucee Blog</h1>
                        <hr class="small">
                        <span class="subheading">Blog powered by Lucee and ORM</span>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <h2 class="post-title">
                   New Post
                </h2>
                <form action="index.cfm?route=do_post" method="post">
                        <fieldset class="form-group">
                          <label for="authorid">Author</label>
                          <select id="authorid" name="authorid" class="form-control">
                            <cfloop array="#authors#" index="a">
                            <option value="#a.getID()#">#a.getFirstName()# #a.getLastName()#</option>
                            </cfloop>
                          </select>
                        </fieldset>
                        <fieldset class="form-group">
                          <label for="posttitle">Post title</label>
                          <input id="posttitle" name="posttitle" class="form-control" />
                        </fieldset>
                        <fieldset class="form-group">
                          <label for="postsubtitle">Post sub-title</label>
                          <input id="postsubtitle" name="postsubtitle" class="form-control" />
                        </fieldset>
                        <fieldset class="form-group">
                          <label for="postbody">Post body</label>
                          <textarea id="postbody" name="postbody" class="form-control"></textarea>
                        </fieldset>
                        <fieldset class="form-group">
                            <button type="submit" class="btn btn-default">Post</button>
                        </fieldset>
                    </form>
            </div>
        </div>
    </div>
</cfoutput>