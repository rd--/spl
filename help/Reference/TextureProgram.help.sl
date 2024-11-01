# TextureProgram

- _TextureProgram(soundBlock, envelopeBlock, delayTime)_

Texture program.
When played,
schedules a periodic process on the system clock to evalute _soundBlock()_,
which should construct a Ugen graph,
and apply _envelopeBlock_ to the answer,
and send the result to the synthesiser.

The process runs at the interval _delayTime_.

* * *

See also: collectTexture, OverlapTexture, overlapTextureProgram, spawnTextureProgram, xFadeTextureProgram

Categories: Scheduling
