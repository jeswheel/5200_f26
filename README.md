## Stat 5200/6200, Fall 2026

Course materials for Math 5200 are posted online at https://jeswheel.github.io/stat5200\_f26/

Recently, I have switch LaTeX generators for this course. 
The main reason for doing so is increase accessibility.
To make sure you can run this, you need to have installed the *LaTeX-lab* bundle for alternative text and tagging.

```
tlmgr install latex-lab
```

With this installed, we can now use alt-text for images. Some key things to know:

- In `\includegraphics` option, `alt={}` can be used for the alternative text.
- Setting `artifact` should tell a PDF reader that an image is an artifact and doesn't need alternative text.
- Setting `actualtext=<LETTER>` will replace a picture of a Unicode like image. Useful for like the R programming logo, for instance.

Unfortunately, it's not currently working for the `notes.pdf` files.
The problem is there is a conflict with `beamerarticle` package that doesn't allow the `\\DocumentMetadata` command.
Thus, it will currently work for accessible `syllabus.pdf`, but not `notes.pdf`. 

### Notes to self

