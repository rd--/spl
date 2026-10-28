/* 20060919 ; rd */
[24 36].collect { :r |
	let tr = dust(3);
	let b = [
		40 47 42 40 50
		43 35 43 40 47
		45 35 43 42 59
		48 40 47 52 45
		;
		40 40 42 47 50
		35 43 43 40 45
		42 35 48 47 43
		40 59 45 47 52
	].localBuf;
	let f = bufRd(1, b, tiRand(0, 6, tr), 0, 2);
	[
		blip((r + f).midiCps, 12),
		blip((r + f + tRand(-0.0001, 0.0001, tr)).midiCps, 12)
	].sum * decay2(tr, 0.3, 1.2) * 0.1
}.mix
