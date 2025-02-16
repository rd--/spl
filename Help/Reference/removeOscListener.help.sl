# removeOscListener

- _removeOscListener(aMessageSource, anOscAddress, aBlock:/1)_

Remove a listener for Osc messages from an Osc source, for instance _ScSynth_.

```
>>> system.workspace.includesKey('onDone').if {
>>> 	system
>>> 	.scSynth
>>> 	.removeOscListener(
>>> 		'/done',
>>> 		workspace::onDone
>>> 	).isBlock
>>> } {
>>> 	true
>>> }
true
```

* * *

See also: addOscListener

Categories: Scheduling
