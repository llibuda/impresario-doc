# Impresario Documentation

This repository contains the source code for Impresario's online help and its 
[GitHub pages](https://llibuda.github.io/impresario/web/index.html).

## License
Impresario including this documentation is open source software and licensed under the 
GNU General Public License version 3 (GPLv3). You may look up the license text 
on the web at [http://www.gnu.org/licenses/gpl-3.0.html](http://www.gnu.org/licenses/gpl-3.0.html) or read it as 
[plain text](./licenses/LICENSE_Impresario.GPLv3).

## Usage
The documentation is created with [Hugo](https://gohugo.io), a static website generator based on markdown language.
Therefore the directory structure follows a Hugo project. Using this approach there is only a single source for two
types of documentation:
* Impresario's online help which is a compressed Qt HTML documentation
* Impresario's GitHub pages

Both types of documentation use a different theme which mainly consist of CSS and JavaScript files.

There are four different batch files which build the documentation in various ways:
* `build_impresario_qtdoc.bat`: Builds Impresario's online help as compressed Qt help file.
* `build_impresario_local.bat`: Builds Impresario's online help as local static website for testing purposes.
* `build_impresario_web.bat`: Builds Impresario's GitHub pages for deployment.
* `build_impresario_weblocal.bat`: Builds Impresario's GitHub pages for Hugo's built-in webserver for testing purposes.

Before using any batch file, the paths in it have to be adapted to match your system.

## Releases
In the [releases](https://github.com/llibuda/impresario-doc/releases) section of this repository you will find the 
compressed Qt help files for online help. You can download them from there and copy it into Impresario's documentation
directory.