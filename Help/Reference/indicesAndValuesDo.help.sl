# indicesAndValuesDo

- _indicesAndValuesDo(c, f:/2)_

Apply the block _f_ to each index and item of the sequential colletion _c_.

At `List`:

```
>>> let answer = [];
>>> ['x' 'y' 'z']
>>> .indicesAndValuesDo { :index :value |
>>> 	answer.addAll([index, value])
>>> };
>>> answer
[1 'x' 2 'y' 3 'z']
```

_Rationale_:
Like `withIndexDo`, but _f_ receives the index first.

* * *

See also: do, indices, indicesDo, withIndexDo

Guides: Iteration Functions

References:
_Smalltalk_
5.7.2.11

Categories: Enumerating
