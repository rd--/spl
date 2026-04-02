+SmallFloat {

	finiteAbelianGroupCount { :n |
		n.factorInteger
		.column(2)
		.partitionsP
		.product
		.asInteger
	}

	finiteGroupCount { :n |
		let a = system.oeisBFileData.at('A000001');
		let k = a.size;
		(n < k).if {
			a.at(n + 1)
		} {
			n.error('finiteGroupCount')
		}
	}

}

+@Collection {

	finiteAbelianGroupCount { :self |
		self.collect(finiteAbelianGroupCount:/1)
	}

	finiteGroupCount { :self |
		self.collect(finiteGroupCount:/1)
	}

}
