# SoundFile

- _SoundFile(aUrl)_
- _SoundFile(anArrayBuffer, aUrl)_

A type representing a sound file.
The methods `numberOfChannels`, `numberOfFrames` and `sampleRate` read the file meta data.
The method `url` reads the Url the file was fetched from.
The method `channelData` reads the indicated one-indexed channel data as a `Float32Array`.

~~~
let url = 'https://rohandrape.net/pub/jssc3/flac/then.wav'.asUrl;
SoundFile(url).then { :soundFile |
	let channelData = soundFile.channelData(1);
	(
		numberOfChannels: soundFile.numberOfChannels,
		numberOfFrames: soundFile.numberOfFrames,
		sampleRate: soundFile.sampleRate,
		url: soundFile.url,
		channelDataSize: channelData.size,
		channelDataTypeOf: channelData.typeOf
	).postLine;
	channelData.asList.drop(1024 * 8).take(1024 * 1).plot
}
~~~

* * *

See also: Float32Array, Url
