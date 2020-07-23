#To be inserted at 8084D0A4
#Checks if the character is Mr.Game and Watch. if it isn't, end the code.
cmpwi r31, 0x12
bne- end

#Stack Frame
stw r7, 0x2F0 (r1)

#Load Filename's CostumeID and Check if 00 (Prevents editing of Dark/Special Costumes)
lhz r7, -0x5(r6)
cmpwi r7, 0x3030
bne- restore


#Costume 05-09 us 01 File
#If the CostumeID is less than 5, the Filename is not changed. Otherwise, Filename is 01.
cmpwi r23, 5
blt- 0x8
li r7, 0x3031

#Costume 10-15 us 01 File
#If the CostumeID is less than 10, the Filename is not changed. Otherwise, Filename is 02.
#Note: This seems like it's 6 costumes, but 12 doesn't count.
cmpwi r23, 10
blt- 0x8
li r7, 0x3032

#Costume 16-20 us 01 File
#If the CostumeID is less than 16, the Filename is not changed. Otherwise, Filename is 03.
cmpwi r23, 16
blt- 0x8
li r7, 0x3033


#Store Filename
sth r7, -0x5(r6)

restore:
lwz r7, 0x2F0 (r1)

end:
li r4, 3