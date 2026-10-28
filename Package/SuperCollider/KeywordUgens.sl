+Record {

	allpassC { :d |
		allpassC(d['in'], d['maxDelayTime'], d['delayTime'], d['decayTime'])
	}

	allpassL { :d |
		allpassL(d['in'], d['maxDelayTime'], d['delayTime'], d['decayTime'])
	}

	allpassN { :d |
		allpassN(d['in'], d['maxDelayTime'], d['delayTime'], d['decayTime'])
	}

	balance2 { :d |
		balance2(d['left'], d['right'], d['pos'], d['level'])
	}

	blip { :d |
		blip(d['freq'], d['numHarm'])
	}

	bpf { :d |
		bpf(d['in'], d['freq'], d['rq'])
	}

	brf { :d |
		brf(d['in'], d['freq'], d['rq'])
	}

	combC { :d |
		combC(d['in'], d['maxDelayTime'], d['delayTime'], d['decayTime'])
	}

	combL { :d |
		combL(d['in'], d['maxDelayTime'], d['delayTime'], d['decayTime'])
	}

	combN { :d |
		combN(d['in'], d['maxDelayTime'], d['delayTime'], d['decayTime'])
	}

	compander { :d |
		compander(d['in'], d['control'], d['thresh'], d['slopeBelow'], d['slopeAbove'], d['clampTime'], d['relaxTime'])
	}

	decay { :d |
		decay(d['in'], d['decayTime'])
	}

	decay2 { :d |
		decay2(d['in'], d['attackTime'], d['decayTime'])
	}

	degreeToKey { :d |
		degreeToKey(d['bufNum'], d['in'], d['octave'])
	}

	delayC { :d |
		delayC(d['in'], d['maxDelayTime'], d['delayTime'])
	}

	delayL { :d |
		delayL(d['in'], d['maxDelayTime'], d['delayTime'])
	}

	delayN { :d |
		delayN(d['in'], d['maxDelayTime'], d['delayTime'])
	}

	demand { :d |
		demand(d['trig'], d['reset'], d['demandUgens'])
	}

	dseq { :d |
		dseq(d['repeats'], d['list'])
	}

	dust { :d |
		dust(d['density'])
	}

	dust2 { :d |
		dust2(d['density'])
	}

	envGen { :d |
		envGen(d['gate'], d['levelScale'], d['levelBias'], d['timeScale'], d['doneAction'], d['envelope'])
	}

	expRand { :d |
		expRand(d['lo'], d['hi'])
	}

	fSinOsc { :d |
		fSinOsc(d['freq'], d['iphase'])
	}

	fold { :d |
		fold(d['in'], d['lo'], d['hi'])
	}

	formant { :d |
		formant(d['fundFreq'], d['formFreq'], d['bwfreq'])
	}

	formlet { :d |
		formlet(d['in'], d['freq'], d['attackTime'], d['decayTime'])
	}

	fos { :d |
		fos(d['in'], d['a0'], d['a1'], d['b1'])
	}

	freeVerb { :d |
		freeVerb(d['in'], d['mix'], d['room'], d['damp'])
	}

	freeVerb2 { :d |
		freeVerb2(d['in'], d['in2'], d['mix'], d['room'], d['damp'])
	}

	freqShift { :d |
		freqShift(d['in'], d['freq'], d['phase'])
	}

	gVerb { :d |
		gVerb(d['in'], d['roomSize'], d['revtime'], d['damping'], d['inputbw'], d['spread'], d['drylevel'], d['earlyreflevel'], d['tailLevel'], d['maxroomSize'])
	}

	gate { :d |
		gate(d['in'], d['trig'])
	}

	gendy1 { :d |
		gendy1(d['ampDist'], d['durDist'], d['adParam'], d['ddParam'], d['minFreq'], d['maxFreq'], d['ampScale'], d['durScale'], d['initCps'], d['kNum'])
	}

	gendy2 { :d |
		gendy2(d['ampDist'], d['durDist'], d['adParam'], d['ddParam'], d['minFreq'], d['maxFreq'], d['ampScale'], d['durScale'], d['initCps'], d['kNum'], d['a'], d['c'])
	}

	gendy3 { :d |
		gendy3(d['ampDist'], d['durDist'], d['adParam'], d['ddParam'], d['freq'], d['ampScale'], d['durScale'], d['initCps'], d['kNum'])
	}

	grainBuf { :d |
		grainBuf(d['numChan'], d['trigger'], d['dur'], d['sndBuf'], d['rate'], d['pos'], d['interp'], d['pan'], d['envBufNum'] /* ? -1 */, d['maxGrains'])
	}

	grainFm { :d |
		grainFm(d['numChan'], d['trigger'], d['dur'], d['carFreq'], d['modFreq'], d['index'], d['pan'], d['envBufNum'] /* ? -1 */, d['maxGrains'])
	}

	grainIn { :d |
		grainIn(d['numChan'], d['trigger'], d['dur'], d['in'], d['pan'], d['envBufNum'] /* ? -1 */, d['maxGrains'])
	}

	grainSin { :d |
		grainSin(d['numChan'], d['trigger'], d['dur'], d['freq'], d['pan'], d['envBufNum'] /* ? -1 */, d['maxGrains'])
	}

	hpf { :d |
		hpf(d['in'], d['freq'])
	}

	iRand { :d |
		iRand(d['lo'], d['hi'])
	}

	impulse { :d |
		impulse(d['freq'], d['phase'])
	}

	lag { :d |
		lag(d['in'], d['lagTime'])
	}

	lag2 { :d |
		lag2(d['in'], d['lagTime'])
	}

	lag2Ud { :d |
		lag2Ud(d['in'], d['lagTimeU'], d['lagTimeD'])
	}

	lag3 { :d |
		lag3(d['in'], d['lagTime'])
	}

	lag3Ud { :d |
		lag3Ud(d['in'], d['lagTimeU'], d['lagTimeD'])
	}

	lagIn { :d |
		lagIn(d['numChan'], d['bus'], d['lag'])
	}

	lagUd { :d |
		lagUd(d['in'], d['lagTimeU'], d['lagTimeD'])
	}

	latch { :d |
		latch(d['in'], d['trig'])
	}

	leakDc { :d |
		leakDc(d['in'], d['coef'])
	}

	lfCub { :d |
		lfCub(d['freq'], d['iphase'])
	}

	lfGauss { :d |
		lfGauss(d['duration'], d['width'], d['iphase'], d['loop'], d['doneAction'])
	}

	lfNoise0 { :d |
		lfNoise0(d['freq'])
	}

	lfNoise1 { :d |
		lfNoise1(d['freq'])
	}

	lfNoise2 { :d |
		lfNoise2(d['freq'])
	}

	lfPar { :d |
		lfPar(d['freq'], d['iphase'])
	}

	lfPulse { :d |
		lfPulse(d['freq'], d['iphase'], d['width'])
	}

	lfSaw { :d |
		lfSaw(d['freq'], d['iphase'])
	}

	lfTri { :d |
		lfTri(d['freq'], d['iphase'])
	}

	linExp { :d |
		linExp(d['in'], d['srcLo'], d['srcHi'], d['dstLo'], d['dstHi'])
	}

	linPan2 { :d |
		linPan2(d['in'], d['pos'], d['level'])
	}

	linRand { :d |
		linRand(d['lo'], d['hi'], d['minmax'])
	}

	linXFade2 { :d |
		linXFade2(d['inA'], d['inB'], d['pan'])
	}

	line { :d |
		line(d['start'], d['end'], d['dur'])
	}

	linen { :d |
		linen(d['gate'], d['attackTime'], d['susLevel'], d['releaseTime'], d['doneAction'])
	}

	localBuf { :d |
		localBuf(d['numChannels'], d['numFrames'])
	}

	localIn { :d |
		localIn(d['numChan'], d['default'])
	}

	localOut { :d |
		localOut(d['channelsList'])
	}

	lpf { :d |
		lpf(d['in'], d['freq'])
	}

	mVerb { :d |
		mVerb(d['in1'], d['in2'], d['dampingFreq'], d['density'], d['bandwidthFreq'], d['decay'], d['preDelay'], d['size'], d['gain'], d['mix'], d['earlyMix'])
	}

	moogFf { :d |
		moogFf(d['in'], d['freq'], d['gain'], d['reset'])
	}

	mouseButton { :d |
		mouseButton(d['minVal'], d['maxVal'], d['lag'])
	}

	mouseX { :d |
		mouseX(d['minVal'], d['maxVal'], d['warp'], d['lag'])
	}

	mouseY { :d |
		mouseY(d['minVal'], d['maxVal'], d['warp'], d['lag'])
	}

	nRand { :d |
		nRand(d['lo'], d['hi'], d['n'])
	}

	osc { :d |
		osc(d['bufNum'], d['freq'], d['phase'])
	}

	oscN { :d |
		oscN(d['bufNum'], d['freq'], d['phase'])
	}

	out { :d |
		out(d['bus'], d['channelsList'])
	}

	pan2 { :d |
		pan2(d['in'], d['pos'], d['level'])
	}

	pan4 { :d |
		pan4(d['in'], d['xpos'], d['ypos'], d['level'])
	}

	panAz { :d |
		panAz(d['numChan'], d['in'], d['pos'], d['level'], d['width'], d['orientation'])
	}

	phasor { :d |
		phasor(d['trig'], d['rate'], d['start'], d['end'], d['resetPos'])
	}

	pitchFollower { :d |
		pitchFollower(d['in'], d['initFreq'], d['minFreq'], d['maxFreq'], d['execFreq'], d['maxBinsPerOctave'], d['median'], d['ampThreshold'], d['peakThreshold'], d['downSample'], d['clar'])
	}

	pitchShift { :d |
		pitchShift(d['in'], d['windowSize'], d['pitchRatio'], d['pitchDispersion'], d['timeDispersion'])
	}

	pluck { :d |
		pluck(d['in'], d['trig'], d['maxDelayTime'], d['delayTime'], d['decayTime'], d['coef'])
	}

	pulse { :d |
		pulse(d['freq'], d['width'])
	}

	pulseCount { :d |
		pulseCount(d['trig'], d['reset'])
	}

	pulseDivider { :d |
		pulseDivider(d['trig'], d['div'], d['start'])
	}

	ramp { :d |
		ramp(d['in'], d['lagTime'])
	}

	rand { :d |
		rand(d['lo'], d['hi'])
	}

	resonz { :d |
		resonz(d['in'], d['freq'], d['bwr'])
	}

	rhpf { :d |
		rhpf(d['in'], d['freq'], d['rq'])
	}

	ringz { :d |
		ringz(d['in'], d['freq'], d['decayTime'])
	}

	rlpf { :d |
		rlpf(d['in'], d['freq'], d['rq'])
	}

	rotate2 { :d |
		rotate2(d['x'], d['y'], d['pos'])
	}

	saw { :d |
		saw(d['freq'])
	}

	schmidt { :d |
		schmidt(d['in'], d['lo'], d['hi'])
	}

	selectT { :d |
		selectT(d['which'], d['array'])
	}

	setResetFf { :d |
		setResetFf(d['trig'], d['reset'])
	}

	shaper { :d |
		shaper(d['bufNum'], d['in'])
	}

	sinOsc { :d |
		sinOsc(d['freq'], d['phase'])
	}

	sinOscFb { :d |
		sinOscFb(d['freq'], d['feedback'])
	}

	slew { :d |
		slew(d['in'], d['up'], d['dn'])
	}

	slope { :d |
		slope(d['in'])
	}

	stepper { :d |
		stepper(d['trig'], d['reset'], d['min'], d['max'], d['step'], d['resetval'])
	}

	sweep { :d |
		sweep(d['trig'], d['rate'])
	}

	syncSaw { :d |
		syncSaw(d['syncFreq'], d['sawFreq'])
	}

	tExpRand { :d |
		tExpRand(d['lo'], d['hi'], d['trig'])
	}

	tGrains { :d |
		tGrains(d['numChan'], d['trigger'], d['bufNum'], d['rate'], d['centerPos'], d['dur'], d['pan'], d['amp'], d['interp'])
	}

	tRand { :d |
		tRand(d['lo'], d['hi'], d['trig'])
	}

	tiRand { :d |
		tiRand(d['lo'], d['hi'], d['trig'])
	}

	timer { :d |
		timer(d['trig'])
	}

	toggleFf { :d |
		toggleFf(d['trig'])
	}

	trig { :d |
		trig(d['in'], d['dur'])
	}

	trig1 { :d |
		trig1(d['in'], d['dur'])
	}

	twoPole { :d |
		twoPole(d['in'], d['freq'], d['radius'])
	}

	twoZero { :d |
		twoZero(d['in'], d['freq'], d['radius'])
	}

	vOsc { :d |
		vOsc(d['bufPos'], d['freq'], d['phase'])
	}

	vOsc3 { :d |
		vOsc3(d['bufPos'], d['freq1'], d['freq2'], d['freq3'])
	}

	varLag { :d |
		varLag(d['in'], d['time'], d['curvature'], d['warp'], d['start'])
	}

	varSaw { :d |
		varSaw(d['freq'], d['iphase'], d['width'])
	}

	vibrato { :d |
		vibrato(d['freq'], d['rate'], d['depth'], d['delay'], d['onset'], d['rateVariation'], d['depthVariation'], d['iphase'], d['trig'])
	}

	warp1 { :d |
		warp1(d['numChan'], d['bufNum'], d['pointer'], d['freqScale'], d['windowSize'], d['envBufNum'] /* ? -1 */, d['overlaps'], d['windowRandRatio'], d['interp'])
	}

	wrap { :d |
		wrap(d['in'], d['lo'], d['hi'])
	}

	xFade2 { :d |
		xFade2(d['inA'], d['inB'], d['pan'], d['level'])
	}

}

