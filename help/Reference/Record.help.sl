# Record

A `Record` is a `Dictionary` type where all the keys are strings.

There is a literal syntax for records.

```
>>> (x: 3.141, y: 23).isRecord
true
```

There is a conversion method from an `Association` `List`:

```
>>> ['x' -> 3.141, 'y' -> 23].asRecord.asJson
'{"x":3.141,"y":23}'

>>> ['x' -> 3.141, 'y' -> 23].asRecord
(x: 3.141, y: 23)

>>> ['pi' -> 1.pi].asRecord.isDictionary
true
```

At the ordinary `asRecord` constructor it is an error if any key is not a string.
There is a `basicAsRecord` form that coerces keys to strings.

```
>>> { [1.pi -> 'pi'].asRecord }.ifError { :err | true }
true

>>> [1.pi -> 'pi'].asMap.basicAsRecord.keys
['3.141592653589793']
```

* * *

See also: asJson, asRecord, Association, Dictionary, Dictionary Syntax, Map

Categories: Collection, Type
