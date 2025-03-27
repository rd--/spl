EqualityDictionary : [Object, Iterable, Indexable, Collection, Extensible, Removable, Dictionary] { | keys values |

	comparator { :unused |
		=
	}

}

+Void {

	EqualityDictionary {
		newEqualityDictionary().initializeSlots([], [])
	}

}

+List {

	asEqualityDictionary { :self |
		let d = EqualityDictionary();
		d.keys := self.collect(key:/1);
		d.values := self.collect(value:/1);
		d
	}

}
