---
categories: "User's Guide"
date: 2016-04-03T19:47:31+01:00
menu:
  main:
    Name: "Reference: Property window"
    Parent: userguide
    Identifier: propwnd
title: "Reference: Property window"
description: "The property window allows to change settings for the process graph and macro parameters. It also provides detailed information
              about every component in a process graph."
weight: 7
---

{{< figure src="propwnd_overview.png" link="propwnd_overview.png" title="Property window overview (Click to enlarge)" 
    alt="Property window overview" class="float">}}

The Property docking window shows all available settings for the item currently selected in the active process graph editor. This applies
to macros, links, and the process graph itself. The settings for the process graph are displayed as soon as neither a macro nor a link is selected.

The window consists of two parts. The upper bigger part is the so called "[Settings area]({{<relref "#settings-area">}})",
the lower part is the "[Information area]({{<relref "#information-area">}})".

# Settings area
The settings area displays all properties for the selected item which can be changed by the user. These are:

* *Process graph*: Settings for the process graph are shown which currently just affects the layout of the graph.

* *Link*: Currently links do not have any configurable properties.

* *Macros*: For macros all adaptable parameters are listed. By default Impresario displays all parameters in a simple list with one parameter per row. 
  However, the developer of a macro can choose to display the parameters in a different way.

Changing any setting here will affect the selected item instantly. All settings are stored with the process graph when it is 
{{< menuCommand "save.png" "Saved" >}}.
  
# Information area
The information area displays more detailed information about the selected item in the process graph editor. Depending on the
selected item type one or two different tabs with information are available. The [Property Window page]({{<relref "settings.md#property-window">}}) in
the settings dialog allows to configure the default tab for each item type.

## General information tab
{{< figure src="propwnd_general.png" link="propwnd_general.png" title="Tab for general item information (Click to enlarge)" 
    alt="Tab for general item information" class="float">}}

General information are displayed for every item type:

* *Process graph*: Information include the process graph's name and the number of macros and links respectively.

* *Link*: For links the data type and their source and destination is shown.

* *Macros*: For macros you can find a subset of the details shown in the 
  [information area of the Macro database window]({{<relref "macrodb.md#information-area">}}) when a macro is selected there.

## Description tab
{{< figure src="propwnd_description.png" link="propwnd_description.png" title="Tab displaying item descriptions (Click to enlarge)" 
    alt="Tab displaying item descriptions" class="float">}}
    
The description tab is displayed only when a macro is selected in the editor. As soon as a macro is selected a detailed description is shown here, provided that
the developer of the macro included it in her implementation. However, as soon as a macro parameter is selected in the settings area, a description of this 
parameter is shown. This of course only works correctly if the macro developer implemented the parameter help.

