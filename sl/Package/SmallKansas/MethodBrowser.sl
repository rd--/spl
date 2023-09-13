+System {

	MethodBrowser { :self |
		|(
			methodNames = self.allMethods.collect(qualifiedName:/1).Set.Array.sorted,
			selectedMethod = nil
		)|
		ColumnBrowser('Method Browser', 'text/plain', true, true, [3, 1], nil) { :accepted |
			selectedMethod.definition := accepted
		} { :browser :path |
			path.size.caseOf([
				0 -> {
					methodNames
				},
				1 -> {
					self.methodTraits(path[1]) ++ self.methodTypes(path[1])
				},
				2 -> {
					browser.setStatus(
						self.isTypeName(path[2]).if {
							'Type'
						} {
							'Trait'
						}
					);
					selectedMethod := self.traitOrType(path[2]).methodDictionary[path[1]];
					selectedMethod.definition
				}
			])
		}
	}

}

MethodBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.addFrame(system.MethodBrowser, event)
	}

}
