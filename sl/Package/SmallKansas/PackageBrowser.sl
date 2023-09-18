(* Requires: ColumnBrowser SmallKansas Trait *)

+SmallKansas  {

	PackageBrowser { :self |
		|(
			packages = system.packageDictionary.values,
			packageCategories = packages.collect(category:/1).withoutDuplicates.sort,
			methods = nil,
			selectedMethod = nil
		)|
		self.ColumnBrowser('Package Browser', 'text/plain', false, true, [1, 1, 1, 3], nil) { :accepted |
			selectedMethod.definition := accepted
		} { :browser :path |
			path.size.caseOf([
				0 -> {
					browser.setStatus('');
					packageCategories
				},
				1 -> {
					browser.setStatus('');
					packages.selectThenCollect { :each |
						each.category = path[1]
					} { :each |
						each.name
					}.sort
				},
				2 -> {
					|(
						traits = system.packageTraits(path[2]),
						types = system.packageTypes(path[2]),
						implements = (traits ++ types).collect(qualifiedName:/1)
					)|
					browser.setStatus(implements.joinSeparatedBy(', '));
					methods := system.packageMethods(path[2]);
					methods.collect { :each |
						each.origin.qualifiedName
					}.withoutDuplicates.sort
				},
				3 -> {
					system.isTypeName(path[3]).if {
						browser.setStatus(system.typeTraits(path[3]).joinSeparatedBy(', '))
					} {
						browser.setStatus('')
					};
					methods.selectThenCollect { :each |
						each.origin.qualifiedName = path[3]
					} { :each |
						each.qualifiedName
					}.sort
				},
				4 -> {
					selectedMethod := methods.detect { :each |
						each.origin.qualifiedName = path[3] & {
							each.qualifiedName = path[4]
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
