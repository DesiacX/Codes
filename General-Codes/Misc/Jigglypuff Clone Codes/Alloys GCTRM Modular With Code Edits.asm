#############################################################
Jigglypuff Clone 6D Uses Bones 6/7/9 instead of 3/4/6 [codes]
#############################################################
.Macro CloneBones(<CloneID>,<BoneID>,<WriteRegister>)
{
  cmpwi r3, <CloneID>
  bne+ 0x8
  li <WriteRegister>, <BoneID>
}

################
HOOK @ $80AC9F9C
{
    %CloneBones(0x6D, 0x7, r28)	#Green Alloy
    lwz r4, 216(r30)
}
################
HOOK @ $80ACA3A4
{
    %CloneBones(0x6D, 0x7, r27)	#Green Alloy  
    lwz r4, 216(r28)
}
################
HOOK @ $80ACA414
{
    %CloneBones(0x6D, 0x7, r27)	#Green Alloy
    lwz r4, 216(r28)
}
################
HOOK @ $80ACA7E8
{
    %CloneBones(0x6D, 0x7, r31)	#Green Alloy    
    lwz r4, 216(r29)
}
################
HOOK @ $80ACA858
{
    %CloneBones(0x6D, 0x7, r31)	#Green Alloy    
    lwz r4, 216(r29)
}
################
HOOK @ $80ACAC2C
{
    %CloneBones(0x6D, 0x7, r28)	#Green Alloy    
    lwz r4, 216(r30)

}
################
HOOK @ $80ACB050
{
    %CloneBones(0x6D, 0x7, r27)	#Green Alloy    
    lwz r4, 216(r28)
}
################
HOOK @ $80ACB0c0
{
    %CloneBones(0x6D, 0x7, r27)	#Green Alloy    
    lwz r4, 216(r28)
}
################
HOOK @ $80ACB6A0
{
    %CloneBones(0x6D, 0x9, r5)	#Green Alloy
    lfs f0, 4(r31)
}
################
HOOK @ $80ACB7BC
{
    %CloneBones(0x6D, 0x7, r31)	#Green Alloy    
    lwz r4, 216(r29)
}
################
HOOK @ $80ACB81C
{
    %CloneBones(0x6D, 0x7, r31)	#Green Alloy    
    lwz r4, 216(r29)
}
################
HOOK @ $80ACBE9C
{
    %CloneBones(0x6D, 0x7, r28)	#Green Alloy    
    lwz r4, 216(r30)
}
################
op NOP @ $80ACC0B8
################
HOOK @ $80ACC0C4
{
    %CloneBones(0x6D, 0x6, r4)	#Green Alloy    
    lwz r3, 4(r5)
    lwz r12, 8(r3)
}
################
HOOK @ $80ACC9C4
{
    %CloneBones(0x6D, 0x7, r27)	#Green Alloy    
    lwz r4, 216(r28)
}
################
HOOK @ $80ACCA34
{
    %CloneBones(0x6D, 0x7, r26)	#Green Alloy    
    lwz r4, 216(r28)
}
################
HOOK @ $80ACD178
{
    %CloneBones(0x6D, 0x9, r28)	#Green Alloy    
    lwz r3, 216(r30)
}
################
HOOK @ $80ACD53C
{
    %CloneBones(0x6D, 0x7, r31)	#Green Alloy    
    lwz r4, 216(r29)
}
################
HOOK @ $80ACD5AC
{
    %CloneBones(0x6D, 0x7, r31)	#Green Alloy    
    lwz r4, 216(r29)
}
################
HOOK @ $80ACD93C
{
    %CloneBones(0x6D, 0x7, r30)	#Green Alloy    
    lwz r4, 216(r29)
}
################
op NOP @ $80ACDB54
################
HOOK @ $80ACDB60
{
    %CloneBones(0x6D, 0x6, r4)	#Green Alloy    
    lwz r3, 4(r5)
    lwz r12, 8(r3)
}
################
HOOK @ $80ACE580
{
    %CloneBones(0x6D, 0x7, r28)	#Green Alloy    
    lwz r4, 216(r27)
}
################
HOOK @ $80ACE5F0
{
    %CloneBones(0x6D, 0x7, r26)	#Green Alloy    
    lwz r4, 216(r27)
}
################
HOOK @ $80ACEBF0
{
    %CloneBones(0x6D, 0x7, r29)	#Green Alloy    
    lwz r4, 216(r30)
}
################
HOOK @ $80ACEDF4
{
    %CloneBones(0x6D, 0x9, r28)	#Green Alloy    
    lwz r3, 216(r30)
}
################
op NOP @ $80ACF8A4
################
HOOK @ $80ACF8B0
{
    %CloneBones(0x6D, 0x6, r4)	#Green Alloy    
    lwz r3, 4(r5)
    lwz r12, 8(r3)
}
################
HOOK @ $80ACFCD4
{
    %CloneBones(0x6D, 0x7, r25)	#Green Alloy    
    lwz r4, 216(r27)
}
################
HOOK @ $80ACFD94
{
    %CloneBones(0x6D, 0x7, r26)	#Green Alloy    
    lwz r4, 216(r27)
}
################
HOOK @ $80AD02C8
{
    %CloneBones(0x6D, 0x7, r31)	#Green Alloy    
    lwz r4, 216(r29)
}
################
HOOK @ $80AD0338
{
    %CloneBones(0x6D, 0x7, r31)	#Green Alloy    
    lwz r4, 216(r29)
}
################
op NOP @ $80AD0AD4
################
HOOK @ $80AD0AE0
{
    %CloneBones(0x6D, 0x6, r4)	#Green Alloy    
    lwz r3, 4(r5)
    lwz r12, 8(r3)
}
################
CODE @ $80AD0B14
{
    nop 
    nop 
    nop 
}
################
#Yes, this is the only one that checks for Jigglypuff.
HOOK @ $80AD0B20
{
    %CloneBones(0x5, 0x197, r28)	#Jigglypuff
    %CloneBones(0x6D, 0x7, r28)	    #Green Alloy    
    lwz r3, 4(r5)
    lwz r12, 8(r3)
}
################
op NOP @ $80AD0B50
################
HOOK @ $80AD0B5C
{
    %CloneBones(0x6D, 0x6, r4)	#Green Alloy    
    lwz r3, 4(r5)
    lwz r12, 8(r3)
}
################
op NOP @ $80AD0D88
################
HOOK @ $80AD0D94
{
    %CloneBones(0x6D, 0x6, r4)	#Green Alloy    
    lwz r3, 4(r5)
    lwz r12, 8(r3)
}
################
op NOP @ $80AD13F8
################
HOOK @ $80AD1404
{
    %CloneBones(0x6D, 0x6, r4)	#Green Alloy    
    lwz r3, 4(r5)
    lwz r12, 8(r3)
}
################
HOOK @ $80AD1628
{
    %CloneBones(0x6D, 0x7, r28)	#Green Alloy    
    lwz r4, 216(r29)
}
################
HOOK @ $80AD1698
{
    %CloneBones(0x6D, 0x7, r28)	#Green Alloy    
    lwz r4, 216(r29)
}
################
HOOK @ $80AD17D8
{
    %CloneBones(0x6D, 0x7, r31)	#Green Alloy    
    lwz r4, 216(r29)
}
################
HOOK @ $80AD1848
{
    %CloneBones(0x6D, 0x7, r31)	#Green Alloy    
    lwz r4, 216(r29)
}
##################################################
Puff Clone 6D's Max Charge GFX is 0130000F [Codes]
###################################################
.Macro CloneGFX(<CloneID>,<GFXID>,<GFXID2>,<WriteRegister>)
{
  cmpwi r3, <CloneID>
  bne+ 0xC
  lis <WriteRegister>, <GFXID>
  addi <WriteRegister>, <WriteRegister>, <GFXID2>
}
################
CODE @ $80ACB668
{
    lis r29, 0x26
    addi r29, r29, 0x2
    bne- 0xC
    lis r29, 0x126
    addi r29, r29, 0x1
}
HOOK @ $80ACB67C
{
    %CloneGFX(0x6D, 0x130, 0xF, r29)	#Green Alloy    
    lwz r3, 8(r30)
}
################
CODE @ $80ACD1D8
{
    lis r4, 0x26
    addi r4, r4, 0x2
    bne- 0xC
    lis r4, 0x126
    addi r4, r4, 0x1
}
HOOK @ $80ACD1EC
{
    %CloneGFX(0x6D, 0x130, 0xF, r4)	#Green Alloy   
      lfs f0, 4(r31)
}
################
CODE @ $80ACEE54
{
    lis r4, 0x26
    addi r4, r4, 0x2
    bne- 0xC
    lis r4, 0x126
    addi r4, r4, 0x1
}
HOOK @ $80ACEE68
{
    %CloneGFX(0x6D, 0x130, 0xF, r4)	#Green Alloy  
    lfs f0, 4(r31)
}
################

