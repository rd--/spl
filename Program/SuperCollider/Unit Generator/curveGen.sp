/* curveGen */
let env = curveGen(1, [0.5 2], [9], [-4]);
sinOsc(440 * env, 0) * 0.1

/* curveGen ; https://audiomasher.org/patch/Y3OOFF */
let tEnvx = { :tr :atk :hld :rel |
	curveGen(tr, [0 1 1 0], [atk hld rel], [0 0 -9])
};
let noteZero = mouseY(48, 75, 0, 0.2).round(1);
let decayTime = mouseX(2, 4, 0, 0.2);
let seq = dseq(Infinity, [0 5 0 3 0 3 5 0 3] + noteZero);
let tr = impulse(4, 0);
let osc = sinOsc(demand(tr, 0, seq.midiCps), 0) * 0.1;
let env = tEnvx(tr, 0.01, 0.1, 0.2) + tEnvx(pulseDivider(tr, 2, 0), 0.01, 0.1, 0.2);
let snd = [osc * env] # 2;
combC(snd, 0.25, 0.25, decayTime) * 0.4 + snd
