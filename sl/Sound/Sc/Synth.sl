CcEvent : [Object] {

	v { :self |
		<primitive: return _self.v;>
	}

	w { :self |
		<primitive: return _self.w;>
	}

	x { :self |
		<primitive: return _self.x;>
	}

	y { :self |
		<primitive: return _self.y;>
	}

	z { :self |
		<primitive: return _self.z;>
	}

	o { :self |
		<primitive: return _self.o;>
	}

	rx { :self |
		<primitive: return _self.rx;>
	}

	ry { :self |
		<primitive: return _self.ry;>
	}

	p { :self |
		<primitive: return _self.p;>
	}

}

+SmallFloat {

	CcEvent { :self :anArray |
		<primitive: return new sc.CcEvent(_self, _anArray);>
	}

	KeyDown { :self | <primitive: return sc.KeyDown(_self);> }
	KeyTimbre { :self | <primitive: return sc.KeyTimbre(_self);> }
	KeyPressure { :self | <primitive: return sc.KeyPressure(_self);> }
	KeyVelocity { :self | <primitive: return sc.KeyVelocity(_self);> }
	KeyPitch { :self | <primitive: return sc.KeyPitch(_self);> }

	PenDown { :self | <primitive: return sc.PenDown(_self);> }
	PenX { :self | <primitive: return sc.PenX(_self);> }
	PenY { :self | <primitive: return sc.PenY(_self);> }
	PenZ { :self | <primitive: return sc.PenZ(_self);> }
	PenAngle { :self | <primitive: return sc.PenAngle(_self);> }
	PenRadius { :self | <primitive: return sc.PenRadius(_self);> }

	Voicer { :self :voiceProcedure |
		<primitive: return sc.Voicer(_self, _voiceProcedure);>
	}

}

Env : [Object] {

	asArray { :self |
		self.coordinateArrayForEnvGen
	}

	asEnvGen { :self :gate |
		EnvGen(gate, 1, 0, 1, 0, self.asArray)
	}

	asEnvGenWithDoneAction { :self :gate :doneAction |
		EnvGen(gate, 1, 0, 1, doneAction, self.asArray)
	}

	coordinateArrayForEnvGen { :self |
		<primitive: return sc.envCoord(_self);>
	}

}

LocalControl : [Object] {

	name { :self | <primitive: return _self.name> }
	index { :self | <primitive: return _self.index> }
	defaultValue { :self | <primitive: return _self.defaultValue> }
	operatingRate { :self | <primitive: return _self.operatingRate> }
	isTriggered { :self | <primitive: return _self.isTriggered> }

	pseudoSlotNameArray { :self |
		['name', 'index', 'defaultValue', 'operatingRate', 'isTriggered']
	}

}

ScSynthOptions : [Object] {

	blockSize { :self |
		<primitive: return _self.blockSize;>
	}

	hardwareBufferSize { :self |
		<primitive: return _self.hardwareBufferSize;>
	}

	numInputs { :self |
		<primitive: return _self.numInputs;>
	}

	numOutputs { :self |
		<primitive: return _self.numOutputs;>
	}

	pseudoSlotNameArray { :self |
		['hardwareBufferSize', 'blockSize', 'numInputs', 'numOutputs']
	}

}

