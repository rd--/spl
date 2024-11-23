# split

- _split(aSequence, aBlock:/2)_

Split _aSequence_ into parts at points where _aBlock_,
when applied to adjacent elements,
answers `false`.

Split when adjacent elements are not equal:

```
>>> [1 1 1 2 2 1 1 3].split(=)
[1 1 1; 2 2; 1 1; 3]
```

Split in increasing runs of elements:

```
>>> [1 2 3 4 3 2 1 5 6 7 4 3].split(<)
[1 2 3 4; 3; 2; 1 5 6 7; 4; 3]
```

Decreasing runs of elements:

```
>>> [1 2 3 4 3 2 1 5 6 7 4 3].split(>)
[1; 2; 3; 4 3 2 1; 5; 6; 7 4 3]
```

Split based on key:

```
>>> [1 -> 'a', 1 -> 'b', 2 -> 'a', 2 -> 'c', 3 -> 'a'].split { :i :j |
>>> 	i.key = j.key
>>> }
[
	[1 -> 'a', 1 -> 'b'],
	[2 -> 'a', 2 -> 'c'],
	[3 -> 'a']
]
```

Split at jumps:

```
>>> 20.primesList.split { :i :j | j - i < 4 }
[2 3 5 7; 11 13; 17 19; 23; 29 31; 37; 41 43; 47; 53; 59 61; 67; 71]
```

Split so that in each sublist successive elements are not the same:

```
>>> [1 1 1 2 1 2 2 1 1 1 3 1].split(~=)
[1; 1; 1 2 1 2; 2 1; 1; 1 3 1]
```

Split after every occurrence of 1:

```
>>> [1 2 1 2 3 4 1 1].split { :i :j | i ~= 1 }
[1; 2 1; 2 3 4 1; 1]
```

Split before every occurrence of 1:

```
>>> [1 2 1 2 3 4 1 1].split { :i :j | j ~= 1 }
[1 2; 1 2 3 4; 1; 1]
```

Group together identical elements:

```
>>> 'aaabbaaccc'.contents.split(=)
['a' 'a' 'a'; 'b' 'b'; 'a' 'a'; 'c' 'c' 'c']
```

Split by sign:

```
>>> [3 0 -4 3 3 -2 0 -3 -4 5].split { :i :j | i.sign = j.sign }
[3; 0; -4; 3 3; -2; 0; -3 -4; 5]
```

Only split when there is a change from non-positive to positive sign (rising edge):

```
>>> [3 0 -4 3 3 -2 0 -3 -4 5].split { :i :j |
>>> 	(i.sign <= 0 & { j.sign > 0 }).not
>>> }
[3 0 -4; 3 3 -2 0 -3 -4; 5]
```

Only split when there is a change from positive to negative (or non-positive) sign (falling edge):

```
>>> [3 0 -4 3 3 -2 0 -3 -4 5].split { :i :j |
>>> 	(i.sign > 0 & { j.sign < 0 }).not
>>> }
[3 0 -4 3 3; -2 0 -3 -4 5]

>>> [3 0 -4 3 3 -2 0 -3 -4 5].split { :i :j |
>>> 	(i.sign > 0 & { j.sign <= 0 }).not
>>> }
[3; 0 -4 3 3; -2 0 -3 -4 5]
```

Run-length encoding:

```
>>> [1 1 1 2 2 1 1 3 3 3].split(=).collect { :each | [each.first, each.size] }
[1 3; 2 2; 1 2; 3 3]
```

`flatten` acts an inverse of `split`:

```
>>> let l = [1 1 1 2 2 1 1 3 3 3];
>>> l.split(=).flatten
l
```

Find runs of numbers in base 10 that contain the same number of 1s:

```
>>> 1:50.collect { :n | n.digitCount(10, 1) }.split(=)
[
	1;
	0 0 0 0 0 0 0 0;
	1;
	2;
	1 1 1 1 1 1 1 1;
	0;
	1;
	0 0 0 0 0 0 0 0 0;
	1;
	0 0 0 0 0 0 0 0 0;
	1;
	0 0 0 0 0 0 0 0 0
]
```

* * *

See also: splitBy

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Split.html)
