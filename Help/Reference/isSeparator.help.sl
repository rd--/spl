# isSeparator

- _isSeparator(c)_

Answer `true` if the character _c_ is one of the separator characters,
which are space, carriage return, tab, line feed, or form feed.

```
>>> ' '.isSeparator & {
>>> 	' '.isSpace
>>> }
true

>>> '\t'.isSeparator & {
>>> 	'\t'.isTab
>>> }
true

>>> '\n'.isSeparator & {
>>> 	'\n'.isLineFeed
>>> }
true

>>> '\r'.isSeparator & {
>>> 	'\r'.isCarriageReturn
>>> }
true

>>> '\f'.isSeparator & {
>>> 	'\f'.isFormFeed
>>> }
true
```

* * *

See also: Character, isCarriageReturn, isFormFeed, isLineFeed, isSpace, isTab

Guides: String Functions

Categories: Testing
