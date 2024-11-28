# concisePrintString

- _concisePrintString(anObject)_

Answer a concise string representation of _anObject_.

```
>>> 3.141.concisePrintString
'3.141'

>>> 23.concisePrintString
'23'

>>> nil.concisePrintString
'nil'

>>> true.concisePrintString
'true'

>>> (1 -- 9).concisePrintString
'(1 -- 9)'

>>> 1:9.concisePrintString
'1:9'

>>> (1, 3, 5, 7, 9).concisePrintString
'(1, 3, 5, 7, 9)'

>>> 'short text'.concisePrintString
'short text'

>>> 'a text that is rather a lot longer'.concisePrintString
'a text that is ...r a lot longer'

>>> [1 .. 9].concisePrintString
'a List (size: 9)'
```

* * *

See also: asString, printString, storeString

Categories: Printing
