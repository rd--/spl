# removeOscListener

- _removeOscListener(s, a, f/1)_

Remove a listener for Open Sound Control messages from an Open Sound Control source,
for instance `ScSynth`.

```
>>> system
>>> .scSynth
>>> .removeOscListener(
>>> 	'/done',
>>> 	workspace.onDone
>>> ).isBlock
true
```

* * *

See also: addOscListener

Guides: Scheduling Functions
