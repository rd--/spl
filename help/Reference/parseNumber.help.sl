# parseNumber

- _parseNumber(aString)_

Answer the `Number` represented by _aString_,
else signal an `error`.

Parse decimal integer:

```
>>> '23'.parseNumber
23
```

Parse negative decimal integer:

```
>>> '-23'.parseNumber
-23
```

Parse decimal real number:

```
>>> '3.141'.parseNumber
3.141
```

Parse negative decimal real number:

```
>>> '-672.433244'.parseNumber
-672.433244
```

Parse negative zero:

```
>>> '-0'.parseNumber
-0
```

Signal error on failure:

```
>>> { 'three'.parseNumber }.ifError { true }
true
```

* * *

See also: parseFraction, parseInteger, printString, storeString

Categories: Parsing
