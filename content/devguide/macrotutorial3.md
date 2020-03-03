---
date: 2018-01-04T17:34:43+01:00
categories: "Developer's Guide"
weight: 6
title: "Setting up macro input and output ports"
description: "How to set up macro input and output ports."
menu: 
  main:
    Name: "- Setting up macro input and output ports"
    Parent: "devguide"
---

Before a macro can process any input data and produce output data, it has to declare the input and output ports so 
that Impresario knows which type of input data the macro expects and which output data it creates. Input and output ports 
are declared in the macro's constructor with the help of the following two methods which are implemented in the 
macro's base class `MacroBase`:

{{<highlight cpp>}}
template<typename T>
bool addInput(const std::wstring& name, 
              const std::wstring& description);

template<typename T>
bool addOutput(const std::wstring& name, 
               const std::wstring& description);
{{</highlight>}}

Both methods have the same arguments. With the template argument of these methods you define the type of the 
input or output port to be created. This can be any type.

The first argument `name` is the port's name. This name is displayed in Impresario 
as soon as the mouse cursor is hovered over the port in the process graph editor.

The second argument `description` is a short description of the port.

The methods return `true` in case the port was successfully added to the macro, `false`otherwise.

**Note:** Internally input and output ports are appended to separate vectors so that they are indexed 
in the order of definition. These indices start counting from zero. This is important to remember when you have to
access the ports later on for processing.

# Example
In the following code the example macro for edge detection is enhanced with one input and one output port of type
`lti::channel8`. This type is part of the 
[LTI Lib 2 image processing library](http://www.ie.tec.ac.cr/palvarado/ltilib-2/html/index.html) and 
defined in the library's appropriate include file.

{{<highlight cpp>}}
#include "cannyedge.h"
#include "ltiChannel8.h"

LtiCannyEdge::LtiCannyEdge() : MacroBase{} {
  // set up macro description
  setName(L"lti::cannyEdges");
  setCreator(L"Lars Libuda");
  setGroup(L"Image Processing");
  setDescription(L"Detects edges in a lti::channel8");
  addInput<lti::channel8>(L"Input image",
           L"8-bit grey scale image for edge detection");
  addOutput<lti::channel8>(L"Output image",
            L"8-bit grey scale image with detected edges");
  // more code to come...
}
{{</highlight>}}

Please continue with section [Setting up macro parameters]({{< relref "macrotutorial4.md" >}}).
