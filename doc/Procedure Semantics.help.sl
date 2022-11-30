# Procedure Semantics

The Spl _Procedure_ semantics follow the Smalltalk _BlockClosure_ semantics.
These semantics can be implemented in Scheme using _lambda_, _let*_ and _set!_, or in Javascript using _function_, _var_ and _=_.

Temporary variables are lexically scoped and initialised to _nil_.

Procedures have fixed arity, they must be applied to the number of arguments they require.

The procedure _numArgs(f)_ reports that arity of the procedure _f_.

The _cull_ family of procedures (as in Smalltalk) selectively apply a procedure to fewer arguments, using the value of  _numArgs(f)_ to ignore excess parameters.
