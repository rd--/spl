+SmallFloat {

	finiteAbelianGroupCount { :n |
		n.factorInteger
		.column(2)
		.partitionsP
		.product
		.asInteger
	}

	finiteGroupCount { :n |
		let t = system.oeisSequenceData.at('A000001');
		let k = t.size;
		(n < k).if {
			t.at(n + 1).at(2)
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
