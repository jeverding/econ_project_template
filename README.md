# econ_project_template

## Setup

### Tooling
#### Environment manager: Pixi
This template uses ``pixi`` as the default package and environment manager.
It works both with python and R, and also supports some tooling for LaTeX, among others.

To add packages (e.g. python or R) to your pixi environment, add them in the ``[dependencies]`` section of the `pixi.toml`.
Then in your shell (e.g. `bash`) run:
```bash
pixi install
```

The solved environment is in ``pixi.lock``, which should be part of the git repo.
When making changes to the environment in ``pixi.toml`` and updating the env (or simply re-installing via `pixi install`), the content of `pixi.lock` will also be updated.

#### Pre-commit
You can use pre-configured pre-commit hooks to help you with coding (e.g. python, R) and writing (e.g. LaTeX).
You can customize the pre-commit hooks in the file ``.pre-commit-config.yaml``.
For an overview of commonly used hooks, see also:
- https://pre-commit.com/hooks.html
- https://cran.r-project.org/web/packages/precommit/vignettes/available-hooks.html

After setting up your ``pixi`` environment, to install pre-commit hooks run:
```bash
pixi run pre-commit install
```

To run all hooks on all files in the repo, run:
```bash
pixi run pre-commit run --all-files
```

### Raw data reference
If you do not want to put the raw data in the project directory `data_raw/`, you can define a reference to the actual location of the raw data using the environment variable `DATA_RAW_PATH`.
This environment variable can be used by Python, R, and Stata code (in `data_raw/`, see `__init__.py`, `config.R`, and `config.do`, respectively).

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

### Git-Zotero-Sync
You sync references in `writing/references/project.bib` with Zotero via the Better BibTex plugin.
For more information about auto-exports, see [here](https://retorque.re/zotero-better-bibtex/exporting/auto/index.html#managing-auto-exports).
For more information about syncing with git in specific, see [here](https://retorque.re/zotero-better-bibtex/exporting/auto/index.html#git-support).

This git repo is pre-configured such that the Git-Overleaf-Sync includes Zotero references.

### .gitignore
The ``.gitignore`` file is pre-configured with the intention to protect sensitive information from being included in this git repo.
If this is relevant to your project, ensure this is the case, e.g. by customizing the ``.gitignore`` file.
The provider of this template does not take any responsibility for leaked information.
