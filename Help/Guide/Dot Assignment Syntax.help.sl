# Dot Assignment Syntax

- _x.f := y_

When types are defined,
methods to read and write their slots are automatically generated.

The type `Complex` has two slots called `real` and `imaginary`.

The unary reader method is simply the slot name,
and slot access is ordinarily written using `Method Syntax`:

```
>>> let x = Complex(1, 2);
>>> (x.real, x.imaginary)
(1, 2)
```

At present,
the binary writer method is named as the slot name with suffix _MutateInPlace_ appended.
This awkward name is not ordinarily encountered because slot mutation is written using this syntax.

```
>>> let x = Complex(1, 2);
>>> x.real := 3;
>>> x.imaginaryMutateInPlace(4);
>>> (x.real, x.imaginary)
(3, 4)
```

If instead the method were named with only an _!_ suffix,
this syntax would become an alias for any _in-place_ method.
Another possibility is for the method to be named `setSlotName!`.
This would make writing _psuedo-slots_ less cumbersome,
however it is not clear if that is a good idea.

Rewrite rule:

```
>> 'x.f := y'.splSimplify
fMutateInPlace(x, y)
```

* * *

Guides: Assignment Syntax
