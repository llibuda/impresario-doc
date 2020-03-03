---
date: 2018-01-04T17:34:43+01:00
categories: "Developer's Guide"
weight: 5
title: "Setting up macro information"
description: "In this section you learn how to provide basic information about your macro to Impresario."
menu: 
  main:
    Name: "- Setting up macro information"
    Parent: "devguide"
---

Before a new macro can be handled by Impresario's [macro database ]({{< relref "../userguide/macrodb.md" >}}),
some information about the macro have to be provided. Therefore the base class `MacroBase` defines four 
API methods:

{{<highlight cpp>}}
void setName(const std::wstring& strName);
void setGroup(const std::wstring& strGroup);
void setCreator(const std::wstring& strCreator);
void setDescription(const std::wstring& strDescription);
{{</highlight>}}

`setName` sets the display name for the new macro. This name has to be unique within one 
macro project but it is even better if this name is unique globally.

`setGroup` sets the group name this macro belongs to. This name is case sensitive.

`setCreator` sets the name for the programmer of this macro. The creator name is also case sensitive.

`setDescription` sets the help text which is displayed in the [description tab]({{< relref "../userguide/macrodb.md#description-tab" >}})
of Impresario's [macro database window]({{< relref "../userguide/macrodb.md" >}}) as soon as this macro is selected.


# Example
Every of these four methods should be called once in the macro's constructor to ensure that 
Impresario can access all necessary information. The following code snippet shows the constructor's 
definition of the example macro declared in the previous section:

{{<highlight cpp>}}
#include "cannyedge.h"

LtiCannyEdge::LtiCannyEdge() : MacroBase{} {
  // set up macro description
  setName(L"lti::cannyEdges");
  setCreator(L"Lars Libuda");
  setGroup(L"Image Processing");
  setDescription(L"Detects edges in a lti::channel8");
  // more code to come...
}
{{</highlight>}}

Please continue with section [Setting up macro input and output ports]({{< relref "macrotutorial3.md" >}}).
