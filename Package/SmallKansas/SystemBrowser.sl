/* Requires: ColumnBrowser SmallKansas */

+SmallKansas {

	SystemBrowser { :self |
		let typeNames = system.typeDictionary.indicesSorted;
		let methodSet = nil;
		let selectedMethod = nil;
		self.ColumnBrowser('System Browser', 'text/plain', false, true, [1, 3], nil) { :accepted |
			selectedMethod.definition := accepted
		} { :browser :path |
			path.size.caseOf([
				0 -> {
					browser.setStatus('');
					typeNames
				},
				1 -> {
					browser.setStatus(system.typeTraits(path[1]).commaSeparated);
					methodSet := system.typeMethodDictionary(path[1]).values.select { :each |
						each.origin.name ~= 'Object'
					};
					methodSet.collect(qualifiedName:/1).asList.sorted
				},
				2 -> {
					selectedMethod := methodSet.detect { :each |
						each.qualifiedName = path[2]
					};
					browser.setStatus(selectedMethod.provenance);
					selectedMethod.definition
				}
			])
		}
	}

}

SystemBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.addFrame(smallKansas.SystemBrowser, event)
	}

}
