# Directory of Services API Documentation

## Contributing changes

All changes are made against the `master` branch as a matter of course. Changes can either be made directly onto the `master` branch, if you have the appropriate access, or you can raise a Pull Request against `master` from your own branch / forked repo.

## Previewing changes

### Previewing locally using Docker

If you have Docker installed, you can use the [standard Jekyll Docker image](https://hub.docker.com/r/jekyll/jekyll) to build and preview the site on your machine without having to install the dependencies locally.

Two Make commands are provided to make this easier for you. You will need to run the following commands from the root directory of the repository:

* `make docker_build` - This will run the `jekyll build` command inside a Docker container, and output the built site to the _site folder in your local repo directory.

* `make docker_serve` - This will run the `jekyll serve` command inside a Docker container, and map the served port to your local machine so that you can access the site on localhost.

### Previewing on Github pages

If you have access to push to the origin repository on Github, Github pages will automatically build the `master` branch to https://nhsd-a2si.github.io/docs-dos-api when a new commit is made.

### Previewing on the Test Developer Network

The Test Developer Network will automatically build the documentation from the `master` branch every 2 hours at a random minute past the hour. You can view these built docs here: https://developer-test.nhs.uk/apis/dos-api

## Publishing changes to the live site (developer.nhs.uk)

To publish content to the Developer Network, create a Pull Request from `master` to `publish` and merge the changes.

The site is automatically built onto https://developer.nhs.uk/apis/dos-api/ from the `publish` branch via a regular Jenkins job (twice a day).
