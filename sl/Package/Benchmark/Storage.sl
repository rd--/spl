StorageBenchark : [Object] { | count |

	benchmark { :self |
		| random = SomRandom(); |
		self.count := 0;
		self.buildTreeDepthWith(7, random);
		self.count
	}

	buildTreeDepthWith { :self :depth :random |
		self.count +:= 1;
		(depth = 1).if {
			Array(random.next % 10 + 1)
		} {
			Array(4).fillWith { :unusedIndex |
				self.buildTreeDepthWith(depth - 1, random)
			}
		}
	}

}

+Void {

	StorageBenchark {
		newStorageBenchark().benchmark
	}

}
