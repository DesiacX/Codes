######################################################################################################################################################################################
L-Cancel Landing Lag and Success Rate and Score Display is Auto L-Cancel Option 3.0 Code Menu Toggle w/HLC Variant (Offset 0E5A, Distance 574) [Magus, standardtoaster, wiiztec, Desi]
######################################################################################################################################################################################
op nop @ $8081bE8C            #????
op li r4, 0x0 @ $800505EC     #Disable Score Display
HOOK @ $8087459C
* 064e4640 00000008   #Write Float for HLC
* 3FE33333 33333333   #Value is 0.6. Use this converter to edit. https://gregstoll.com/~gregstoll/floattohex/
.alias CodeMenuOffset = 0x0E5A       #Position of Half Word container Player 1 ALC Toggle in cm.bin
.alias CodeMenuDistance = 0x0574      #Distance between Player Toggles.
#F30 contains frames of Landing Lag
{
loc_0x0:
  lwz r4, 112(r31)
  lwz r4, 32(r4)
  lwz r4, 12(r4)
  lwz r6, 360(r4)
  lfs f0, -23448(r2)        #>Load 0.5 from the abyss
  fmr f2, f30
  lwz r11, 28(r31)          #\Obtain Player ID through magic beyond my comprehension
  lwz r11, 40(r11)          #|
  lwz r11, 16(r11)          #|
  lbz r11, 85(r11)          #/
  mulli r11, r11, CodeMenuDistance  #>Multiply PLayer ID by Code Menu Distance
  lis r12, 0x804E                   #\ 
  ori r12, r12, CodeMenuOffset      #|Load Code Menu Info for the current player
  lhzx r12, r12, r11                #/
  cmpwi r12, 0x1; beq- AutoLCancel      #\Go to segments for ALC of HLC
  cmpwi r12, 0x2; beq- HandicappedALC   #/
  lis r11, 0x9017
  ori r11, r11, 0xF36B
  lbz r11, 0(r11)
  cmpwi r11, 0x1
  bne- loc_0x78

AutoLCancel:
  fmuls f30, f30, f0        #Multiply F30 by 0.5
  b OriginalCodeA

HandicappedALC:
  lis r11, 0x804E           #\Load stored float
  ori r11, r11, 0x4640      #|
  lfd f0, 0(r11)            #|
  fmuls f30, f30, f0        #/Multiply by float

OriginalCodeA:
  cmpwi r6, 0x0
  lis r6, 0x80B8
  ori r6, r6, 0x8394
  lfs f6, 0(r6)
  lfs f5, 568(r4)
  fadds f5, f5, f6
  stfs f5, 568(r4)
  lis r5, 0x80B8
  lwz r5, 31784(r5)
  lwz r5, 340(r5)
  lwz r5, 0(r5)
  lwz r6, 8(r31)
  lwz r6, 268(r6)
  rlwinm r6, r6, 0, 24, 31
  mulli r6, r6, 0x244
  add r5, r5, r6
  lwz r5, 40(r5)
  addi r5, r5, 0x850
  ble- OriginalCodeB
  fmuls f30, f2, f0
  lis r6, 0x80B8
  ori r6, r6, 0x8394
  lfs f6, 0(r6)
  lfs f4, 572(r4)
  fadds f4, f6, f4
  stfs f4, 572(r4)

OriginalCodeB:
  lfs f4, 572(r4)
  fdivs f5, f4, f5
  lis r6, 0x80B8
  ori r6, r6, 0x83A0
  lfs f6, 0(r6)
  fmuls f5, f6, f5
  fctiwz f5, f5
  stfd f5, 48(r2)
  lhz r12, 54(r2)
  stw r12, 0(r5)
  fctiwz f30, f30
  stfd f30, 16(r2)
  lhz r12, 22(r2)
  lfd f0, -31632(r2)
  lis r3, 0x4330
  ori r3, r3, 0x0
  stw r3, 16(r2)
  xoris r12, r12, 32768
  stw r12, 20(r2)
  lfd f30, 16(r2)
  fsub f30, f30, f0
  fadds f31, f31, f1
  fdivs f31, f31, f30
}