ScSynth : [Object] {

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

ScUgen : [Object] {

	id { :self | <primitive: return _self.id> }
	inputArray { :self | <primitive: return _self.inputArray> }
	localControl { :self | <primitive: return _self.localControl> }
	mrg { :self | <primitive: return _self.mrg> }
	name { :self | <primitive: return _self.name> }
	numChan { :self | <primitive: return _self.numChan> }
	rate { :self | <primitive: return _self.rate> }
	specialIndex { :self | <primitive: return _self.specialIndex> }

	printString { :self |
		[
			self.name,
			'(',
			self.inputArray.collect(printString:/1).joinSeparatedBy(', ')
			,')'
		].join
	}

	pseudoSlotNameArray { :self |
		['name', 'numChan', 'rate', 'specialIndex', 'id', 'inputArray', 'mrg', 'localControl']
	}

}

Ugen : [Object, Number] {

	scUgen { :self | <primitive: return _self.scUgen> }
	port { :self | <primitive: return _self.port> }

	adaptToNumberAndApply { :self :aNumber :aProcedure |
		<primitive:
		return sl.applyGenericAt(
			sl.nameWithoutArity(_aProcedure.name),
			[_aNumber, _self],
			'Ugen'
		);
		>
	}

	adaptToCollectionAndApply { :self :aCollection :aProcedure:/2 |
		aCollection.collect { :each |
			aProcedure(each, self)
		}
	}

	printString { :self |
		[
			self.scUgen.printString,
			':',
			self.port.printString
		].join
	}

	pseudoSlotNameArray { :self |
		['scUgen', 'port']
	}

}

UgenGraph : [Object] {

	controlArray { :self |
		<primitive: return _self.controlArray>
	}

	constantArray { :self |
		<primitive: return _self.constantArray>
	}

	encode { :self |
		<primitive: return sc.graphEncodeSyndef(_self);>
	}

	name { :self |
		<primitive: return _self.name>
	}

	pseudoSlotNameArray { :self |
		['name', 'ugenArray', 'constantArray', 'controlArray']
	}

	ugenArray { :self |
		<primitive: return _self.ugenArray>
	}

}

+String {

	encodeUgen { :self :aUgen |
		<primitive: return sc.encodeUgen(_self, sc.wrapOut(0, _aUgen));>
	}

	ugenGraph { :self :aUgen |
		<primitive: return sc.makeUgenGraph(_self, sc.wrapOut(0, _aUgen));>
	}

}

+[Array, SmallFloat, Ugen] {

	<! { :self :aUgen |
		self.mrg(aUgen)
	}

	isOutputSignal { :self |
		<primitive: return sc.isOutputSignal(_self);>
	}

	kr { :aUgen |
		<primitive: return sc.kr(_aUgen);>
	}

	mrg { :self :aUgen |
		<primitive: return sc.mrg(_self, _aUgen);>
	}

	playUgenAt { :self :systemTimeInSeconds |
		<primitive:
		sc.scSynthEnsure(globalScSynth, function() {
			sc.playUgenAt(globalScSynth, _self, 1, _systemTimeInSeconds)
		});
		>
	}

	playUgen { :self |
		self.playUgenAt(nil)
	}

	printUgen { :aUgen |
		<primitive: return sc.prettyPrintSyndefOf(_aUgen);>
	}

}

+Procedure {

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

+StringDictionary {

	localControls { :self |
		<primitive: return sc.localControls(_self);>
	}

}

+Procedure {

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

+ [Array, SmallFloat, Ugen] {

	AudioIn { :channelNumber |
		In(1, NumOutputBuses() + channelNumber - 1)
	}

	AudioOut { :channelsArray |
		Out(0, channelsArray)
	}

	EnvBreakPoint { :breakPointArray :curves |
		| n = breakPointArray.size; |
		Env(
			Interval(1, n, 2).collect { :index | breakPointArray[index] },
			Interval(2, n - 1, 2).collect { :index | breakPointArray[index] }.differentiate,
			curves,
			nil,
			nil,
			0
		)
	}

	EqPan2 { :self :pos |
		Pan2(self, pos, 1)
	}

	ExpRange { :self :lo :hi |
		LinExp(self, -1, 1, lo, hi)
	}

	ImpulseSequencer { :self :trig |
		Sequencer(self, trig) * Trig(trig, SampleDur())
	}

	IRand { :self |
		IRand(0, self)
	}

	LinLin { :self :srclo :srchi :dstlo :dsthi |
		|
			mul = (dsthi - dstlo) / (srchi - srclo),
			add = dstlo - (mul * srclo);
		|
		MulAdd(self, mul, add)
	}

	Rand { :self |
		Rand(0, self)
	}

	Rand2 { :self |
		Rand(0 - self, self)
	}

	Range { :self :lo :hi |
		LinLin(self, -1, 1, lo, hi)
	}

	Sequencer { :self :trig |
		Demand(trig, 0, Dseq(inf, self))
	}

	Silent { :numChannels |
		if (numChannels == 1) { Dc(0) } { Dc(0) ! numChannels }
	}

	withOverlapEnvelope { :aUgen :sustainTime :transitionTime |
		| env amp |
		env := Env([0,1,1,0], [transitionTime,sustainTime,transitionTime], 'sin', nil, nil, 0);
		amp := EnvGen(1, 1, 0, 1, 2, env.asArray);
		Out(0, aUgen * amp)
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

+Procedure {

	!^ { :self :anInteger |
		Splay2(self ! anInteger)
	}

}
