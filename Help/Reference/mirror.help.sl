# mirror

- _mirror(aList, m, n)_

Answer a `List` that is a mirrored form of _aList_,
where _m_ tells how many items to discard from the start of the reversal,
and _n_ tells how many to discard from the end of the reversal.

Append copy of reverse of the complete list,
making a palindrome with a repeated middle item:

```
>>> [1 2 3 4].mirror(0, 0)
[1 2 3 4 4 3 2 1]
```

Append reverse of prefix of list,
making a palindrome without a repeated middle item:

```
>>> [1 2 3 4].mirror(1, 0)
[1 2 3 4 3 2 1]
```

Append reverse of prefix of list without last item,
making a list that will cycle without repeated elements at the center or at the join:

```
>>> [1 2 3 4].mirror(1, 1)
[1 2 3 4 3 2]
```

Plot the `mirror` of the `++` of the `prefixes` of the arithmetic sequence _1:13_:

~~~spl svg=A
1:13.prefixes.++.mirror(1, 0).linePlot
~~~

![](sw/spl/Help/Image/mirror-A.svg)

* * *

See also: first, last, pyramid, reversed

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Array.html#-mirror)
