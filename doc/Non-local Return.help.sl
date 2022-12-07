# Non-local Return

There is no _procedure return_ operator.
Instead there are _withReturn_  and _return_ methods, implementing delimited non-local return.

```
| answer |
answer := withReturn {
	while { true } {
		| n = random(); |
		if(n > 0.9) {
			return(0 - n)
		} {
			n.postLine
		}
	}
};
answer.postLine
```

_Rationale_:
In Smalltalk _^_ is the _method return_ operator.
In JavaScript _return_ is the _procedure return_ operator.
If control structures are represented as procedures, procedure return is not a useful construct.
If methods are simply procedures there can be no method return construct.
Instead a form of delimited non-local return is required.
The scope of the _return_ method is indicated by the _withReturn_ method.
