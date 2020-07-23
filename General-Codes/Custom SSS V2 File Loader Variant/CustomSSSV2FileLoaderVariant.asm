######################################################################################
Custom Stage Select Screen V2 File Loader Variant [Spunit, Phantom Wings, SOJ, Yohan1044, DukeItOut, JOJI, Desi]
######################################################################################

op mr r0, r4				@ $806B8F5C # Access stage location in table
op lbzx r3, r3, r0			@ $806B8F64	# Entry variable is a byte, rather than a half
op rlwinm r0, r3, 1, 0, 30	@ $800AF618	# Access stage to load
op addi r4, r4, 2			@ $800AF68C	# Table entry size
op rlwinm r3, r3, 1, 0, 30	@ $800AF6AC	# \ Relates to loading the stage frame icon
op lbz r0, 1(r3)			@ $800AF6C0	# /
op li r3, -1				@ $800AF6E8	# Disables message?
op li r3, 0xC				@ $800AF59C	# Disables stage unlocking
CODE @ $800B91C8
{
	stmw r29, 0x14(r1)
	mr r31, r6
	mr r30, r5
	mr r29, r3
	cmpwi cr2, r5, -1
	beq- cr2, 0x14		
}

op lis r4, 0x8049 		@ $800AF58C
op lwz r4, 0x5D00(r4)	@ $800AF594
op lis r4, 0x8049		@ $800AF614
op lwz r4, 0x5D00(r4)	@ $800AF61C
op lis r4, 0x8049		@ $800AF66C
op lwz r4, 0x5D00(r4)	@ $800AF674
op lis r4, 0x8049		@ $800AF6A0
op lwz r4, 0x5D00(r4)	@ $800AF6A8
op lis r4, 0x8049		@ $800AF6D8
op lwz r4, 0x5D00(r4)	@ $800AF6E0

word 0x8054FD08 @ $80495D00	# Stage Index
word 0x8054FDC8 @ $80495D04	# Page 1
word 0x8054FE08 @ $80495D08	# Page 2
word 0x8054FE48 @ $80495D0C	# Page 3
word 0x8054FE88 @ $80495D10	# Page 4
word 0x8054FEC8 @ $80495D14	# Page 5

	.BA<-INDEXFILENAME
	.BA->$935CE498
	.BA<-PAGEFILENAME
	.BA->$935CE49C
	.RESET
	.GOTO->FileLoader
INDEXFILENAME:
		string "Project+/pf/stage/stagelist/Stage_Index.slst"
PAGEFILENAME:
		string "Project+/pf/stage/stagelist/Page_0.slst"		

FileLoader:

