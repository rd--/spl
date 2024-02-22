# Non-local Return

There is no _block return_ operator.
Instead there is the `valueWithReturn` method, implementing delimited non-local return.

_Rationale_:
In Smalltalk _^_ is the _method return_ operator.
In JavaScript _return_ is the _block return_ operator.
If control structures are represented as blocks, block return is not a useful construct.
If methods are simply blocks there can be no method return construct.
Instead a form of delimited non-local return is required.
The scope of the _return_ is indicated by the _valueWithReturn_ method.

* * *

See also: caseOf, valueWithReturn
