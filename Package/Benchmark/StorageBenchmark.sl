StorageBenchark : [Object] {

	| count |

	benchmark { :self |
		let random = SomRandom();
		self.count := 0;
		self.buildTreeDepthWith(7, random);
		self.count
	}

	buildTreeDepthWith { :self :depth :random |
		self.count := self.count + 1;
		(depth = 1).if {
			List(random.next % 10 + 1)
		} {
			{
				self.buildTreeDepthWith(depth - 1, random)
			}.array([4])
		}
	}

}

+Void {

	StorageBenchark {
		newStorageBenchark().benchmark
	}

}
