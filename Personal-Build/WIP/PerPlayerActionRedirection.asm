##########################################################
Per-Player Fighter.pac Redirection [Desi]
##########################################################
#The purpose of this code is to redirected the entire Fighter.pac Action elsewhere based on a per-player condition.
#The re-directed version needs the original Fighter.pac Action and the Injection built into it (Or injected into it).

.macro StackFrame()
{
	stw r0, -4(r1)
	mflr r0
	stw r0, 4(r1)
	mfctr r0
	stw r0, -8(r1)
	stwu r1, -132(r1)
	stmw r3, 8(r1)
}

.macro ReturnStackFrame()
{
	lmw r3, 8(r1)
	addi r1, r1, 0x84
	lwz r0, -8(r1)
	mtctr r0
	lwz r0, 4(r1)
	mtlr r0
	lwz r0, -4(r1)
}


HOOK @ $80780B24
{
	cmpwi r4, 0x18 				#Check the Action ID
	bne- end
	
	mr r12, r29					#\Get Player Port	
	rlwinm r12, r12, 16, 20, 31	#|

 end:
 	lwz r12, 0 (r3) #Original instruction.
}

