# knit-to-jekyll
## Blogging like a hacker, from R. 

[RMarkdown](http://rmarkdown.rstudio.com/) is great for writing files that contain mathematics, code and results
from that code. 

[Jekyll](http://jekyllrb.com/) is a great blogging platform. 

If you have tried to combine the two, you know the workflow. 

1. Write the post in RMarkdown. 
2. knit it with knitr. 
3. Write yaml front matter at the top. 
4. Save file with today's date in the filename. 
5. Move file to the _posts folder. 

The knit-to-jekyll function attempts to help you by changing that workflow to : 

1. Write post in RMarkdown with filename "filename.Rmd". 
2. Run knitToJekyll as 
```R
knitToJekyll("filename", title="My awesome post.")
```

If you also have figures in your post, you would need to move them yourself (until me or someone else writes the extra function calls needed to automate this). 


Isn't that much better? 

[Another work in this direction](https://github.com/yihui/knitr-jekyll), by the creator of knitr.
