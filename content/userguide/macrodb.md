---
categories: "User's Guide"
date: 2016-03-20T15:57:46+02:00
menu:
  main:
    Name: "Reference: Macro database window"
    Parent: userguide
    Identifier: macrodb
title: "Reference: Macro database window"
description: "The Macro database window is essential for creating process graphs. This section documents the window's behavior
              and features."
weight: 6
---

{{< figure src="macrodb_overview.png" link="macrodb_overview.png" title="Macro Database window overview (Click to enlarge)" 
    alt="Macro Database window overview" class="float">}}
    
The Macro database docking window contains all available macros. It is the most important docking window for creating
and modifying [process graphs]({{<relref "introduction.md#impresario-process-graphs">}}). Therefore it can be customized to 
better suit your needs.

The window consists of two parts. The upper bigger part is the so called "[Macro area]({{<relref "#macro-area">}})",
the lower part is the "[Information area]({{<relref "#information-area">}})".

# Macro area
The macro area is dominated by a tree view which visualizes all macros available for creating process graphs. Macros can be
displayed in a tree structure or in a simple list including additional properties for structuring and sorting them. Sorting the
database is possible by clicking a column's header.
The following item types with their corresponding icons can be displayed:

{{<itemtype "macro.png" "Macro">}} is the macro itself identified by its name. It is the only mandatory item type to be displayed.

{{<itemtype "macrodb.png" "Macro library">}} denotes the library a macro belongs to. A macro library consists of one or more macro library files.

{{<itemtype "macrolib.png" "Macro library file">}} is the physical file (.dll or .so) a macro is loaded from. 

{{<itemtype "macrogroup.png" "Macro group">}} shows each macro's group. Macro developers can sort macros into groups for sorting
and structuring the database.

{{<itemtype "macrobuild.png" "Macro build">}} gives build information about each macro. The build information contains the
compiler name, compiler version, and the type of build ("Release" or "Debug").

{{<itemtype "macrocreator.png" "Macro creator">}} displays the name of a macro's developer.

{{<itemtype "macrotype.png" "Macro type">}} denotes each macro's type. Currently the macro type has one of the following 
values: "Macro" or "Viewer". While the value "Macro" denotes a regular macro, "Viewer" is assigned to macros which visualize
data types exchanged between regular macros. These macros are handled differently and are called *viewers*.

{{<itemtype "eye.png" "Viewer">}} is a special type of macro for visualizing data types exchanged by the regular macros. Viewers
are always shown in light gray color to indicate that they are listed for information purposes only.
In the [settings dialog]({{<relref "settings.md#macro-database">}}) it is possible to disable the listing 
of viewers in the database to avoid confusion.

At the top of the macro area three controls are located which allow to layout and narrow down the number of macros displayed
in the tree view.

## View
The View combo box contains a list of available views which change the structure and type of information displayed in the tree
view containing the macros. Pressing the {{< menuCommand "dbview.png" "View">}} button brings up the [view settings page]
({{<relref "settings.md#view">}}) which allows you to create and modify your own views.

## Filter
Filters can be used to only display macros which fulfil the criteria defined by the active filter. The filter combo box offers
all filters defined. It also contains the special filter "None" which actually switches off filtering. The list of filters can
be modified. The {{< menuCommand "dbfilter.png" "Filter">}} button is a direct shortcut to the [filter settings page]
({{<relref "settings.md#filter">}}).

## Search
Text entered into the search input box narrows down the number of macros in the tree view directly. The entered text is matched
against each macro's name, starting from its beginning. The match is case insensitive. Only matching macros are shown in 
the tree view and the first matching macro is highlighted. Pressing the "Enter" key in this situation adds one instance of the
highlighted macro to the top left corner of the current active process graph. The {{< menuCommand "reset.png" "Reset">}} button 
clears the search input box. The [settings related to the macro database]({{<relref "settings.md#macro-database">}}) offer an 
option to automatically reset the search input box after pressing the "Enter" key.

# Information area
The information area displays more detailed information for each item type when selected in the tree view. Depending on the
selected item type one to three different tabs with information are available. The [settings dialog]({{<relref "settings.md#macro-database">}}) 
allows to configure the default tab for each item type.

## General information tab
{{< figure src="macrodb_general.png" link="macrodb_general.png" title="Tab for general item information (Click to enlarge)" 
    alt="Tab for general item information" class="float">}}
    
General information are displayed for every item type but the most detailed information are available for {{<itemtype "macro.png" "Macros">}}
(see screenshot for an example), {{<itemtype "macrolib.png" "Macro library files">}}, and {{<itemtype "eye.png" "Viewers">}}. For the remaining types only
the item type and name are displayed.

## Description tab
{{< figure src="macrodb_description.png" link="macrodb_description.png" title="Tab displaying item descriptions (Click to enlarge)" 
    alt="Tab displaying item descriptions" class="float">}}
    
Descriptions are only available for item types {{<itemtype "macro.png" "Macros">}}
(see screenshot for an example), {{<itemtype "macrolib.png" "Macro library files">}}, and {{<itemtype "eye.png" "Viewers">}}.
However, the developer must have provided this information otherwise the tab will be empty.

## Instances tab
{{< figure src="macrodb_instances.png" link="macrodb_instances.png" title="Tab showing macro instances (Click to enlarge)" 
    alt="Tab showing macro instances" class="float">}}
    
The instances tab is only shown in case a {{<itemtype "macro.png" "Macro">}} is selected. In this case this tab lists all currently 
created instances of the selected macro. The list has two columns. 

The column denoted "Instance UUID" contains the Universal Unique Identifier of an instance Impresario uses to identify the macro
instances within the application. 

The column with header "Location" shows the process graph's name the macro instance is located in. The process graph name may be set to 
"(Untitled)" in case the graph has just been created and never been saved to disk. Left to the location's name an icon depicts a more
detailed status of each instance. The unbroken chain icon {{< icon "macrolinked.png" >}} means that the macro instance is an active part of the 
process graph, the broken chain icon {{< icon "macrounlinked.png" >}} denotes a macro instance which was removed from the process graph but is still 
available for an {{< menuCommand "undo.png" "Undo">}} command.
All macro instances removed from a process graph will be irrevocably deleted as soon as the process graph is saved.

A right click on any row in the tab brings up a popup menu which allows you to navigate directly to the selected macro instance (for active instances)
or at least to its process graph (for already removed instances).
