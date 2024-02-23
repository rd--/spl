# Apply Syntax

Rewrite rule:

- _f()_ ⟹ _f:/0 . ()_
- _f(x, ...)_ ⟹ _f:/n . (x, ...)_

Ordinarily method application is written _f(x, ...)_,
where _f_ is the _unqualified name_ of a method,
and _x..._ are the arguments.

```
>>> min(3, 4)
3

>>> min:/2 . (3, 4)
3
```

Operators are just especially named methods whose arity when written _free_ is known to be two:

```
>>> 3 + 4
7

>>> + . (3, 4)
7
```

Operators can also be written in prefix form and `Method Syntax` forms:

```
>>> +(3, 4)
7

>>> 3.+(4)
7
```

No argument method application is written _f()_.

```
>>> let f = { 7 };
>>> f()
7

>>> let f = { 7 };
>>> f:/0 . ()
7
```

* * *

See also: Value Apply Syntax

Categories: Syntax
