# Ascii

A `Type` holding an Ascii encoded text string.

Ascii implements `Iterable`, `Collection`, `Indexable` and `Sequence`.

```
>>> let s = 'text'.asAscii;
>>> (s.isAscii, s.size, s.first, s.last(3))
(true, 4, 't'.asCharacter, 'ext'.asAscii)
```

Select characters by index:

```
>>> let s = 'text'.asAscii;
>>> s @* [2 4]
'et'.asAscii
```

Transform to upper case using `collect` and `asUpperCase`:

```
>>> 'text'.asAscii.collect(asUpperCase:/1)
'TEXT'.asAscii
```

Filter out vowels using `reject` and `isVowel`:

```
>>> 'text'.asAscii.reject(isVowel:/1)
'txt'.asAscii
```

Concatenate using `++`:

```
>>> 'te'.asAscii ++ 'xt'.asAscii
'text'.asAscii
```

Split on sub-string using `splitBy`:

```
>>> 'two words'.asAscii.splitBy(' '.asAscii)
['two'.asAscii, 'words'.asAscii]
```

* * *

See also: ByteArray, Character, String
