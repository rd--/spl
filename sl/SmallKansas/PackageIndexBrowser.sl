{- Requires: ColumnBrowser SmallKansas Trait -}

+SmallKansas  {

	PackageIndexBrowser { :self |
		let packages = system.packageDictionary.values;
		let packageCategories = packages.collect(category:/1).copyWithoutDuplicates.sort;
		self.ColumnBrowser('Package Index Browser', 'text/plain', false, true, [1, 3], nil, nil) { :browser :path |
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
					let package = system.packageDictionary[path[2]];
					browser.setStatus('Loaded: ' ++ package.isLoaded.asString);
					package.text
				}
			])
		}
	}

}

PackageIndexBrowser : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		smallKansas.addFrame(smallKansas.PackageIndexBrowser, event)
	}

}