HOOK @ $806B098C
{
stw r0, -4(r1)         #\Stack Frame 
mflr r0                #|
stw r0, 4(r1)          #|
mfctr r0               #|
stw r0, -8(r1)         #|
stwu r1, -132(r1)      #|
stmw r3, 8(r1)         #/

lis r31, 0x935C			#\Setup File Loader at 935CE480
ori r31, r31, 0xE480	#|
lis r30, 0x935C			#|
ori r30, r30 0xE498		#|
lwz r30, 0(r30)			#|
stw r30, 0(r31)			#|
lis r30, 0x8054			#|
ori r30, r30 0xFD00		#|
stw r30, 12(r31)		#/

li r30, 0x0				#\Initialize Data
stw r30, 4(r31)			#|
stw r30, 8(r31)			#|
stw r30, 16(r31)		#/

mr r3, r31				#\Load File (Stage_Index)
lis r0, 0x8001			#|
ori r0, r0, 0xCBF4		#|
mtctr r0				#|
bctrl 					#/

lwz r31, 0(r31)			#\Setup Stage Count
lwz r30, 4(r31)			#|		
lis r31, 0x800A			#|
ori r31, r31, 0xF673	#|
stb r30, 0(r31)			#/

lis r31, 0x935C			#\Setup Page File Loader
ori r31, r31, 0xE480	#|
lis r30, 0x935C			#|
ori r30, r30 0xE49C 	#|
lwz r30, 0(r30)			#|
stw r30, 0(r31)			#/

Page_Loader_Loop:

lbz r3, 33(r30)	#\Setup Page Number
addi r3, r3, 1	#|
cmpwi r3, 0x36	#|
beq- end		#|
stb r3, 33(r30)	#/

lwz r30, 8(r31)		#\Setup File Loading Location
lwz r3, 12(r31)		#|Brawl is dumb. I don't know how it changes C0 into 80, but it does.
add r30, r30, r3	#|That's why this section is here.
stw r30, 12(r31)	#|I'm doing it myself.
li r3, 0			#|Then clearing it so brawl doesn't try.
stw r3, 8(r31)		#/

mr r3, r31				#\Load File (Page_X)
lis r0, 0x8001			#|
ori r0, r0, 0xCBF4		#|
mtctr r0				#|
bctrl 					#/

cmpwi r3, 1		#\If file failed to load, Cleanup anything from previous loads.
beq- Cleanup	#/

lwz r3, 4(r30)
lbz r31, 3(r30)

P1Check:
cmpwi r31, 0x31 ;bne- P2Check	#\Check each Page, and set the Stage Count accordingly
lis r31, 0x806B					#|
ori r31, r31, 0x929C			#|
stb r3, 0(r31)					#|
b- Page_Loader_Loop_Setup		#|

P2Check:
cmpwi r31, 0x32 ;bne- P3Check	#|
lis r31, 0x806B					#|
ori r31, r31, 0x92A4			#|
stb r3, 0(r31)					#|
b- Page_Loader_Loop_Setup		#|

P3Check:
cmpwi r31, 0x33 ;bne- P4Check	#|
lis r31, 0x8049					#|
ori r31, r31, 0x6002			#|
stb r3, 0(r31)					#|
b- Page_Loader_Loop_Setup		#|

P4Check:
cmpwi r31, 0x34 ;bne- P5		#|
lis r31, 0x8049					#|
ori r31, r31, 0x6003			#|
stb r3, 0(r31)					#|
b- Page_Loader_Loop_Setup		#|

P5:
lis r31, 0x8049					#|
ori r31, r31, 0x6004			#|
stb r3, 0(r31)					#|
b- end							#/

Page_Loader_Loop_Setup:
lis r30, 0x935C			#\Setup for Page Number after Loop
ori r30, r30 0xE49C 	#|
lis r31, 0x935C			#|
ori r31, r31, 0xE480	#|
lwz r30, 0(r30)			#/

b Page_Loader_Loop

Cleanup:

lis r30, 0x935C			#\Cleanup will cause SSSRES to read the pages as empty, even if a file was loaded there previously.
ori r30, r30 0xE49C 	#|
lwz r30, 0(r30)			#|
lbz r3, 33(r30)			#|
li r31, 0x30			#|
subf r3, r31, r3		#|
cmpwi r3, 0x2			#|If Page is 2, we have to do the thing elsewhere first
bne- Cleanup_Loop		#|
lis r30, 0x806B			#|
ori r30, r30, 0x92A4	#|
li r31, 0x0				#|
stb r31, 0(r30)			#|
Cleanup_loop:			#|
lis r30, 0x8049			#|
ori r30, r30, 0x6000	#|
add r30, r30, r3		#|
li r31, 0x0				#|
stb r31, 0(r30)			#|
addi, r3, r3, 0x1		#|
cmpwi r3, 0x6			#|
ble- Cleanup_loop		#/

end:

lis r30, 0x935C			#\Reset Page Number to 0
ori r30, r30 0xE49C 	#|
lwz r30, 0(r30)			#|
li r3, 0x30				#|
stb r3, 33(r30)			#/

lmw r3, 8(r1)			#\Return Stack Frame
addi r1, r1, 0x84		#|
lwz r0, -8(r1)			#|
mtctr r0				#|
lwz r0, 4(r1)			#|
mtlr r0					#|
lwz r0, -4(r1)			#/

li r4, 0x2A 			#Original function
}
