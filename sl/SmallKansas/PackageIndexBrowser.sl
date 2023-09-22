(* Requires: ColumnBrowser SmallKansas Trait *)

+SmallKansas  {

	PackageIndexBrowser { :self |
		|(
			packages = system.packageIndex.values,
			packageCategories = packages.collect(category:/1).withoutDuplicates.sort
		)|
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
					browser.setStatus('Loaded: ' ++ system.packageDictionary.includesIndex(path[2]).asString);
					system.packageIndex[path[2]].text
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
