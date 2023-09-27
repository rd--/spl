(* Requires: Menu SmallKansas *)

+SmallKansas {

	WorldMenu { :self :isTransient :event |
		self.menu('World Menu', self.worldMenuEntries, isTransient, event)
	}

	worldMenuEntries { :self |
		|(
			static = [
				MenuItem('Font Menu', nil) { :event |
					self.fontMenuOn(self, false, event)
				},
				MenuItem('Font Size Menu', nil) { :event |
					self.fontSizeMenuOn(self, false, event)
				}
			],
			dynamic = system.smallKansans.collect { :each |
				MenuItem(each.name.pascalCaseToWords, nil) { :event |
					each.instanceOf.openIn(self, event)
				}
			}
		)|
		(static ++ dynamic).sort
	}

}
