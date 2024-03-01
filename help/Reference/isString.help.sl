# isString

- _isString(anObject)_

Answer `true` if _anObject_ is a `String`, else `false`.

```
>>> 'string'.isString
true
```

Pick out all `String`s in a `List`:

```
>>> [1 2 'ab' 'cd' 3 4].select(isString:/1)
['ab' 'cd']
```

* * *

See also: String

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/StringQ.html)

Categories: Predicate, Testing
