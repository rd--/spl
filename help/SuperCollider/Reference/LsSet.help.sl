# LsSet

- _Pset(key, value, aStream)_

Set _key_ to _value_ in _aStream_.

	LsSet('freq', LsSeries(1, 1, 2) * 111, LsBind(dur: 1)).upToEnd = [(dur: 1, freq: 111), (dur: 1, freq: 222)]

* * *

See also: LsBind
