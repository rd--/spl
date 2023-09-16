(* {"requires": ["ColumnBrowser", "SmallKansas"]} *)

TypeBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.addFrame(smallKansas.TypeBrowser, event)
	}

}

+SmallKansas {

	TypeBrowser { :self |
		|(
			typeNames = system.typeDictionary.indicesSorted,
			selectedMethod = nil
		)|
		self.ColumnBrowser('Type Browser', 'text/plain', false, true, [1, 3], nil) { :accepted |
			selectedMethod.definition := accepted
		} { :browser :path |
			path.size.caseOf([
				0 -> {
					browser.setStatus('');
					typeNames
				},
				1 -> {
					browser.setStatus(system.typeTraits(path[1]).joinSeparatedBy(', '));
					system.typeDictionary[path[1]].methodDictionary.indicesSorted
				},
				2 -> {
					selectedMethod := system.typeDictionary[path[1]].methodDictionary[path[2]];
					browser.setStatus(selectedMethod.provenance);
					selectedMethod.definition
				}
			])
		}
	}

}
