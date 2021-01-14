---
categories: "User's Guide"
date: 2015-06-21T17:52:09+02:00
menu:
  main:
    Name: Release History
    Parent: userguide
    Identifier: history
title: Release history
description: "Release history of Impresario"
weight: 11
---

# Impresario

## Version 2.1.3
* Release date: January 2021
* Release notes:
  - High DPI support
  - Code cleanup: Replaced deprecated code

## Version 2.1.2
* Release date: December 2020
* Release notes:
  - Rebuild QML part with QtQuickControls 2
  - Added *readOnly* property to StringLineEdit component
  - Impresario is now based on Qt 5.15.1 LTS
  
## Version 2.1.1
* Release date: March 2020
* Release notes:
  - Completed developer's guide in online help
  - Added progress bar on start up while loading libraries
  - Loading of libraries is multithreaded now
  - Improved System Log Window which now wraps messages
  - Impresario is now based on Qt 5.12.7 LTS 
  - C++11 compatible compiler is now required
  - On Windows platform Microsoft Visual Studio 2017 is now default compiler for 32bit and 64bit builds
  - Various small bug fixes

## Version 2.1.0
* Release date: March 2017
* Release notes:
  - Added online help
  - Improved directory handling. All directories are now saved as
    relative paths to Impresario's bin-directory which allows moving
    the whole installation without the need to adapt all paths afterwards. Further, more
    fallbacks are added for directories containing macro libraries and dependent libraries.
  - Macro search in database now matches from any position in macro name, not only from beginning
  - Improved QML components for parameter settings with better mouse and keyboard support
  - Impresario is now based on Qt 5.6.2 LTS
  - On Windows platform Microsoft C++ Compiler 19.0 from Visual Studio 2015 is supported for 32bit and 64bit builds

## Version 2.0.0
* Release date: December 2015
* Release notes:
  - Initial 2.0.0 release with all the bugs you will find
  - Support of Impresario API 1.0
    
# Impresario Macros

## Version 1.1.3
* Release date: December 2020
* Release notes:
  - Rebuild QML part with QtQuickControls 2
  - Usage of *readOnly* property of StringLineEdit component in macros lti::loadImages and cv::loadImages
  - Viewer macros are now based on Qt 5.15.1 LTS

## Version 1.1.2
* Release date: March 2020
* Release notes:
  - Adapted macros to Impresario API 1.0.1

## Version 1.1.1
* Release date: March 2020
* Release notes:
  - C++11 compatible compiler is now required
  - Code base is modernized based on C++11 standard
  - Viewer macros are now based on Qt 5.12.7 LTS
  - Added OpenCV macro for Cascaded Classifier
  - Various small bug fixes

## Version 1.1.0
* Release date: March 2017
* Release notes:
  - OpenCV macros are now based on OpenCV 3.1.0
  - Improved build configurations for easier support of new compilers
  - Viewer macros are now based on Qt 5.6.2
  - Improved parameter handling for lti::convolution macro

## Version 1.0.0
* Release date: December 2015
* Release notes:
  - Initial 1.0.0 release to demonstrate Impresario's features
  - Macros are not yet fully fault tolerant and allow for improvements
  - Based on Impresario API 1.0
  
  