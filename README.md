# knit-to-jekyll
## Blog like a hacker from R. 

RMarkdown is great for writing files that contain mathematics, code and results
from that code. 

Jekyll is a great blogging platform. 

If you have tried to combine the two, you know the workflow. 

1. Write the post in RMarkdown. 
2. knit it with knitr. 
3. Write yaml front matter at the top. 
4. Save file with today's date in the filename. 
5. Move file and figures to the _posts folder. 

The knit-to-jekyll function attempts to help you by changing that workflow to : 

1. Write post in RMarkdown with filename "title.Rmd". 
2. Run knitToJekyll as 

```R
knitToJekyll("title", title="My awesome post.")
```

3. Move figures to the _posts folder. 


Isn't that much better? 
