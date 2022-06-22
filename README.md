# delete_from_another_repo_action
This GitHub Action removes a path from a remote repository

# Example Workflow
    name: Remove Path

    on: push

    jobs:
      remove-path:
        runs-on: ubuntu-latest
        steps:
        - name: Checkout
          uses: actions/checkout@v3

        - name: Remove test api.code-workspace file
          uses: kafkasl/delete_from_another_repo@master
          env:
            API_TOKEN_GITHUB: ${{ secrets.API_TOKEN_GITHUB }}
          with:
            path: 'api.code-workspace'
            destination_repo: 'kafkasl/api'
            user_email: 'example@email.com'
            user_name: 'dmnemec'
            commit_message: 'A custom message for the commit'

# Variables

The `API_TOKEN_GITHUB` needs to be set in the `Secrets` section of your repository options. You can retrieve the `API_TOKEN_GITHUB` [here](https://github.com/settings/tokens) (set the `repo` permissions).

* path: The file or directory to be removed.
* destination_repo: The repository to place the file or directory in.
* user_email: The GitHub user email associated with the API token secret.
* user_name: The GitHub username associated with the API token secret.
* destination_branch: [optional] The branch of the source repo to update, if not "main" branch is used.
* destination_branch_create: [optional] A branch to be created with this commit, defaults to commiting in `destination_branch`
* commit_message: [optional] A custom commit message for the commit. Defaults to `Update from https://github.com/${GITHUB_REPOSITORY}/commit/${GITHUB_SHA}`