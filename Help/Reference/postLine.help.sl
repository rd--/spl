# postLine

- _postLine(aSystem, anObject)_
- _postLine(alpha)_ ⟹ _postLine(system, alpha)_

Print the `printString` of _anObject_ to the console, followed by a new line.
Answer _anObject_.

Print the answer of _3 + 4_ and answer it multiplied by _7_:

```
>>> (3 + 4).postLine * 7
49
```

Print hounds-tooth like pattern to console:

~~~
let d = [3 6 13 11 223 191 111 207];
4.timesRepeat {
	1.toDo(8) { :l |
		let s = [];
		5.timesRepeat {
			1.toDo(8) { :n |
				let k = d[l].integerDigits(2, 8);
				let c = (k[n] > 0).if {
					'██'
				} {
					'░░'
				};
				s.add(c)
			}
		};
		s.join('').postLine
	}
}
~~~

If a `Transcript` is loaded, the message will also be written to the transcript,
where it may be viewed using a `TranscriptViewer`.

* * *

See also: system, Transcript

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:print),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Print.html)
[2](https://reference.wolfram.com/language/ref/Echo.html)
[3](https://reference.wolfram.com/language/ref/Message.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/disp.html),
_Python_
[1](https://docs.python.org/3/library/functions.html#print),
_Whatwg_
[1](https://console.spec.whatwg.org/#log)

Categories: Printing
