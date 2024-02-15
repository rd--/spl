# ,

Comma is syntax token, it is not an operator.

Comma separates items in [List Syntax]:

```
>>> [1, 2, 3]
[1, 2, 3]
```

Comma separates items in [Dictionary Syntax]:

```
>>> (x: 1, y: 2, z: 3)
(x: 1, y: 2, z: 3)
```

Comma separates parameter items in [Apply Syntax]:

```
>>> min(3, 7)
3
```

Comma separates parameter items in [Value Apply Syntax]:

```
>>> min:/2 . (3, 7)
3
```

Comma separates the first to items in [Range Syntax]:

```
>>> (1, 3 .. 9)
Range(1, 9, 2)

>>> [1, 3 .. 9]
[1, 3, 5, 7, 9]
```

* * *

See also: ;, ., .., ++
