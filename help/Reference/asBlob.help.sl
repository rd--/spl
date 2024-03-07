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

At `List`, joins multiple parts together:

```
>>> let list = [1:5, 6:9].collect(asByteArray:/1);
>>> let blob = list.asBlob;
>>> (list.size, blob.size, blob.type)
(2, 9, '')
```

* * *

See also: Blob

Categories: Converting
