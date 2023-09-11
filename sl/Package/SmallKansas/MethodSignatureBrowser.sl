+Array {

	MethodSignatureBrowser { :self :withFilter |
		| selectedMethod = nil; |
		ColumnBrowser('Method Signature Browser', 'text/plain', withFilter, true, [1], nil) { :accepted |
			selectedMethod.definition := accepted
		} { :browser :path |
			path.size.caseOf([
				0 -> {
					self
				},
				1 -> {
					selectedMethod := system.methodLookupAtSignature(path[1]);
					browser.setStatus(selectedMethod.origin.typeOf);
					selectedMethod.definition
				}
			])
		}
	}

}

+System {

	MethodSignatureBrowser { :self |
		MethodSignatureBrowser(
			self.allMethods.collect(signature:/1).Set.Array.sorted,
			true
		)
	}

}

+SmallKansas {

	MethodSignatureBrowser { :self :event |
		self.addFrame(system.MethodSignatureBrowser, event)
	}

}
