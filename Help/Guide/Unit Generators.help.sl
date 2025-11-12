# Unit Generators

## Amplitude & Dynamics

- `AmpComp`: psychoacoustic amplitude compensation
- `Amplitude`: amplitude follower
- `Compander`: compressor, expander, limiter, gate, ducker
- `Limiter`: peak limiter
- `Normalizer`: flattens dynamics
- `PeakFollower`: track peak signal amplitude

## Analysis

- `Pitch`: autocorrelation pitch follower
- `RunningSum`: summing
- `Slope`: slope of signal
- `ZeroCrossing`: zero crossing frequency follower

## Arrays

- `Mix`: sum a list of inputs
- `Select`: select output from a list of inputs

## Buffer Input & Output

- `BufRd`: buffer reading oscillator
- `Index`: index into a table with a signal
- `PlayBuf`: sample playback oscillator
- `TGrains`: buffer granulator
- `Warp1`: warp a buffer with a time pointer
- `WrapIndex`: index into a table with a signal

## Chaotic Systems

- `CuspL`: cusp map chaotic generator
- `HenonC`: Henon map chaotic generator
- `LatoocarfianC`: latoocarfian chaotic generator

## Comparison

- `Equal`
- `GreaterThanOrEqual`
- `GreaterThan`
- `LessThanOrEqual`
- `LessThan`
- `Unequal`

## Constants

- `BlockSize`
- `ControlRate`
- `RadiansPerSample`
- `SampleDur`
- `SampleRate`

## Control Signals

- `Integrator`: leaky integrator
- `KeyState`: keyboard input unit generator
- `Lag`: exponential lag
- `MouseButton`: cursor unit generator
- `MouseX`: cursor unit generator
- `MouseY`: cursor unit generator
- `Slew`: slew rate limiter

## Converting

- `AmpDb`: convert linear amplitude to decibels
- `CpsMidi`: convert cycles per second to midi note
- `CpsOct`: convert cycles per second to decimal octaves
- `DbAmp`: convert decibels to linear amplitude
- `DegreeToKey`: convert signal to modal pitch
- `K2A`: control rate to audio rate converter
- `LinExp`: convert a linear range to an exponential range
- `LinLin`: convert a linear range to a linear range
- `MidiCps`: convert midi note to cycles per second
- `MidiRatio`: convert an interval in midi notes into a frequency ratio
- `OctCps`: convert decimal octaves to cycles per second
- `RatioMidi`: convert interval as frequency ratio to midi note number

## Delays

- `AllpassC`: all pass filter
- `AllpassL`: all pass filter
- `AllpassN`: all pass filter
- `CombC`: comb filter
- `CombL`: comb filter
- `CombN`: comb filter
- `Delay1`: single sample delay
- `Delay2`: two sample delay
- `DelayC`: delay line
- `DelayL`: delay line
- `DelayN`: delay line
- `DelayTap`: delay line read
- `DelayWrite`: delay line write
- `MultiTapDelay`: multi-tap delay line
- `PingPongDelay`: stereo ping pong delay
- `Pluck`: karplus-strong ugen

## Distortion

- `Distort`: nonlinear distortion
- `SoftClip`: nonlinear distortion

## Envelopes

- `Cutoff`: cutoff envelope
- `Decay`: exponential decay
- `Decay2`: exponential decay
- `EnvGen`: envelope generator
- `Line`: line generator
- `Release`: release envelope
- `XLine`: exponential line generator

## Filters

- `BLowPass`: 12db/oct rolloff 2nd order resonant low pass filter
- `Bpf`: 2nd order Butterworth bandpass filter
- `Bpz2`: two zero fixed midpass
- `Brf`: 2nd order Butterworth band reject filter
- `Brz2`: two zero fixed midcut
- `Formlet`: FOF-like filter
- `Fos`: first order filter section
- `FreqShift`: frequency shifter
- `Hpf`: 2nd order Butterworth highpass filter
- `Hpz1`: two point difference filter
- `Hpz2`: two zero fixed highpass
- `LeakDc`: remove dc
- `Lpf`: 2nd order Butterworth lowpass filter
- `Lpz1`: two point average filter
- `Lpz2`: two zero fixed lowpass
- `Median`: median filter
- `MidEq`: parametric filter
- `OnePole`: one pole filter
- `OneZero`: one zero filter
- `Resonz`: resonant filter
- `Rhpf`: resonant high pass filter
- `Ringz`: ringing filter
- `RingzBank`: bank of resonators
- `Rlpf`: resonant low pass filter
- `Sos`: second order filter section (biquad)
- `TwoPole`: two pole filter
- `TwoZero`: two zero filter

## Granular Synthesis

- `PitchShift`: granular pitch shifter

## Input & Output

- `AudioIn`: read audio input from analogue-to-digital converter
- `In`: read a signal from a bus
- `LocalIn`: define and read from an audio bus local to the enclosing synth
- `LocalOut`: define and write to an audio bus local to the enclosing synth
- `Out`: summing output

