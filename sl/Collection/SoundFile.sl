SoundFile! : [Object] {

	channelData { :self :index |
		<primitive: return _self.channelData(_index - 1);>
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

	interleavedData { :self |
		<primitive: return _self.interleavedData;>
	}

	allocSendMessage { :self :bufferNumber |
		<primitive:
		return sc.b_alloc_then_memcpy_float32array(
			_bufferNumber,
			_self.numberOfFrames,
			_self.numberOfChannels,
			_self.sampleRate,
			_self.interleavedData
		);
		>
	}

	url { :self |
		<primitive: return _self.url;>
	}

}

+ArrayBuffer {

	SoundFile { :self :url |
		<primitive: return sc.arraybuffer_to_soundfile(_url, _self);>
	}

}

+@Url {

	SoundFile { :self |
		<primitive: return sc.fetch_soundfile(_self);>
	}

}
