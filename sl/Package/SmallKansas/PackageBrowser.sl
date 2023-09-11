+System  {

	PackageBrowser { :self |
		| packageNames = self.packageDictionary.indicesSorted, methods = nil; |
		ColumnBrowser('Package Browser', 'text/plain', false, true, [1, 1, 3], nil, nil) { :browser :path |
			path.size.caseOf([
				0 -> {
					browser.setStatus('');
					packageNames
				},
				1 -> {
					|(
						traits = self.packageTraits(path[1]),
						types = self.packageTypes(path[1]),
						implements = (traits ++ types).collect(qualifiedName:/1)
					)|
					browser.setStatus(implements.joinSeparatedBy(', '));
					methods := self.packageMethods(path[1]);
					methods.collect { :each |
						each.origin.qualifiedName
					}.withoutDuplicates.sort
				},
				2 -> {
					self.isTypeName(path[2]).if {
						browser.setStatus(self.typeTraits(path[2]).joinSeparatedBy(', '))
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
					browser.setStatus('');
					methods.detect { :each |
						each.origin.qualifiedName = path[2] & {
							each.qualifiedName = path[3]
						}
					}.definition
				}
			])
		}
	}

}

+SmallKansas {

	PackageBrowser { :self :event |
		self.addFrame(system.PackageBrowser, event)
	}

}
