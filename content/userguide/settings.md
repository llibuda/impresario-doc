---
categories: "User's Guide"
date: 2016-03-04T19:54:08+02:00
menu:
  main:
    Name: "Reference: Settings"
    Parent: userguide
    Identifier: settings
title: "Reference: Settings"
description: "Impresario can be configured to suit your needs. This reference covers all available settings."
weight: 8
---

Impresario's settings can be changed in its settings dialog which is opened by the menu command
{{< menuCommand "settings.png" "Settings...">}} in the {{< menuCommand "Extras">}} menu. 

The settings dialog consists of several pages described in the following sections.

# Directories
Impresario uses several directories or list of directories which can be configured in the sub-pages.

## Process Graphs
The process graph directory is used as default directory for storing 
[Impresario Process Graphs]({{< relref "introduction.md#impresario-process-graphs" >}}) or loading
them from it. The dialogs for opening and saving process graphs are initialized with this
directory. You can change it to suit your needs which will take effect immediately. However, you have to provide an 
existing directory.

## Macro Libraries
During start up Impresario searches a list of directories for [Macro Libraries]({{< relref "introduction.md#macro-libraries" >}})
and tries to load all macros detected in these libraries. This list of directories can be configured in this settings page. 
You can add and remove directories and change their order. Only existing directories are accepted in this list. You have to restart
Impresario to use the new list of directories.

**Please note:**

* If a macro library with the same file name exists in two different directories, only the macro library in the first listed
  directory will be loaded. The second library will be ignored.
* For performance reasons it is recommended to keep only macro libraries in the directories referenced by this list.

## Dependent Libraries
[Macro Libraries]({{< relref "introduction.md#macro-libraries" >}}) contain executable code which may depend on different third party
libraries. Usually third party libraries must be kept in directories known to the operating system in order to be loaded properly. With
the directory list for dependent libraries Impresario offers a way to ship these third party libraries without the need to install them
to standard directories searched by the OS. On Windows platforms Impresario prepends this list of directories to the Windows {{< path "PATH" >}}
environment variable before it starts loading macro libraries. On Linux platforms the same applies to the system's {{< path "LD_LIBRARY_PATH" >}}.

You can add and remove directories here and change their order. Only existing directories are accepted as input and of course you have to
place all third party libraries your macro libraries depend on in these directories. The new list of directories will take effect the next
time you start Impresario.

## Documentation
This directory contains all files related to Impresario's documentation. Especially files for online help have to be located here. On start
up Impresario searches this directory including all sub-directories for online help files (*.qch) and adds them to its online help engine.
When you change this directory, Impresario will immediately start to search it. So make sure the new directory contains the help files you
require.

## Resources
The resources directory contains files Impresario requires during runtime. Impresario checks this directory and its contents during start up
and it will terminate with error messages if it does not find all required files. Therefore it is **not recommended** to change this directory.
However, if you see a need to do so, please copy the whole contents of the current resource directory to the intended new location before you
change it here. This setting takes effect on restart of Impresario.

# Macro Database
The settings in this page and sub-pages effect the behavior of the [macro area]({{< relref "macrodb.md#macro-area" >}}) in the macro database 
docking window. The following options are available on this main page:

* *Auto reset search field on Enter key*: By checking this option the [search field]({{< relref "macrodb.md#search" >}}) in the macro database docking 
  window will be cleared after
  pressing the Enter key (which adds the first macro in the search results to the current process graph). By unchecking it, the entered search
  string remains.
* *Show registered viewers (for information only)*: Impresario will add all loaded viewers to the macro database if this option is
  checked. Viewers are shown grayed out to indicate that they cannot be added to an Impresario Process Graph like macros. However, it is possible
  to inspect each viewer's properties. If this option is not checked all registered viewers will still be available but won't be shown in the 
  macro database.
* *Default property display for*: In this group box you can configure the default property display for the 
  [information area]({{< relref "macrodb.md#information-area" >}}) of the macro database docking
  window and the different item types *Macros*, *Viewers*, *Libraries*, and *Others*. Every time the item's type you select changes, 
  the properties set as default in this group box will be displayed for the selected item.

## View
This settings page allows you to define your own [views on the macro database]({{< relref "macrodb.md#view" >}}).
Each view consists of a unique identifier and its format definition.

**Identifier**