################################################
Puff Clone 6D Has Different Roll SFX [Codes]
################################################
#Logic changed to suit macro [Desi]
#Previous, it checked the CloneID. If it wasn't the Clone Id, it'd write Jigglypuffs
#Now it manualy checks Jigglypuff and any clones.
.Macro CloneSFX(<CloneID>,<SFXID>,<ComparisonRegister>)
{
  cmpwi <ComparisonRegister>, <CloneID>
  bne+ 0x8
  lis r4, 0
  ori r4, r4, <SFXID>
}
################
HOOK @ $80ACAE38
{
  stwu r1, -12(r1)
  stw r3, 8(r1)
  lwz r3, 216(r30)
}
################
HOOK @ $80ACAE3C
{
    lwz r4, 8(r1)
    %CloneSFX(0x5, 0x17A1, r4)	#Jigglypuff
    %CloneSFX(0x6D, 0xC43, r4)	#Green Alloy  
}
################
HOOK @ $80ACAE60
{
    lwz r4, 8(r1)
    lwz r1, 0(r1)
    %CloneSFX(0x5, 0x9B5, r4)	#Jigglypuff
    %CloneSFX(0x6D, 0xFFFF, r4)	#Green Alloy  
}
################
op NOP @ $80ACF700
################
HOOK @ $80ACF704
{
    %CloneSFX(0x5, 0x179F, r3)	#Jigglypuff
    %CloneSFX(0x6D, 0xC41, r3)	#Green Alloy  
    lwz r3, 216(r31)
}
################
op NOP @ $80ACA098
################
HOOK @ $80ACA09C
{
    %CloneSFX(0x5, 0x17A0, r3)	#Jigglypuff
    %CloneSFX(0x6D, 0xC42, r3)	#Green Alloy  
    lwz r3, 216(r30)
}
################