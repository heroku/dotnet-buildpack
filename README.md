Mono Heroku Buildpack
=====================

This is a [Heroku buildpack](http://devcenter.heroku.com/articles/buildpack) for Mono that will run ASP.NET applications.

It serves files using [XSP](http://www.mono-project.com/ASP.NET#ASP.NET_hosting_with_XSP).

Usage
-----

Example usage:

    $ heroku create --stack cedar --buildpack http://github.com/brandur/heroku-buildpack-mono.git

    $ git push heroku master

The buildpack will detect your app as Node.js if it has the file `global.asax` in the root or at one directory depth.

Pre-compiling Binaries
----------------------

$ export AWS_ACCOUNT_ID=xxx AWS_SECRET=yyy S3_BUCKET=zzz
$ support/package_mono 2.10.8
$ support/package_xsp 2.10.2

