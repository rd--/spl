# Defining Methods

Methods can be appended to an existing type.

The _Standard Library_ type _Duration_ represents an interval of time.

It has methods to construct and interpret Durations as seconds, but not as centiseconds.

The expressions below define these methods.

```
+Duration {
	centiseconds { :self |
		self.milliseconds / 10
	}
}

+@Number {
	centiseconds { :self |
		(self * 10).milliseconds
	}
}
```

When these expressions are evaluated the new methods are added to the system.
If methods with these names already exist they are replaced by the new definitions.

```
100.centiseconds = 1000.milliseconds
```
