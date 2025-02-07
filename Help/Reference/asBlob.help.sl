# asBlob

- _asBlob(aList | aByteArray | aFloat64Array)_

At `ByteArray` encloses data:

```
>>> let byteArray = [1 .. 9].asByteArray;
>>> let blob = byteArray.asBlob;
>>> (byteArray.size, blob.size, blob.type)
(9, 9, '')
```

At `Float64Array` encloses data as a byte array:

```
>>> let float64Array = [1 .. 9].asFloat64Array;
>>> let blob = float64Array.asBlob;
>>> (float64Array.size, blob.size, blob.type)
(9, 72, '')
```

Fetch text from `Blob`:

~~~spl async
[65 .. 69]
.asByteArray
.asBlob
.text
~~~

* * *

See also: Blob

Categories: Converting
