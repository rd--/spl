# Defining Methods

Methods can be appended to an existing type.

The _stdlib_ type _Duration_ represents an interval of time.

It has methods to construct and interpret Durations as seconds, but not as centiseconds.

The expressions below define these methods.

```
+ Duration {
	centiseconds { :self |
		self.milliseconds / 10
	}
}

+ Number {
	centiseconds { :self |
		Duration(self * 10)
	}
}
```

When these expressions are evaluated the new methods are added to the system.
If methods with these names already exist they are replaced by the new definitions.

The expression below schedules random sine tones at intervals given in centiseconds.

```
{
	Release(
		Pan2(
			SinOsc(IRand(48, 72).MidiCps, 0),
			Rand(-1, 1),
			Rand(0, 0.1)
		),
		Rand(0, 1),
		Rand(1, 2),
		Rand(2, 3)
	)
}.playEvery { random(50, 150).centiseconds }
```
