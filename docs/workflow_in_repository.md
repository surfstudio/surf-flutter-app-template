## Workflow in a repository

### Branching in a repository

For each task, a branch is created according to the pattern specified below.
- task branch: `JIRA-<task_number>_<description>` => `JIRA-1234_add_new_screen`

If you want to make changes to the code base outside the task, or if you don't want the change to be executed as a task, then a branch is created according to the pattern:
- branch without a task: `no-task-<type>([context])_<description>` => `no-task-fix(ABC-1)_fix_error_state`

### Commits

The [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) is used to create commits.

A pattern for a commit: `<type>(JIRA-<task_number>): <description>`, for example:

- `feat(QWE-1): init project`
- `fix(XYZ-2): fix error state`
- `chore(ABC-3): update CHANGELOG.md`

It is better if the commits will be atomic, then it will be easier to navigate in the history of changes and in the design of PR, the text of the last commit will be automatically substituted in the name of the PR.

### Merge requests (Pull Requests)

For description text, there is a basic template that will be automatically added to the PR description text field.
The template is an mandatory part of the description.
During the creation of a PR, it is highly recommended to describe interesting and complex details, point out bottlenecks if possible, and help the reviewers understand the changes as much as possible.

If PR rules the bug, then in the changes you must additionally describe 2 points. The first is **Root cause**. It is necessary to describe the causes of the bug. The second one is **Solution** here you should describe the algorithm of solving this bug.

`fix(ZXC-4): Buttons are not blocked when loading`

```
Root cause: No UI reaction to load time
Soution: Wrap the screen widget tree in the AbsorbPointer widget. And change the state of this widget based on the loading state.
```

If the work in the current PR is not finished yet, i.e. it does not require an early review, mark it with the flag - **WIP**(Work In Progress) or **Draft**, and remove this flag when the work is finished.

A pattern for a Pull request: `<type>(JIRA-<task_number>): <Description>`, for example:

- `feat(QWE-1): Init`
- `fix(ASD-2): Incorrect text for SocketException`
- `docs(ZXC-2): Readme update`

### List of labels for PR and issues

List of labels which are used in the project:
- `wip` - "work in process" the PR is not ready for review
- `enhancement` - the PR contains changes that improve the code, but do not affect the functionality
- `bug` - the PR fixes a bug
- `help wanted` - the PR contains changes that require additional review
