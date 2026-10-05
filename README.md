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

### TODOs

- [ ] **major item, spring 2027**. The `main.Rnw -> notes.pdf` workflow should be made more accessible.
`latex-lab` should make this somewhat simple. 
However, a major problem is that `\DocumentMetadata` triggers the `latex-lab` modules, which overwrite low-level components such as lists and blocks.
This specifically has a conflict with the `beamerarticle` package, which is needed to convert the beamer-like code to a the notes pdf.
Can this framework be updated / modified?


### Notes to self

- Lecture 0: syllabus. I think this went fairly well. Introduction and syllabus took about an hour, left 15 minutes to introduce R.
Next time, have a ready .csv file to demonstrate loading, etc. Slightly more organized R / R Studio introduction. About 20 students stayed.
- Early on, give a homework assignment that emphasizes notation, like $y_{ij}$ and $y_{i \bullet}$. For instance, give some data from an experiment, ask students to compute specific values, checking their understanding of the notation.
- Create a more detailed reading structure. Chapters that I like for 5000-level students include:
  - Chapter 1 (about 10 pages, very light)
  - Chapter 2 (about 15 pages, very light)
  - Chapter 3.1 -- 3.8 (about 21 pages, math-heavy)
  - Chapter 4.1 -- 4.2 (6 pages)
  - 5.1--5.2, 5.6, 5.7, 5.8 (about 7 pages, light) (5.3 -- 5.5 is good and the material should be covered, but it's beyond wat 5000-level students need / want). 
  - 6.1--6.2 (more sections in this chapter?)
  - Cha
- For 6000-level students, additional reading might be a good idea:
  - 4.3--4.4 (orthogonal and polynomial contrasts)
  - 5.3--5.5 (mathematics of multiple comparisons)
- If we keep doing reading assignments, consider adding some HW questions directly from the reading.
