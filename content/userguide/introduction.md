---
date: 2015-06-21T17:52:09+02:00
categories: "User's Guide"
weight: 1
title: "Introduction"
description: "Detailed introduction to Impresario, its purpose, basic concepts, and features.
              It also contains a short history of Impresario."
menu: 
  main:
    Name: "Introduction"
    Parent: "userguide"
    Identifier: introduction
---

*Impresario* is the acronym for "**Im**age **Pr**ocessing **E**ngineering **S**ystem **A**pplying **R**eusable 
**I**nteractive **O**bjects". It is originally designed as a *Rapid Prototyping System* for easy creation and testing 
of image processing algorithms in the context of larger solutions. But it is not limited to it.

# Basic concepts and features
To get a basic understanding of how Impresario works, the following paragraphs outline Impresario's basic concepts and
features.

## Macros
Impresario relies on the availability of "Reusable Interactive Objects" as mentioned in its acronym. Impresario 
denotes these reusable interactive objects as "Macros". A macro is a functional element which is fully described
by its input data, output data, and parameters. The latter control the behavior of the functional element. 

A macro can most likely be compared to a function block as defined in IEC 61131-3 for programming PLCs (Programmable
Logic Controller).

## Macro libraries
A macro library contains several macros which are loaded from one or more macro library files. A macro library file is 
a dynamic link library (.dll) on Windows platforms and a shared object file (.so) on Linux like platforms.

Impresario comes with a simple C++ API to create your own macro libraries using any license you wish. This is Impresario's
core feature. The provided API allows the developer to focus on the implementation of the desired macro functionality by
hiding all interactions with Impresario and GUI related tasks from the developer.

## Macro database
During start-up Impresario loads all available macro libraries from predefined directories and adds all macros
contained in the libraries to its database which is finally presented to the user.

Impresario allows the user to customize views and filters for the database.

## Impresario Process Graphs
Impresario provides a graphical editor which allows to add macros from the macro database to a document and connect
macro output data to another macro's input data. The result is a directed graph called Impresario Process Graph. 
Impresario can save these graphs to files and also restore them from files.

Each Impresario Process Graphs represents an application or program the user created. An Impresario Process Graph can
most likely be compared to a function block diagram as defined in IEC 61131-3, which is one graphical programming syntax
to program PLCs.

## Data flow engine
Impresario features a multithreaded data flow engine which allows to run Impresario Process Graphs in the editor. 
During runtime you can inspect each macro's output data and its execution time. Execution can be paused and resumed as
you like.

## Multi platform support
I chose the [Qt framework](http://www.qt.io) for developing Impresario version 2.x. Impresario runs on Windows and 
Linux platforms. Macs should be supported as well but I haven't tested it as I do not own a Mac. 

**Please note**: As everybody is welcome to develop her own macro libraries, macro libraries must not necessarily be
cross-platform enabled.

# Abstraction
In the end it actually depends on the macros' functionalities what Impresario is suitable for. As stated in its acronym, 
Impresario originated from the purpose to develop and test image processing solutions. Therefore all macros
developed so far have functionalities related to image processing.

However, Impresario's architecture does not limit it to image processing. On a more abstract level Impresario 
can be considered as a graphical function block diagram editor with a data flow engine in the background 
running the function block diagrams in place and visualizing the results. It is up to you to find more
application areas in which Impresario may be useful.

# History
I developed the 1.x versions of Impresario between 2003 and 2006 at the Chair of Technical Computer Science at 
RWTH Aachen University, Germany. These versions were exclusively developed for Windows operating systems - particular
Windows NT and Windows XP - using Microsoft Visual C++ and Microsoft Foundation Classes (MFC). 

Impresario was used as development and testing framework for image processing solutions in several diploma theses 
and my PhD thesis. And as I successfully finished my PhD thesis it fullfilled its purposes to full extent.

In 2006 the Chair of Technical Computer Science closed. Since then Impresario has not been of any use and hasn't been
maintained. So the original code does not run on Windows Vista and higher.

In winter time 2011 I rediscovered the code on one of my hard disks during a relocation. I spontaneously decided 
to start a new implementation from scratch without all the quirks and workarounds of the 1.x version and with 
multi platform support. The result is now available as Impresario version 2.x licensed under the terms of GPLv3
on [GitHub](https://github.com/llibuda/impresario). Hopefully, it lasts for longer than version 1.x and finds a 
community for maintenance and further development.


