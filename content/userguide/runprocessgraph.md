---
date: 2016-11-04T15:35:34+01:00
categories: "User's Guide"
weight: 5
title: "Running process graphs"
description: "Running process graphs and visualizing results is what Impresario was made for. Here you find detailed descriptions
              how you can run a process graph and what is displayed while running a process graph."
menu: 
  main:
    Name: "Running process graphs"
    Parent: "userguide"

---

Process graphs can be run in Impresario's process graph editor. **Please note: While a process graph is running it cannot be modified!**

# Control
To start running a process graph use the {{< menuCommand "control_play.png" "Start">}} command. This will initialize all macro instances
which are subsequently processed in a loop afterwards. In case an error occurs during initialization or processing of any macro instance,
execution is stopped automatically and an error message is displayed in the [System Messages window]({{<relref "auxdocks.md#system-messages-window">}}).

With the {{< menuCommand "control_pause.png" "Pause">}} command it is possible to pause processing the current process graph at any time. Using this
command again resumes processing. The {{< menuCommand "control_stop.png" "Stop">}} command finally stops processing the current process graph.

A special command is the {{< menuCommand "control_end.png" "Snap">}} command. It runs the current process graph for exactly one cylce, i.e. every
macro instance in the process graph is run once. Afterwards execution is stopped automatically.

# Macro indications
Each macro displays its current status and last execution time. The execution time measures the time the macro instance required to run its code and 
can therefore be used to estimate its performance with varying inputs. The status is displayed as LED which can have the following colors and meanings:

* Black or off {{<icon "bullet_black.png">}}: The process graph is stopped.
* Green {{<icon "bullet_green.png">}}: The macro instance is in idle state, i.e. waiting to be run.
* Orange {{<icon "bullet_orange.png">}}: The macro instance is currently running.
* Red {{<icon "bullet_red.png">}}: An error occured in the macro instance. In this case an error message should also be displayed in the
  [System Messages window]({{<relref "auxdocks.md#system-messages-window">}})

# Visualization of results
It is possible to look at the data flowing through the graph at runtime. The only prerequisite is a viewer for the data type to be visualized.
Viewers can be opened by:

* Right clicking the desired output pin of a macro instance and choosing the {{< menuCommand "eye.png" "Watch">}} command in the context menu.
* Right clicking the desired link and choosing the {{< menuCommand "eye.png" "Watch">}} command in the context menu.
* Double clicking the desired link.

If a viewer is available for the data type represented by the link or output pin a separate window will open and show the current data. Otherwise
an error message stating that no viewer is available for the data type will appear in the 
[System messages window]({{<relref "auxdocks.md#system-messages-window">}}).

# Changing parameters at runtime
While a process graph is running it is possible to change parameters of any macro instance. Just select the macro instance for which you would like 
to change some parameters and the parameters will be displayed in the [Property window]({{<relref "propwnd.md">}}). Here you can change the parameters. 
The changed values take effect immediately.
