####################################################################
Conditionally Load CSPs from RSP files [Phantom Wings, DukeItOut, Desi]
####################################################################
#INSTALLATION INSTRUCTIONS (Assuming vanilla P+ Installation)
# 1. Ctrl + F in RSBE01.txt for "AltCostume". 
# Use .include to add this file to the codeset below the AltCostume.asm.
# 2. Adjust the RSPThreshold.
##########################
.alias RSPThreshold = 0x5
##########################
# This is the ammount of costumes you need to scroll before the RSP is loaded. 
# The Costumes below the threshold need to be in both the Selchar and RSP file.
# The default is 5, to catch most team costumes. Reducing to 0 works for FFA, but will load RSP alot on Team Battles.
# 3. Drag/Drop RSBE01.txt over GCTRealMate to compile the codset.
####################################################################
# Accesses portrait files from the results screen files 
# instead of sc_selcharacter.pac, at the cost of performance
#
# Likely will improve in speed if the first costume for characters
# are coded to be loaded from the CSPs and the RSPs are loaded for 
# other values. <---- We are here [Desi].
#
# Note that additional code work applied to this will need to be done
# to remove skin limitations, unfortunately, which has not been done
# yet!
####################################################################

HOOK @ $80693960
{
  mr r4, r31
  stwu r1, -0x110(r1)
  stw r31, 0x10C(r1)
  stw r30, 0x108(r1)
  stw r3,  0x104(r1)
  mr r30, r3
  cmpwi r24, RSPThreshold	#\Check if Costume Slot is between 0-5. 
  ble- loc_0xC0				#/If it is, Use CSP from sc_Selchar
  lis r3, 0x804E			#\Check if this character ID already has an RSP file loaded.
  ori, r3, r3, 0x41FF		#|
  lbzx r4, r3, r23			#|
  cmpw r4, r30				#|
  beq- Already_Loaded		#/
  stbx r30, r3, r23			#|Store character ID to tell game this is loaded (Cleared when CSS is exited)
  addi r3, r1, 0xA0
  lis r4, 0x8040
  ori r4, r4, 0x6920
  lis r12, 0x803F			# \ 
  ori r12, r12, 0x89FC		# | Write string of modname folder
  mtctr r12					# |
  bctrl 					# /
  add r3, r1, r3
  lis r4, 0x7066
  stw r4, 0xA0(r3)
  addi r3, r3, 0xA2
  lis r4, 0x8045
  ori r4, r4, 0x6ED0
  mr r5, r30
  lis r12, 0x803F			# \
  ori r12, r12, 0x89FC		# | Write string "/menu/common/char_bust_tex/MenSelchrFaceB%02d0.brres"
  mtctr r12					# |
  bctrl 					# /
  addi r3, r1, 0x8
  addi r4, r1, 0xA0
  lwz r5, 0x438(r31)
  li r6, 0x0
  li r7, 0x0
  lis r12, 0x8002			# \
  ori r12, r12, 0x239C		# | Set up this file to be read.
  mtctr r12					# |
  bctrl 					# /
  addi r3, r1, 0x8
  lis r12, 0x8001			# \
  ori r12, r12, 0xCBF4		# | Read it from the SD card.
  mtctr r12					# |
  bctrl 					# /
  cmpwi r3, 0x0
  
  bne- loc_0xC0
  
  Already_Loaded:
  lwz r3, 0x438(r1)
  lwz r30, 0x108(r1)
  lwz r31, 0x10C(r1)
  lwz r1, 0(r1)
  lis r12, 0x8069
  ori r12, r12, 0x3988
  mtctr r12
  bctr 

loc_0xC0:
  lwz r30, 0x108(r1)
  lwz r31, 0x10C(r1)
  lwz r3,  0x104(r1)
  lwz r1, 0(r1)
  lis r4, 0x1
}

####################################################################
Reset RSP Loaded and Character Selected Flags [Desi]
#In Load CSPs from RSP Files, i modified it to store whether or not 
#the RSP File for a character is loaded. This clears that flag.
#This also clears the Character Selected Flags used for Do not allow costume scrolling.
####################################################################
HOOK @ $800AFC2C
{
	lis r3, 0x804E			#\Clear Flags
	ori, r3, r3, 0x4200		#|
	lis r4, 0xFFFF			#|
	ori r4, r4, 0xFFFF		#|
	stw r4, 0(r3)			#/
	stw r4, 4(r3)			#/
	li r3, 428				#Original Function
	li r4, 42				#Overwritten thing restored to original
}

###################################################################
!Do not allow costume scrolling if Character Loaded Flag is not set [Desi]
#Disabled by default. Delete the exclamation point at the start of the title to enable.
#If you have friends that do everything in their power to freeze your game by mashing stuff on the CSS, this is for you.
#This expects the Hold L/R to Increment code and skips past it too.
####################################################################
HOOK @ $8069A260
{
	lwz r26, 0x01BC (r31)	#|Original Function 1
	lis r7, 0x804E			#\
	ori, r7, r7, 0x4204		#|Load Character Slected Flag
	lbzx r7, r7, r29		#|
	cmpw r7, r30			#/
	lwz r7, 0X0648 (r8)		#|Original Function 2
}
op bne- 0x14 	@ $8069A264	#If character isn't selected, do not costume scroll.

HOOK @ $8069A374
{
	lwz r26, 0x01BC (r31)	#|Original Function 1
	lis r7, 0x804E			#\
	ori, r7, r7, 0x4204		#|Load Character Slected Flag
	lbzx r7, r7, r29		#|
	cmpw r7, r30			#/
	lwz r7, 0X0648 (r8)		#|Original Function 2
}
op bne- 0x10 	@ $8069A378	#If character isn't selected, do not costume scroll.


#Set Character Selected Flags
#These flags state that a character has been selected.
#This occurs immedietly following Melee Random.
HOOK @ $8068AE1C
{
	lis r4, 0x804E
	ori, r4, r4, 0x4204	
	li r3, 0x4
	divw r3, r0, r3	
	stbx r27, r4, r3
	cmpwi r27, 40
}

#Reset Flags if Character is Unselected
HOOK @ $80689788
{
	lis r27, 0x804E			#\
	ori, r27, r27, 0x4204	#|Load Character Selected Flag
	lbzx r28, r27, r30		#/
	cmpw r28, r31
	beq- Original_Function
	li r29, 0xFF
	stbx r29, r27, r30
	Original_Function:
	addi r11, r1, 0x40
}

#one of the four lines from Pick Any Color You Want [Igglyboo]
op nop @ $80696FD4




