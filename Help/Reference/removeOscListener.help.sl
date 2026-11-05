# removeOscListener

- _removeOscListener(s, a, f/1)_

Remove a listener for Open Sound Control messages from an Open Sound Control source,
for instance `ScSynth`.

```
>>> let f = { :oscMessage |
>>> 	['onDone', oscMessage].printLine
>>> };
>>> system
>>> .scSynth
>>> .addOscListener(
>>> 	'/done',
>>> 	f/1
>>> );
>>> system
>>> .scSynth
>>> .removeOscListener(
>>> 	'/done',
>>> 	f/1
>>> )
f/1
```

* * *

See also: addOscListener

Guides: Scheduling Functions
