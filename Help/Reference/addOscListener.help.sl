# addOscListener

- _addOscListener(s, f, f/1)_

Add a listener for _Open Sound Control_ messages to an Open Sound Control message source _s_,
for instance _ScSynth_.
When an osc message is received with the specified address _a_,
the block _f_ is applied to the message.

```
>>> system.workspace['onDone'] := (
>>> 	system
>>> 	.scSynth
>>> 	.addOscListener(
>>> 		'/done',
>>> 		{ :oscMessage |
>>> 			['onDone', oscMessage].printLine
>>> 		}
>>> 	)
>>> );
>>> system.workspace['onDone'].isBlock
true
```

* * *

See also: ScSynth, removeOscListener

Guides: Scheduling Functions
