TowersDisk : [Object] { | size next |

}

+SmallFloat {

	TowersDisk { :self |
		newTowersDisk().initializeSlots(self, nil)
	}

}

TowersBenchmark : [Object] { | piles movesDone |

	pushDiskOnPile { :self :disk :pile |
		let top = self.piles[pile];
		(
			top.notNil & {
				disk.size >= top.size
			}
		).ifTrue {
			'Cannot put a big disk on a smaller one'.error
		};
		disk.next := top;
		self.piles[pile] := disk
	}

	popDiskFrom { :self :pile |
		let top = self.piles[pile];
		top.isNil.ifTrue {
			'Attempting to remove a disk from an empty pile'.error
		};
		self.piles[pile] := top.next;
		top.next := nil;
		top
	}

	moveTopDiskFromTo { :self :fromPile :toPile |
		self.pushDiskOnPile((self.popDiskFrom(fromPile)), toPile);
		self.movesDone := self.movesDone + 1
	}

	buildTowerAtDisks { :self :pile :disks |
		disks.downToDo(0) { :i |
			self.pushDiskOnPile(TowersDisk(i), pile)
		}
	}

	moveDisksFromTo { :self :disks :fromPile :toPile |
		(disks = 1).if {
			self.moveTopDiskFromTo(fromPile, toPile)
		} {
			let otherPile = 6 - fromPile - toPile;
			self.moveDisksFromTo(disks - 1, fromPile, otherPile);
			self.moveTopDiskFromTo(fromPile, toPile);
			self.moveDisksFromTo(disks - 1, otherPile, toPile)
		}
	}

	benchmark { :self |
		self.piles := Array(3);
		self.buildTowerAtDisks(1, 13);
		self.movesDone := 0;
		self.moveDisksFromTo(13, 1, 2);
		self.movesDone
	}

	verifyResult { :self :result |
		result = 8191
	}

}

+Void {

	TowersBenchmark {
		newTowersBenchmark().benchmark
	}

}
