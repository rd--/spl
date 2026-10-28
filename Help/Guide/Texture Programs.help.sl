# Texture Programs

Texture programs generate sound by scheduling overlapping instances of a synthesiser program.

This program generates random panning three note chords.

~~~spl texture
let dur = 12;
{
	{
		pan2(
			sinOsc(
				iRand(48, 72).midiCps,
				0
			),
			line(
				rand(-1, 1),
				rand(-1, 1),
				dur
			),
			rand(0.01, 0.05)
		)
	} !+ 3
}.overlapTextureProgram(
	dur // 3,
	dur // 3,
	4
)
~~~

To stop a texture program the clock on which it is scheduled must be cleared.
The keybinding _Ctrl-Shift->_ clears the `system` `Clock`.

Type:

- `TextureProgram`

Functions:

- `collectTextureProgram`
- `overlapTextureProgram`
- `spawnTextureProgram`
- `xFadeTextureProgram`

Textrue programs are distinct from texture unit generators,
see `overlapTexture` and `xFadeTexture`.

* * *

Guides: Scheduling Functions, SuperCollider Functions

Categories: Scheduling
