---
date: 2017-11-09T15:08:09+01:00
categories: "Developer's Guide"
weight: 10
title: "Macro API Reference"
description: "This section contains a detailed description of all API functions required to create your own macro."
menu: 
  main:
    Name: "Macro API Reference"
    Parent: "devguide"
---

This section summarizes all API methods for creating your own macros. For more details you may take a look at the files `macrobase.h` and `macroextended.h`. 
The API is separated in the following groups:

# Macro setup
All methods in this section must be called in the macro's constructor. They are used to define a macro's properties and its interface to Impresario.

<hr>
<table class="apideclaration">
  <tr>
    <td><code>void setName</code></td>
    <td>(&nbsp;</td>
    <td><code>const std::wstring &amp;</code>&nbsp;</td>
    <td><em>strName</em>&nbsp;)</td>
  </tr>
</table>
<table class="apidescription">
  <tr>
    <td>&nbsp;</td>
    <td>
      Sets the macro's display name in Impresario. This method has to be called once in the macro's constructor. 
      <dl>
        <dt>Parameters:</dt>
        <dd>
          <table>
            <tr>
              <td><em>strName</em></td>
              <td>Display name of the macro in Impresario</td>
            </tr>
          </table>
        </dd>
      </dl>
      <dl>
        <dt>Since API Version: 1.0.0</dt>
        <dt>See also:</dt>
        <dd><a href="{{% ref "macrotutorial2.md" %}}">Setting up macro information</a></dd>
      </dl>
    </td>
  </tr>
</table>

<hr>
<table class="apideclaration">
  <tr>
    <td><code>void setGroup</code></td>
    <td>(&nbsp;</td>
    <td><code>const std::wstring &amp;</code>&nbsp;</td>
    <td><em>strGroup</em>&nbsp;)</td>
  </tr>
</table>
<table class="apidescription">
  <tr>
    <td>&nbsp;</td>
    <td>
      Sets the macro's group. The group is used in Impresario's group filter in the macro selection window. This method has to be called once in the macro's constructor to assign the macro a group. 
      <dl>
        <dt>Parameters:</dt>
        <dd>
          <table>
            <tr>
              <td><em>strGroup</em>&nbsp;</td>
              <td>Group the macro should belong to. The group name is case sensitive.</td>
            </tr>
          </table>
        </dd>
      </dl>
      <dl>
	    <dt>Since API Version: 1.0.0</dt>
        <dt>See also:</dt>
        <dd><a href="{{% ref "macrotutorial2.md" %}}">Setting up macro information</a></dd>
      </dl>
    </td>
  </tr>
</table>

<hr>
<table class="apideclaration">
  <tr>
    <td><code>void setCreator</code></td>
    <td>(&nbsp;</td>
    <td><code>const std::wstring &amp;</code>&nbsp;</td>
    <td><em>strCreator</em>&nbsp;)</td>
  </tr>
</table>
<table class="apidescription">
  <tr>
    <td>&nbsp;</td>
    <td>
      Sets the name of the programmer who created the macro. This name is used in Impresario's creator filter in the macro selection window. This method has to be called once in the macro's constructor to assign the macro a creator. 
      <dl>
        <dt>Parameters:</dt>
        <dd>
          <table>
            <tr>
              <td><em>strCreator</em>&nbsp;</td>
              <td>Name of the programmer who created the macro. The name is case sensitive.</td>
            </tr>
          </table>
        </dd>
      </dl>
      <dl>
	    <dt>Since API Version: 1.0.0</dt>
        <dt>See also:</dt>
        <dd><a href="{{% ref "macrotutorial2.md" %}}">Setting up macro information</a></dd>
      </dl>
    </td>
  </tr>
</table>

<hr>
<table class="apideclaration">
  <tr>
    <td><code>void setDescription</code></td>
    <td>(&nbsp;</td>
    <td><code>const std::wstring &amp;</code>&nbsp;</td>
    <td><em>strDescription</em>&nbsp;)</td>
  </tr>
