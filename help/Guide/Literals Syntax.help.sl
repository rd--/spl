# Literals Syntax -- syntax

The four primitive types are _Nil, _Boolean_, _Number_ and _String_.

- _nil_ ⇒ _Nil_
- _true_ ⇒ _Boolean_
- _false_ ⇒ _Boolean_
- _23_ ⇒ _Number_
-  _3.141_ ⇒ _Number_
- _'xyz'_ ⇒ _String_

The _Block_ syntax is as in Smalltalk, with braces replacing brackets.

- _{ e; ... }_ ⇒ _Block_ (with expressions _e_)
- _{ :a ...| e; ... }_ ⇒ _Block_ (with arguments _a_)
- _{ :a ...| | t ... | e; ... }_ ⇒ _Block_ (with temporary variables _t_)

There is no literal _Array_ syntax (as in Smalltalk) however there is an array expression syntax.

- _[p, q, r]_ ⇒ _Array_

There is also a _Dictionary_ expression syntax.

- _(x: p, y: q, z: r) ⇒ _Record_

* * *

See also: [Dictionary Syntax], [Integer Literals], [Interval Syntax]
