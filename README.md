# ruby-formula

| License | Versioning | Build |
| ------- | ---------- | ----- |
| [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) | [![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release) | [![Build Status](https://travis-ci.com/extra2000/ruby-formula.svg?branch=master)](https://travis-ci.com/extra2000/ruby-formula) |

SaltStack Formula for Ruby.


## Available states

| States | Descriptions |
| ------ | ------------ |
| `ruby` | Executes `./init.sls` which will install `rvm` and `ruby` |
| `ruby.package` | Install `rvm` and `ruby` |
| `ruby.package.install` | Install `rvm` and `ruby` |