</table>
<table class="apidescription">
  <tr>
    <td>&nbsp;</td>
    <td>
      Sets the macro's description. The description is displayed beneath Impresario's macro selection window if help is switched on. This method has to be called once in the macro's constructor to assign the macro a short description. 
      <dl>
        <dt>Parameters:</dt>
        <dd>
          <table>
            <tr>
              <td><em>strDescription</em>&nbsp;</td>
              <td>Short description of the macro.</td>
            </tr>
          </table>
        </dd>
      </dl>
      <dl>
	    <dt>Since API Version: 1.0.0</dt>
        <dt>See also:</dt>
        <dd><a href="{{% ref "macrotutorial2.md" %}}">Setting up macro information</a></dd>
      </dl>
    </td>
  </tr>
</table>

<hr>
<table class="apideclaration">
  <tr>
    <td><code>void setPropertyWidgetComponent</code></td>
    <td>(&nbsp;</td>
    <td><code>const std::wstring &amp;</code>&nbsp;</td>
    <td><em>strPropWidgetFile</em>&nbsp;)</td>
  </tr>
</table>
<table class="apidescription">
  <tr>
    <td>&nbsp;</td>
    <td>
      This method allows to override Impresario's default QML widget for dislaying and changing parameters. If you have your own widget for your macro
      you need to call this method in the macro's constructor.
      <dl>
        <dt>Parameters:</dt>
        <dd>
          <table>
            <tr>
              <td><em>strPropWidgetFile</em>&nbsp;</td>
              <td>File name of the QML component to be used as alternative display for parameters of this macro.</td>
            </tr>
          </table>
        </dd>
      </dl>
      <dl>
	    <dt>Since API Version: 1.0.0</dt>
        <dt>See also:</dt>
        <dd><a href="{{% ref "advancedparameter.md#create-your-own-property-widget" %}}">Advanced parameter presentation</a></dd>
      </dl>
    </td>
  </tr>
</table>

<hr>
<table class="apideclaration">
  <tr>
    <td colspan="4"><code>template&lt;typename T&gt;</code></td>
  </tr>
  <tr>
    <td><code>bool addInput</code></td>
    <td>(&nbsp;</td>
    <td><code>const std::wstring &amp;</code>&nbsp;</td>
    <td><em>name</em>,</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td><code>const std::wstring &amp;</code>&nbsp;</td>
    <td><em>description</em>&nbsp;)</td>
  </tr>
</table>
<table class="apidescription">
  <tr>
    <td>&nbsp;</td>
    <td>
      Adds an input port of type <code>T</code> to the macro. For type <code>T</code> any type may be used. This method must be called 
      in the macro's constructor once for each input port to be declared. 
      <dl>
        <dt>Parameters:</dt>
        <dd>
          <table>
            <tr>
              <td><em>name</em>&nbsp;</td>
              <td>Name of the input port. This name must not be empty.</td>
            </tr>
            <tr>
              <td><em>description</em>&nbsp;</td>
              <td>Description of the input port.</td>
            </tr>
          </table>
        </dd>
      </dl>
      <dl>
        <dt>Returns:</dt>
        <dd>
          <code>true</code> if the input port was added successfully, <code>false</code> otherwise.
        </dd>
      </dl>
      <dl>
	    <dt>Since API Version: 1.0.0</dt>
        <dt>See also:</dt>
        <dd><a href="{{% ref "macrotutorial3.md" %}}">Setting up macro input and output ports</a></dd>
      </dl>
    </td>
  </tr>
</table>

<hr>
<table class="apideclaration">
  <tr>
    <td colspan="4"><code>template&lt;typename T&gt;</code></td>
  </tr>
  <tr>
    <td><code>bool addOutput</code></td>
    <td>(&nbsp;</td>
    <td><code>const std::wstring &amp;</code>&nbsp;</td>
    <td><em>name</em>,</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td><code>const std::wstring &amp;</code>&nbsp;</td>
    <td><em>description</em>&nbsp;)</td>
  </tr>
