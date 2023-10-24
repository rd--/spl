# ScSynth -- synthesiser type

An object representing a connection to the SuperCollider synthesiser, _scsynth_.

The system instance of this type is at _system.scSynth_.

By default an internal copy of the SuperCollider synthesiser is used.
This instance can be started using _connect_, which the ordinary _play_ methods will do as required.

However the system can also connect to an existing external instance of the synthesiser by calling the _useWebSocket_ method.

	system.scSynth.useWebSocket('ws://localhost:58110')

This method must be called before a connection is established using _connect_.

At present _scsynth_ does not implement the
[WebSocket](https://developer.mozilla.org/en-US/docs/Web/API/WebSocket) protocol
and a bridge must be used,
c.f. the _ws-bridge_ program at [jssc3](https://rohandrape.net/?t=jssc3).

* * *

See also: addOscListener, removeOscListener
