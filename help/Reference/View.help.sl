# View

A `View` is a `Trait` that represents values that may be placed in a `Frame`.

A `View` must implement `outerElement`.

If not redefined:

- `frame` is an empty method
- `frameMenuItems` answers the empty list
- `name` is derived from `title` by deleting whitespace
- `title` is derived from `typeOf`

* * *

See also: Frame, SmallKansas

Categories: UserInterface
