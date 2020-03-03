---
date: 2015-09-05T13:20:43+02:00
categories: "User's Guide"
weight: 4
title: "Editing process graphs"
description: "Creating and modifying process graphs is the most frequent task. This section documents how you can edit them."
menu: 
  main:
    Name: "Editing process graphs"
    Parent: "userguide"

---

Editing a process graph mainly comprises adding and removing macros as well as adding and removing links between macros. 
In some situations also loops have to be resolved. Impresario supports all these tasks in several ways.

# Adding macros to a process graph
When a macro is added to a process graph a new instance of this macro is created. Either of the following methods can be used to add a new
macro instance to a process graph:

* The most straight forward way is to simply left-click the desired {{<itemtype "macro.png" "Macro">}} object in the [Macro database window]({{<relref "macrodb.md">}}),
  drag the macro to the desired position in the process graph editor and drop it there.
  {{< figure src="macro_add1.png" link="macro_add1.png" title="Adding a macro instance by left-click drag & drop (Click to enlarge)" 
    alt="Adding a macro instance by left click drag & drop" >}}

* It is also possible to search for the desired macro by entering text in the search input box. The first {{<itemtype "macro.png" "Macro">}} object
  matching the text is highlighted. Pressing the "Enter" key now adds a new instance of the macro to the top left corner of the process graph editor.
  {{< figure src="macro_add2.png" link="macro_add2.png" title="Adding a macro instance using the search input box (Click to enlarge)" 
    alt="Adding a macro instance using the search input box" >}}

* A right-click on the desired {{<itemtype "macro.png" "Macro">}} object in the Macro database window brings up a context menu which allows you to
  {{< menuCommand "Create 1 instance">}}, {{< menuCommand "Create 2 instances">}}, or {{< menuCommand "Create 3 instances">}} of the selected macro.
  More than three instances can also be created by choosing the {{< menuCommand "macrocreate.png" "Create multiple instances...">}} command. This will
  open a dialog for creating up to ten instances at once. All created macro instances will be placed in the top left corner of the process graph editor.
  {{< figure src="macro_add3.png" link="macro_add3.png" title="Adding a macro instance using the context menu (Click to enlarge)" 
    alt="Adding a macro instance using the context menu" >}}

* A combination of the first and third method can be achieved by right-clicking a {{<itemtype "macro.png" "Macro">}} object in the Macro database window,
  dragging it to the desired position in the process graph editor and drop it there. This will open up the context menu for creating several instances as above.
  All macro instances will be created at the drop position. **However, this method only works on Windows operating systems**.
  {{< figure src="macro_add4.png" link="macro_add4.png" title="Adding a macro instance by right-click drag & drop (Click to enlarge)" 
    alt="Adding a macro instance by right click drag & drop" >}}
    
# Creating links between macros
The data flow between macros is determined by links which connect an output pin of one macro with another macro's input pin. The following rules apply to links:

1. A macro output pin can only be connected to a macro input pin of the same data type.
2. A macro's output pin can be connected to many macro input pins.
3. A macro input pin can only have one connection to another macro's output pin.
4. A macro output pin cannot be connected to a macro input pin of the same macro instance.

Creating a link requires the following steps:

{{< figure src="macro_link1.png" link="macro_link1.png" title="Start link creation (Click to enlarge)" alt="Start link creation" class="float_fix">}}

* Left-click the output pin and hold down the left mouse button. Start dragging the mouse cursor. A red line will be drawn from the output pin
  to the current mouse position. The mouse cursor also turns into a link cursor depicting an invalid link destination.

{{< figure src="macro_link2.png" link="macro_link2.png" title="Invalid link destination (Click to enlarge)" alt="Invalid link destination" class="float_fix">}}

* You can hover over various macro input pins. If the data types of the output pin and currently hovered input pin are not identical, the 
  link line stays red and the mouse cursor still depicts an invalid link destination.

{{< figure src="macro_link3.png" link="macro_link3.png" title="Valid link destination (Click to enlarge)" alt="Valid link destination" class="float_fix">}}

* As soon as you hover over a macro input pin with identical data type the link line turns green and the mouse cursor indicates a valid
  link destination.

{{< figure src="macro_link4.png" link="macro_link4.png" title="Created link (Click to enlarge)" alt="Created link" class="float_fix">}}

* Release the mouse button. The green line is replaced by a black link with an arrow head pointing to the connected macro input pin.

It is also possible to create links by starting from a macro's input pin and connect to another macro's output pin.

# Resolving loops
{{< figure src="macro_loop.png" link="macro_loop.png" title="Unresolvable loop (Click to enlarge)" alt="Unresolvable loop" class="float">}}

It may happen that you create circular references between macros resulting in a loop Impresario cannot resolve itself from execution order point of view. In this case
you have to guide Impresario.
<br>
Impresario marks all macros within an unresolvable loop with a red circular arrow {{< icon "cycle.png" >}} and does not assign these macros an execution order number.

{{< figure src="macro_loop_menu.png" link="macro_loop_menu.png" title="Context menu for resolving loops (Click to enlarge)" alt="Context menu for resolving loops" class="float">}}

To resolve a loop you have to use the command {{<menuCommand "anchor.png" "Toggle cycle anchor" >}} which is exclusively available on the context menu of each macro
within the loop you need to resolve.<br>
By executing this command on a macro, you tell Impresario to use this macro as starting point - or anchor - for calculating the execution order.

{{< figure src="macro_loop_resolve.png" link="macro_loop_resolve.png" title="Manually resolved loop (Click to enlarge)" alt="Manually resolved loop" class="float_fix">}}

The macro you selected as anchor is subsequently marked with the anchor icon {{< icon "anchor.png" >}}.<br/>
<b>Please note</b>: When you further change your process graph it may happen that Impresario can resolve the loop on its own you just resolved manually. In this case
Impresario will do so and the anchor icon will disappear again.

# Standard edit operations
{{< figure src="macro_prop_sel.png" link="macro_prop_sel.png" title="Selection (Click to enlarge)" alt="Selection" class="float" >}}

Impresario supports the standard edit operations {{< menuCommand "cut.png" "Cut">}}, {{< menuCommand "copy.png" "Copy">}}, and {{< menuCommand "Delete">}}. These 
commands work on a single macro, a single link, or a selection consisting of several macros and/or links.
To make a selection, press the left mouse button and pull a rectangle around all components to be selected. Afterwards, the standard edit commands are applied to the current selection.
Copied or cut selections can be inserted in the same or a different process graph editor using the {{< menuCommand "paste.png" "Paste">}} command.

{{< figure src="macro_prop_size.png" link="macro_prop_size.png" title="Resizing (Click to enlarge)" alt="Resizing" class="float">}}

When a single macro is selected, small circles are displayed in each corner. By left clicking a circle and holding down the mouse button the selected macro can be resized.

# Undo and Redo
All operations described in the previous sections can be undone or redone at any time until the process graph is saved. Undoing or redoing edit operations is possible by
using the {{< menuCommand "undo.png" "Undo">}} and {{< menuCommand "redo.png" "Redo">}} commands or the [Change log Window]({{<relref "auxdocks.md#change-log-window">}}).