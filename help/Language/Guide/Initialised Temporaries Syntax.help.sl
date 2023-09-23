# Initialised Temporaries Syntax -- syntax

Rewrite rules:

- _| p = x, q = y, ...; |_ ⟹ _| p q ... | p := x; q := y;_

This rule allows temporaries to be initialised when declared.

The sequence of initiliasers is retained, subsequent initialisations may refer to the value of previous initialisations.

The syntax requires that all temporaries have initialisers, there is no implicit _nil_ initialiser.

Note that the initialiser syntax, _p = x_, is distinct from the assignment syntax, _p := x_.

- _| (k, ...) = d, ...; |_ ⟹ _| k = at(d, 'k'), ..., ...; |_
- _| [e, ...] = c, ...; |_ ⟹ _| e = at(c, 1), ..., ...; |_

These rules allow destructuring _Dictionary_ and _SequencableCollection_ values respectively.

The notation _| (x, y) = p; |_ initialises the variables _x_ and _y_ to the values _p::x_ and _p::y_.

- _|( p = x, q = y, ... )|_ ⟹ _| p = x, q = y, ...; |_

This rule can make writing temporaries with long initializers spanning multiple lines clearer.
Where supported the opening and closing tokens are displayed as ⦇ and ⦈.

_Rationale_: Initialising temporary variables as they are declared makes it clear in which cases they are used simply as names (assigned to using the `=` notation) and in which cases they are used as mutable state (assigned to using `:=`).

_Subtleties_:
The array and dictionary initialisers must only evaluate the right hand side once.
A gensym-ed private name is used to store the initial value, and that name is used for the destructuring.

* * *

See also: [Variable Keyword Syntax]

Unicode: ⦇ U+2987 Z Notation Left Image Bracket, ⦈ U+2988 Z Notation Right Image Bracket
