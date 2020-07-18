# ai-service
A Python Flask service exposing an API for Natural Language Processing.

## Usage
This service is launched via the project's [docker stack](../docker-stack/README.md).

I've chosen to use the `ubuntu:16.04` container image out of convenience but would likely use a lighter container in an actual production environment.
Additionally, this implementation uses the Flask debugger server and not a production grade WSGI server.

## APIs

The following APIs are currently support:

| API | Usage |
|---|---|
| Server identification | GET / |
| Server version | GET /v1/server/version |
| String reverse | POST /v1/string/reverse |

## Building
The AI Service docker image can be built using the `build.sh` shell script and passing a version number.

```shell
$ ./build.sh 0.1.0
```

## Testing
The AI Service RESTfull APIs can be tested using the shell scripts found in the `tests` folder.  Essentially the scripts make API requests using the curl command line utility.  In actual testing I'd recommend using [Postman](https://www.postman.com/), [Paw](https://paw.cloud/) (on Mac) or [HTTP Client](https://marketplace.visualstudio.com/items?itemName=mkloubert.vscode-http-client) on Visual Studio Code.

The `tests` folder includes a basic set of tests - for both success and failure suituations. The test coverage is by no means comprehensive at this time.


