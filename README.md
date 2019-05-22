# Directory of Services API Documentation

## Making Changes
All changes to documentation should be made against the `master` branch. Changes can then be published as a release to the live Developer Network site.

## Previewing changes
Github pages will automatically build the `master` branch to https://nhsd-a2si.github.io/dos-api-docs when a new commit is made.

## Publishing to the Developer Network (developer.nhs.uk)
To publish content to the Developer Network, create a Pull Request from `master` to `publish` and merge the changes.

The documentation is automatically built onto https://developer.nhs.uk/apis/dos-api/ from the `publish` branch via a regular Jenkins job (every few hours).
