# parameterNames

- _parameterNames(m)_

Answer a `List` of `String` items giving the names of the parameters of the method _m_.

```
>>> size:/1.parameterNames
['self']

>>> randomChoice:/3.parameterNames
['self' 'r' 'shape']

>>> asJson:/3.parameterNames
['self' 'replacer' 'space']
```

Note that literal `Block` values do not store their parameter names:

```
>>> { :x | x }.parameterNames
nil

>>> let f = { :x | x };
>>> f:/1.parameterNames
nil
```

_Note:_
Not all methods with the same name and the same arity will use the same parameter names.
The parameter names reported can be for any one of the defined methods.

* * *

See also: Block, Method

Guides: Reflection Functions

Categories: Reflection
