+System {

	SystemBrowser { :self |
		|(
			typeNames = self.typeDictionary.indicesSorted,
			methodSet = nil,
			selectedMethod = nil
		)|
		ColumnBrowser('System Browser', 'text/plain', false, true, [1, 3], nil) { :accepted |
			selectedMethod.definition := accepted
		} { :browser :path |
			path.size.caseOf([
				0 -> {
					browser.setStatus('');
					typeNames
				},
				1 -> {
					browser.setStatus(self.typeTraits(path[1]).joinSeparatedBy(', '));
					methodSet := self.typeMethodDictionary(path[1]).values.select { :each |
						each.origin.name ~= 'Object'
					};
					methodSet.collect(qualifiedName:/1).Array.sorted
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
		smallKansas.addFrame(system.SystemBrowser, event)
	}

}
