/* Requires: ColumnBrowser SmallKansas */

+SmallKansas {

	TraitBrowser { :self |
		let traitNames = system.traitDictionary.indicesSorted;
		let selectedMethod = nil;
		self.ColumnBrowser('Trait Browser', 'text/plain', false, true, [1, 3], nil) { :accepted |
			selectedMethod.definition := accepted
		} { :browser :path |
			path.size.caseOf([
				0 -> {
					browser.setStatus('');
					traitNames
				},
				1 -> {
					browser.setStatus(system.traitTypes(path[1]).join(', '));
					system.traitDictionary[path[1]].methodDictionary.indicesSorted
				},
				2 -> {
					selectedMethod := system.traitDictionary[path[1]].methodDictionary[path[2]];
					browser.setStatus(selectedMethod.provenance);
					selectedMethod.definition
				}
			])
		}
	}

}

TraitBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.addFrame(smallKansas.TraitBrowser, event)
	}

}
