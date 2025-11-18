+[List, Range, String] {

	chunksOfFrom { :self :chunkSize :startingAt |
		let chunkCount = (self.size - startingAt + 1 / chunkSize).ceiling;
		0.to(chunkCount - 1).collect { :i |
			let startIndex = i * chunkSize + startingAt;
			let stopIndex = (startIndex + chunkSize - 1).min(self.size);
			self.copyFromTo(startIndex, stopIndex)
		}
	}

	chunksOf { :self :chunkSize |
		self.chunksOfFrom(chunkSize, 1)
	}

}
