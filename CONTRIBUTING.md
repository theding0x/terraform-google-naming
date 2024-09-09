# Contributing to the Project

We welcome contributions and suggestions to improve this project. Please follow the guidelines below to ensure a smooth contribution process.

## Getting Started

1. **Fork the repository**: Click the "Fork" button at the top right of this repository to create a copy of the repository under your GitHub account.
2. **Clone your fork**: Clone your forked repository to your local machine.
   ```sh
   git clone https://github.com/your-username/repository-name.git
   ```
3. **Create a branch**: Create a new branch to work on your changes.
   ```sh
   git checkout -b feature/your-feature-name
   ```

## Making Changes
1. **Install dependencies**: Run `make install` in the root directory of the repository to install the required dependencies.
    ```shell
    make install
    ```
3. **Make your changes**: Make the necessary changes to the codebase.
3. **Run tests**: Run `make test` to ensure that your changes do not break the existing tests.
    ```shell
    make validate
    ```

## Commit and Push
1. **Commit your changes**: Commit your changes to your branch.
    ```shell
    git add .
    git commit -m "Add feature: your feature description"
    ```

2. **Push your changes**: Push your changes to your forked repository.
    ```shell
    git push origin feature/your-feature-name
    ```

## Submitting a Pull Request
1. **Create a Pull Request**: Go to your forked repository on GitHub and click the "New Pull Request" button. Fill in the necessary details and submit your pull request.
2. **Review**: Your pull request will be reviewed by the maintainers. Make sure to address any feedback or comments provided.
3. **Link Issues**: If your pull request is related to any issue, make sure to link the issue in the pull request description.
4. **Merge**: Once your pull request is approved, it will be merged into the main branch.
