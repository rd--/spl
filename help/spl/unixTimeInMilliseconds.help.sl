# unixTimeInMilliseconds -- time

- _unixTimeInMilliseconds(aSystem)_
- _unixTimeInMilliseconds(aTimeStamp)_
- _unixTimeInMilliseconds(aNumber)_

_system.unixTimeInMilliseconds_ gets the current time in milliseconds since the Unix epoch as a SmallFloat.

	{ system.unixTimeInMilliseconds }.benchForMilliseconds(1000)

_aTimeStamp.unixTimeInMilliseconds_ converts a TimeStamp into the number of milliseconds since the Unix epoch.

_aNumber.unixTimeInMilliseconds_ is the identity function.
