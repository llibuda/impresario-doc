---
date: 2015-06-21T17:52:09+02:00
categories: "User's Guide"
weight: 2
title: "Installing Impresario"
description: "All about the installation and deinstallation of Impresario on Windows and Linux systems."
menu: 
  main:
    Name: "Installing Impresario"
    Parent: "userguide"

---

Impresario binaries are distributed in self-extracting archives for Windows and Linux platforms. 
Impresario does not make any changes to the operating system, it runs locally from
the folder you installed it to.

# Installation on Windows

* Download the two executable files {{< path "Impresario-win64-X.Y.Z.exe" >}} and 
  {{< path "ImpresarioMacros-win64-X.Y.Z.exe" >}} respectively, where 
  {{< path "X" >}}, {{< path "Y" >}}, and {{< path "Z" >}} denote the major, minor, and patch version of the packages.
* Run {{< path "Impresario-win64-X.Y.Z.exe" >}} **first**. It will prompt for an installation directory, please provide it,
  e.g. {{< path "D:\Impresario-2.1.0" >}}. The directory will be created if it does not exist already.
* Next, run {{< path "ImpresarioMacros-win64-X.Y.Z.exe" >}}, it will also prompt for an installation directory. Please provide
  the *same* directory as you did in the first step. During extraction the tool may ask to overwrite 
  the file {{< path "bin\Impresario.xml" >}}. Please let it overwrite the file.
* You are done. You can now start Impresario by running {{< path "Impresario.exe" >}} in the {{< path "bin" >}} subdirectory.  

# Installation on Linux

* Download the two self-extracting archives {{< path "Impresario-linux64-X.Y.Z.exe" >}} and 
  {{< path "ImpresarioMacros-linux64-X.Y.Z.exe" >}} respectively, where 
  {{< path "X" >}}, {{< path "Y" >}}, and {{< path "Z" >}} denote the major, minor, and patch version of the packages.
* Make both downloaded files executable:
  {{<highlight bash>}}
chmod +x Impresario-linux64-X.Y.Z.run
chmod +x ImpresarioMacros-linux64-X.Y.Z.tar.gz
  {{</highlight>}}

* Run {{< path "Impresario-linux64-X.Y.Z.run" >}} **first**. You can provide an installation directory with the 
  {{< path "--target" >}} option, e.g. 
  {{<highlight bash>}} 
Impresario-linux64-X.Y.Z.run --target ./Impresario
  {{</highlight>}}
  If no {{< path "--target" >}} option is given, the default
  installation directory will be used, which is {{< path "./Impresario-X.Y.Z" >}}.
* Next, run {{< path "ImpresarioMacros-linux64-X.Y.Z.run" >}}, providing the *same* directory as you did in the first step. 
* You are done. You can now start Impresario by running {{< path "./impresario.sh" >}} in the {{< path "bin" >}} subdirectory.<br>
  **Important:** Do not run the program {{< path "./Impresario" >}}! This will run Impresario with an incorrect setup of
  {{< path "LD_LIBRARY_PATH" >}}.  

# Uninstall Impresario

To uninstall Impresario just delete the folder containing Impresario.

Impresario stores its user specific settings on Windows in {{< path "<PATH_TO_YOUR_USER_DIRECTORY>\AppData\Roaming\Impresario" >}}.
On Linux these settings are stored in {{< path "~/.config/Impresario" >}}.

You may like to delete these settings as well.
