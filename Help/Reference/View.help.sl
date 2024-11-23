# View

A `View` is a `Trait` that represents values that may be placed in a `Frame`.

A `View` must implement `outerElement`.

If not redefined:

1. `frame` is an empty method
2. `frameMenuItems` answers the empty list
3. `name` is derived from `title` by deleting whitespace
4. `title` is derived from `typeOf`

* * *

See also: Frame, SmallKansas

Categories: Kansas
