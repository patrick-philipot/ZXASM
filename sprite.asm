   
   DEVICE ZXSPECTRUM48
      org 30000

LASTK equ  23560
PRINT equ  8252

start:
      ld a, 2
      call 5633
      ld hl, GFX
      ld (23675), hl

MAINL call PPLAY
      ld a, (LASTK)
      cp "o"
      jr z, GLEFT

GLEFT ld a, " "
      ld (PLAYER+3), a
      call PPLAY
      ld a, 144
      ld (PLAYER+3), a
      ld a, (PLAYER+2)
      dec a
      ld (PLAYER+2), a
      ld a, 0
      ld (LASTK), a
      jr MAINL

GRIGH equ $

PPLAY ld de, PLAYER
      ld bc, EOPLAYER-PLAYER
      call PRINT
      ret

PLAYER   defb 22,21,15,144
EOPLAYER equ $

GFX   defb 24, 24, 255, 189, 189, 60, 36, 102



; Deployment
LENGTH      equ $ - start


   ;;   Cette partie est gérée par TapLib.asm
   include TapLib.asm
   ;;   MakeTape <speccy_model>, <tape_file>, <program_name>, <start_address>, <code_length>, <call_address>

   ; option 1: tape
   MakeTape ZXSPECTRUM48, "_tape.tap", "tapefile", start, LENGTH, start

   ; option 2: snapshot
   SAVESNA "_snapshot.sna", start