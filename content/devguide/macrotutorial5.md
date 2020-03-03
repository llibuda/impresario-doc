---
date: 2018-01-04T17:34:43+01:00
categories: "Developer's Guide"
weight: 8
title: "Processing data"
description: "Handle input data and create output data."
menu: 
  main:
    Name: "- Processing data"
    Parent: "devguide"
---

After input ports, output ports, and parameters have been set up in the macro's constructor, 
we are ready to process data. 

# Overridables
The macro's base class `MacroBase` defines four virtual methods 
which are called by Impresario during processing:

{{<highlight cpp>}}
virtual Status onInit();
virtual Status onApply();
virtual Status onExit();
virtual void onParametersChanged(ParameterSet& parameters);
{{</highlight>}}

The methods `onInit()`, `onApply()`, and `onExit()` return a `Status` code which is defined 
as follows:

{{<highlight cpp>}}
enum Status {
  Ok,   // tell Impresario to continue processing normally
  Stop, // tell Impresario to stop processing
  Error // tell Impresario to abort processing abnormally
};
{{</highlight>}}

The base class implementations of `onInit()`, `onApply()`, and `onExit()` just return `Ok`, 
`onParametersChanged(ParameterSet& parameters)` does nothing. 

`onInit()` is called once for each macro in the [process graph]({{< relref "../userguide/introduction.md#impresario-process-graphs" >}}) 
before the first call to `onApply()`. So this is the place to check whether all requirements are
met to start processing and to initialize internal data which is needed in subsequent processing. 
`onInit()` has to return `Ok` to indicate that processing can continue. Returning `Error` or `Stop` 
will stopp processing immediately and `onExit()` will be called for every macro in the process graph.

`onApply()` is the only method which must be overridden to realize data processing, overriding the other methods 
is optional. `onApply()` is called by Impresario cyclically with new input data and must return `Ok` to continue
processing, `Stop` to stop processing, or `Error` to abort processing.

`onExit()` is called for each macro in the process graph in case `onInit()` or `onApply()` of any macro in the 
process graph returns `Stop` or `Error` or the user stopped processing with the {{< menuCommand "control_stop.png" "Stop">}} 
command in Impresario's GUI. You can override this method in case you have to do some cleanup after processing.

Finally, `onParametersChanged(ParameterSet& parameters)` is called by Impresario just before each call to `onInit()`, 
`onApply()`, and `onExit()`. `ParameterSet` is defined as `std::set<unsigned int>` and contains the indices of all 
changed parameters. You can override this method to handle parameter changes separately, e.g. in case more complex computations
are required in case a parameter changes. There are two important aspects to mention here:

* When `onParametersChanged(ParameterSet& parameters)` is called just after processing was started and before `onInit()`,
  `ParameterSet` contains the indices of all defined paramters to make sure everything can be initialized correctly.
* In subsequent calls before `onApply()`, and `onExit()`, `ParameterSet` only contains the indices of parameters which
  have been changed by the user since the last call. In case no paramters have been changed, `onParametersChanged(ParameterSet& parameters)`
  is not called at all, i.e. you will never see an empty set.

When you override one or more of the above methods you need to access the input ports, output ports, and parameters within
these methods. Therefore the API provides access methods.

# Access methods
Within the overridable methods you can you the following access methods to access inputs, outputs, and parameters:

{{<highlight cpp>}}
template<typename T>
const T* accessInput(std::size_t index);
template<typename T>
T& accessOutput(std::size_t index);
template<typename T>
const T& getParameterValue(std::size_t index);
{{</highlight>}}

All methods take an `index` as parameter which is the zero based index of inputs, outputs, and parameters in the order they
are defined in the macro's constructor. The template type provided must match the type used for the definition.

`accessInput(std::size_t index)` returns a pointer to the input object instance which can be `nullptr` in case the input port
is not connected in the corresponing process graph. This can be checked in `onInit()` once before processing starts as it is
not possible to change the process graph while Impresario is processing it. The returned input object instance is also constant,
i.e. not modifyable. Only outputs can be manipulated.

Outputs are accessed with `accessOutput(std::size_t index)`. This method returns a reference to the output object instance which
can be modified. **Please note**: Outputs must only be modified in `onApply()` as Impresario expects modifications only here.

With `getParameterValue(std::size_t index)` you can read the current parameters. Parameters are usually set by the user in
Impresario's [property window]({{< relref "../userguide/propwnd.md" >}}) but the API provides a method to set parameter 
values also in code:

{{<highlight cpp>}}
template<typename T>
void setParameterValue(std::size_t index, const T& value);
{{</highlight>}}

Usually both access methods are called in the overridable `onParametersChanged(ParameterSet& parameters)` but can also be used
in the other overridable methods.

# Message output
There are two ways to provide text output to Impresario. First, in case you return `Error` in `onInit()`, `onApply()`, or `onExit()`
you can set an error message with the following method:

{{<highlight cpp>}}
void setErrorMsg(const std::wstring& strErrorMsg);
{{</highlight>}}

The text you provide to this method will be shown in Impresario's 
[System Messages Window]({{< relref "../userguide/auxdocks.md#system-messages-window" >}}). **Please note**: This message is only shown
when you return `Error`, otherwise a call to this message does not have any effect.

Second, you can use the standard streams `std::cout` and `std::cerr`. Impresario redirects these streams to it's 
[Console output Window]({{< relref "../userguide/auxdocks.md#console-output-window" >}}). This is sometimes helpful for debugging.

# Example
The following shows the implementation of the overridables in our example. In this example we do not use `onExit()` so that the
base class implementation is used.

{{<highlight cpp>}}
MacroBase::Status LtiCannyEdge::onInit() {
  // check whether the input port is connected
  const lti::channel8* input = accessInput<lti::channel8>(0);
  if (input == nullptr) {
    // input port is not connected, so abort processing
	// with an error message
    setErrorMsg(L"Input is not connected.");
    return Error;
  }
  return Ok;
}

MacroBase::Status LtiCannyEdge::onApply() {
  // access input
  const lti::channel8* input = accessInput<lti::channel8>(0);
  // access output
  lti::channel8& output = accessOutput<lti::channel8>(0);
  // just let the LTI Lib 2 algorithm do the work
  return (cannyFunctor.apply(*input,output)) ? Ok : Error;
}

void LtiCannyEdge::onParametersChanged(ParameterSet & paramSet) {
  for(ParameterSet::iterator it = paramSet.begin(); 
      it != paramSet.end(); ++it) {
    switch (*it) {
      case 0:
        params.edgeValue = lti::ubyte(getParameterValue<int>(0));
        break;
      case 1:
        params.noEdgeValue = lti::ubyte(getParameterValue<int>(1));
        break;
    }
  }
  cannyFunctor.setParameters(params);
}
{{</highlight>}}
