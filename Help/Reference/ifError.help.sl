# ifError

- _ifError(f:/0, g:/1)_

Evaluate the no-argument block _f_ and if there is no error then that is the answer.
If an error occurs evaluate the unary block _g_ and that is the answer.
_g_ is evaluated using `cull`,
the parameter is the `Error` signalled by _f_.

With one argument block:

```
>>> {
>>> 	1.anUnknownMessage
>>> }.ifError { :err |
>>> 	err
>>> }.isError
true
```

With no argument block:

```
>>> {
>>> 	1.anUnknownMessage
>>> }.ifError {
>>> 	true
>>> }
true
```

* * *

See also: cull, Error, isError

Guides: Block Functions, Control Functions

References:
_Smalltalk_
5.4.3.2,
_SuperCollider_
[1](https://doc.sccode.org/Classes/Function.html#-try)

Categories: Evaluating
