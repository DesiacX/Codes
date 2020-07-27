######################################################################################
Salty Re-Roll V(-1) [Desi]
######################################################################################
#This is for use with Stage Expansion System Neo, but should work elsewhere.
#Because of the ammount of time spent writing the original v0.9/v1, i'm leaving it here, but commented.
#It turns out that setting Oshtoby's Song Forcer address to 0 forces a song re-roll.
#Apparently, Stage Expansion Neo has no issue grabbing Brawl Titles this way, likely because MyMusic chooses the song.

HOOK @ $806D4844
{
	cmpwi r5, 0			#\If R5 doesn`t equal Zero (It shouldn`t, i cound`nt find a place where it does)
	bne- end			#|Skip
	lis r4, 0x9018		#|
	ori r4, r4, 0x0F7E	#|
	sth r5, 0 (r4)‬		#/Store 0 at Oshtoby's Song Forcer.
	end:
	li r4, 0			#Original Code
}

#.macro StackFrame()
#{
#	stw r0, -4(r1)
#	mflr r0
#	stw r0, 4(r1)
#	mfctr r0
#	stw r0, -8(r1)
#	stwu r1, -132(r1)
#	stmw r3, 8(r1)
#}
#
#.macro ReturnStackFrame()
#{
#	lmw r3, 8(r1)
#	addi r1, r1, 0x84
#	lwz r0, -8(r1)
#	mtctr r0
#	lwz r0, 4(r1)
#	mtlr r0
#	lwz r0, -4(r1)
#}
#
#HOOK @ $806D4844
#{
#	%StackFrame	
#	lis r4, 0x8053			#\Obtain Tracklist Odds
#	ori r4, r4, 0xF200		#|
#	lwz r6, 0x4 (r4)		#|Number of Songs we need to loop for.
#	addi r4, r4, 0x10		#|
#    li r3, 0				#|
#Loop:						#|
#	lbz r7, 3 (r4)			#|Add all of the Tracklist's odds together
#	add r3, r3, r7			#|
#	subi r6, r6, 0x1		#|
#	addi r4, r4, 0x10		#|
#	cmpwi r6, 0				#|
#	beq- Loop_End			#|
#	b Loop					#|
#Loop_End:					#/
#
#	lis r4, 0x8003			#\Obtain Random Value from Tracklist's Odds
#	ori r4, r4, 0xFC7C		#|
#	mtctr r4				#|
#	bctrl					#/
#	
#	lis r4, 0x8053			#\Obtain Song ID
#	ori r4, r4, 0xF20C		#|	
#Song_Loop:
#	lbz r7, 7 (r4)			#|
#	cmpw r3, r7				#|
#	ble- Song_Chosen		#|BLE was chosen instead of BLT so i wouldn't have to think of any issues regarding tracklists with only 0's
#	subf r3, r7, r3			#|
#	addi r4, r4, 0x10		#|
#	b Song_Loop				#/
#
#Title:
#	lhz r5, 0 (r4)		#\Load Chosen Song ID, keep it for later
#	cmpw r5, 0x4000		#|If it's not a brawl ID, we can skip this.
#	bgt- Song_Chosen	#|
#	lbz r6, 0xB (r4)	#|Load Song Title Offset
#	ori r4, r4, 0xF200	#|
#	lbz r7, 0xB (r4)	#|Load Tracklist Title Offset
#	add r4, r4, r6		#|
#	add r4, r4, r7		#|Complete Title Address
#	lis r6, 0x8053		#|
#	ori r6, r6, 0xEFD8	#|
#	stw r4, 0 (r6)		#/Set Title
#	
#	
#
#Song_Chosen:
#	lis r3, 0x9018		#\Store the chosen song at Oshtoby's Song 
#	ori r3, r3, 0x0F7E	#|
#	sth r5, 0 (r3)‬		#/
#	%ReturnStackFrame	
#	li r4, 0			#Original Code
#}
