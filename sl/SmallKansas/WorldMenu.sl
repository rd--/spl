(* Requires: Menu SmallKansas *)

+SmallKansas {

	WorldMenu { :self :isTransient :event |
		self.menu('World Menu', self.worldMenuEntries, isTransient, event)
	}

	worldMenuEntries { :self |
		let static = [
			MenuItem('Font Menu', nil) { :event |
				self.fontMenuOn(self, false, event)
			},
			MenuItem('Font Size Menu', nil) { :event |
				self.fontSizeMenuOn(self, false, event)
			}
		];
		let dynamic = system.smallKansans.collect { :each |
			MenuItem(each.name.pascalCaseToWords, nil) { :event |
				each.instanceOf.openIn(self, event)
			}
		};
		(static ++ dynamic).sort
	}

}
