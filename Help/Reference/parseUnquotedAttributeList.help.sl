# parseUnquotedAttributeList

- _parseUnquotedAttributeList(s)_

Answer a `Record` specified by an unquoted attribute list at the string _s_.
Entries are separated by white space and key value pairs are separated by an equals sign.
Values are of type `String`.
A key with no value is assigned the value 'true'.

```
>>> 'a=x b=y c d=z'
>>> .parseUnquotedAttributeList
(a: 'x', b: 'y', c: 'true', d: 'z')
```

Values may have non-letter characters:

```
>>> 'x=1,2 y=3,4 z=-1,0'
>>> .parseUnquotedAttributeList
(x: '1,2', y: '3,4', z: '-1,0')
```

* * *

See also: Record

Guides: Parsing Functions
