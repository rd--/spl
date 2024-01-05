(* Requires: ByteArray MutableCollectionStream *)

+MutableCollectionStream {

	utf8Contents { :self |
		self.contents.utf8String
	}

}

+Block {

	utf8StringStreamContents { :self:/1 |
		| stream = Utf8Stream(); |
		self(stream);
		stream.contents.utf8String
	}

}

+SmallFloat {

	Utf8Stream { :self |
		ByteArray(self).asWriteStream
	}

}

+Void {

	Utf8Stream {
		Utf8Stream(100)
	}

}
