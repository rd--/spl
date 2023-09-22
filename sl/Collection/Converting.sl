(* Requires: Bag *)

+@Collection {

	asArray { :self |
		self.Array
	}

	asBag { :self |
		self.Bag
	}

}

+Array {

	asArray { :self |
		self
	}

}

+Bag {

	asBag { :self |
		self
	}

	asSet { :self |
		self.contents.keys.asSet
	}

}

+Map {

	asMap { :self |
		self
	}

}
