## Workflow in a repository

### Branching in a repository

For each task, a branch is created according to the pattern specified below:
- `JIRA-<task_number>_<description>` => `JIRA-1234_add_new_screen`

Branch without a task:
- `no-task-<type>([context])_<description>` => `no-task-fix(ABC-1)_fix_error_state`

`<type>` is the same as for commits, for example: `feat`, `fix`, `chore`, `docs`, `refactor`...

### Commits

The [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) is used to create commits.

A pattern for a commit: `<type>(JIRA-<task_number>): <description>`, for example:

- `feat(QWE-1): init project`
- `fix(XYZ-2): fix error state`
- `chore(ABC-3): update CHANGELOG.md`

For commits without a task, the pattern is `no-task-<type>: <description>`, for example:

- `no-task-doc: update README.md`

It is better if the commits are atomic, then it will be easier to navigate in the history of changes and in the design of PR, the text of the last commit will be automatically substituted in the name of the PR.

### Pull requests

For description text, there is a basic template that will be automatically added to the PR description text field.
The template is an mandatory part of the description.
During the creation of a PR, it is highly recommended to describe interesting and complex details, point out bottlenecks if possible, and help the reviewers understand the changes as much as possible.

A pattern for a Pull request: `<type>(JIRA-<task_number>): <Description>`, for example:

- `feat(QWE-1): Init`
- `fix(ASD-2): Incorrect text for SocketException`
- `docs(ZXC-2): Readme update`

If PR rules the bug, then in the changes you must additionally describe 2 points. The first is **Root cause**. It is necessary to describe the causes of the bug. The second one is **Solution** here you should describe the algorithm of solving this bug.

`fix(ZXC-4): Buttons are not blocked when loading`

```
Root cause: No UI reaction to load time
Soution: Wrap the screen widget tree in the AbsorbPointer widget. And change the state of this widget based on the loading state.
```

If the work in the current PR is not finished yet, i.e. it does not require an early review, mark it with the flag - **wip**(work in progress), and remove this flag when the work is finished.

### List of labels for PR and issues

List of common labels which should be used in the project:
- `wip` - "work in process" the PR is not ready for review
- `enhancement` - the PR contains changes that improve the code, but do not affect the functionality
- `bug` - the PR fixes a bug
- `documentation` - the PR contains changes in the documentation
- `help wanted` - the PR contains changes that require additional review

You can add your own labels if necessary.

### Change log

Following the completion of any task (feature / bug / improvement) in this repository, you must leave a record of changes in the CHANGELOG in the Unreleased section. If there is a task for this task in Jira, you must leave a link to this task.

Change log file is located in the root of the repository.

Example:
```text
## Unreleased

* [JIRA-124](https://jira.surfstudio.ru/browse/JIRA-124) feat: Change application icons.
* no-task-doc: Change README.md.

## [0.0.1-rc1+1] (<release date>)

* [JIRA-122](https://jira.surfstudio.ru/browse/JIRA-123) feat: Add the coolest feature.
* [JIRA-123](https://jira.surfstudio.ru/browse/JIRA-123) fix: Fix the coolest bug.
```

### Technical debt

Current technical debt issues are in the Github Issues section.

When creating an issue as a technical debt, be sure to leave a detailed description and a link to the code, if necessary.
It is advisable to report the creation of an issue in the project team chat.

#### TODOs

It is strictly forbidden in the project to leave TODO without a reference to the actual problem. 
This link can be an issue of a project, a specific package, or a response to SO.

You should use the following pattern for TODOs:
```dart
// issue(author): <issue URL>
```



