# Mono Heroku Buildpack

This is a [Heroku buildpack](http://devcenter.heroku.com/articles/buildpack) for Mono that will run ASP.NET applications (and other frameworks too).

It serves files using [XSP](http://www.mono-project.com/ASP.NET#ASP.NET_hosting_with_XSP).

## Usage

Example usage:

    $ heroku create --buildpack http://github.com/friism/heroku-buildpack-mono.git
    $ git push heroku master

The buildpack will detect your app as Mono if it has the file `global.asax` in the root or at one directory depth.

## TODO

* Store buildoutput in $CACHE_DIR and do incremental builds (also won't cause NuGet packages to be re-downloaded)
* Remove original source code before slug is tarred up
* Slim down Mono runtime to reduce slug size and build time
* Avoid copying Mono runtime to build /app and ${BUILD_DIR} during build

## Pre-compiling Binaries

Use Anvil and buildpack-self
