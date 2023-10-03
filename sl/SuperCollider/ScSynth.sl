(* Requires: Ugen *)

ScSynth! : [Object] {

	addOscListener { :self :address :onMessage |
		<primitive: sc.scSynthAddOscListener(_self, _address, _onMessage);>
		onMessage
	}

	boot { :self |
		<primitive: return _self.boot();>
	}

	isAlive { :self |
		<primitive: return _self.isAlive;>
	}

	isStarting { :self |
		<primitive: return _self.isStarting;>
	}

	hasIoUgens { :self |
		<primitive: return _self.hasIoUgens;>
	}

	langPort { :self |
		<primitive: return _self.langPort;>
	}

	options { :self |
		<primitive: return _self.options;>
	}

	oscListeners { :self |
		<primitive: return _self.oscListeners;>
	}

	pseudoSlotNameArray { :self |
		['options', 'oscListeners', 'isAlive', 'isStarting', 'hasIoUgens', 'synthPort', 'langPort', 'status']
	}

	removeOscListener { :self :address :onMessage |
		<primitive: sc.scSynthRemoveOscListener(_self, _address, _onMessage);>
		onMessage
	}

	reset { :self |
		<primitive: return sc.resetScSynth(_self);>
	}

	sendOsc { :self :oscPacket |
		<primitive: return _self.sendOsc(_oscPacket);>
	}

	status { :self |
		<primitive: return _self.status;>
	}

	synthPort { :self |
		<primitive: return _self.synthPort;>
	}

}

+System {

	defaultScSynth { :self |
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
		<primitive:
		sc.scSynthEnsure(globalScSynth, function() {
			sc.playUgenAt(globalScSynth, _self, -1, 1, [], _systemTimeInSeconds)
		});
		>
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
		answer.isOutputSignal.ifTrue {
			answer.playUgenAt(systemTimeInSeconds)
		}
	}

}

+Record {

	localControls { :self |
		<primitive: return sc.localControls(_self);>
	}

}

+Block {

	OverlapTexture { :self :sustainTime :transitionTime :overlap |
		<primitive: return sc.OverlapTexture(_self, _sustainTime, _transitionTime, _overlap);>
	}

	XFadeTexture { :self :sustainTime :transitionTime |
		<primitive: return sc.XFadeTexture(_self, _sustainTime, _transitionTime);>
	}

}

+String {

	SfAcquire { :self :numberOfChannels :channelSelector |
		<primitive: return sc.SfAcquire(_self, _numberOfChannels, _channelSelector);>
	}

}

+Array {

	asLocalBuf { :self |
		<primitive: return sc.asLocalBuf(_self);>
	}

	LocalBuf { :self |
		<primitive: return sc.asLocalBuf(_self);>
	}

	Mix { :self |
		self.sum
	}

}

+Block {

	!^ { :self :anInteger |
		Splay2(self ! anInteger)
	}

}
