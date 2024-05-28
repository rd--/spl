# parameterNames

- _parameterNames(aMethod)_

Answer a `List` of `String` items giving the names of the parameters of _aMethod_.

```
>>> at:/2.parameterNames
['self' 'index']

>>> asJson:/3.parameterNames
['self' 'replacer' 'space']

>>> randomFloat:/4.parameterNames
['self' 'min' 'max' 'countOrShape']
```

Note that literal `Block` values do not store their parameter names:

```
>>> { :x | x }.parameterNames
nil

>>> let f = { :x | x };
>>> f:/1.parameterNames
nil
```

* * *

See also: Block, Method

Categories: Reflection
