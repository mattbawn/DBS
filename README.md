
# First steps in data science

*some points to link to*

- What does biological data look like: Genome sequence
- Why are computational tools well suited to text-based data

In this workshop we will be looking at how to use the [**command line**](https://en.wikipedia.org/wiki/Command-line_interface) and [**RStudio**](https://www.rstudio.com/) to do some useful analysis of data derived from bacterial genomic sequence.

More specifically we will:

1. Use the **command line** to look at and manipulate some [***metadata***](https://en.wikipedia.org/wiki/Metadata).
2. Use **RStudio** to [explore and edit the *metadata*](merge_data_in_R.md).
3. [Reproduce a figure](plot-data.md) from a [paper](https://journals.plos.org/plosgenetics/article?id=10.1371/journal.pgen.1008850#sec025)  in **RStudio** using the data.

# Command line

The command line is a text-based application for viewing, handling, and manipulating files on your computer. It's a program that takes in commands, which it passes on to the computer's operating system to run.

## Files and folders

Files in Linux are identified by their names, which can include letters, numbers, and other characters. They can be text files, binary files, or executable files, and they are stored on the file system in a specific location.

Folders, also known as directories, are used to organize files and other directories. A directory can contain any number of files and other directories, and it is identified by its name. Directories can be created, renamed, and deleted just like files.

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
> **_Activity:_**  Discuss the data.

> **_Aim:_** We want a seperate file that contains the mean DBS value for each sample
---
 
type `grep "MEAN" *.dbs`

*Question: What is the output?*

but we want a file

type `grep "MEAN" *.dbs > deltaBS_mean.txt`

> **_Next_** Now we have our file we can [combine this data with some other data types](merge_data_in_R.md)

## Further Exploration

Commands like `mkdir` and `rm` can also be used to work with files and folders in linux.  `mkdir` is used to create a new directory, and `rm` is used to remove a file or directory.

Additionally, the `cp` and `mv` command can be used to copy and move files and directories, respectively.



