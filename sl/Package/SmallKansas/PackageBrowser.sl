(* Requires: 'SmallKansas-SmallKansas' 'System-Trait' *)

+SmallKansas  {

	PackageBrowser { :self |
		|(
			packageNames = system.packageDictionary.indicesSorted,
			methods = nil,
			selectedMethod = nil
		)|
		self.ColumnBrowser('Package Browser', 'text/plain', false, true, [1, 1, 3], nil) { :accepted |
			selectedMethod.definition := accepted
		} { :browser :path |
			path.size.caseOf([
				0 -> {
					browser.setStatus('');
					packageNames
				},
				1 -> {
					|(
						traits = system.packageTraits(path[1]),
						types = system.packageTypes(path[1]),
						implements = (traits ++ types).collect(qualifiedName:/1)
					)|
					browser.setStatus(implements.joinSeparatedBy(', '));
					methods := system.packageMethods(path[1]);
					methods.collect { :each |
						each.origin.qualifiedName
					}.withoutDuplicates.sort
				},
				2 -> {
					system.isTypeName(path[2]).if {
						browser.setStatus(system.typeTraits(path[2]).joinSeparatedBy(', '))
					} {
						browser.setStatus('')
					};
					methods.selectThenCollect { :each |
						each.origin.qualifiedName = path[2]
					} { :each |
						each.qualifiedName
					}.sort
				},
				3 -> {
					selectedMethod := methods.detect { :each |
						each.origin.qualifiedName = path[2] & {
							each.qualifiedName = path[3]
						}
					};
					browser.setStatus(selectedMethod.provenance);
					selectedMethod.definition
				}
			])
		}
	}

}

PackageBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.addFrame(smallKansas.PackageBrowser, event)
	}

}
