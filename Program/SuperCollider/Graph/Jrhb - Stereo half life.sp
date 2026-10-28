/* Stereo half-life (jrhb) */
let tHalf = 3.92; /* Radon-219, discovered 1904 by Giesel and Debierne */
let nAtoms = 100000; /* Ca. 3.6e-14 mg */
let n = (nAtoms - pulseCount(localIn(2, 0), 0)).max(0);
let activity = dust(n * 2.log / tHalf);
(activity * 0.1) <! localOut(activity)
