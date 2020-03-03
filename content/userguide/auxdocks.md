---
categories: "User's Guide"
date: 2016-03-13T12:12:13+02:00
menu:
  main:
    Name: "Reference: Auxiliary windows"
    Parent: userguide
    Identifier: auxdocks
title: "Reference: Auxiliary docking windows"
description: "This section documents Impresario's auxiliary docking windows. They are not necessarily required for work but may provide
              additional and more detailed information in some situations."
weight: 10
---

Next to the [macro database]({{<relref "macrodb.md">}}) and [property docking windows]({{<relref "propwnd.md">}}), Impresario provides some more 
docking windows which give additional and more detailed information about Impresario's current state and other components.

# System Messages Window
The System Messages window displays all messages Impresario reports during runtime. Especially at start-up many messages are produced
to control which directories and macro libraries are actually used.

Messages are categorized as {{< menuCommand "information.png" "Information" >}}, {{< menuCommand "warning.png" "Warnings" >}}, and 
{{< menuCommand "error.png" "Errors" >}}. You can filter these categories by pressing the corresponding buttons in the toolbar attached to the
window. Here you also find commands to {{< menuCommand "save.png" "Save" >}} the current messages to a text file and 
{{< menuCommand "delete.png" "Delete" >}} all messages.

{{< figure src="dock_systemmsg.png" link="dock_systemmsg.png" title="System Messages docking window (Click to enlarge)" 
    alt="System messages docking window" >}}

# Change log Window
This window lists all changes to the current process graph since it was last saved in chronological order (see [Editing process graphs]({{<relref "createprocessgraph.md">}})). 
You can restore each state by just clicking the corresponding entry. When you save the current process graph the list is cleared.
The {{< menuCommand "undo.png" "Undo">}} and {{< menuCommand "redo.png" "Redo">}} command operate on this list as well.

{{< figure src="dock_changelog.png" link="dock_changelog.png" title="Change log docking window (Click to enlarge)" 
    alt="Change log docking window" >}}

# Console output Window
Impresario redirects the output of `std::cout` and `std::cerr` to this window. However, Impresario itself does not send any messages 
to the standard console outputs but it is a feature every programmer who develops macros can make use of.
Therefore this window stays empty as long as a macro's programmer does not use this feature in her code.

The window offers commands to {{< menuCommand "save.png" "Save" >}} the current messages to a text file and to
{{< menuCommand "delete.png" "Delete" >}} all messages.

{{< figure src="dock_console.png" link="dock_console.png" title="Console output docking window (Click to enlarge)" 
    alt="Console output docking window" >}}
    
