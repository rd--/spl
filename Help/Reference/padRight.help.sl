# padRight

- _padRight(aSequence, anInteger, anObject)_

Answer a sequence of length _anInteger_ by suffixing _aSequence_ with copies of _anObject_.

At `List`:

```
>>> [1 2 3].padRight(9, 0)
[1 2 3 0 0 0 0 0 0]
```

Not in place:

```
>>> let a = [1 2 3];
>>> let b = a.padRight(5, 0);
>>> (a, b)
([1 2 3], [1 2 3 0 0])
```

At `String`:

```
>>> 'xyz'.padRight(9, ' ')
'xyz      '
```

+List{
	padRight { :self |
		self.isVector.if {
			self
		} {
			let k = self.depth;
			let s = [self.size];
			1.toDo(k - 2) { :i |
				s.add(
					self.level([i]).collect { :each |
						each.nest.size
					}.max
				)
			};
			s
		}
	}
}


```
>>> let l = [1; ; 2 3:; 4; 5 6 7; ];
>>> (l.depth, l.dimensions, l.level([1]), l.padRight)


* * *

See also: #, ++, padLeft, padLeftAndRight, size

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PadRight.html)
