# removeOscListener

- _removeOscListener(s, a, f/1)_

Remove a listener for Open Sound Control messages from an Open Sound Control source,
for instance _ScSynth_.

```
>>> system.workspace.includesKey('onDone').if {
>>> 	system
>>> 	.scSynth
>>> 	.removeOscListener(
>>> 		'/done',
>>> 		system.workspace['onDone']
>>> 	).isBlock
>>> } {
>>> 	true
>>> }
true
```

* * *

See also: addOscListener

Categories: Scheduling
