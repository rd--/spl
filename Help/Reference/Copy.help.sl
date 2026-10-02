# Copy

`Copy` is a `Trait` for objects that can be copied.

```
>>> system
>>> .traitDictionary['Copy']
>>> .isTrait
true
```

Requires:

- `primitiveDeepCopy`
- `primitiveShallowCopy`

These methods are both implemented at `Object`,
so types that implement `Object` and `Copy` do not need to implement any methods.

The instrinsic atomic types implement `shallowCopy` as idenentity.

Implements:

- `copy`
- `deepCopy`
- `postCopy`
- `shallowCopy`

* * *

See also: Object, copy, deepCopy, postCopy, shallowCopy

Guides: Copying Functions
