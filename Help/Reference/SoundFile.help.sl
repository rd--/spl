# SoundFile

- _SoundFile(aUrl)_
- _SoundFile(anArrayBuffer, numberOfChannels, numberOfFrames, sampleRate, aUrl)_

A type representing a sound file.
The methods `numberOfChannels`, `numberOfFrames` and `sampleRate` read the file meta data.
The method `url` reads the Url the file was fetched from.
The method `interleavedData` reads the indicated interleave channel data as a `Float32Array`.
The method `channelData` reads the indicated one-indexed channel data as a `Float32Array`.

~~~spl svg=A
let url = [
	'https://rohandrape.net/'
	'pub/jssc3/flac/'
	'Then.wav'
].join('').asUrl;
SoundFile(url).then { :soundFile |
	let channelData = soundFile.channelData(1);
	(
		soundFile.numberOfChannels,
		soundFile.numberOfFrames,
		soundFile.sampleRate,
		soundFile.url,
		channelData.size,
		channelData.typeOf
	).postLine;
	channelData
	.asList
	.drop(1024 * 8)
	.take(1024 * 1)
	.linePlot
}
~~~

![](sw/spl/Help/Image/SoundFile-A.svg)

Define a 128 place sine table,
construct a SoundFile to hold it,
and send to the table to the synthesiser:

~~~
let table = (0 -- 2.pi).discretize(128).sin;
let soundFile = SoundFile(
	table.asFloat32Array,
	1,
	128,
	48000,
	''
);
system.scSynth.sendOsc(
	soundFile.allocSendMessage(10)
)
~~~

Read the table as a frequency control:

```
let rate = MouseX(0.001, 0.1, 0, 0.2);
let lfo = PlayBuf(1, 10, rate, 1, 0, 1, 0);
let freq = lfo * 110 + 220;
SinOsc(freq, 0) * 0.1
```

* * *

See also: Float32Array, Url

Categories: Collection, Type
