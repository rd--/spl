# ifError

- _ifError(f/0, g/1)_

Evaluate the no-argument block _f_ and if there is no error then that is the answer.
If an error occurs evaluate the unary block _g_ with the `Error` signalled by _f_,
and that is the answer.

Evaluate a block that raises an error:

```
>>> {
>>> 	1.anUnknownMessage
>>> }.ifError { :err |
>>> 	err
>>> }.isError
true
```

Evaluate a block that does not raise an error:

```
>>> {
>>> 	9.sqrt
>>> }.ifError { :err |
>>> 	-9
>>> }
3
```

Divide by zero is not an error:

```
>> { 0 / 0 }.ifError { '?' }
NaN
```

* * *

See also: Error, cull, hasError, isError

Guides: Block Functions, Control Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CheckAbort.html)
[2](https://reference.wolfram.com/language/ref/Check.html)
[3](https://reference.wolfram.com/language/ref/Catch.html),
_Smalltalk_
5.4.3.2,
_SuperCollider_
[1](https://doc.sccode.org/Classes/Function.html#-try)
