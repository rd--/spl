/* envLinen */
sinOsc(440, 0) * envGen(1, 1, 0, 1, 0, envLinen(1, 3, 5, 0.1, -4))

/* envLinen ; asEnvGen */
sinOsc(440, 0) * envLinen(1, 3, 5, 0.1, -4).asEnvGen(1)
