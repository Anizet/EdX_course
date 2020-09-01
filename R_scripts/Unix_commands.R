#Unix commands

# to print a string
echo "hello world"


# home directory
#it is 
/c/Users/Arnaud
# nickname is 
~
#example
~/docs


# root directory : where all other directories are, ! it is not c
# represented by :
/

  
# working directory
# nickname :
. # can be useful with the mv command for the file path of the destination ./
# to show working directory :
pwd


# listing a directory's content:
ls
# for more info use the long argument
ls -l
# to also include hidden files use the all argument
ls -a directoryname
# for chronological order the time argument
ls -t
# to reverse the order of showing use 
ls -r
# example
ls -lart

#make a directory
mkdir file1 file2
#remove a directory
rmdir

# remove a directory that is not empty ! it deletes everything!
rm


# to move back to the parent directory (one above)
cd ..
# example to move back to the parent directory of the parent directory:
cd ../..


# to move back to whatever directory you just left:
cd -
# to move back to the home directory
cd


# to move files and directories (always add the last / to make clear that we want to move the file not change its name)
mv path-to-file path-to-destination-directory/ # attention the mv command will overwrite if a file of the same name is already present
# you can use the same command to change the name of a file
# you just need to keep the same destination while changing the name
mv cv.tex resume.tex

# to behave in the same way as mv but to copy instead of moving:
cp

# to remove files
rm file1 file2 file3
# to remove a directory and all the files in it, use the recursive argument
rm -r directoryname
# to force the removal of protected files, use the force argument
rm -rf directoryname

# to quickly look at a text file
less filenameandpath
# q to quit looking



# to get help about a command
#example
ls --help

# you can also pipe on the command line |
ls --help | less
# is also useful for listing files
ls -lart | less

# wild card which will describe everything that fits the pattern
* # for anything
# example
ls *.html
rm *.html

? # for a single character
rm file-???.html #removes all files with 3 characters instead of the ???

#attention pay very much attention while using the wild cards and rm you can brick your computer

# executables are also files, to find where they are:
which
#example:
which mv
which git
which rm

#environment variables: distinguished by $
# the home directory is an environment:
echo $HOME
# to executables path is also one:
echo $PATH
# it is a list of paths which will be looked at in order when trying to run a command (executable)
# for example ls
which # gives us a directory of the variable $PATH

# if the executable is not on the $PATH, you have to write the full path to execute it


# To open a file
start filenameandpath

# to clone a repository
git clone https://github.com/Anizet/homework-o.git

# to check the status of the current working directory in relation to the staging area, local and upstream repositories
git status

# to stage the file (add into the stage area) (note that staging is optional, you can commit right away)
git add filename

# to commit all staged files into the local repository
git commit -m "comment" # it is mandatory to add a comment

# to discard changes in the working directory of a staged file 
git restore filename

# you can commit right away by writing the file name in commit
echo "adding a second line" >> new-file.txt
git commit -m "minor change to new-file" new-file.txt

# to keep track of changes to a file 
git log

# Finally, to push all changes from local repo to upstream repo
git push

# To get all changes from upstream repo to the local repo
git fetch

# To get all changes from our local repo to the working directory
git merge

#To do both previous commands in one go 
git pull