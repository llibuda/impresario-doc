---
date: 2015-06-21T17:52:09+02:00
categories: "User's Guide"
weight: 3
title: "Introducing Impresario's GUI"
description: "When you start Impresario for the first time, everything is new. Here you find a short introduction to the most important
              components of Impresario's user interface."
menu: 
  main:
    Name: "Introducing Impresario's GUI"
    Parent: "userguide"

---

After starting Impresario the window as shown in the following screenshot pops up which features the components marked by the annotated red rectangles:

{{< figure src="impresario_start.png" link="impresario_start.png" title="Impresario GUI after startup (Click to enlarge)" 
    alt="Impresario main window after startup" >}}

* *Menu bar*: The menu bar contains all commands available in Impresario's current context. A reference of all commands is available in the chapter 
  [Commands]({{<relref "menu.md">}}).
* *Tool bar*: The tool bar contains short cuts to some commands available in the menu.
* *Macro database window*: The [Macro database window]({{<relref "macrodb.md">}}) provides all [macros]({{<relref "introduction.md#macros">}}) Impresario 
  knows about for use in [process graphs]({{<relref "introduction.md#impresario-process-graphs">}}). This window is populated during startup of Impresario.
* *System messages window*: In the [System messages window]({{<relref "auxdocks.md#system-messages-window">}}) Impresario prints out information, warnings, and 
  errors which occur during startup and operation. After startup you will find information about the used directories, loaded macros, and much more.
* *Status bar*: The status bar displays temporay information when some operation like loading a process graph is carried out.

Finally, the dark gray area is the working area which is populated with process graph editors as soon as they are created by using the {{< menuCommand "new.png" "New" >}}
command or opended from disk by using the {{< menuCommand "open.png" "Open..." >}} command.

# Process graph editor
The following screenshot shows Impresario's process graph editor containing a process graph.

{{< figure src="impresario_editor.png" link="impresario_editor.png" title="Impresario editor with opened process graph (Click to enlarge)" 
    alt="Impresario editor with opened process graph" >}}

In addition to the editor also the [Property window]({{<relref "propwnd.md">}}) is shown which displays all properties of the selected components in 
the process graph editor.

The process graph editor contains two different types of components:

* Macros (more precisely: Instances of macros)
* Links between macro instances

## Macro instances
{{< figure src="macro_elements.png" link="macro_elements.png" title="Macro visualization (Click to enlarge)" 
    alt="Macro visualization" class="float">}}
    
{{< figure src="pin_prop_allowed.png" link="pin_prop_allowed.png" title="Detailed pin information (Click to enlarge)" 
    alt="Detailed pin information" class="float">}}
    
Macro instances are visualized as rectangles in the process graph editor. In general, a macro instance has (yellow) input pins and (red) output pins to connect the macro instance
to different macro instances. Further, each macro instance displays its name, its status and last execution time, and its order number. The order number is automatically
calculated by Impresario as soon as the macro instance is connected to other macro instances. 

When you hover over a pin with the mouse, an information window pops up giving information about the pin's name and data type. In addition the mouse cursor changes indicating whether
it is possible to create a connection to this pin.
  
## Links
Links are connections between an output pin of one macro instance (source) and an input pin of another macro instance (destination). They are visualized by black lines 
with an arrow head pointing to the input pin. Links define the data flow within the process graph and therefore determine the chronological order in which the macro instances
are executed when the process graph is run. So everytime a link is added or removed, Impresario updates the order number of all affected macro instances.

Impresario routes all links automatically.

## Context menus
{{< figure src="pin_prop_menu.png" link="pin_prop_menu.png" title="Pin context menu (Click to enlarge)" 
    alt="Pin context menu" class="float">}}
    
The process graph editor provides context menus for all components in the editor:
    
* Macro instances
* Macro pins (see screenshot)
* Links
* Selection of components
* Editor itself (empty space)

A context menu can be accessed by right clicking the respective component. It mainly provides shortcuts to the commands available on the toolbar and the menu bar but in some 
cases also contains special commands only applicable to the selected component.

