Template Git Repository
=======================

Standard Starter Git Repository.

*NOTE:* Only modify this file from with the Template Git Repository so that when merging changes your copy is not clobbered by this file when next merging in from the Template git repository.


Generate New Repository:
------------------------

### Method 1 - Clone from the Template Repository

*NOTE:* This method retains the history of the template repository allowing you to easily merge in subsequent changes as they are made in the Template repository.  However, all branches and history from the template repository will be visible in the cloned repository.

  1. Navigate to and login to https://github.com
  2. Navigate into the __Repositories__ tab.
  3. Click on the *TemplateGitRepository*
  4. Ensure the *main* branch has been selected.
  5. Click on the *Code* button and copy onto the clipboard the URL
     For our purposes, let's use: `https://github.com/Shawn1357/TemplateGitRepository.git`.

  6. From your local machine, create a directory to contain the new repository.
  7. Open a Command shell, Power shell or Git Bash shell and navigate to this local directory.
  8. Type in the command<p>
  
    git clone https://github.com/Shawn1357/TemplateGitRepository.git
     
  9. Within the repository, create a remote named *template* so that it can easily be pulled from.

    git remote add --no-tags -t main template https://github.com/Shawn1357/TemplateGitRepository.git
    git fetch template
    git fetch template main
    
  10. You may wish to delete the automatically created *origin* remote:

    git remote remove origin


### Method 2 - Use this repository as a *Repository template*

*NOTE:* This removes the history and all links back to the template repository making it a clean copy unrelated to the source.

  1. Navigate to and login to https://github.com
  2. Navigate into the __Repositories__ tab.
  3. Click on the __New__ button.
  4. Select the __TemplateGitRepository__ as the *Repository template*.
  5. Continue filling in other initial and configuration values.
  6. Click on __Create repository__ button.
  7. Optionallly click on the __Code__ button to create a local clone of the new repository.


Post Clone Steps:
-----------------

After cloning the repository locally, be sure to perform the foillowing one-time only steps to set up the standard git-hooks:

### Common ###
Execute the following commands:

    git config [--global] user.email "youremail@yourdomain.com"
    git config [--global] user.name  "Your Name"

### Windows ###
  1. From a command shell, navigate into the *.githooks* directory within the git repository.
  2. Execute the command:
  
    gitHooksGenerator
  
### Bash Shell ###
  1. From a bash shell, navigate into the *.githooks* directory within the cloned git repository.
  2. Execute the command:

    ./gitHooksGenerator.sh

