# Mono Heroku Buildpack

This is a [Heroku buildpack](http://devcenter.heroku.com/articles/buildpack) for Mono that will run [ASP.NET](http://friism.com/running-net-on-heroku) and [Katana/OWIN applications](http://friism.com/running-owin-katana-apps-on-heroku).

It uses [nginx](http://www.mono-project.com/FastCGI_Nginx) as the web server and runs on Mono 3.2.

## Usage

Additional details and guides:

 * [Running ASP.NET and .NET console apps on Heroku](http://friism.com/running-net-on-heroku)
 * [Running Katana/OWIN apps on Heroku](http://friism.com/running-owin-katana-apps-on-heroku)
 * [Buildpack update to Mono 3.2 and more](http://friism.com/heroku-net-buildpack-update-to-mono-3-2-and-more)

Example usage:

    $ heroku create --buildpack http://github.com/friism/heroku-buildpack-mono.git
    $ git push heroku master

The buildpack will detect your app as ASP.NET if it has the file `global.asax` in the root or at one directory depth or as .NET if it has a `.sln` file.

## TODO

* ~~Store buildoutput in $CACHE_DIR and do incremental builds (also won't cause NuGet packages to be re-downloaded)~~
* Less simplistic nginx setup, see [nginx buildpack](https://github.com/ryandotsmith/nginx-buildpack)
* Factor repeated code into functions like [PHP buildpack](https://github.com/CHH/heroku-buildpack-php/blob/master/bin/compile)
* Consider inserting environment variables and connectionstrings into Web.config
* Remove original source code before slug is tarred up
* Slim down Mono runtime to reduce slug size and build time
* Avoid copying Mono runtime to build /app and ${BUILD_DIR} during build
* Web.Release.config
* ~~Get bundling and minification to work (likely to be Win/Linux path issues)~~
* Figure out whether there's hope for EntityFramework (and reliance on `System.Data.Entity` and other)
* ~~Get default Visual Studio templates working (you just have to fix casing problems~~
* More Mono/XSP versions and ability to select version, like [Python buildpack](https://devcenter.heroku.com/articles/python-runtimes)
* Get Katana hosting working with System.Web Host
* Visual Basic!

## Pre-compiling Binaries

Use Anvil and [buildpack-inline](https://github.com/kr/heroku-buildpack-inline)
