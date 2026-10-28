# Unit Generators

## Amplitude & Dynamics

- `ampComp`: psychoacoustic amplitude compensation
- `amplitude`: amplitude follower
- `compander`: compressor, expander, limiter, gate, ducker
- `limiter`: peak limiter
- `normalizer`: flattens dynamics
- `peakFollower`: track peak signal amplitude

## Analysis

- `pitch`: autocorrelation pitch follower
- `runningSum`: summing
- `slope`: slope of signal
- `zeroCrossing`: zero crossing frequency follower

## Arrays

- `mix`: sum a list of inputs
- `select`: select output from a list of inputs

## Buffer Input & Output

- `bufRd`: buffer reading oscillator
- `index`: index into a table with a signal
- `playBuf`: sample playback oscillator
- `tGrains`: buffer granulator
- `warp1`: warp a buffer with a time pointer
- `bufIndexWrap`: index into a table with a signal

## Chaotic Systems

- `cuspL`: cusp map chaotic generator
- `henonC`: Henon map chaotic generator
- `latoocarfianC`: latoocarfian chaotic generator

## Comparison

- `isEqual`
- `isGreaterOrEqual`
- `isGreater`
- `isLessOrEqual`
- `isLess`
- `isUnequal`

## Constants

- `blockSize`
- `controlRate`
- `radiansPerSample`
- `sampleDur`
- `sampleRate`

## Control Signals

- `integrator`: leaky integrator
- `keyState`: keyboard input unit generator
- `lag`: exponential lag
- `mouseButton`: cursor unit generator
- `mouseX`: cursor unit generator
- `mouseY`: cursor unit generator
- `slew`: slew rate limiter

## Converting

- `ampDb`: convert linear amplitude to decibels
- `cpsMidi`: convert cycles per second to midi note
- `cpsOct`: convert cycles per second to decimal octaves
- `dbAmp`: convert decibels to linear amplitude
- `degreeToKey`: convert signal to modal pitch
- `k2A`: control rate to audio rate converter
- `linExp`: convert a linear range to an exponential range
- `linLin`: convert a linear range to a linear range
- `midiCps`: convert midi note to cycles per second
- `midiRatio`: convert an interval in midi notes into a frequency ratio
- `octCps`: convert decimal octaves to cycles per second
- `ratioMidi`: convert interval as frequency ratio to midi note number

## Delays

- `allpassC`: all pass filter
- `allpassL`: all pass filter
- `allpassN`: all pass filter
- `combC`: comb filter
- `combL`: comb filter
- `combN`: comb filter
- `delay1`: single sample delay
- `delay2`: two sample delay
- `delayC`: delay line
- `delayL`: delay line
- `delayN`: delay line
- `delayTap`: delay line read
- `delayWrite`: delay line write
- `multiTapDelay`: multi-tap delay line
- `pingPongDelay`: stereo ping pong delay
- `pluck`: karplus-strong ugen

## Distortion

- `distort`
- `softClip`
- `tanh`

## Envelopes

- `cutoff`: cutoff envelope
- `decay`: exponential decay
- `decay2`: exponential decay
- `envGen`: envelope generator
- `line`: line generator
- `release`: release envelope
- `xLine`: exponential line generator

## Filters

- `bLowPass`: 12db/oct rolloff 2nd order resonant low pass filter
- `bpf`: 2nd order Butterworth bandpass filter
- `bpz2`: two zero fixed midpass
- `brf`: 2nd order Butterworth band reject filter
- `brz2`: two zero fixed midcut
- `formlet`: FOF-like filter
- `fos`: first order filter section
- `freqShift`: frequency shifter
- `hpf`: 2nd order Butterworth highpass filter
- `hpz1`: two point difference filter
- `hpz2`: two zero fixed highpass
- `leakDc`: remove dc
- `lpf`: 2nd order Butterworth lowpass filter
- `lpz1`: two point average filter
- `lpz2`: two zero fixed lowpass
- `median`: median filter
- `midEq`: parametric filter
- `onePole`: one pole filter
- `oneZero`: one zero filter
- `resonz`: resonant filter
- `rhpf`: resonant high pass filter
- `ringz`: ringing filter
- `ringzBank`: bank of resonators
- `rlpf`: resonant low pass filter
- `sos`: second order filter section (biquad)
- `twoPole`: two pole filter
- `twoZero`: two zero filter

## Granular Synthesis

- `pitchShift`: granular pitch shifter

## Input & Output

- `audioIn`: read audio input from analogue-to-digital converter
- `in`: read a signal from a bus
- `localIn`: define and read from an audio bus local to the enclosing synth
- `localOut`: define and write to an audio bus local to the enclosing synth
- `out`: summing output

