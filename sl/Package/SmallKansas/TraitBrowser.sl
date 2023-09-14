+System {

	TraitBrowser { :self |
		|(
			traitNames = self.traitDictionary.indicesSorted,
			selectedMethod = nil
		)|
		ColumnBrowser('Trait Browser', 'text/plain', false, true, [1, 3], nil) { :accepted |
			selectedMethod.definition := accepted
		} { :browser :path |
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
					selectedMethod := self.traitDictionary[path[1]].methodDictionary[path[2]];
					browser.setStatus(selectedMethod.provenance);
					selectedMethod.definition
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
