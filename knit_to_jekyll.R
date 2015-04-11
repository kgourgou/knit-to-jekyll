
# You may want to set your working directory to the drafts
# folder or wherever you store your drafts. 
# Leave as is if your working directory is the same as the drafts folder 
# when you run this. 

path_to_drafts = get_wd();
setwd(path_to_drafts)

# Don't forget to set the following variables!

myjekyllsite = c("a_cool_blog.github.io") # Url of your jekyll website.
post_author = "you" # Your name
post_path = "path/to/_posts" # The local path to the _posts folder



knitToJekyll <- function(input, title_of_post="", author=post_author, 
                         base.url = myjekyllsite, path_to_posts = post_path, 
                         cp=FALSE) {
  
  # If cp == TRUE, a copy of the post will be moved over to 
    # the folder post_path

  require(knitr);                   
  
  # Do knit magic.
  opts_knit$set(base.url = base.url)
  fig.path <- paste0("figs/", sub(".Rmd$", "", basename(input)), "/")
  opts_chunk$set(fig.path = fig.path)
  opts_chunk$set(fig.cap = "center")
  render_jekyll()
  
  # Grab today's date for filename
  curr_date <- Sys.Date();
  post_filename <- paste(curr_date,"-", input, ".md",sep="") 
  
  # More Knit magic
  knit(paste(input,".Rmd",sep=""), 
       output = post_filename,
       envir = parent.frame())
  
  # Set front-matter of new file.
  yaml_front_matter <- c("---", 
                         "layout: post",
                         paste("title:", title_of_post),
                         paste("author:", author),
                         "---");
  
  
  # Load the whole post into memory.
  post_content <- readLines(post_filename)
  
  # Add yaml.
  post_content <- c(yaml_front_matter, post_content)
  
  # Write back.
  writeLines(post_content, post_filename);

  # Don't forget about the title! 
  if(title_of_post==""){
            warning("Did not find a title for the Jekyll post!")
  }
    
 if(cp){
           # Copy the file over to posts.
            file.copy(from = post_filename, to=path_to_posts,
                      copy.mode=TRUE)

            # Motivational message follows. 
            print(paste("Good job! A copy of the post is over to",path_to_posts))
            print("Share it with the world!")
    }

}
