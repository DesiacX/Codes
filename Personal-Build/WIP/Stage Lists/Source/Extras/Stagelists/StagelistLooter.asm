######################################################################################
Stagelist Looter [Desi]
######################################################################################

.BA<-FileName
.BA->$935CE480
.RESET
.GOTO->FileLoader

FileName:
    string "Project+/Source/Extras/Stagelists/LegacyMPStagelist.gct"	

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
lis r30, 0x8049			#|
ori r30, r30 0x5600		#|
stw r30, 12(r31)		#/

li r30, 0x0				#\Initialize Data
stw r30, 4(r31)			#|
stw r30, 8(r31)			#|
stw r30, 16(r31)		#/

mr r3, r31				#\Load File
lis r0, 0x8001			#|
ori r0, r0, 0xCBF4		#|
mtctr r0				#|
bctrl 					#/

lmw r3, 8(r1)			#\Return Stack Frame
addi r1, r1, 0x84		#|
lwz r0, -8(r1)			#|
mtctr r0				#|
lwz r0, 4(r1)			#|
mtlr r0					#|
lwz r0, -4(r1)			#/

li r4, 0x2A 			#Original function
}

PULSE
{
    lis r16, 0x8049
	ori r16, r16, 0x5D38
	stw r15, 0 (r16)
	blr
}
* 20495600 00D0C0DE     #GCTLink Lives
* 20495604 00D0C0DE
* 04001848 80495608
* 64000000 00000000

.RESET

PULSE       #Manual copy path to CSE because Gecko Registers hate me and string writing leaves a 0 at the end of the string breaking the purpose
{
    b post_storage
    nop
post_storage: 
    stw r14, 0x4 (r15)
    lis r14, 0x805A
    ori r14, r14, 0x7B00
    lis r6, 0x8049
    lwz r6, 0x5D34 (r6)
    cmpwi r6, 0
    beq Return          #Don't do this if the file isn't loaded yet
    lwz r16, 0 (r6)
    stw r16, 0 (r14)
    lwz r16, 4 (r6)
    stw r16, 4 (r14)
    lhz r16, 8 (r6)
    sth r16, 8 (r14)
Return:
    lwz r14, 0x4 (r15) 
    blr
}
.RESET