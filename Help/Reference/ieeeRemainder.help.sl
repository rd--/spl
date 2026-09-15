# ieeeRemainder

- _ieeeRemainder(n, d)_

Answer IEEE 754 remainder of _n_ and _d_.

Compare with `remainder`:

```
>>> [
>>> 	3 2;
>>> 	4 2;
>>> 	10 3;
>>> 	11 3;
>>> 	27 4;
>>> 	28 5;
>>> 	17.8 4;
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

* * *

See also: -, *, remainder, round

References:
_C#_
[1](https://learn.microsoft.com/en-us/dotnet/api/system.math.ieeeremainder)
