
# First steps in data science

In this workshop we will be looking at how to use the [**command line**](https://en.wikipedia.org/wiki/Command-line_interface) and [**RStudio**](https://www.rstudio.com/) to do some useful analysis of data derived from bacterial genomic sequence.

More specifically we will:

1. Use the **command line** to look at and manipulate some [***metadata***](https://en.wikipedia.org/wiki/Metadata).
2. Use **RStudio** to explore and edit the *metadata*.
3. Reproduce a figure from a [paper](https://journals.plos.org/plosgenetics/article?id=10.1371/journal.pgen.1008850#sec025)  in **RStudio** using the data.

# Command line

The command line is a text-based application for viewing, handling, and manipulating files on your computer. It's a program that takes in commands, which it passes on to the computer's operating system to run.

## Files and folders

The file explorer is accessible using the button in left corner of the navigation bar. You can create a new file by clicking the **New file** button in the file explorer. You can also create folders by clicking the **New folder** button.

## moving around

type `pwd` 
**pwd** or *present working directory* prints the full pathname of the current working directory to the screen.

We can also see what files are there.

type `ls`
**ls** is a command to *list* computer files and directories.

We can see there is a folder:
 `DBS_files`.

type ` cd DBS_files`
**cd** or *change directory* lets us move into a different space.

To check we have moved:

type `pwd` 

what is here:

type `ls`

*Question: How many files are there?*

type `ls | wc -l`

*Question: What does the console output read?*

*Question: so what are `|` and `wc`?*

type `man wc`

Let's see whats in a file

type `less deltaBS_1.dbs`

---
> **_Activity_**  Discuss the data.
> **_Aim_** We want a seperate file that contains the mean DBS value for each sample
---
 

### autocomplete



## Rename a file



## Delete a file


