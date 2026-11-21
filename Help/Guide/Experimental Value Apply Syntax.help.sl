# Experimental Value Apply Syntax

- _f . ()_
- _f . (x, ...)_

This is the primitive `Function` application syntax.
_f_ must be a `Function` value,
it is applied to the arguments given within the parentheses.

A full stop separates the _procedure_ from the _parameter list_ in `Value Apply Syntax`:

~~~spl experimental
sqrt/1 . (9)
=>
3

max/2 . (3, 7)
=>
7
~~~

Comma separates parameter items in `Value Apply Syntax`:

~~~spl experimental
min/2 . (3, 7)
=>
3
~~~

`()` is part of `Value Apply Syntax`,
where it represents an empty parameter list:

~~~spl experimental
List/0 . ()
=>
[]
~~~

No argument `Function`:

~~~spl experimental
{ } . ()
=>
nil
~~~

One argument `Function`:

~~~spl experimental
{ :n | n * n } . (23)
=>
529
~~~

Two argument `Function`:

~~~spl experimental
{ :p :q | p ++ q } . ('x', 'y')
=>
'xy'
~~~

Methods are functions:

~~~spl experimental
sqrt/1 . (529)
=>
23
~~~

Operators are functions:

~~~spl experimental
^ . (23, 2)
=>
529
~~~

* * *

See also: Function, .

Guides: Apply Syntax, Method Syntax

Categories: Syntax
