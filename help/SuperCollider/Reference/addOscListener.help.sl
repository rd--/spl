# addOscListener -- scheduling

- _addOscListener(aMessageSource, anOscAddress, aBlock:/1)_

Add a listener for _Open Sound Control_ messages to an Osc source, for instance _ScSynth_.
When an Osc message is received with the specified _address_, _aBlock_ is applied to the message.

	workspace::onDone := { :oscMessage | ['onDone', oscMessage].postLine }
	system.scSynth.addOscListener('/done', workspace::onDone)

* * *

See also: removeOscListener, ScSynth
