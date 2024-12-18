   
   DEVICE ZXSPECTRUM48
   org $8000

start:
   jp main_code

; Character Codes
ENTER       equ $0D

; ROM routines
ROM_CLS     equ $0DAF
ROM_PRINT   equ $203C

; DATA

hello:		db "ASM prototype file for SjASMPlus",ENTER
HELLO_LEN   equ $ - hello

main_code:
   call ROM_CLS
   ld de,hello
   ld bc,HELLO_LEN
   call ROM_PRINT
   ret

; Deployment
LENGTH      equ $ - start


   ;;   Cette partie est gérée par TapLib.asm
   include TapLib.asm
   ;;   MakeTape <speccy_model>, <tape_file>, <program_name>, <start_address>, <code_length>, <call_address>

   ; option 1: tape
   MakeTape ZXSPECTRUM48, "_tape.tap", "tapefile", start, LENGTH, start

   ; option 2: snapshot
   SAVESNA "_snapshot.sna", start