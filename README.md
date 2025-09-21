# econ_project_template

## Setup

### Raw data reference
If you do not want to put the raw data in the project directory `data_raw/`, you can define a reference to the actual location of the raw data using the environment variable `DATA_RAW_PATH`.

### Git-Overleaf-Sync
To sync the `writing/` subdir with Overleaf, use the custom command `wh` as defined below (or directly the git commands therein).
This needs the following steps once as preparation:
1. Log in to Overleaf and create Overleaf project. 
1. Inside the Overleaf project, open menu/sync/git to get the git path, ending on `<your-overleaf-project-id`
1. `cd` into git project repo 
1. Run `git remote add overleaf https://git.overleaf.com/<your-overleaf-project-id>`
1. Run `git remote -v` to verify second remote is configured correctly
```bash
function wh() {
  echo "Pull writing/ from Overleaf first (to avoid merge conflicts there)..."
  git subtree pull --prefix=writing overleaf master --squash || return
  echo "Push writing/ to Overleaf..."
  git subtree push --prefix=writing overleaf master"
}
```

### .gitignore
The ``.gitignore`` file is pre-configured with the intention to protect sensitive information to be included in this git repo. 
If this is relevant to your project, ensure this is the case, e.g. by customizing the ``.gitignore`` file.
The provider of this template does not take any responsibility for leaked information.
