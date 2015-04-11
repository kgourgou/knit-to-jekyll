
# You may want to set your working directory to the drafts
# folder. 
#setwd("")

# Url of your jekyll website.
myjekyllsite = c("a_cool_blog.github.io")
post_author = "you"

post_path = "path/to/_posts";

knitToJekyll <- function(input, title="", author=post_author, base.url = myjekyllsite, path_to_posts = post_path) {
   
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
                         paste("title:", title),
                         paste("author:", author),
                         "---");
  
  
  # Load the whole post into memory.
  post_content <- readLines(post_filename)
  
  # Add yaml.
  post_content <- c(yaml_front_matter, post_content)
  
  # Write back.
  writeLines(post_content, post_filename);
  
}
