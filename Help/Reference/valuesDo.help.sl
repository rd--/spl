# valuesDo

- _valuesDo(aDictionary, aBlock:/1)_

Evaluate _aBlock_ with each value of _aDictionary_ as the argument.

```
>>> let list = [];
>>> (x: 1, y: 2, z: 3).valuesDo { :each | list.add(each) };
>>> list
[1 2 3]
```

* * *

See also: associationsDo, do, keysAndValuesDo, keysDo

Categories: Enumerating
