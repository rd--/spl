# System Variable

The value `system` is a global variable holding a `System` object.

```
>>> system.typeOf
'System'
```

The `system` holds the dictionaries that hold the system implementation:

- `methodDictionary`
- `packageDictionary`
- `traitDictionary`
- `typeDictionary`

The `System` type implements the `Cache` trait.

`System` is also used as the implementation type,
in preference to `Void`,
for methods that access the _host system_,
such as `absoluteTime`.

_Note_:
There is some inconsistency about the rule for which methods are defined at system.
`fetch` is define at `Url`,
`readTextFile` is defined at both `FilePath` and `System`,
`splFileName` is defined at `System`,
`splFilePath` is defined at `String`.
It could perhaps be helpful to distinguish between the Sᴘʟ system and the _host_ or _device_,
however that could be equally confusing.

* * *

See also: system, System, Void

Guides: Reflection Functions, System Functions
