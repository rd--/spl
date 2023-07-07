@MidiMap {

	do { :self :aProcedure |
		<primitive: return _self.forEach(_aProcedure);>
	}

	ports { :self |
		<primitive: return Array.from(_self.values());>
	}

	pseudoSlotNameArray { :self |
		['size', 'ports']
	}

	size { :self |
		<primitive: return _self.size;>
	}

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

	pseudoSlotNameArray { :self |
		['type', 'id', 'manufacturer', 'name', 'version', 'state', 'connection']
	}

}

MIDIAccess : [Object, EventTarget] {

	inputs { :self | <primitive: return _self.inputs;> } (* Read only *)
	outputs { :self | <primitive: return _self.outputs;> } (* Read only *)
	sysexEnabled { :self | <primitive: return _self.sysexEnabled;> } (* Read only *)

	onstatechange { :self :aProcedure |
		<primitive: return _self.onstatechange = _aProcedure;>
	}

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

	pseudoSlotNameArray { :self |
		['inputs', 'outputs', 'sysexEnabled']
	}

}

MIDIConnectionEvent : [Object, Event] {

	port { :self |
		<primitive: return _self.port;>
	}

}

MIDIInput : [Object, EventTarget, MidiPort] {

	onmidimessage { :self :aProcedure |
		<primitive: return _self.onmidimessage = _aProcedure;>
	}

}

MIDIInputMap : [Object, MidiMap] {

}

MIDIMessageEvent : [Object, Event] {

	data { :self |
		<primitive: return _self.data;>
	}

}

MIDIOutputMap : [Object, MidiMap] {

}

MIDIOutput : [Object, EventTarget, MidiPort] {

}
