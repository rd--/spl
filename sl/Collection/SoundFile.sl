SoundFile! : [Object] {

	allocSendMessage { :self :bufferNumber |
		<primitive:
		return sc.b_allocMemcpyFloat32Array(
			_bufferNumber,
			_self.numberOfFrames,
			_self.numberOfChannels,
			_self.sampleRate,
			_self.interleavedData
		);
		>
	}

	channelData { :self :index |
		<primitive: return _self.channelData(_index - 1);>
	}

	interleavedData { :self |
		<primitive: return _self.interleavedData;>
	}

	numberOfChannels { :self |
		<primitive: return _self.numberOfChannels;>
	}

	numberOfFrames { :self |
		<primitive: return _self.numberOfFrames;>
	}

	sampleRate { :self |
		<primitive: return _self.sampleRate;>
	}

	pseudoSlotNameList { :self |
		['interleavedData', 'numberOfChannels', 'numberOfFrames', 'sampleRate', 'url']
	}

	url { :self |
		<primitive: return _self.url;>
	}

}

+ArrayBuffer {

	SoundFile { :self :url |
		<primitive: return sc.arrayBufferToSoundFile(_url, _self);>
	}

}

+Float32Array {

	SoundFile { :interleavedData :numberOfChannels :numberOfFrames :sampleRate :urlOrNil |
		<primitive: return new sc.SoundFile(_urlOrNil, _numberOfChannels, _numberOfFrames, _sampleRate, _interleavedData);>
	}

}

+@Url {

	SoundFile { :self |
		<primitive: return sc.fetchSoundFile(_self);>
	}

}
