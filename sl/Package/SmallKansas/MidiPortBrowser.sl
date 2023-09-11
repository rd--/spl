+SmallKansas {

	MidiPortBrowser { :self |
		ColumnBrowser('Midi Port Browser', 'text/plain', false, false, [1, 1, 3], nil, nil) { :browser :path |
			path.size.caseOf([
				0 -> {
					['input', 'output']
				},
				1 -> {
					self.midiAccess.ports(path[1]).collect(manufacturer:/1).Set.Array
				},
				2 -> {
					self.midiAccess.ports(path[1]).select { :port |
						port.manufacturer = path[2]
					}.collect(name:/1)
				},
				3 -> {
					self.midiAccess.portByName(path[1], path[2], path[3]).asString
				}
			])
		}
	}

}
