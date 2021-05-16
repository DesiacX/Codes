######################################################################################
StageListLoader [Desi]
######################################################################################

.BA<-FileName
.BA->$935CE480
.RESET
.GOTO->FileLoader

FileName:
    string "Project+/pf/stage/stagelist/Paths.hex"	

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