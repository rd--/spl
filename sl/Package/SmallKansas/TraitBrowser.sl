+System {

	TraitBrowser { :self |
		| traitNames = self.traitDictionary.indicesSorted; |
		ColumnBrowser('Trait Browser', 'text/plain', false, true, [1, 3], nil, nil) { :browser :path |
			path.size.caseOf([
				0 -> {
					browser.setStatus('');
					traitNames
				},
				1 -> {
					browser.setStatus(self.traitTypes(path[1]).joinSeparatedBy(', '));
					self.traitDictionary[path[1]].methodDictionary.indicesSorted
				},
				2 -> {
					self.traitDictionary[path[1]].methodDictionary[path[2]].definition
				}
			])
		}
	}

}

TraitBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.addFrame(system.TraitBrowser, event)
	}

}
