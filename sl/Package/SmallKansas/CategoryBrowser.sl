CategoryBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.addFrame(system.CategoryBrowser, event)
	}

}

+System {

	CategoryBrowser { :self |
		|(
			typeNames = self.typeDictionary.indicesSorted,
			typeCategoryDictionary = self.categoryDictionary.domain('type'),
			typeCategoryNames = typeCategoryDictionary.indicesSorted,
			methodCategoryDictionary = self.categoryDictionary.domain('method'),
			completeMethodSet = nil,
			methodSet = nil,
			selectedMethod = nil
		)|
		ColumnBrowser('Category Browser', 'text/plain', false, true, [1, 1, 1, 3], nil) { :accepted |
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
						self.isTypeName(each)
					}.sorted
				},
				2 -> {
					browser.setStatus(self.typeTraits(path[2]).joinSeparatedBy(', '));
					completeMethodSet := self.typeMethodDictionary(path[2]).values.select { :each |
						each.origin.name ~= 'Object'
					};
					completeMethodSet.collect { :each |
						self.categoryDictionary.categoryOf('method', each.name)
					}.withoutDuplicates.sort
				},
				3 -> {
					browser.setStatus('');
					methodSet := completeMethodSet.select { :each |
						self.categoryDictionary.categoryOf('method', each.name) = path[3]
					};
					methodSet.collect(qualifiedName:/1).Array.sorted
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
