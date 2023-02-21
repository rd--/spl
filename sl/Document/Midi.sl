@MidiMap {

	do { :self :aProcedure | <primitive: return _self.forEach(_aProcedure);> }
	size { :self | <primitive: return _self.size;> }


	ports { :self | <primitive: return Array.from(_self.values());> }

}

@MidiPort {

	connection { :self | <primitive: return _self.connection;> }
	id { :self | <primitive: return _self.id;> }
	manufacturer { :self | <primitive: return _self.manufacturer;> }
	name { :self | <primitive: return _self.name;> }
	state { :self | <primitive: return _self.state;> }
	type { :self | <primitive: return _self.type;> }
	version { :self | <primitive: return _self.version;> }

	asDictionary { :self |
		(
			type: self.type,
			id: self.id,
			manufacturer: self.manufacturer,
			name: self.name,
			version: self.version,
			state: self.state,
			connection: self.connection
		)
	}

	printString { :self |
		self.asDictionary.json(nil, '	')
	}


}

MIDIAccess : [Object, EventTarget] {

	inputs { :self | <primitive: return _self.inputs;> }
	onstatechange { :self :aProcedure | <primitive: return _self.onstatechange = _aProcedure;> }
	outputs { :self | <primitive: return _self.outputs;> }
	sysexEnabled { :self | <primitive: return _self.sysexEnabled;> }


	portByName { :self :type :manufacturer :name |
		self.ports(type).detect { :port |
			port.manufacturer = manufacturer & {
				port.name = name
			}
		}
	}

	ports { :self :type |
		(type = 'input').if {
			self.inputs.ports
		} {
			self.outputs.ports
		}
	}

}

MIDIConnectionEvent : [Object, Event] {

	port { :self | <primitive: return _self.port;> }

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

MIDIOutput : [Object, EventTarget, MidiPort] {

}
