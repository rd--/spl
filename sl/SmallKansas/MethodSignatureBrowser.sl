+SmallKansas {

	MethodSignatureBrowser { :self :methods :withFilter |
		| selectedMethod = nil; |
		self.ColumnBrowser('Method Signature Browser', 'text/plain', withFilter, true, [1], nil) { :accepted |
			selectedMethod.definition := accepted
		} { :browser :path |
			path.size.caseOf([
				0 -> {
					methods
				},
				1 -> {
					selectedMethod := system.methodLookupAtSignature(path[1]);
					browser.setStatus(selectedMethod.provenance);
					selectedMethod.definition
				}
			])
		}
	}

	MethodSignatureBrowser { :self |
		self.MethodSignatureBrowser(
			system.allMethods.collect(signature:/1).copyWithoutDuplicates.sort,
			true
		)
	}

}

MethodSignatureBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.addFrame(smallKansas.MethodSignatureBrowser, event)
	}

}