## Mathematical Function

- `abs`: absolute value
- `arcCos`: arc cosine
- `arcSin`: arc sine
- `arcTan`: arc tangent
- `ceiling`: next higher integer
- `clip`: clipping
- `cos`: cosine
- `cosh`: hyperbolic cosine
- `cube`: cube value
- `divide`: division
- `exp`: exponential
- `floor`: next lower integer
- `fold`: fold a signal outside given thresholds
- `fractionPart`: fractional part
- `hypotenuse`: hypotenuse
- `log10`: base 10 logarithm
- `log2`: base 2 logarithm
- `log`: natural logarithm
- `max`: maximum
- `min`: minimum
- `modularDistance`: minimum difference of two values in modulo arithmetics
- `negate`: negation
- `plus`: addition
- `power`: raised to
- `quotient`: quotient
- `reciprocal`: reciprocal
- `round`: round to multiple of
- `signedGcd`: greatest common divisor
- `signedLcm`: least common multiple
- `signedSqrt`: square root
- `sin`: sine
- `sinh`: hyperbolic sine
- `square`: square value
- `subtract`: subtraction
- `tan`: tangent
- `tanh`: hyperbolic tangent
- `timesPlus`: multiply and add
- `wrap`: wrap a signal outside given thresholds

## Bilateral Functions

- `bilateralClip`
- `bilateralFold`
- `bilateralWrap`

## Noise Generators

- `brownNoise`: noise generator
- `clipNoise`: noise generator
- `crackle`: chaotic noise function
- `dust`: random impulses
- `dust2`: bipolar random impulses
- `greyNoise`: noise generator
- `lfClipNoise`: clipped noise
- `lfNoise0`: step noise
- `lfNoise1`: ramp noise
- `lfNoise2`: quadratic noise
- `lfdNoise0`: dynamic step noise
- `lfdNoise3`: dynamic cubic noise
- `linCongC`: linear congruential generator
- `pinkNoise`: noise generator
- `whiteNoise`: noise generator

## Oscillators

- `blip`: band limited impulse oscillator
- `fSinOsc`: fast sine oscillator
- `fbSineC`: feedback sine with chaotic phase indexing
- `formant`: formant oscillator
- `impulse`: impulse oscillator
- `lfCub`: oscillator
- `lfPulse`: pulse oscillator
- `lfSaw`: sawtooth oscillator
- `lfTri`: triangle wave oscillator
- `osc1`: one-shot oscillator
- `phasor`: a resettable linear ramp between two levels
- `pmOsc`: phase modulation oscillator pair
- `pulse`: band limited pulse wave
- `saw`: band limited sawtooth
- `sinOsc`: interpolating sine wavetable oscillator
- `sinOscBank`: sin oscillator bank
- `sinOscFb`: Feedback Fm oscillator
- `syncSaw`: hard sync sawtooth wave
- `varSaw`: variable duty saw

## Panning

- `eqPan2`: two channel equal power pan
- `linPan2`: two channel linear pan
- `linXFade2`: two channel linear crossfade
- `pan2`: two channel equal power pan
- `panAz`: azimuth panner
- `panB`: Ambisonic B format panner
- `splay`: panner
- `splay2`: stereo panner
- `splayAz`: panner
- `xFade2`: equal power two channel cross fade

## Physical Models

- `spring`: physical model of resonating spring

## Random Number Generators

- `expRand`: random number generator
- `hasher`: randomized value
- `iRand`: random number generator
- `linRand`: random number generator
- `nRand`: random number generator
- `rand`: random number generator
- `rand2`: random number generator
- `randRange`: random number generator
- `tExpRand`: triggered exponential random number generator
- `tRand`: triggered random number generator
- `tiRand`: triggered integer random number generator

## Reverberation

- `freeVerb`: a reverb
- `gVerb`: two-channel reverb

## Sequencing

- `seq`: demand rate sequence generator

## Testing

- `inRange`: tests if a signal is within a given range

## Triggering

- `coinGate`: statistical gate
- `gate`: gate or hold
- `latch`: sample and hold
- `pulseCount`: pulse counter
- `pulseDivider`: pulse divider
- `schmidt`: schmidt trigger
- `stepper`: pulse counter
- `sweep`: triggered linear ramp
- `tChoose`: randomly select one of several inputs
- `tDelay`: trigger delay
- `timer`: returns time since last triggered
- `toggleFf`: toggle flip flop

## Uncategorized

- `choose`: demand rate random sequence generator
- `gendy1`
- `gendy3`
- `getTempo`: continuous tempo
- `overlapTexture`: overlap events
- `silent`: output silence

* * *

Guides: SuperCollider Functions, SuperCollider Synthesiser, Upper Case Methods
