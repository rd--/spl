# parameterNames

- _parameterNames(f/n)_

Answer a `List` of `String` items giving the names of the parameters of the _n_-ary method _f_.

```
>>> size/1.parameterNames
['self']

>>> randomChoice/3.parameterNames
['self' 'r' 'shape']

>>> sinOsc/2.parameterNames
['freq' 'phase']
```

At a `MethodInformation` value:

```
>>> system
>>> .methodDictionary
>>> .atPath(['collect' 2 'List'])
>>> .information
>>> .parameterNames
['self', 'aBlock/1']
```

Note that literal `Block` values do not store their parameter names,
see instead `argumentNames`:

```
>>> { :x | x }.parameterNames
nil

>>> let f = { :x | x };
>>> f/1.parameterNames
nil

>>> { :x | x }.argumentNames
['x']
```

_Note:_
Not all methods with the same name and the same arity will use the same parameter names.
The parameter names reported can be for any one of the defined methods.

* * *

See also: Block, Method, argumentNames

Guides: Block Functions, Reflection Functions
