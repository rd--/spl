# addOscListener

- _addOscListener(aMessageSource, anOscAddress, aBlock:/1)_

Add a listener for _Open Sound Control_ messages to an Osc source, for instance _ScSynth_.
When an Osc message is received with the specified _address_,
_aBlock_ is applied to the message.

```
>>> system.workspace::onDone := (
>>> 	system
>>> 	.scSynth
>>> 	.addOscListener(
>>> 		'/done',
>>> 		{ :oscMessage |
>>> 			['onDone', oscMessage].postLine
>>> 		}
>>> 	)
>>> );
>>> system.workspace::onDone.isBlock
true
```

* * *

See also: removeOscListener, ScSynth

Categories: Scheduling