The identifier can be any string containing at least one non-white space character. The string must be unique within the list of views.

**Format definition**

The format definition consists of an optional tree part and a list part. The tree part must be defined first and separated from the list part
by surrounding brackets, i.g `[GM]LB` where `[GM]` denotes the tree part and `LB` the list part.

You can use the following upper case characters to reference the item types for the tree and list part:

* `M`: {{<itemtype "macro.png" "Macro">}}
* `G`: {{<itemtype "macrogroup.png" "Macro group">}}
* `L`: {{<itemtype "macrodb.png" "Macro library">}} 
* `F`: {{<itemtype "macrolib.png" "Macro library file">}}
* `B`: {{<itemtype "macrobuild.png" "Macro build">}}
* `C`: {{<itemtype "macrocreator.png" "Macro creator">}}
* `T`: {{<itemtype "macrotype.png" "Macro type">}} (currently "Macro" or "Viewer")

For the view definition the following rules apply:

* The Macro item type (`M`) is mandatory in the view definition.
* If you define a tree part, the tree part must consist of at least two levels (two characters) and must contain the Macro item type (`M`).
* Within the tree part each item type can be referenced only once.
* Within the list part each item type can be referenced only once.

The following screenshot shows some examples for views.

{{< figure src="settings_db_view.png" link="settings_db_view.png" title="Settings page for view definition with examples (Click to enlarge)" 
    alt="Settings page for view definition" class="float">}}

When editing a view, error messages are displayed in the settings page in case the view is not defined correctly. In addition a red bullet is
shown left to the view's identifier. As soon as the view is correctly defined, the red bullet turns green.

You can start editing each view's identifier and format definition by double clicking it.

## Filter
[Filters]({{< relref "macrodb.md#filter" >}}) can be defined on this page to hide items in the macro database which are currently not of interest.
A filter consists of a unique identifier and a filter definition.

**Identifier**

The identifier can be any string containing at least one non-white space character. The string must be unique within the list of filters.

**Filter definition**

A filter definition is made up of a logical combination of *Perl* style regular expressions matching item types 
in the macro database. You can match the following item types represented by their upper case characters:

* `M`: {{<itemtype "macro.png" "Macro">}}
* `G`: {{<itemtype "macrogroup.png" "Macro group">}}
* `L`: {{<itemtype "macrodb.png" "Macro library">}} 
* `F`: {{<itemtype "macrolib.png" "Macro library file">}}
* `B`: {{<itemtype "macrobuild.png" "Macro build">}}
* `C`: {{<itemtype "macrocreator.png" "Macro creator">}}
* `T`: {{<itemtype "macrotype.png" "Macro type">}} (currently "Macro" or "Viewer")

*Example*: To see only macros in the database starting with "lti::" can be achieved with `M =~ /^lti::.*/`.

Several regular expressions as shown in the example above can be logically combined using the following operators,
listed in descending precedence:

* `(..)`: Parenthesis
* `AND` : Logical AND combination of two regular expressions
* `OR`  : Logical OR combination of two regular expressions

*Example*: To see only macros in the database starting with "lti::" and which do not belong to the group "Conversion" 
you can define the filter as `M =~ /^lti::.*/ AND G !~ /Conversion/`.

The following screenshot shows the default filters defined in Impresario.

{{< figure src="settings_db_filter.png" link="settings_db_filter.png" title="Settings page for filter definition with examples (Click to enlarge)" 
    alt="Settings page for filter definition" class="float">}}

When editing a filter, error messages are displayed in the settings page in case the filter is not defined correctly. In addition a red bullet is
shown left to the filter's identifier. As soon as the filter is correctly defined, the red bullet turns green.

You can start editing each filter's identifier and format definition by double clicking it.

# Property Window
The settings in this page allow to customize the behavior of Impresario's property window. The property window displays properties and information
for the currently selected component in the active process graph editor. The following options are available:

* *Default QML component*: You can provide the default QML component to be used to display macro parameters. The file holding this QML component
  **must** be located in Impresario's [resource directory]({{< relref "#resources" >}}).<br>
  **Please note**: It is not recommended to change this setting unless you really know what you are doing.
  
* *Default property display for*: In this group box you can configure the default information display in the lower half of the property
  window for the different item types *Macros* and *Others*. Every time the component's type you select in the active process graph editor 
  changes, the information set as default in this group box will be displayed for the selected component.

