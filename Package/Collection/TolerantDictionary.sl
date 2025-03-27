TolerantDictionary : [Object, Iterable, Indexable, Collection, Extensible, Removable, Dictionary] { | keys values |

	comparator { :unused |
		~
	}

}

+Void {

	TolerantDictionary {
		newTolerantDictionary().initializeSlots([], [])
	}

}

+List {

	asTolerantDictionary { :self |
		let d = TolerantDictionary();
		d.keys := self.collect(key:/1);
		d.values := self.collect(value:/1);
		d
	}

}
