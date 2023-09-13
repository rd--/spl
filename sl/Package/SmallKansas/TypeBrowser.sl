TypeBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.addFrame(system.TypeBrowser, event)
	}

}

+System {

	TypeBrowser { :self |
		|(
			typeNames = self.typeDictionary.indicesSorted,
			selectedMethod = nil
		)|
		ColumnBrowser('Type Browser', 'text/plain', false, true, [1, 3], nil) { :accepted |
			selectedMethod.definition := accepted
		} { :browser :path |
			path.size.caseOf([
				0 -> {
					browser.setStatus('');
					typeNames
				},
				1 -> {
					browser.setStatus(self.typeTraits(path[1]).joinSeparatedBy(', '));
					self.typeDictionary[path[1]].methodDictionary.indicesSorted
				},
				2 -> {
					selectedMethod := self.typeDictionary[path[1]].methodDictionary[path[2]];
					browser.setStatus(selectedMethod.provenance);
					selectedMethod.definition
				}
			])
		}
	}

}
