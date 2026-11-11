# abbreviatedPrintString

- _abbreviatedPrintString(x)_

Generic implementation at `Collection`:

```
>>> ByteArray(100, 0).abbreviatedPrintString
'a ByteArray (size: 100)'
```

At `List`:

```
>>> [1 .. 100].abbreviatedPrintString
'a List (size: 100)'
```

At `String`:

```
>> 'short text'
>> .abbreviatedPrintString
'short text'

>> 'a text that is rather a lot longer'
>> .abbreviatedPrintString
'a text that is ...r a lot longer'
```

* * *

See also: concisePrintString, printString, storeString

Guides: Printing Functions
