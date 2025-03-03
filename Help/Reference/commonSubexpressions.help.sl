# commonSubexpressions

- _commonSubexpressions(aSymbolicExpression, aBlock:/2)_

Answer a list of the subexpressions of _aSymbolicExpression_ that occur more than once,
according to _aBlock_.

List subexpressions that are common,
according to `==`.
This recovers `let` bound variables:

```
>> let a = 𝒙 * 𝒙;
>> (a * a).commonSubexpressions(==)
[(* x x)]
```

List subexpressions that are common,
according to `==` and `isEqualSymbolicExpression`:

```
>> let e = ((𝒙 * 𝒙) * (𝒙 * 𝒙));
>> let a = e.commonSubexpressions(==);
>> let b = e.commonSubexpressions(
>> 	isEqualSymbolicExpression:/2
>> );
>> (a, b)
([], [(* x x)])
```

* * *

See also: ==, isEqualSymbolicExpression, SymbolicExpression

