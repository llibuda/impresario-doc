---
date: 2018-01-04T17:34:43+01:00
categories: "Developer's Guide"
weight: 4
title: "Creating a macro"
description: "This section shows how to create and implement a new macro and finally add it to the macro library."
menu: 
  main:
    Name: "Creating a macro"
    Parent: "devguide"
---

Internally a macro is represented by a C++ class which is derived from the class `MacroBase`. 
`MacroBase` defines the common interface to Impresario. Therefore the header file {{<path "macrobase.h" >}}
has to be included in every macro project.

The follwing code shows an annotated header file for a new macro. You can use it as template and replace 
"MyMacroClass" by your class name.

{{<highlight cpp>}}
#ifndef MYMACROCLASS_H_
#define MYMACROCLASS_H_

#include "macrobase.h"

class MyMacroClass : public MacroBase {
public:
  // Standard constructor: the macro's interface to Impresario
  // is defined here.
  MyMacroClass();
  
  // Standard destructor
  ~MyMacroClass() override = default;

  // Override clone method to provide correct class instance. 
  // This method must be overridden in any case, otherwise 
  // the macro cannot be used in Impresario. 
  // The base class implementation just returns 0. The following
  // line shows the minimal implementation.
  MacroBase* clone() const override { 
    return new MyMacroClass(); 
  }

protected:
  // Override this method if you need special one time 
  // preparation for processing in the onApply() method. 
  // The base class implementation just returns Ok.
  // This method is called by Impresario as the first event 
  // before processing starts. 
  Status onInit() override;
  
  // Override this method with your processing code. It is 
  // called by Impresario for every new set of input data during 
  // processing. The base class implementation just returns Ok.
  Status onApply() override;

  // Override this method in case you need cleanup after 
  // processing has been stopped by the user or it has been 
  // terminated by Impresario due to errors reported by
  // macro instances.
  // The base class implementation just returns Ok.
  Status onExit() override;
  
  // Override this method to be notified about every parameter 
  // change. This method is called by Impresario before each 
  // call to onInit(), onApply(), and onExit(). Before the call
  // to onInit() all parameters are reported as changed to allow 
  // for proper initialization. In further calls only parameters 
  // are reported which have been changed since the last time. 
  // ParameterSet is an std::set<unsigned int> containing the 
  // zero-based indices of all parameters which have been 
  // changed since the last call. 
  // The base class implementation does nothing. 
  void onParametersChanged(ParameterSet& parameters) override;

private:
  // Put your attributes and further methods here
  
};

#endif // MYMACROCLASS_H_
{{</highlight>}}

The public method `clone()` must always be implemented. Otherwise the macro cannot be added to any 
[process graph]({{< relref "../userguide/introduction.md#impresario-process-graphs" >}}). 
If this method is not implemented correctly, unpredictable behaviour of the whole system may occur.
The simple implementation as shown in the example below is sufficient.

Within the implementation of the macro's constructor it's creator, display name, description, 
and group are declared (for details see [Setting up macro information]({{< relref "macrotutorial2.md" >}}))
along with the input ports and output ports ([Setting up macro input and output ports]({{< relref "macrotutorial3.md" >}})), 
as well as it's parameters ([Setting up macro parameters]({{< relref "macrotutorial4.md" >}})).

The four protected virtual methods `onInit()`, `onApply()`, `onExit`(), and 
`onParametersChanged(ParameterSet& parameters)` are called by Impresario during processing. 
At least the `onApply()` method has to be overridden in every macro class as this method is used to 
process the input data and to produce the output data. This is explained in detail in section
([Processing data]({{< relref "macrotutorial5.md" >}})).

# Example
The code depicted below is one example for a macro declaration. Everything declared in the private
section is macro specific data and will be used during implementation of the different methods. In this
case the attributes refer to the Canny Edge algorithm implemted in the 
[LTI Lib 2 image processing library](http://www.ie.tec.ac.cr/palvarado/ltilib-2/html/index.html).

{{<highlight cpp>}}
#ifndef CANNYEDGE_H_
#define CANNYEDGE_H_

#include "macrobase.h"
#include "ltiCannyEdges.h"

class LtiCannyEdge : public MacroBase {
public:
  // standard constructor
  LtiCannyEdge();
  // standard destructor
  ~LtiCannyEdge(void) override = default;

  // override clone method to provide correct class instance
  MacroBase* clone() const override { return new LtiCannyEdge(); }

protected:
  Status onInit() override;
  Status onApply() override;
  void onParametersChanged(ParameterSet& paramSet) override;

private:
  // Canny Edge algorithm and parameters from LTI Lib 2
  lti::cannyEdges             cannyFunctor;
  lti::cannyEdges::parameters params;
};

#endif /* CANNYEDGE_H_ */
{{</highlight>}}

The implementation of this macro is discussed in detail in the following sections.
Please continue with section [Setting up macro information]({{< relref "macrotutorial2.md" >}}).


