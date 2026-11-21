# argumentNames

- _argumentNames(f/n)_

Answer an _n_ item list giving the argument names of the _n_-ary block _f_.

At an anonymous block:

```
>>> { }.argumentNames
[]

>>> { :x | x }.argumentNames
['x']

>>> { :x :y | x + y }.argumentNames
['x' 'y']
```

At the block implementing a method:

```
>>> system.methodLookupAtType(
>>> 	'collect',
>>> 	2.0,
>>> 	'List'
>>> ).compiledFunction.argumentNames
['self' 'aFunction/1']
```

* * *

See also: Function, argumentCount

Guides: Function Functions, Function Semantics, Reflection Functions
