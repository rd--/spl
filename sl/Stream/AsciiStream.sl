(* Requires: ByteArray MutableCollectionStream *)

+MutableCollectionStream {

	asciiContents { :self |
		self.contents.asciiString
	}

}

+Block {

	asciiStringStreamContents { :self:/1 |
		| stream = AsciiStream(); |
		self(stream);
		stream.contents.asciiString
	}

}

+SmallFloat {

	AsciiStream { :self |
		ByteArray(self).asWriteStream
	}

}

+Void {

	AsciiStream {
		AsciiStream(100)
	}

}
