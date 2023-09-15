(* Requires: MIDIAccess SmallKansas-ColumnBrowser SmallKansas-SmallKansas *)

+SmallKansas {

	MidiPortBrowser { :self :midiAccess |
		self.ColumnBrowser('Midi Port Browser', 'text/plain', false, false, [1, 1, 3], nil, nil) { :browser :path |
			path.size.caseOf([
				0 -> {
					['input', 'output']
				},
				1 -> {
					midiAccess.ports(path[1]).collect(manufacturer:/1).withoutDuplicates
				},
				2 -> {
					midiAccess.ports(path[1]).select { :port |
						port.manufacturer = path[2]
					}.collect(name:/1)
				},
				3 -> {
					midiAccess.portByName(path[1], path[2], path[3]).asString
				}
			])
		}
	}

}

MidiPortBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.midiAccess.then { :midiAccess |
			smallKansas.addFrame(smallKansas.MidiPortBrowser(midiAccess), event)
		}
	}

}
