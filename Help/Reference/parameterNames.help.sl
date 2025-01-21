# parameterNames

- _parameterNames(aMethod)_

Answer a `List` of `String` items giving the names of the parameters of _aMethod_.

```
>>> size:/1.parameterNames
['self']

>>> asJson:/3.parameterNames
['self' 'replacer' 'space']

>>> randomReal:/4.parameterNames
['self' 'min' 'max' 'shape']
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

Categories: Reflection
