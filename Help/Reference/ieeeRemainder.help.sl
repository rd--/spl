# ieeeRemainder

- _ieeeRemainder(n, d)_

Answer IEEE 754 remainder of _n_ and _d_.

Compare with `remainder`:

```
>>> [
>>> 	3.0 2.0;
>>> 	4.0 2.0;
>>> 	10.0 3.0;
>>> 	11.0 3.0;
>>> 	27.0 4.0;
>>> 	28.0 5.0;
>>> 	17.8 4.0;
>>> 	17.8 4.1;
>>> 	-16.3 4.1;
>>> 	17.8 -4.1;
>>> 	-17.8 -4.1
>>> ].collect { :x |
>>> 	let [n, d] = x;
>>> 	[
>>> 		n,
>>> 		d,
>>> 		ieeeRemainder(n, d),
>>> 		remainder(n, d)
>>> 	]
>>> }
[
	3 2 -1 1;
	4 2 0 0;
	10 3 1 1;
	11 3 -1 2;
	27 4 -1 3;
	28 5 -2 3;
	17.8 4 1.8 1.8;
	17.8 4.1 1.4 1.4;
	-16.3 4.1 0.1 -4;
	17.8 -4.1 1.4 1.4;
	-17.8 -4.1 -1.4 -1.4
]
```

Written out IEEE remainder:

```
>>> let [a, b] = [3.0, 2.0];
>>> a - (b * round(a / b))
-1.0
```

Written out remainder:

```
>>> let [a, b] = [3.0, 2.0];
>>> (
>>> 	abs(a)
>>> 	 - (abs(b) * floor(abs(a) / abs(b)))
>>> ) * sign(a)
1.0
```

* * *

See also: *, -, remainder, round

Guides: Floating Point Functions

References:
_C#_
[1](https://learn.microsoft.com/en-us/dotnet/api/system.math.ieeeremainder)
