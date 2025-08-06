Subcommand Template Git Repository
==================================

Standard CLI Subcommand Scripting tempalte repository written in Python.

It is intended that to create a new CLI Subcommand project, you would clone from this repository in order to save you the effort of rebuilding all the basic plumbing required when starting from scratch.
The source URL for the *CLI Subcommand Template* repository is found here:
`https://github.com/Shawn1357/CLISubcommandTemplate.git`


*NOTE:* After cloning into a new project, only modify this file from with the Subcommand Template Git Repository so that when merging changes your copy is not clobbered by this file when next merging in from the CLI Subcommand Template git repository.

*NOTE:* The *CLI Subcommand* repository is cloned from the __TemplateGitRepository__ so that changes made to elements of it may be easily merged into this repository.  It is hoped that this mechanism will be helpful...
The source URL for the *TemplateGitRepository* is found here:
`https://github.com/Shawn1357/TemplateGitRepository.git`


Generate New Repository:
------------------------

### Clone from the CLI Subcommand Template Repository

*NOTE:* This method retains the history of the template repository allowing you to easily merge in subsequent changes as they are made in the *CLI Subcommand Template* repository.  However, all branches and history from the template repository will be visible in the cloned repository.

  1. Navigate to and login to https://github.com
  2. Navigate into the __Repositories__ tab.
  3. Click on the *CLISubcommandTemplate*
  4. Ensure the *main* branch has been selected.
  5. Click on the *Code* button and copy onto the clipboard the URL
     For our purposes, let's use: `https://github.com/Shawn1357/CLISubcommandTemplate.git`.

  6. From your local machine, create a directory to contain the new repository.
  7. Open a Command shell, Power shell or Git Bash shell and navigate to this local directory.
  8. Type in the command<p>
  
    git clone https://github.com/Shawn1357/CLISubcommandTemplate.git .
     
  9. Within the repository, create a remote named *subcommand* so that it can easily be pulled from.

    git remote add --no-tags -t main subcommand https://github.com/Shawn1357/CLISubcommandTemplate.git
    git fetch subcommand
    git fetch subcommand main
    
  10. You may wish to delete the automatically created *origin* remoten as it will be pointing to the template repository rather than this new one:

    git remote remove origin


Post Clone Steps:
-----------------

After cloning the repository locally, be sure to perform the following one-time only steps to set up the standard git-hooks:

### Common ###
Execute the following commands:

    git config [--global] user.email "youremail@yourdomain.com"
    git config [--global] user.name  "Your Name"

### Windows ###
  1. From a command shell, navigate into the *.githooks* directory within the git repository.
  2. Execute the command:
  
    ./gitHooksGenerator
  
### Bash Shell ###
  1. From a bash shell, navigate into the *.githooks* directory within the cloned git repository.
  2. Execute the command:

    ./gitHooksGenerator.sh

