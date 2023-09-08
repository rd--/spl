+@Object {

	replicateApplying { :self :anInteger :aProcedure:/1 |
		| answer = Array(anInteger); |
		answer.indicesDo { :index |
			answer[index] := aProcedure(self)
		};
		answer
	}

	replicate { :self :anInteger |
		self.replicateApplying(anInteger, identity:/1)
	}

}

+String {

	base64Decoded { :self |
		<primitive:
		const binString = atob(_self);
		return Uint8Array.from(binString, function(m) {
			return m.codePointAt(0)
		});
		>
	}

	crc16 { :self |
		self.utf8ByteArray.crc16
	}

	parseHexString { :self |
		<primitive:
		const bytes = new Uint8Array(_self.length / 2);
		for (let i = 0; i < _self.length; i ++) {
			bytes[i] = parseInt(_self.substr(i * 2, 2), 16);
		}
		return bytes;
		>
	}

}
