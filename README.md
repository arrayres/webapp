# ArrayResUi

## Installation

 1. Install [node.js](https://nodejs.org/)

 2. Install [gulp](http://gulpjs.com/) with:

        $ npm install --global gulp

 3. Clone this repository

        $ git clone https://github.com/olegskl/arrayresui.git
        $ cd arrayresui

 4. Install dependencies (may take some time)

        $ npm install

 5. Run the application in the system default browser on localhost:3000

        $ gulp

## Contributing

When possible we follow the [Gitflow Workflow](http://nvie.com/posts/a-successful-git-branching-model/).

 1. Clone the project and checkout the `develop` branch.

        $ git clone https://github.com/olegskl/arrayresui.git
        $ cd arrayresui
        $ git checkout develop

 2. Create a new topic branch for your idea, and commit to it.

        $ git checkout -b feat-awesome-idea
        $ touch server/foo.bar && git add server/foo.bar
        $ git commit -m 'feat(server): added foo'

 3. Push the branch and add upstream (tracking) reference.

        $ git push -u

 4. Create a [pull request](https://help.github.com/articles/using-pull-requests/) to the `develop` branch.
