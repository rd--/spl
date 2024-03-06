# instanceOf

- _instanceOf(aType)_

Create an uninitialized instance of _aType_.

~~~
>>> let colourType = system.typeLookup('Colour');
>>> let colourValue = colourType.instanceOf;
>>> (colourType.isType, colourValue.isColour, colourValue.red)
(true, true, nil)
~~~

* * *

See also: new, Type, typeLookup

Categories: Instance Creation
