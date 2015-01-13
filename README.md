# ASP.NET 5 Buildpack

This is a [Heroku buildpack](http://devcenter.heroku.com/articles/buildpack) for building [ASP.NET 5](http://www.asp.net/vnext/overview/aspnet-vnext/aspnet-5-overview) apps using [`project.json` files](https://github.com/aspnet/Home/wiki/Project.json-file) and the [kpm package manager](https://github.com/aspnet/Home/wiki/Package-Manager).

[Mono](http://www.mono-project.com/) is bundled for runtime execution.

## Usage

Example usage:

    $ heroku create --buildpack http://github.com/heroku/aspnet-buildpack.git
    $ git push heroku master

The buildpack will detect your app as ASP.NET 5 if it has `project.json`. If the source code you want to build contains multiple `project.json` files, you can use a [`.deployment`](https://github.com/projectkudu/kudu/wiki/Customizing-deployments) to control which one is built.
