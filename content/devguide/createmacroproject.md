---
date: 2018-08-27T16:15:12+02:00
categories: "Developer's Guide"
weight: 3
title: "Creating a macro project"
description: "Learn how to setup a new macro project."
menu: 
  main:
    Name: "Creating a macro project"
    Parent: "devguide"
---

A macro project is a C++ development project which is setup to produce a 
[macro library file]({{< relref "../userguide/introduction.md#macro-libraries" >}}) based on
Impresario's API. 

Therefore the development project has to be configured to build a dynamic link library (.dll) on 
Windows platforms and a shared object file (.so) on Linux platforms. 
Also Run-Time-Type-Information (RTTI) must be enabled.

In addition some preprocesser defines have to be declared on global level in the compiler settings:
* `_IMPRESARIO_WIN` needs to be defined for Windows builds
* `_IMPRESARIO_LINUX` needs to be defined for builds targeting Linux platforms
* `_IMPRESARIO_DEBUG` needs to be set for debug builds independent of the target platform

# Including Impresario API
The following files need to included into your new project:

* {{<path "libconfig.h" >}}: Header file for configuring the library, needs to be edited
* {{<path "libinterface.h" >}}: Main header file of the API, no need to change it
* {{<path "libinterface.cpp" >}}: Main implementation file of the API, no need to change it
* {{<path "macrobase.h" >}}: Header file of the macro base class, no need to change it
* {{<path "macroextended.h" >}}: Header file for an extended macro class, no need to change it

The files can usually be found in Impresario's installation directory in the 
{{<path "development/impresario-interface_X.Y.Z" >}} subfolder.

# Library configuration
As stated above, the file {{<path "libconfig.h" >}} needs to be edited to configure the macro library file
appropriately. The following code snippet shows the file as provided by the API:

{{<highlight cpp>}}
#ifndef LIBCONFIG_H_
#define LIBCONFIG_H_
#include "libinterface.h"

#define LIB_CREATOR        L"<NAME OF CREATOR>"
#define LIB_NAME           L"<NAME OF LIBRARY>"
#define LIB_VERSION_MAJOR  1
#define LIB_VERSION_MINOR  0
#define LIB_VERSION_PATCH  0
#define LIB_DESCRIPTION    L"<html><body><p>YOUR DESCRIPTION" \
                           L"</p></body></html>"

#include "<YOUR MACRO HEADER FILE 1>"
#include "<YOUR MACRO HEADER FILE 2>"

MACRO_REGISTRATION_BEGIN
  MACRO_ADD(<YOUR MACRO CLASS 1>)
  MACRO_ADD(<YOUR MACRO CLASS 2>)
MACRO_REGISTRATION_END

#endif // LIBCONFIG_H_
{{</highlight>}}

You need to fill in the following `#defines` with your own values:

* `LIB_CREATOR`: The name of the programmer who developed this macro library file.
   It can be displayed in the Impresario's [macro database]({{< relref "../userguide/macrodb.md" >}}).
* `LIB_NAME`: The name of the library this macro library file is part of. This can also be displayed in 
   Impresario's [macro database]({{< relref "../userguide/macrodb.md" >}}). **Please note**: The name is case
   sensitive and several macro library files may share the same name. In this case Impresario groups all macros
   from these files into one library as displayed in the macro database.
* `LIB_VERSION_MAJOR`: Major version of the library. Within a major version downward compatibility must be
   guaranteed. In case the major version is increased, downward compatibility can be broken.
* `LIB_VERSION_MINOR`: Minor version of the library. New features can be introduced with a new minor version.
* `LIB_VERSION_PATCH`: Patch level of the library. When the library is patched or improved without adding new features
   the patch level has to be increased.
* `LIB_VERSION_DESCRIPTION`: Brief description of the library file which will be displayed in 
   Impresario's [description tab]({{< relref "../userguide/macrodb.md#description-tab" >}}). You can use plain or rich
   text for your description.

After this block you have to include all header files containing your macros and you need to add each macro wihtin the block
marked with `MACRO_REGISTRATION_BEGIN` and `MACRO_REGISTRATION_END` by using the preprocesser macro `MACRO_ADD`.