# Github Status API Wercker Step ☑️
Update Github branch/PR/revision status via the [Github Status API](https://developer.github.com/v3/repos/statuses/) from [Wercker](http://www.wercker.com/)

# Preview
This is what a Github Status may look like. The icon will be that of the token owner (see below for more on tokens).
![help](help.png)

# Usage
Use this step twice:
 1. First, as the first step of the build process to let Github know that a build has begun.
 2. Then call it again in the after-steps to update Github with the final status

# Options
* `token`: (required) A valid Github token with at least `repo:status` permissions. See below on how to generate a token.
* `context`: A string label to differentiate this status from the status of other systems. Default: "default"
* `msg`: A short description of the status
* `fail`: Same as `msg`, used in case of a build failure
* `url`: The target URL to associate with this status. The url must begin with `https://`.

# Example
```yml
box: node

build:
  steps:
    - mbrevda/github-status:
      token: $GITHUB_TOKEN
      context: My App
      msg: build in process
    ...
  after-steps:
    - mbrevda/github-status:
      token: $GITHUB_TOKEN
      context: My App
      msg: build completed
      fail: an error has occurred
      url: https://example.com/my/build/status
deploy:
  steps:
    ...
 ```

 # Github token generation
 This step will require a Github token with at least `repo:status` permissions. You can generate a new "Personal access token" by clicking [here](https://github.com/settings/tokens/new?description=Github+status+werker+step&scopes=repo:status) and then clicking "Generate token"
