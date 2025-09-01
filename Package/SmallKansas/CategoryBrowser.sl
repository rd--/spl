/* Requires: ColumnBrowser Method SmallKansas */

CategoryBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.addFrame(smallKansas.CategoryBrowser, event)
	}

}

+SmallKansas {

	CategoryBrowser { :self |
		let typeNames = system.typeDictionary.indicesSorted;
		let typeCategoryDictionary = system.categoryDictionary.domain('type');
		let typeCategoryNames = typeCategoryDictionary.indicesSorted;
		let methodCategoryDictionary = system.categoryDictionary.domain('method');
		let completeMethodSet = nil;
		let methodSet = nil;
		let selectedMethod = nil;
		self.ColumnBrowser('Category Browser', 'text/plain', false, true, [1, 1, 1, 3], nil) { :accepted |
			selectedMethod.definition := accepted
		} { :browser :path |
			path.size.caseOf([
				0 -> {
					browser.setStatus('');
					typeCategoryNames
				},
				1 -> {
					browser.setStatus('');
					typeCategoryDictionary[path[1]].select { :each |
						system.isTypeName(each)
					}.sorted
				},
				2 -> {
					browser.setStatus(system.typeTraits(path[2]).commaSeparated);
					completeMethodSet := system.typeMethodDictionary(path[2]).values.select { :each |
						each.origin.name != 'Object'
					};
					completeMethodSet.collect { :each |
						system.categoryDictionary.categoryOf('method', each.name)
					}.copyWithoutIdenticalElements.sort
				},
				3 -> {
					browser.setStatus('');
					methodSet := completeMethodSet.select { :each |
						system.categoryDictionary.categoryOf('method', each.name) = path[3]
					};
					methodSet.collect(qualifiedName:/1).asList.sorted
				},
				4 -> {
					selectedMethod := methodSet.detect { :each |
						each.qualifiedName = path[4]
					};
					browser.setStatus(selectedMethod.provenance);
					selectedMethod.definition
				}
			])
		}
	}

}