</table>
<table class="apidescription">
  <tr>
    <td>&nbsp;</td>
    <td>
      Adds an output port of type <code>T</code> to the macro. For type <code>T</code> any type may be used. This method must be called 
      in the macro's constructor once for each output port to be declared. 
      <dl>
        <dt>Parameters:</dt>
        <dd>
          <table>
            <tr>
              <td><em>name</em>&nbsp;</td>
              <td>Name of the output port. This name must not be empty.</td>
            </tr>
            <tr>
              <td><em>description</em>&nbsp;</td>
              <td>Description of the output port.</td>
            </tr>
          </table>
        </dd>
      </dl>
      <dl>
        <dt>Returns:</dt>
        <dd>
          <code>true</code> if the output port was added successfully, <code>false</code> otherwise.
        </dd>
      </dl>
      <dl>
	    <dt>Since API Version: 1.0.0</dt>
        <dt>See also:</dt>
        <dd><a href="{{% ref "macrotutorial3.md" %}}">Setting up macro input and output ports</a></dd>
      </dl>
    </td>
  </tr>
</table>

<hr>
<table class="apideclaration">
  <tr>
    <td colspan="4"><code>template&lt;typename T&gt;</code></td>
  </tr>
  <tr>
    <td><code>bool addParameter</code></td>
    <td>(&nbsp;</td>
    <td><code>const std::wstring &amp;</code>&nbsp;</td>
    <td><em>name</em>,</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td><code>const std::wstring &amp;</code>&nbsp;</td>
    <td><em>description</em>,</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td><code>const T &amp;</code>&nbsp;</td>
    <td><em>tDefaultValue</em>,</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td><code>const std::wstring &amp;</code>&nbsp;</td>
    <td><em>qmlUIComponent</em> <code>= L""</code>,</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td><code>const std::wstring &amp;</code>&nbsp;</td>
    <td><em>qmlUIProperties</em> <code>= L""</code>,</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td><code>const ParameterValueConverter&lt;T&gt; &amp;</code>&nbsp;</td>
    <td><em>converter</em> <code>= ParameterValueConverter&lt;T&gt;()</code>&nbsp;)</td>
  </tr>
</table>
<table class="apidescription">
  <tr>
    <td>&nbsp;</td>
    <td>
      Adds a parameter to the macro. This method must be
      called in the macro's constructor once for each
      parameter to be declared. Parameters appear in the
      macro's property window in the order they are declared
      in the constructor.
      <dl>
        <dt>Parameters:</dt>
        <dd>
          <table>
            <tr>
              <td><em>name</em>&nbsp;</td>
              <td>Name of the parameter. The name must not be empty.</td>
            </tr>
            <tr>
              <td><em>description</em>&nbsp;</td>
              <td>Description of the parameter's meaning.
              This discription is displayed beneath the macro
              property window if help is switched on.</td>
            </tr>
            <tr>
              <td>
              <em>tDefaultValue</em>&nbsp;</td>
              <td>Default value for the parameter.</td>
            </tr>
            <tr>
              <td><em>qmlUIComponent</em>&nbsp;</td>
              <td>Name (i.e. file name) of the QML component to be used to display and change the parameter in Impresario's
                  property window. By default a simple line edit component will be used.</td>
            </tr>
            <tr>
              <td><em>qmlUIProperties</em>&nbsp;</td>
              <td>String holding default properties for the QML component defined in the previous parameter.</td>
            </tr>
            <tr>
              <td><em>converter</em>&nbsp;</td>
              <td><code>ParameterValueConverter</code> instance used to convert the parameter's value to and from <code>std::wstring</code>.
                  Usually the default converter handles all simple data types sufficiently. For complex types a specialized converter has to be provided.</td>
            </tr>            
          </table>
        </dd>
      </dl>
      <dl>
        <dt>Returns:</dt>
        <dd>
          <code>true</code> if the parameter was added successfully, <code>false</code> otherwise.
        </dd>
      </dl>      
      <dl>
	    <dt>Since API Version: 1.0.0</dt>
        <dt>See also:</dt>
        <dd><a href="{{% ref "macrotutorial4.md#defining-parameters-with-default-view" %}}">Setting up macro parameters</a></dd>
      </dl>
    </td>
  </tr>
