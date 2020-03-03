---
date: 2020-01-28T17:34:43+01:00
categories: "Developer's Guide"
weight: 9
title: "Advanced parameter presentation"
description: "In case the default parameter presentation is not sufficient, this section describes other methods to present them."
menu: 
  main:
    Name: "Advanced parameter presentation"
    Parent: "devguide"
---

{{< figure src="propwnd_annotated.png" link="propwnd_annotated.png" title="QML components of settings area (Click to enlarge)" 
    alt="QML components of settings area" class="float">}}
	
In case the [default parameter presentation]({{< relref "macrotutorial4.md#default-parameter-presentation" >}}) 
is not sufficient, this section shows two more options how to customize parameter presentation:
* You can create customized inplace editor components (green rectangle in the right figure) but use the standard
  property display. 
* You can provide your own property display and replace the complete widget in the red rectangle shown 
  in the figure to the right.

Both methods are described in the following subsections and require good knowledge of QML. In addition you have to
know how Impresario interfaces with QML which is detailed now.

# Impresario's QML interface
Impresario provides a QML context object to the QML component representing the settings area (red rectangle
in the figure above). This QML context object can be addressed with identifier `macro`.
It provides the following methods and signals within QML:

1. `variant macro.parameters()`:
  This method returns a list of variants containing all parameters of the macro. Within QML you can assign this
  list to a property like this:
  {{< highlight bash>}}
property variant props: macro.parameters();
  {{</ highlight >}}
  In the following you can access the different fields of each parameter by `props[index]` where `index`
  identifies the parameter:
    * `props[index].value`: Current value of the parameter as variant
    * `props[index].name`: Name of the parameter as read-only string
    * `props[index].type`: Type of the parameter as read-only string
	* `props[index].description`: Description of the parameter as read-only string
	* `props[index].component`: Inplace editor component of the parameter as read-only string
	* `props[index].properties`: Properties for the inplace editor component as read-only string

2. `macro.showDescription(int parameterIndex)`:
  Call this method to tell Impresario to show the description of the parameter identified by `parameterIndex`
  in the [information area]({{< relref "../userguide/propwnd.md#information-area" >}}) of the property window.
  As you have full control over parameter presentation you also have to define when which parameter is selected
  and its help has to be displayed.
  
3. `signal onParameterUpdated(int index)`:
  You receive this signal from `macro` when a parameter value has been changed programmatically, i.e. by calling
  the API method from within a macro instance:
  {{< highlight cpp >}}
template<typename T>
void setParameterValue(std::size_t index, const T& value);
  {{</ highlight >}}
  In this case you have to make sure that the display of the parameter referenced by `index` is updated as well.

# Use default presentation with custom inplace editors
If you are happy with the default presentation but require a special presentation for a parameter you can
create your own inplace editor component. This component will be dynamically loaded by the default
presentation implemented in {{<path "PropertyWidget.qml" >}} located in Impresario's
[resource directory]({{< relref "../userguide/settings.md#resources" >}}) which is {{<path "resources" >}} by default.

The easiest way to start is to copy one of the shipped inplace editor components introduced in section
[Default parameter presentation]({{< relref "macrotutorial4.md#default-parameter-presentation" >}}) and 
modify it to fit your requirements.

# Create your own property widget
If you like full freedom for parameter presentation you can also use your own property widget. These are the steps
required:
1. Create your own property widget component in a separate QML file, using the interface described above. The easiest
   way to start is to copy Impresario's default component {{<path "PropertyWidget.qml" >}} and customize it the way you require it.
2. Place your new QML file in Impresario's [resource directory]({{< relref "../userguide/settings.md#resources" >}}).
3. Impresario's API provides the following method you have to call in your macro's constructor:
   {{<highlight cpp>}}
void setPropertyWidgetComponent(const std::wstring& qmlFile);
   {{</highlight>}}
   The parameter `qmlFile` is the name of your QML file including the extension {{<path ".qml" >}} but without path.
   
 Whenever an instance of this macro is now selected in the process graph editor Impresario will show your own
 parameter presentation.

