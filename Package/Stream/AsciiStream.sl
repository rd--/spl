/* Requires: ByteArray MutableCollectionStream */

+MutableCollectionStream {

	asciiContents { :self |
		self.contents.asciiString
	}

}

+Block {

	asciiStringStreamContents { :self/1 |
		let stream = AsciiStream();
		self(stream);
		stream.contents.asciiString
	}

}

+SmallFloat {

	AsciiStream { :self |
		WriteStream(
			ByteArray(self)
		)
	}

}

+Void {

	AsciiStream {
		AsciiStream(100)
	}

}
