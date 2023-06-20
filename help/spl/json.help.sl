# json -- protocol

String encoding for a small set of types:
_Nil_, _Boolean_, _SmallFloat_, _String_, _Array_, and _Record_.

	[nil, true, false].collect(json:/1) = ["null", "true", "false"]
	[3.141, 23].collect(json:/1) = ["3.141", "23"]
	'str'.json = '"str"'
	[3.141, 23].json = '[3.141,23]'
	(x: 3.141, y: 23).json = '{"x":3.141,"y":23}'

* * *

See also: _parseJson_
