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

* * *

See also: cull, Error, hasError, isError

Guides: Block Functions, Control Functions

References:
_Smalltalk_
5.4.3.2,
_SuperCollider_
[1](https://doc.sccode.org/Classes/Function.html#-try)

Categories: Evaluating
