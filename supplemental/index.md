---
title: "Design-Cost Optimization"
author: "Jesse Wheeler"
output: html_document
---

----------------------

This set of notes and slides provide a brief introduction to optimizing design based on cost constraints.
They will not be presented in class, but serve as a good reference to learn about the topic.

The basic premise here is that, in a nested design, we sometimes have a choice between how many higher-or-lower level units to include in the study.
Generally, we want as many units as possible that correspond to our treatment, though this is not always possible due to realistic cost constraints.

As a motivating example, we consider a nested CRD with pigs and pens; we assign a food treatment to each *pen*, making the pens our higher-level unit.
Since treatment is assigned to pen, typically the more pens we have, the better we can detect the signal of the treatment effect.
However, a new pen may cost more to build and maintain than it is to just put more pigs into existing pens.
Here, we demonstrate how you can use results from a pilot study to optimize the number of pigs-to-pen allocation based on the cost of both pigs and pens.
This is followed by a brief power-calculation, showing how to compute the number of pens needed given the results of the pilot study and the optimal pigs-to-pen allocation.
These calculations can be made for more complex designs as needed.


| &nbsp;           | &nbsp;                          |
|:-----------------------|:------------------------:|
| Lecture slides   | [pdf](slides.pdf) |
| Lecture notes    | [pdf](notes.pdf) |

----------------------



----------------------

[Back to course homepage](../index.html)  
[Acknowledgements](../acknowledge.html)  
[Source code for these notes](http://github.com/jeswheel/5200_f26/tree/main/supplemental/)


----------------------
