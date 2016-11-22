// start a process
"settings.scd".loadRelative

b=PAT.melody

(
a=PAT.envirPoly;
a.sffd=()
)

a.sffd.instrument=\marimba1
a.bob
a.bob.mtranspose=[0,2,1,2]

a.keys
