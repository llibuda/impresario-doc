---
date: 2015-06-21T17:52:09+02:00
categories: "Developer's Guide"
weight: 1
title: "Setup of Development Environment"
description: "This chapter shows how to setup a development enviroment for creating your own Impresario Macro libraries.
              The environment is also required to contribute code to Impresario itself."
menu: 
  main:
    Name: "Setup of Development Environment"
    Parent: "devguide"
---

In order to create your own Impresario Macro libraries or to build Impresario yourself from its source code,
you need a development enviroment.

In general three components are required:

* Qt Framework version 5.12 LTS or higher with QtCreator. 
* A suitable compiler for QtCreator. The compiler must support at least the C++11 standard.
* _Git_ as version control system

The following two subsections show how to set it up on Windows and Linux systems.

# Setup for Windows systems
On Windows systems Impresario supports Microsoft's C++ compilers which are shipped with Visual Studio. At the time of this writing
Impresario is built with the compiler shipped with Visual Studio 2017. Therefore this one is recommended.

* Go to [http://www.qt.io/download-open-source/](http://www.qt.io/download-open-source/) and download the Qt Online Installer for Windows.
* Run the downloaded installer. After creating a Qt account (it's free) you can choose which Qt components to install. The following 
  screenshot shows what is needed by Impresario:
  {{< figure src="qt_install_windows.png" link="qt_install_windows.png" title="Qt components on Windows (Click to enlarge)" 
     alt="Qt components to be installed on Windows" >}}
  Next to the pre-build Qt core libraries for the compiler it is also mandatory to install the _Qt WebEngine_ component which is used
  by Impresario's help system.
* Download Visual Studio 2017 Community Edition free of charge from 
  [https://visualstudio.microsoft.com/de/vs/older-downloads/](https://visualstudio.microsoft.com/de/vs/older-downloads/). 
  Visual Studion 2017 may have been moved to the older versions section so that you have to browse for it. After download
  run the installer.
* Download Git for Windows from [https://git-scm.com/download/win](https://git-scm.com/download/win). Afterwards, run the installer.

# Setup for Linux systems
On Linux systems the GNU 64bit gcc is the compiler of choice.

* Go to [http://www.qt.io/download-open-source/](http://www.qt.io/download-open-source/) and download the Qt Online Installer for Linux.
* Run the downloaded installer. After creating a Qt account (it's free) you can choose which Qt components to install. The following 
  screenshot shows what is needed by Impresario:
  {{< figure src="qt_install_linux.png" link="qt_install_linux.png" title="Qt components on Linux (Click to enlarge)" 
     alt="Qt components to be installed on Linux" >}}
  Next to the pre-build Qt core libraries for the compiler it is also mandatory to install the _Qt WebEngine_ component which is used
  by Impresario's help system.
* If not already installed on your system you have to install gcc and git. On Debian based systems like Ubuntu or Linux Mint 
  with apt package manager this is achieved by running
  {{<highlight bash>}}
  sudo apt-get install build-essential git
  {{</highlight>}} 
  from the command line.
  On Linux distributions with a different package management system please refer to its documentation.
