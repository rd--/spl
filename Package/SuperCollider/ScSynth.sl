/* Requires: Ugen */

ScSynth! : [Object] {

	addOscListener { :self :address :onMessage |
		<primitive: _self.addOscListener(_address, _onMessage);>
		onMessage
	}

	connect { :self |
		<primitive: return _self.connect();>
	}

	isConnected { :self |
		<primitive: return _self.isConnected();>
	}

	mainOutputs { :self |
		system.preference('ScSynth/Outputs/Main/NumberOfChannels', 2)
	}

	mainOrientation { :self |
		system.preference('ScSynth/Outputs/Main/FrontIsVertex', false).if {
			0
		} {
			0.5
		}
	}

	options { :self |
		<primitive: return _self.options;>
	}

	oscListeners { :self |
		<primitive: return _self.oscListeners;>
	}

	pseudoSlotNameList { :self |
		['options', 'oscListeners', 'readyState', 'status', 'useIoUgens']
	}

	readyState { :self |
		<primitive: return _self.readyState;>
	}

	removeOscListener { :self :address :onMessage |
		<primitive: _self.removeOscListener(_address, _onMessage);>
		onMessage
	}

	reset { :self |
		<primitive: return _self.reset();>
	}

	sendOsc { :self :oscPacket |
		<primitive: return _self.sendOsc(_asRecord_1(_oscPacket));>
	}

	setControl { :self :index :value |
		self.sendOsc(OscMessage('/c_set', [index, value]))
	}

	status { :self |
		<primitive: return _self.status;>
	}

	useIoUgens { :self |
		<primitive: return _self.useIoUgens;>
	}

	useWebSocket { :self :address |
		<primitive: return sc.scSynthUseWebSocket(_self, _address);>
	}

}

+System {

	scSynth { :self |
		<primitive: return globalScSynth;>
	}

}

+[List, Ugen] {

	<! { :self :aUgen |
		(aUgen.isUgen & {
			aUgen.scUgen.numberOfChannels = 0
		}).if {
			self.multipleRootGraph(aUgen)
		} {
			FirstArg(self, aUgen)
		}
	}

	basicPlayAt { :self :systemTimeInSeconds |
		<primitive:
		globalScSynth.playUgenAt(
			_self,
			_busOffset_1(_self),
			-1,
			1,
			[],
			_systemTimeInSeconds
		);
		>
	}

	draw { :self |
		let scSynDefFileName = '/tmp/splDraw.scsyndef';
		self.writeScSynDefFile(
			'Anonymous',
			scSynDefFileName
		);
		system.systemCommand(
			'hsc3-dot',
			[
				'scsyndef-draw',
				scSynDefFileName
			]
		)
	}

	isOutputSignal { :self |
		<primitive: return sc.isOutputSignal(_self);>
	}

	kr { :aUgen |
		<primitive: return sc.kr(_aUgen);>
	}

	multipleRootGraph { :self :aUgen |
		<primitive: return sc.multipleRootGraph(_self, _aUgen);>
	}

	play { :self |
		self.playAt(system.systemTimeInSeconds)
	}

	playAt { :self :systemTimeInSeconds |
		self.isOutputSignal.if {
			let latency = 0.2; /* Preferences */
			self.basicPlayAt(systemTimeInSeconds + latency)
		} {
			'playAt: not ouput signal?'.error
		}
	}

	plot { :self :duration |
		let scSynDefFileName = '/tmp/splPlot.scsyndef';
		let numberOfChannels = self.isCollection.if {
			self.size
		} {
			1
		};
		self.writeScSynDefFile(
			'Anonymous',
			scSynDefFileName
		);
		system.systemCommand(
			'hsc3-plot',
			[
				'scsyndef',
				scSynDefFileName,
				numberOfChannels.asString,
				duration.asString
			]
		)
	}

	print { :self |
		<primitive: return sc.prettyPrintSyndefOf(_self);>
	}

	writeScSynDefFile { :self :scSynDefName :scSynDefFileName |
		let graphDef = scSynDefName.encodeUgenAt(self.busOffset, self);
		scSynDefFileName.writeBinaryFile(graphDef)
	}

}

+Block {

}

+Record {

	localControls { :self |
		<primitive: return _asRecord_1(sc.localControls(_self));>
	}

}

+Block {

	OverlapTextureList { :self :sustainTime :transitionTime :overlap |
		<primitive: return sc.OverlapTextureArray(_self, _sustainTime, _transitionTime, _overlap);>
	}

	OverlapTexture { :self :sustainTime :transitionTime :overlap |
		self.OverlapTextureList(sustainTime, transitionTime, overlap)
	}

	XFadeTexture { :self :sustainTime :transitionTime |
		<primitive: return sc.XFadeTexture(_self, _sustainTime, _transitionTime);>
	}

}

+String {

	SfAcquire { :self :numberOfChannels :channelIndices |
		<primitive: return sc.SfAcquire(_self, _numberOfChannels, _channelIndices);>
	}

	SfAcquire1 { :self :numberOfChannels :channelIndex |
		SfAcquire(self, numberOfChannels, [channelIndex]).first
	}

	SfAcquireMono { :self |
		SfAcquire(self, 1, [1]).first
	}

	SfAcquireStereo { :self |
		SfAcquire(self, 2, [1, 2])
	}

}

+List {

	asLocalBuf { :self |
		<primitive: return sc.asLocalBuf(_self);>
	}

	asLocalBufferList { :self |
		(self.depth ~= 3).if {
			'asLocalBufferList: not a matrix'.error
		} {
			self.collect(asLocalBuf:/1)
		}
	}

	LocalBuf { :self |
		<primitive: return sc.asLocalBuf(_self);>
	}

	/*
	Mix { :self |
		self.sum
	}
	*/

}

+Block {

	!^ { :self :anInteger |
		Splay(self ! anInteger)
	}

	!> { :self :anInteger |
		Mix(self ! anInteger)
	}

}
