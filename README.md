**Please note:** This buildpack is an experimental project and is not officially supported.

# .NET Core Buildpack

This is a [Heroku buildpack](http://devcenter.heroku.com/articles/buildpack) for building [.NET Core](https://www.microsoft.com/net/core) apps using [`project.json` files](https://docs.microsoft.com/en-us/dotnet/articles/core/tools/project-json).

## Usage

Example usage:

    $ heroku create --buildpack http://github.com/friism/dotnet-buildpack.git
    $ git push heroku master

The buildpack will detect your app as .NET Core if it has `project.json`. If the source code you want to build contains multiple `project.json` files, you can use a [`.deployment`](https://github.com/projectkudu/kudu/wiki/Customizing-deployments) or set a `$PROJECT` config var to control which one is built.
