# digitAt

- _digitAt(anInteger)_

Answer the value of an apparent byte-indexable field in _anInteger_.

At `SmallFloat`:

```
>>> let n = 1 + (2 << 8) + (3 << 16) + (4 << 24);
>>> (n, 1:4.collect { :i | n.digitAt(i) })
(
	67305985,
	[1 2 3 4]
)
```

At `LargeInteger`:

```
>>> let m = [
>>> 	1146051034025416L
>>> 	9903760998019254L
>>> 	6360895434064385L
>>> ];
>>> let n = (m * (10L ^ [32 16 0])).sum;
>>> 1:20.collect { :i | n.digitAt(i) }
[
	 1  2  3  4  5  6  7  8  9 10
	11 12 13 14 15 16 17 18 19 20
]
```

* * *

See also: digitLength