</table>

# Overridables
The following methods need to overridden in a macro class. These methods are called by Impresario.

<hr>
<table class="apideclaration">
  <tr>
    <td><code>virtual MacroBase* clone (&nbsp;)</code></td>
  </tr>
</table>
<table class="apidescription">
  <tr>
    <td>&nbsp;</td>
    <td>
      Called by Impresario every time the macro is added to a process graph. This method always has to be overriden otherwise the macro cannot 
      be used in Impresario. The base implementation just returns <code>nullptr</code>. 
      <dl>
        <dt>Returns:</dt>
        <dd>
          A pointer to a new created instance of the macro class.
        </dd>
      </dl>
      <dl>
	    <dt>Since API Version: 1.0.0 - Obsolete since API Version: 1.0.1</dt>
        <!-- <dt>See also:</dt>
             <dd><a href="{{% ref "macrotutorial1.md" %}}">Creating a macro</a></dd> -->
      </dl>
    </td>
  </tr>
</table>

<hr>
<table class="apideclaration">
  <tr>
    <td><code>virtual Status onInit (&nbsp;)</code></td>
  </tr>
</table>
<table class="apidescription">
  <tr>
    <td>&nbsp;</td>
    <td>
      Called by Impresario as the first event before processing starts. Override this method if you need special one time preparation 
      for processing in the <code>onApply()</code> method. The base implementation just returns <code>Ok</code>. 
      <dl>
        <dt>Returns:</dt>
        <dd>
          Return <code>Ok</code> to indicate Impresario to continue processing. 
          Return <code>Error</code> to terminate processing with an error message immediately.
        </dd>
      </dl>
      <dl>
	    <dt>Since API Version: 1.0.0</dt>
        <dt>See also:</dt>
        <dd><a href="{{% ref "macrotutorial5.md#overridables" %}}">Processing data</a></dd>
      </dl>
    </td>
  </tr>
</table>

<hr>
<table class="apideclaration">
  <tr>
    <td><code>virtual Status onApply (&nbsp;)</code></td>
  </tr>
</table>
<table class="apidescription">
  <tr>
    <td>&nbsp;</td>
    <td>
      Called by Impresario for every new set of input data during processing. Override this method to process data at the input ports. 
      The base implementation just returns <code>Ok</code>. 
      <dl>
        <dt>Returns:</dt>
        <dd>
          Return <code>Ok</code> to indicate Impresario to continue processing. 
          Return <code>Error</code> to terminate processing with an error message immediately.
          Return <code>Stop</code> to indicate Impresario to stop processing.
        </dd>
      </dl>
      <dl>
	    <dt>Since API Version: 1.0.0</dt>
        <dt>See also:</dt>
        <dd><a href="{{% ref "macrotutorial5.md#overridables" %}}">Processing data</a></dd>
      </dl>
    </td>
  </tr>
</table>

<hr>
<table class="apideclaration">
  <tr>
    <td><code>virtual Status onExit (&nbsp;)</code></td>
  </tr>
</table>
<table class="apidescription">
  <tr>
    <td>&nbsp;</td>
    <td>
      Called by Impresario after processing has been stopped by the user, by a macro, or by an error. Override this method if you need 
      special clean up after processing. The base implementation just returns <code>Ok</code>. 
      <dl>
        <dt>Returns:</dt>
        <dd>
          Return <code>Ok</code> to indicate Impresario success. 
          Return <code>Error</code> to indicate Impresario an error.
        </dd>
      </dl>
      <dl>
	    <dt>Since API Version: 1.0.0</dt>
        <dt>See also:</dt>
        <dd><a href="{{% ref "macrotutorial5.md#overridables" %}}">Processing data</a></dd>
      </dl>
    </td>
  </tr>
</table>

