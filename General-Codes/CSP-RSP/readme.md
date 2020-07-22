This code is a modification of CostumeAdditions.asm [PhantomWings, DukeItOut] from Project+ to reduce the ammount of times the RSP is loaded. 

The current version uses an RSP Threshold to determine when to load the RSP file. Anything below the RSP Threshold will use the CSP's from the sc_selcharacter. Anything above the RSP Threshold will load the RSP File, asuming it isn't already loaded, and use the RSP.