+Record {

	Env { :d |
		Env(d['levels'], d['times'], d['curves'], d['releaseNode'], d['loopNode'], d['offset'])
	}

	eqPan2 { :d |
		eqPan2(d['in'], d['pos'])
	}

	membraneCircle { :d |
		membraneCircle(d['excitation'], d['tension'], d['loss'])
	}

	miBraids { :d |
		miBraids(d['pitch'], d['timbre'], d['color'], d['model'], d['trig'], d['resamp'], d['decim'], d['bits'], d['ws'])
	}

	miClouds { :d |
		miClouds(d['pit'], d['pos'], d['size'], d['dens'], d['tex'], d['dryWet'], d['inGain'], d['spread'], d['rvb'], d['fb'], d['freeze'], d['mode'], d['lofi'], d['trig'], d['inputList'])
	}

	miRings { :d |
		miRings(d['in'], d['trig'], d['pit'], d['struct'], d['bright'], d['damp'], d['pos'], d['model'], d['poly'], d['internExciter'], d['easterEgg'], d['bypass'])
	}

	perc { :d |
		perc(d['trig'], d['attackTime'], d['releaseTime'], d['curve'])
	}

	release { :d |
		release(d['in'], d['attackTime'], d['sustainTime'], d['releaseTime'])
	}

	tScramble { :d |
		tScramble(d['trigger'], d['inputs'])
	}

	[timesPlus, *+] { :d |
		timesPlus(d['in'], d['mul'], d['add'])
	}

	txLine { :d |
		txLine(d['start'], d['end'], d['dur'], d['trig'])
	}

	voicer { :d |
		voicer(d['part'], d['numVoices'], d['voiceFunc'])
	}

}