<hr>
<table class="apideclaration">
  <tr>
    <td><code>virtual void onParametersChanged</code></td>
    <td>(&nbsp;</td>
    <td><code>ParameterSet &amp;</code>&nbsp;</td>
    <td><em>parameters</em>&nbsp;)</td>
  </tr>
</table>
<table class="apidescription">
  <tr>
    <td>&nbsp;</td>
    <td>
      Called by Impresario before the calls to <code>onInit()</code>, <code>onApply()</code>, and <code>onExit()</code>.
      Before the call to <code>onInit()</code> all parameters are reported as changed to allow for proper initialization. In further calls only
      parameters are reported which have been changed since the last time.
      Override this method the be notified of every parameter change. The base implementation does nothing. 
      <dl>
        <dt>Parameters:</dt>
        <dd>
          <table>
            <tr>
              <td><em>parameters</em>&nbsp;</td>
              <td><code>std::set&lt;unsigned int&gt;</code> with zero-based indices of all parameters which have been changed in the meantime.</td>
            </tr>
          </table>
        </dd>
      </dl>
      <dl>
	    <dt>Since API Version: 1.0.0</dt>
        <dt>See also:</dt>
        <dd><a href="{{% ref "macrotutorial5.md#overridables" %}}">Processing data</a></dd>
      </dl>
    </td>
  </tr>
</table>

# Access methods
Access methods provide access to inputs, outputs, and parameters in the overridden methods <code>onInit()</code>, <code>onApply()</code>, 
<code>onExit()</code>,and <code>onParametersChanged()</code> and must be called only there.

<hr>
<table class="apideclaration">
  <tr>
    <td colspan="4"><code>template&lt;typename T&gt;</code></td>
  </tr>
  <tr>
    <td><code>const T* accessInput</code></td>
    <td>(&nbsp;</td>
    <td><code>std::size_t</code>&nbsp;</td>
    <td><em>index</em>&nbsp;)</td>
  </tr>
</table>
<table class="apidescription">
  <tr>
    <td>&nbsp;</td>
    <td>
      Access data of an input port.
      <dl>
        <dt>Parameters:</dt>
        <dd>
          <table>
            <tr>
              <td><em>index</em>&nbsp;</td>
              <td>Zero based index of the input to be accessed. Inputs are sorted in the same order as declared in the macro's constructor
                  with calls to <code>addInput</code>.</td>
            </tr>
          </table>
        </dd>
      </dl>
      <dl>
        <dt>Returns:</dt>
        <dd>
          Pointer to a constant object of type <code>T</code> or <code>nullptr</code> in case 
		  the input is not connected in Impresario's process graph.
        </dd>
      </dl>      
      <dl>
	    <dt>Since API Version: 1.0.0</dt>
        <dt>See also:</dt>
        <dd><a href="{{% ref "macrotutorial5.md#access-methods" %}}">Processing data</a></dd>
      </dl>
    </td>
  </tr>
</table>

<hr>
<table class="apideclaration">
  <tr>
    <td colspan="4"><code>template&lt;typename T&gt;</code></td>
  </tr>
  <tr>
    <td><code>T&amp; accessOutput</code></td>
    <td>(&nbsp;</td>
    <td><code>std::size_t</code>&nbsp;</td>
    <td><em>index</em>&nbsp;)</td>
  </tr>
</table>
<table class="apidescription">
  <tr>
    <td>&nbsp;</td>
    <td>
      Access data of an output port.
      <dl>
        <dt>Parameters:</dt>
        <dd>
          <table>
            <tr>
              <td><em>index</em>&nbsp;</td>
              <td>Zero based index of the output to be accessed. Outputs are sorted in the same order as declared in the macro's constructor
                  with calls to <code>addOutput</code>.</td>
            </tr>
          </table>
        </dd>
      </dl>
      <dl>
        <dt>Returns:</dt>
        <dd>
          Writable reference to an object of type <code>T</code>.
        </dd>
      </dl>      
      <dl>
	    <dt>Since API Version: 1.0.0</dt>
        <dt>See also:</dt>
        <dd><a href="{{% ref "macrotutorial5.md#access-methods" %}}">Processing data</a></dd>
      </dl>
    </td>
  </tr>
