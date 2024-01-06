(* Requires: ColumnBrowser SmallKansas *)

+SmallKansas {

	MethodBrowser { :self |
		let methodNames = system.allMethods.collect(qualifiedName:/1).copyWithoutDuplicates.sort;
		let selectedMethod = nil;
		self.ColumnBrowser('Method Browser', 'text/plain', true, true, [3, 1], nil) { :accepted |
			selectedMethod.definition := accepted
		} { :browser :path |
			path.size.caseOf([
				0 -> {
					methodNames
				},
				1 -> {
					system.methodTraits(path[1]) ++ system.methodTypes(path[1])
				},
				2 -> {
					browser.setStatus(
						system.isTypeName(path[2]).if {
							'Type'
						} {
							'Trait'
						}
					);
					selectedMethod := system.traitOrType(path[2]).methodDictionary[path[1]];
					selectedMethod.definition
				}
			])
		}
	}

}

MethodBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.addFrame(smallKansas.MethodBrowser, event)
	}

}
