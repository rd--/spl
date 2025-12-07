# indexOf

- _indexOf([x₁ x₂ …], y)_

Answer the index of the first occurence of the object _y_ within the sequential collection _x_.
At sequences answer `zero` (an invalid index) if _y_ is not found,
else signal an `error`.

Find index of first occurrence of element in sequence:

```
>>> ['1' '2' '3' '4' '5'].indexOf('3')
3

>>> 9:1:-1.indexOf(3)
7

>>> [2 3 5 6].indexOf(5)
3
```

Answers first of multiple occurrences:

```
>>> [1 2 3 2 3].indexOf(3)
3
```

Answers zero if the item is not in the sequence:

```
>>> [1 2 3 2 3].indexOf(4)
0
```

At `Range` there is a closed form:

```
>>> (99, 101 .. 999).indexOf(433)
168

>>> (433 - 99) / 2 + 1
168

>>> (1, 7 .. 99999999).indexOf(89014735)
14835790

>>> (1, 7 .. 99999999).at(14835790)
89014735
```

`indexOf` is subject to floating point error:

```
>>> (1, 1.1 .. 9).indexOf(3.1)
0

>>> (1, 1.1 .. 9).at(22)
3.1

>>> (3.1 - 1) / (1.1 - 1) + 1
22

>>> [1, 1.1 .. 9].indexOf(3.1)
0

>>> [1, 1.1 .. 9].at(22)
3.1
```

* * *

See also: detect, detectIndex, indexOfIfAbsent, indexOfStartingAtBy, indicesOf, lastIndexOf

Guides: Indexing Functions, List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FirstPosition.html),
_Smalltalk_
5.7.8.20

Categories: Accessing
