# LsClump

- _LsClump(input, size)_

Groups the items at _input_ into lists whose size is given by _size_, which may be a stream.

If there are to few items the last list may be truncated:

```
>>> LsClump(LsSeries(1, 1, 5), 2).upToEnd
[1 2; 3 4; 5]
```

The _size_ value may be a stream:

```
>>> LsClump(LsSeries(1, 1, 11), LsCyc([2 3])).upToEnd
[1 2; 3 4 5; 6 7; 8 9 10; 11]
```

* * *

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pclump.html)

Categories: Stream
