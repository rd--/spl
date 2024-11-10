# Block Semantics

_Block_ has the semantics of Smalltalk’s _BlockClosure_, which is a form of Scheme’s _lambda_.

> _Semantics:_
> A lambda expression evaluates to a procedure.
> The environment in effect when the lambda expression was evaluated is remembered as part of the procedure.
> When the procedure is later called with some actual arguments,
> the environment in which the lambda expression was evaluated will be extended by
> binding the variables in the formal argument list to fresh locations,
> the corresponding actual argument values will be stored in those locations,
> and the expressions in the body of the lambda expression will be evaluated sequentially in the extended environment.
> The result of the last expression in the body will be returned as the result of the procedure call.
> (Rees and Clinger 1986, p. 7)

Blocks have fixed arity, they must be applied to the number of arguments they require.

Temporary variables are initialised to _nil_.

The `numArgs` method reports the arity of a block.

The `cull` method (as in Smalltalk) selectively applies a block to fewer arguments,
using  `numArgs` to ignore excess parameters.

* * *

See also: cull, numArgs, value

Guides: Block Syntax
