# Smalltalk Arity

In Smalltalk, message names indicate the arity of the method they select.
Operators are always binary and are written infix, i.e. _3 + 4_.
Unary messages are written postfix, i.e. _9 sqrt_.
N-ary messages are written using keywords, i.e. _aCollection at: aKey put: aValue_.

The arity of a method is two if it is an operator, or else it is one more that the number of colons in the name.
The arity of _sqrt_ is one, the arity of _at:_ is two, the arity of _at:put:_ is three.
Since all messages in Smalltalk have a receiver, the number of colons indicates the number of arguments in the message.

In Smalltalk _c max_ selects the maximum element from the collection _c_,
and _p max: q_ selects the greater of the two values _p_ and _q_.
The expression _p x_ reads the _x_ field of the _Point_ _p_,
and _p x: 1_ mutates it.
The expression _c sorted: f_ answers a copy of the collection _c_ sorted according to comparison block _f_,
and _c sorted_ sorts according to _<=_.

In Smalltalk blocks and methods have distinct application syntaxes.
The block _squared := [ :aNumber | aNumber * aNumber ]_ is applied as _squared value: 3_
The method _squared_ is applied as _3 squared_.

Methods that require behaviours as arguments generally require blocks, i.e. _#(9 16 25) collect: [ :each | each sqrt ]_.
By implementing _value:_ at _Symbol_ (as _anObject perform: self_) this can be written _#(9 16 25) collect: #sqrt_.
