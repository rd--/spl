(* Requires: Ugen *)

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
		system.preference('ScSynth.Outputs.Main.NumberOfChannels', 2)
	}

	mainOrientation { :self |
		system.preference('ScSynth.Outputs.Main.FrontIsVertex', false).if {
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

	pseudoSlotNameArray { :self |
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
		<primitive: return _self.sendOsc(_oscPacket);>
	}

	setControl { :self :index :value |
		self.sendOsc(
			(
				address: '/c_set',
				args: [
					(type: 'i', value: index),
					(type: 'f', value: value)
				]
			)
		)
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

+[Array, SmallFloat, Ugen] {

	<! { :self :aUgen |
		self.multipleRootGraph(aUgen)
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

	playUgenAt { :self :systemTimeInSeconds |
		<primitive: globalScSynth.playUgenAt(_self, _busOffset_1(_self), -1, 1, [], _systemTimeInSeconds);>
	}

	playUgen { :self |
		self.playUgenAt(nil)
	}

	printUgenGraph { :aUgen |
		<primitive: return sc.prettyPrintSyndefOf(_aUgen);>
	}

}

+Block {

	play { :self:/0 |
		self:/0.playAt(nil)
	}

	playAt { :self:/0 :systemTimeInSeconds |
		| answer = self(); |
		answer.isOutputSignal.if {
			answer.playUgenAt(systemTimeInSeconds)
		} {
			'Block>>playAt: answer not ouput signal?'.error
		}
	}

}

+Record {

	localControls { :self |
		<primitive: return sc.localControls(_self);>
	}

}

+Block {

	OverlapTextureArray { :self :sustainTime :transitionTime :overlap |
		<primitive: return sc.OverlapTextureArray(_self, _sustainTime, _transitionTime, _overlap);>
	}

	OverlapTexture { :self :sustainTime :transitionTime :overlap |
		self.OverlapTextureArray(sustainTime, transitionTime, overlap)
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

+Array {

	asLocalBuf { :self |
		<primitive: return sc.asLocalBuf(_self);>
	}

	asLocalBufferArray { :self |
		(self.rank ~= 2).if {
			'asLocalBufferArray: not a matrix'.error
		} {
			self.collect(asLocalBuf:/1)
		}
	}

	LocalBuf { :self |
		<primitive: return sc.asLocalBuf(_self);>
	}

(*
	Mix { :self |
		self.sum
	}
*)

}

+Block {

	!^ { :self :anInteger |
		Splay(self ! anInteger)
	}

	!> { :self :anInteger |
		Mix(self ! anInteger)
	}

}
