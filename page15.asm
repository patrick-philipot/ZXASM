   
   DEVICE ZXSPECTRUM48
         ORG 30000
start:
         LD HL, 22528
         LD B, 16
LOOP    LD (HL), 40
         INC HL
         LD (HL), 8
         INC HL
         DJNZ LOOP
         RET

; Deployment
LENGTH      equ $ - start


   ;;   Cette partie est gérée par TapLib.asm
   include TapLib.asm
   ;;   MakeTape <speccy_model>, <tape_file>, <program_name>, <start_address>, <code_length>, <call_address>

   ; option 1: tape
   MakeTape ZXSPECTRUM48, "_tape.tap", "tapefile", start, LENGTH, start

   ; option 2: snapshot
   SAVESNA "_snapshot.sna", start