</table>

<hr>
<table class="apideclaration">
  <tr>
    <td colspan="4"><code>template&lt;typename T&gt;</code></td>
  </tr>
  <tr>
    <td><code>const T&amp; getParameterValue</code></td>
    <td>(&nbsp;</td>
    <td><code>std::size_t</code>&nbsp;</td>
    <td><em>index</em>&nbsp;)</td>
  </tr>
</table>
<table class="apidescription">
  <tr>
    <td>&nbsp;</td>
    <td>
      Access current value of a parameter with the given index.
      <dl>
        <dt>Parameters:</dt>
        <dd>
          <table>
            <tr>
              <td><em>index</em>&nbsp;</td>
              <td>Zero based index of the parameter to be accessed. Parameters are sorted in the same order as declared in the macro's constructor
                  with calls to <code>addParameter</code>.</td>
            </tr>
          </table>
        </dd>
      </dl>
      <dl>
        <dt>Returns:</dt>
        <dd>
          Read-only reference to an object of type <code>T</code> containing the parameter's current value.
        </dd>
      </dl>      
      <dl>
	    <dt>Since API Version: 1.0.0</dt>
        <dt>See also:</dt>
        <dd><a href="{{% ref "macrotutorial5.md#access-methods" %}}">Processing data</a></dd>
      </dl>
    </td>
  </tr>
</table>

<hr>
<table class="apideclaration">
  <tr>
    <td colspan="4"><code>template&lt;typename T&gt;</code></td>
  </tr>
  <tr>
    <td><code>void setParameterValue</code></td>
    <td>(&nbsp;</td>
    <td><code>std::size_t</code>&nbsp;</td>
    <td><em>index</em>,</td>
    <td><code>const T &amp;</code>&nbsp;</td>
    <td><em>value</em>&nbsp;)</td>    
  </tr>
</table>
<table class="apidescription">
  <tr>
    <td>&nbsp;</td>
    <td>
      Sets the parameter of the given index to the new value.
      <dl>
        <dt>Parameters:</dt>
        <dd>
          <table>
            <tr>
              <td><em>index</em>&nbsp;</td>
              <td>Zero based index of the parameter to be accessed. Parameters are sorted in the same order as declared in the macro's constructor
                  with calls to <code>addParameter</code>.</td>
            </tr>
            <tr>
              <td><em>value</em>&nbsp;</td>
              <td>New value for parameter.</td>                  
            </tr>
          </table>
        </dd>
      </dl>
      <dl>
	    <dt>Since API Version: 1.0.0</dt>
        <dt>See also:</dt>
        <dd><a href="{{% ref "macrotutorial5.md#access-methods" %}}">Processing data</a></dd>
      </dl>
    </td>
  </tr>
</table>

# Miscellaneous
The following methods are available for providing more information.

<hr>
<table class="apideclaration">
  <tr>
    <td><code>void setErrorMsg</code></td>
    <td>(&nbsp;</td>
    <td><code>const std::wstring &amp;</code>&nbsp;</td>
    <td><em>strErrorMsg</em>&nbsp;)</td>
  </tr>
</table>
<table class="apidescription">
  <tr>
    <td>&nbsp;</td>
    <td>
      Can be used to set an error message which is read by Impresario in case one of the overridden methods <code>onInit()</code>, 
      <code>onApply()</code>, and <code>onExit()</code> return <code>Error</code>. Otherwise this message won't be displayed.
      <dl>
        <dt>Parameters:</dt>
        <dd>
          <table>
            <tr>
              <td><em>strErrorMsg</em>&nbsp;</td>
              <td>Error message to be displayed in Impresario.</td>
            </tr>
          </table>
        </dd>
      </dl>
      <dl>
	    <dt>Since API Version: 1.0.0</dt>
        <dt>See also:</dt>
        <dd><a href="{{% ref "macrotutorial5.md#message-output" %}}">Processing data</a></dd>
      </dl>
    </td>
  </tr>
</table>