## Mathematical Function

- `Abs`: absolute value
- `ArcCos`: arc cosine
- `ArcSin`: arc sine
- `ArcTan`: arc tangent
- `Ceiling`: next higher integer
- `Clip`: clipping
- `Clip2`: bilateral clipping
- `Cos`: cosine
- `Cosh`: hyperbolic cosine
- `Cube`: cube value
- `Exp`: exponential
- `Divide`: division
- `Floor`: next lower integer
- `Fold`: fold a signal outside given thresholds
- `Fold2`: bilateral folding
- `Gcd`: greatest common divisor
- `FractionPart`: fractional part
- `Hypotenuse`: hypotenuse
- `Lcm`: least common multiple
- `Log`: natural logarithm
- `Log10`: base 10 logarithm
- `Log2`: base 2 logarithm
- `Max`: maximum
- `Min`: minimum
- `Minus`: subtraction
- `ModDif`: minimum difference of two values in modulo arithmetics
- `MulAdd`: multiply and add
- `Negate`: negation
- `Plus`: addition
- `Power`: raised to
- `Quotient`: quotient
- `Reciprocal`: reciprocal
- `RoundTo`: round to multiple of
- `Sin`: sine
- `Sinh`: hyperbolic sine
- `Sqrt`: square root
- `Square`: square value
- `Tan`: tangent
- `Tanh`: hyperbolic tangent
- `Wrap`: wrap a signal outside given thresholds
- `Wrap2`: bilateral wrapping

## Noise Generators

- `BrownNoise`: noise generator
- `ClipNoise`: noise generator
- `Crackle`: chaotic noise function
- `Dust`: random impulses
- `Dust2`: bipolar random impulses
- `GreyNoise`: noise generator
- `LfClipNoise`: clipped noise
- `LfNoise0`: step noise
- `LfNoise1`: ramp noise
- `LfNoise2`: quadratic noise
- `LfdNoise0`: dynamic step noise
- `LfdNoise3`: dynamic cubic noise
- `LinCongC`: linear congruential generator
- `PinkNoise`: noise generator
- `WhiteNoise`: noise generator

## Oscillators

- `Blip`: band limited impulse oscillator
- `FSinOsc`: fast sine oscillator
- `FbSineC`: feedback sine with chaotic phase indexing
- `Formant`: formant oscillator
- `Impulse`: impulse oscillator
- `LfCub`: oscillator
- `LfPulse`: pulse oscillator
- `LfSaw`: sawtooth oscillator
- `LfTri`: triangle wave oscillator
- `Osc1`: one-shot oscillator
- `Phasor`: a resettable linear ramp between two levels
- `PmOsc`: phase modulation oscillator pair
- `Pulse`: band limited pulse wave
- `Saw`: band limited sawtooth
- `SinOsc`: interpolating sine wavetable oscillator
- `SinOscBank`: sin oscillator bank
- `SinOscFb`: Feedback Fm oscillator
- `SyncSaw`: hard sync sawtooth wave
- `VarSaw`: variable duty saw

## Panning

- `EqPan2`: two channel equal power pan
- `LinPan2`: two channel linear pan
- `LinXFade2`: two channel linear crossfade
- `Pan2`: two channel equal power pan
- `PanAz`: azimuth panner
- `PanB`: Ambisonic B format panner
- `Splay`: panner
- `Splay2`: stereo panner
- `SplayAz`: panner
- `XFade2`: equal power two channel cross fade

## Physical Models

- `Spring`: physical model of resonating spring

## Random Number Generators

- `ExpRand`: random number generator
- `Hasher`: randomized value
- `IRand`: random number generator
- `LinRand`: random number generator
- `NRand`: random number generator
- `Rand`: random number generator
- `Rand2`: random number generator
- `RandRange`: random number generator
- `TExpRand`: triggered exponential random number generator
- `TRand`: triggered random number generator
- `TiRand`: triggered integer random number generator

## Reverberation

- `FreeVerb`: a reverb
- `GVerb`: two-channel reverb

## Sequencing

- `Seq`: demand rate sequence generator

## Testing

- `InRange`: tests if a signal is within a given range

## Triggering

- `CoinGate`: statistical gate
- `Gate`: gate or hold
- `Latch`: sample and hold
- `PulseCount`: pulse counter
- `PulseDivider`: pulse divider
- `Schmidt`: schmidt trigger
- `Stepper`: pulse counter
- `Sweep`: triggered linear ramp
- `TChoose`: randomly select one of several inputs
- `TDelay`: trigger delay
- `Timer`: returns time since last triggered
- `ToggleFf`: toggle flip flop

## Uncategorized

- `Choose`: demand rate random sequence generator
- `GetTempo`: continuous tempo
- `OverlapTexture`: overlap events
- `Silent`: output silence
