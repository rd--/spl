# operatorCharacterNameTable

- _operatorCharacterNameTable(aSystem)_

Answer a `Dictionary` where the `keys` are operator characters and the values are operator character names.

```
>>> let t = system.operatorCharacterNameTable;
>>> (t.size, t['>'], t[':'], t['('])
(31, 'greaterThanSign', 'colon', 'leftParenthesis')
```

_Note_:
This is a misnomer, since the table contains characters that are not allowed as part of an operator.

* * *

See also: operatorNameTable

Categories: Reflection
