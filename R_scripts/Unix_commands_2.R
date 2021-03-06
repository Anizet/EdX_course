# Instead of cloning an existing repo from github let's initialize a repo on our own computer
# after making a repo of the same name on github
# Find the directory in your computer and go to it then initialise git
git init

# To connect our local repo the the upstream repo use
git remote add origin "https://github.com/Anizet/EdX_course.git"

# if error fatal: remote origin already exists. then try
git remote set-url origin "https://github.com/Anizet/EdX_course.git"

# Once you have the connection you can
git add
git commit -m ""
git branch -M master
git push -u origin master # to add all the files committed to the local repo