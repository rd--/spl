# Non-local Return

There is no function return operator in Sᴘʟ.
Instead there is the `withReturn` method, implementing delimited non-local return.

_Rationale_:
In Smalltalk `^` is the _method return_ operator.
In JavaScript `return` is the _function return_ operator.
If control structures are represented as functions, function return is not a useful construct.
If methods are simply functions there can be no method return construct.
Instead a form of delimited non-local return is required.
The scope of the `return` is indicated by the `withReturn` method.

* * *

See also: caseOf, withReturn

Guides: Control Functions
