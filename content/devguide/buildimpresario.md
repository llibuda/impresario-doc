---
date: 2020-02-01T17:47:09+02:00
categories: "Developer's Guide"
weight: 2
title: "Build Impresario from source"
description: "This section deals with the task to build Impresario executable from source."
menu: 
  main:
    Name: "Build Impresario from source"
    Parent: "devguide"
---

If you cannot make use of the prebuild binaries of Impresario, e.g. you require a 32bit version,
you have to build Impresario from source. This section shows how to do this.

# Get source code
You can get the most up to date source code from [Impresario's GitHub repository](https://github.com/llibuda/impresario).
Here you can download a zip file containing the source code or if you like to stay connected with the
repository, open a command line and run:
{{<highlight bash>}}
git clone https://github.com/llibuda/impresario.git
{{</highlight>}}

You should now have a directory called {{<path "impresario">}} in the location from where you run the git command.
The directory structure looks like this:
```
impresario
├─ .git
├─ development
│  ├─ impresario
│  │  ├─ components
│  │  ├─ impresario   
│  │  └─ misc
│  ├─ impresario-interface_1.0.0
│  └─ impresario-interface_1.0.1
├─ doc
├─ licenses
└─ resources
```

# Run Qt Creator
Start Qt Creator and open the project file {{< path "impresario/development/impresario/impresario.pro" >}}.

Qt Creator will ask you to configure your project in a similar dialog as depicted below:
{{< figure src="qtcreator_configure.png" link="qtcreator_configure.png" title="Qt Creator configuration dialog (Click to enlarge)" 
    alt="Qt Creator configuration dialog" >}}

Please choose the kit you like to use for your build. Refer to 
[Setup of Development Environment]({{< relref "devenvironment.md" >}}) to see which 
kits are supported on the different platforms. Press the {{<menuCommand "Configure Project">}} button
to prepare the project for build.

Finally, you can build Impresario by selecting {{<menuCommand "Build Project \"impresario\"">}} from Qt Creator's
Build menu.

# Run Impresario
After a successful build you will find the following directory structure:
```
impresario
├─ .git
├─ bin_...
├─ development
│  ├─ impresario
│  │  ├─ build-impresario
│  │  ├─ components
│  │  ├─ impresario
│  │  └─ misc
│  ├─ impresario-interface_1.0.0
│  └─ impresario-interface_1.0.1
├─ doc
├─ lib
├─ licenses
├─ processgraphs
└─ resources
```
In the {{<path "build-impresario" >}} directory and its subdirectories Qt Creator stores all intermediate files generated
during compilation and linking.

The {{<path "bin_..." >}} directory contains the executable with all required files. On Windows platforms you can run
{{<path "Impresario.exe" >}} from this directory. On Linux systems you have to start Impresario by calling the shell
script {{<path "impresario.sh" >}}.

**Please note**: When running Impresario now you won't have any macro libraries and online help. These components
have to be added manually. Example macro libraries can be found in the GitHub repository 
[impresario-macros](https://github.com/llibuda/impresario-macros). Or you create your own macro libraries. How
this is done is described in the remaining sections of this Developer's Guide.

The online help is available in the separate repository 
[impresario-doc](https://github.com/llibuda/impresario-doc). In the release section you will find the latest help file
which you just have to copy to Impresario's [documentation directory]({{<relref "../userguide/settings.md#documentation" >}}).

