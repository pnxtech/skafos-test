# Web Service
NodeJS web service built using ExpressJS.  This service both serves a ReactJS/Redux site as well has exposes a set of APIs which are used by the React SPA.

This service uses an Axios Async/Await call to the AI Service.

## Usage
This service is launched via the project's [docker stack](../docker-stack/README.md).

## APIs

The following APIs are currently supported:

| API | Endpoint |
|---|---|
| Server version | GET /v1/server/version |
| String reverse | POST /v1/string/reverse |
| String history | GET /v1/string/history |

## Build
The Web Service docker image can be built using the `build.sh` shell script and passing a version number.

```shell
$ ./build.sh 0.1.0
```

## Testing
The service RESTfull APIs can be tested using the shell scripts found in the `tests` folder.  Essentially the scripts make API requests using the curl command line utility.  In actual testing I'd recommend using [Postman](https://www.postman.com/), [Paw](https://paw.cloud/) (on Mac) or [HTTP Client](https://marketplace.visualstudio.com/items?itemName=mkloubert.vscode-http-client) on Visual Studio Code.

The `tests` folder includes a basic set of tests - for both success and failure suituations. The test coverage is by no means comprehensive at this time.

## Improvement Notes
Given additional time or on an actual production project I would do the following:

- [ ] Use a microservices library such as [Hydra](https://www.npmjs.com/package/hydra) to create true microservices rather than a simple ExpressJS site.
- [ ] Decouple the ReactJS site from within the web service container and pull files from a CDN instead.

