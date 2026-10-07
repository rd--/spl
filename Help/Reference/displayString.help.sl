# displayString

- _displayString(x)_

Answer the `printString` of the object _x_,
unless it is a `String`, in which case answer _x_ itself.

At `String`:

```
>> 'x'.displayString
x

>> 'x'.printString
'x'
```

At `List`,
strings in a list are shown quoted:

```
>> [1 .. 3].displayString
[1, 2, 3]

>> ['1' '2' '3'].displayString
['1', '2', '3']
```

At `Record`,
string in record fields are quoted:

```
>> (x: 1, y: 2).displayString
(x: 1, y: 2)

>> (x: 'a', y: 'b').displayString
(x: 'a', y: 'b')
```

* * *

See also: String, concisePrintString, printString, storeString

Guides: String Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/TextString.html)

Categories: Converting, Printing
