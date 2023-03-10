Template Git Repository
=======================

Standard Starter Git Repository.

*TODO:* Edit this file once you have created your repository.


Generate New Repository:
------------------------

  1. Navigate to and login to https://github.com
  2. Navigate into the __Repositories__ tab.
  3. Click on the __New__ button.
  4. Select the __TemplateGitRepository__ as the *Repository template*.
  5. Continue filling in other initial and configuration values.
  6. Click on __Create repository__ button.
  7. Optionallly click on thE __Code__ button to create a local clone of the new repository.


Post Clone Steps:
-----------------

After cloning the repository locally, be sure to perform the foillowing one-time only steps to set up the standard git-hooks:

### Windows ###
  1. From a command shell, navigate into the .githooks directory within the git repository.
  2. Execute the command: __gitHooksGenerator__
  
### Bash Shell ###
  1. From a bash shell, navigate into the .githooks directory within the cloned git repository.
  2. Execute the command: __./gitHooksGenerator.sh__

