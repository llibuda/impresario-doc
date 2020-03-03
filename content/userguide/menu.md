---
categories: "User's Guide"
date: 2016-01-21T21:01:09+02:00
menu:
  main:
    Name: "Reference: Commands"
    Parent: userguide
    Identifier: menucmds
title: "Reference: Commands"
description: "Reference and brief description of all available commands."
weight: 9
---

This section contains an overview of all available commands in the menu bar, toolbars, and context menus. Not
all commands are available all the time. It depends on the application's context which commands can be triggered.

# File menu
{{< menuCommand "new.png" "New">}} creates a new empty process graph.

{{< menuCommand "open.png" "Open...">}} displays a file dialog to open an existing process graph. The
dialog starts by default in the directory for process graphs as given by the settings dialog.

{{< menuCommand "save.png" "Save">}} saves the current process graph. In case the process graph is still
unnamed, a "Save as" dialog will be shown to select an appropriate file name.

{{< menuCommand "Save as...">}} saves the current process graph under a different name. The file name can
be set in the shown "Save as" file dialog.

{{< menuCommand "Close">}} closes the current process graph. In case the process graph is still running you
will be prompted to stop it first. In case there are unsaved changes in the current process graph you will be
prompted to save or discard the changes.

{{< menuCommand "Close all">}} closes all open process graphs. In case a process graph is still running you
will be prompted to stop it first. In case there are unsaved changes in an open process graph you will be
prompted to save or discard the changes.

{{< menuCommand "quit.png" "Quit">}} quits the application. If a process graph is still running
you have to stop it before you can quit Impresario. If there are unsaved changes in any open
process graphs you will be prompted to save or discard the changes.

# Edit menu
{{< menuCommand "undo.png" "Undo">}} will undo the last edit action. This command is coupled to the 
[Change Log window]({{< relref "auxdocks.md#change-log-window" >}}).

{{< menuCommand "redo.png" "Redo">}} will redo the last edit action which was undone before. This command is coupled 
to the [Change Log window]({{< relref "auxdocks.md#change-log-window" >}}).

{{< menuCommand "cut.png" "Cut">}} cuts the selected items (macros and links) from the current process graph and
adds them to the clipboard. **Please note**:
 
* Links which are not selected but will become loose by cutting either the source or destination macro will be deleted! 
* Links which are selected but both their respective source **and** destination macros are not part of the selection are 
  not added to the clipboard but will be deleted!

{{< menuCommand "copy.png" "Copy">}} copies the selected items (macros and links) to the clipboard. 
**Please note**: "Loose" links are not copied, i.e. links which are selected but both their respective source **and** destination macros
are not part of the selection!

{{< menuCommand "paste.png" "Paste">}} pastes the contents of the clipboard to the current process graph.

{{< menuCommand "Delete">}} deletes the selected items (macros and links) in the current process graph. **Pleate note:**
Links which are not selected but will become loose by deleting either the source or destination macro will also be deleted!

{{< menuCommand "Select all">}} selects all items in the current process graph.

# View menu

{{< menuCommand "Toolbars">}} opens a submenu which allows to toggle the visibility of all toolbars. 

{{< menuCommand "Docks">}} opens a submenu which allows to toggle the visibility of all docking windows. 

{{< menuCommand "zoom_100.png" "Zoom 100%">}} zooms the view on the current process graph to its original size.

{{< menuCommand "zoom_in.png" "Zoom In">}} increases the zoom level on the current view. Maximum zoom is 300%.

{{< menuCommand "zoom_out.png" "Zoom Out">}} decreases the zoom level on the current view. Minimum zoom is 20%.

{{< menuCommand "zoom_selection.png" "Fit to Selection">}} activates the zoom cursor which allows you to select an
area in the current process graph to zoom into. After selection the selected area is zoomed to fit the current view.

{{< menuCommand "zoom_page.png" "Fit to Page">}} fits the zoom so that the whole process graph is shown in the current
view. However, the zoom will not go below 20% or above 300%.

# Control menu
{{< menuCommand "control_play.png" "Start">}} starts executing the current process graph. In case an error occurs
the process graph is stopped automatically and an error message is displayed in the System Messages window.

{{< menuCommand "control_pause.png" "Pause">}} pauses execution of the current process graph.

{{< menuCommand "control_stop.png" "Stop">}} stops executing the current process graph.

{{< menuCommand "control_end.png" "Snap">}} executes the current process graph for exactly one cylce, i.e. every
macro in the process graph is run once. Afterwards execution is stopped.

# Extras menu
{{< menuCommand "settings.png" "Settings...">}} displays the [settings dialog]({{< relref "settings.md" >}}) to configure 
some aspects of Impresario.

# Help menu
{{< menuCommand "help.png" "Contents...">}} opens this online help.

{{< menuCommand "information.png" "About Impresario...">}} shows the dialog containg information about Impresario like version number, 
license, and credits.

# Process graph editor context menu
Within a process graph editor different context menus are shown depending on which component the user right clicks. These context
menus offer the standard commands for [Edit]({{< relref "#edit-menu" >}}) and [Control]({{< relref "#control-menu" >}}), and the
following special commands:

{{< menuCommand "anchor.png" "Toggle cycle anchor">}} allows to set and unset a cycle anchor for the selected macro to disambiguate a cycle
in the process graph. This command is only available in the macro context menu if a cycle in the current process graph is detected which 
Impresario cannot disambiguate itself. 

{{< menuCommand "eye.png" "Watch">}} opens a viewer window for the selected output pin or link. This command is available by right clicking
either an link or a macro's ouput pin.

# Macro database context menu
In the Macro database window two context menus are available. In the [Macro area]({{< relref "macrodb.md#macro-area" >}}) a right click
on a {{<itemtype "macro.png" "Macro">}} opens a context menu for adding macro instances to the current process graph.
The context menu in the [Instances tab]({{< relref "macrodb.md#instances-tab" >}}) of the [Information area]({{< relref "macrodb.md#information-area" >}})
allows to navigate to the selected macro.

## Macro area context menu
{{< menuCommand "Create 1 instance">}} creates a new instance of the selected macro and adds it to the current process graph editor.

{{< menuCommand "Create 2 instances">}} creates two new instances of the selected macro and adds them to the current process graph editor.

{{< menuCommand "Create 3 instances">}} creates three new instances of the selected macro and adds them to the current process graph editor.

{{< menuCommand "macrocreate.png" "Create multiple instances...">}} opens a dialog where you can choose the number of instances which are to
be created of the selected macro and added to the current process graph editor. The dialog allows to create up to 10 instances at once.

## Instances tab context menu
{{< menuCommand "Navigate to Macro instance">}} activates the process graph editor in which the selected macro is located and selects the macro 
within the editor. This command is only available when the selected Macro is part of a process graph.

{{< menuCommand "Navigate to Process graph">}} activates the process graph editor in which the selected macro was located before it was deleted from the
editor. This command is only available when the selected Macro was deleted from the process graph editor but is still available in the 
[Change Log window]({{< relref "auxdocks.md#change-log-window" >}}) for an undo action.