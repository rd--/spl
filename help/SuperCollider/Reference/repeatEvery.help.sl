# repeatEvery -- scheduling

- _repeatEvery(aClock, aBlock, aDelay)_

Schedule _aBlock_ at intervals given by _aDelay_ on _aClock_.
If _aBlock_ accepts an argument it will be the delay interval before the block will execute next.

Print a message every few seconds indefinitely:

```
workspace::clock.repeatEvery({ :interval |
	['About to delay for', interval].postLine
}, {
	(1 .. 5).atRandom
})
```

Clear clock to end:

```
workspace::clock.clear
```
