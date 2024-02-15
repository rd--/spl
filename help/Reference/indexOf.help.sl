# indexOf

- _indexOf(aCollection, anElement)_

Answer the index of the first occurence of _anElement_ within _aCollection_.
At sequences answer zero (an invalid index) if _anElement_ is not found,
else raise an error.

Find index of first occurrence of element in sequence:

```
>>> ['1' '2' '3' '4' '5'].indexOf('3')
3

>>> 9:1.indexOf(3)
7
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

* * *

See also: indexOfIfAbsent, lastIndexOf

Categories: Accessing
