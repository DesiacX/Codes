######################################
Player ID instead of Character ID used in Results Screen [Desi]
######################################
op stb r5, 0x34 (r6) @ $80954828   #Game stores Player ID instead of Character ID
op addi r0, r5, 0x1 @ $800E8b28    #Adds 1 to the Player ID, This is where the game would have loaded the Costume ID and added it to the player ID.
op stb r4, 0xFC (r6) @ $80954860    #Above is for KOs, this is for Falls. Character killed is in R5, character who performed the kill is in R4.
op addi r0, r5, 0x1 @ $800E8C24

######################################
!Disable first page of Results Display [Desi]
######################################
#Nuclear Option, disabled. This disables the entire page.
op NOP @ $800EC104