@MidiMap {

	do { :self :aProcedure | <primitive: return _self.forEach(_aProcedure);> }
	size { :self | <primitive: return _self.size;> }

}

@MidiPort {

	connection { :self | <primitive: return _self.connection;> }
	id { :self | <primitive: return _self.id;> }
	manufacturer { :self | <primitive: return _self.manufacturer;> }
	name { :self | <primitive: return _self.name;> }
	state { :self | <primitive: return _self.state;> }
	type { :self | <primitive: return _self.type;> }
	version { :self | <primitive: return _self.version;> }

	postLine { :self |
		[
			self.type, self.id, self.manufacturer, self.name, self.version
		].joinSeparatedBy(', ').postLine
	}

}

MIDIAccess : [Object, EventTarget] {

	inputs { :self | <primitive: return _self.inputs;> }
	outputs { :self | <primitive: return _self.outputs;> }
	sysexEnabled { :self | <primitive: return _self.sysexEnabled;> }

}

MIDIInput : [Object, EventTarget, MidiPort] {

	onmidimessage { :self :aProcedure | <primitive: return _self.onmidimessage = _aProcedure;> }

}

MIDIInputMap : [Object, MidiMap] {

}

MIDIMessageEvent : [Object, Event] {

	data { :self | <primitive: return _self.data;> }

}

MIDIOutputMap : [Object, MidiMap] {

}


