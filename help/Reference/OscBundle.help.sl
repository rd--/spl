# OscBundle

- _OscBundle(time, messageList)_

An _Open Sound Control_ bundle consists of an _time_ and a (possibly empty) _messageList_.

```
>>> OscBundle(0, [OscMessage('/x', [])]).asRecord
(timeTag: (native: 0), packets: [(address: '/x', args: [])])
```

* * *

See also: OscMessage, OscParameter

Categories: OpenSoundControl
