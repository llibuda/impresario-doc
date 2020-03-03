---
date: "2015-06-19T15:03:01+02:00"
title: "_index"
---

# Welcome to Impresario

**Impresario** is the acronym for "**Im**age **Pr**ocessing **E**ngineering **S**ystem **A**pplying **R**eusable 
**I**nteractive **O**bjects" (guess what was first).
It is designed for rapid prototyping of image processing solutions and testing of image processing algorithms
within these solutions. Therefore all kind of algorithms Impresario can make use of, are coded in separate libraries.

{{< figure src="impresario.png" link="impresario.png" title="Impresario (Click to enlarge)" 
    alt="Impresario main window screenshot" >}}
    
Everybody with interest in image processing is welcome to develop and hopefully share her own library. A simple C++ API 
allows to focus on the implementation of the algorithms and hides all the necessary interactions and data exchange between 
Impresario and the library from the developers.
Read more in the [introduction]({{< relref "userguide/introduction.md" >}}).

## License
Impresario is open source software and licensed under the GNU General Public License version 3 (GPLv3). You may look up the license text 
on the web at [http://www.gnu.org/licenses/gpl-3.0.html](http://www.gnu.org/licenses/gpl-3.0.html) or read it as locally stored 
[plain text](./resources/licenses/LICENSE_GPLv3.txt).

However, the GPLv3 does not apply to the libraries containing the image processing algorithms, etc. These libraries
may be licensed under any license the library developers choose, even closed source ones. 

## Further reading
There are two guides available:
The [User's Guide]({{< nodeUrl "./userguide" >}}) gives a detailed introduction to Impresario and provides information about 
installation and usage.
The [Developer's Guide]({{< nodeUrl "./devguide" >}}) contains the API documentation and examples for writing your own libraries.
It also explains Impresario's architecture.
