<cfoutput>
    <!-- Page Header -->
    <!-- Set your background image for this header on the line below. -->
    <header class="intro-header" style="background-image: url('views/img/post-bg.jpg')">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <div class="post-heading">
                        <h1>#post.getTitle()#</h1>
                        <h2 class="subheading">#post.getSubTitle()#</h2>
                        <span class="meta">Posted by <a href="index.cfm?route=author&amp;id=#post.getAuthor().getID()#">#post.getAuthor().getFirstName()# #post.getAuthor().getLastName()#</a> on #DateFormat(post.getMoment(), "long")#</span>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Post Content -->
    <article>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    #post.getBody()#
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                        <h3>Comments</h3>
                        <cfif post.hasComments()>
                            <cfloop array="#post.getComments()#" index="c">
        					   <div class="post-preview">
                                   #c.getBody()#
                                   <p class="post-meta">Comment by <a href="index.cfm?route=author&amp;id=#c.getAuthor().getID()#">#c.getAuthor().getFirstName()# #c.getAuthor().getLastName()#</a> on #DateFormat(c.getMoment(), "long")#</p>
        					   </div>
                            </cfloop>
                        <cfelse>
                            <p>None yet, be first to comment!</p>
                        </cfif>
                </div>
            </div>
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <form action="index.cfm?route=do_comment" method="post">
						<input type="hidden" name="postid" value="#post.getID()#" />
					    <fieldset class="form-group">
					      <label for="authorid">Author</label>
					      <select id="authorid" name="authorid" class="form-control">
							<cfloop array="#authors#" index="a">
							<option value="#a.getID()#">#a.getFirstName()# #a.getLastName()#</option>
							</cfloop>
						  </select>
					    </fieldset>
					    <fieldset class="form-group">
					      <label for="commenttext">Comment text</label>
					      <textarea id="commenttext" name="commenttext" class="form-control"></textarea>
					    </fieldset>
					    <fieldset class="form-group">
						    <button type="submit" class="btn btn-default">Comment</button>
						</fieldset>
					</form>
                </div>
			</div>
        </div>
    </article>

    <hr>
</cfoutput>