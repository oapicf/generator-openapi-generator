<!-- BEGIN:AVATAR -->
![Avatar](avatar.jpg)
<!-- END:AVATAR -->

<!-- BEGIN:BADGES -->
[![Build Status](https://github.com/cliffano/generator-openapi-generator/workflows/CI/badge.svg)](https://github.com/cliffano/generator-openapi-generator/actions?query=workflow%3ACI)
[![Code Scanning Status](https://github.com/cliffano/generator-openapi-generator/workflows/CodeQL/badge.svg)](https://github.com/cliffano/generator-openapi-generator/actions?query=workflow%3ACodeQL)
[![Security Status](https://snyk.io/test/github/cliffano/generator-openapi-generator/badge.svg)](https://snyk.io/test/github/cliffano/generator-openapi-generator)
<!-- END:BADGES -->

# Generator-OpenAPI-Generator

Generator-OpenAPI-Generator is an OpenAPI Generator projects generator using [Plop](https://plopjs.com/).

It provides the following components:

| Component | Description |
|-----------|-------------|
| oag-file-spec | Generate a project to generate OpenAPI Generator using a file specification. |
| oag-url-spec | Generate a project to generate OpenAPI Generator using a URL specification. |

All components are built using [Swaggy C](https://github.com/cliffano/swaggy-c).

## Usage

Generate OAG with file specification project:

```shell
make generate-oag-file-spec
```

Generate OAG with URL specification project:

```shell
make generate-oag-url-spec
```

Both components will prompt you the following inputs:

| Prompt | Description |
|--------|-------------|
| Project ID | Used for package names and project repo name. |
| Project Name | Used in documentation or comments. |
| Project Description | Used in documentation or comments. |
| Author Name | The name of the project author. |
| Author Email | The email of the project author. |
| Author URL | The author's website URL. |
| GitHub ID | The GitHub ID of the project repo. |
| GitHub Actions token prefix | Prefix for the GitHub token secret used in GitHub Actions workflows. |

Move to the generated project directory:

```shell
cd stage/<component>/
```

Initial configuration file for each OAG language:

```shell
make init-generators-config
```

For the primary languages, modify the configuration file to include the following:

(NOTE: configuration properties can be found in the [OpenAPI Generator Mustache templates](https://github.com/OpenAPITools/openapi-generator/tree/master/modules/openapi-generator/src/main/resources)

### Javascript

```json
{
  "projectName": "<project_id>",
  "packageName": "<project_id>",
  "packageVersion": "<version>",
  "gitUserId": "<github_id>",
  "gitRepoId": "<project_id>"
}
```

### Python

```json
{
  "projectName": "<project_id>",
  "packageName": "<project_id>",
  "packageVersion": "<version>",
  "packageUrl": "https://github.com/<github_id>/<project_id>",
  "gitUserId": "<github_id>",
  "gitRepoId": "<project_id>"
}
```

### Ruby

```json
{
  "gemName": "<project_id>",
  "moduleName": "<ProjectId>",
  "gemVersion": "<version>",
  "gemAuthor": "<author_name>",
  "gemAuthorEmail": "<author_email>",
  "gemHomepage": "https://github.com/oapicf/<project_id>",
  "gemLicense": "MIT",
  "gemRequiredRubyVersion": ">= 3.0",
  "gitUserId": "<github_id>",
  "gitRepoId": "<project_id>"
}
```

## Colophon

<!-- BEGIN:DEVELOPERS_GUIDE -->
[Developer's Guide](https://cliffano.github.io/developers-guide-makefile.html)
<!-- END:DEVELOPERS_GUIDE -->

<!-- BEGIN:BUILD_REPORTS -->
Build reports:

<!-- END:BUILD_REPORTS -->

Related Projects:

* [Swaggy C](https://github.com/cliffano/swaggy-c) - Builder for OpenAPIGenerator-generated API clients in multiple languages
