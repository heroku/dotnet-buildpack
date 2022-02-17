**Please note:** This buildpack is an experimental project and is not officially supported.

# ASP.NET Core Buildpack

This is a [Heroku buildpack](http://devcenter.heroku.com/articles/buildpack) for building [ASP.NET Core](https://docs.asp.net/en/latest/conceptual-overview/aspnet.html) apps using [`project.json` files](https://github.com/aspnet/Home/wiki/Project.json-file) and the [.NET CLI](https://github.com/dotnet/cli).

## Usage

Example usage:

    $ heroku create --buildpack http://github.com/noliar/dotnet-buildpack.git
    $ git push heroku master

The buildpack will detect your app as ASP.NET Core if it has `project.json`. If the source code you want to build contains multiple `project.json` files, you can use a [`.deployment`](https://github.com/projectkudu/kudu/wiki/Customizing-deployments) or set a `$PROJECT` config var to control which one is built.

## Attension
1. You should configure a unique compatible framework in `project.json`.
2. Your Project should use `Microsoft.Extensions.Configuration.CommandLine` package.
3. You'd better configure SDK version using `global.json`.