# Procedure Arity

If the host language supports variable arity procedures, the expression _sqrt(9)_ can be implemented by providing a variable arity procedure _sqrt_ that dynamically checks how many arguments it receives and dispatches to the appropriate place in the generics table.

However the lexical structure of _sqrt(9)_ tells us the required arity of _sqrt_.
_sqrt(9)_ can be re-written _sqrt:/1(9)_ to avoid the arity-dispatch, where _:/_ is the notation for naming fixed arity methods.
Compiling away arity dispatch would make programs quicker.

This rewriting rule would also need to be applied to local procedure definitions.
Writing _f = { :x | x + 1 }_ would need to mean _f:/1 = { :x | x + 1 }_.
(This implies disallowing assigning a procedure to a variable, since the re-writing needs to rename the variable.)

It is an open question how best to approach higher order methods, that is whether it should be possible write _c.collect(m)_ where _m_ is a method.

If _sqrt_ is a variable arity procedure then _[9, 16, 25].collect(sqrt) = [3, 4, 5]_.

If _sqrt:/1_ is a unary procedure then _[9, 16, 25].collect(sqrt:/1) = [3, 4, 5]_.

In Smalltalk _collect_ requires a block, _[9, 16, 25].collect { :each | sqrt(each) } = [3, 4, 5]_.

If the host language does not support variable arity procedures then the rule is decided for us.
