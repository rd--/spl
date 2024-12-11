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
>>> 	1146051034025416n
>>> 	9903760998019254n
>>> 	6360895434064385n
>>> ];
>>> let n = (m * (10n ^ [32 16 0])).sum;
>>> 1:20.collect { :i | n.digitAt(i) }
[
	1n 2n 3n 4n 5n 6n 7n 8n 9n 10n
	11n 12n 13n 14n 15n 16n 17n 18n 19n 20n
]
```

* * *

See also: digitLength
