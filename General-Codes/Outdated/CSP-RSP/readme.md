## Conditionally Load CSPs from RSP files

This code is a modification of CostumeAdditions.asm [PhantomWings, DukeItOut] from Project+ to reduce the ammount of times the RSP is loaded. 

The current version uses an RSP Threshold to determine when to load the RSP file. Anything below the RSP Threshold will use the CSP's from the sc_selcharacter. Anything above the RSP Threshold will load the RSP File, asuming it isn't already loaded, and use the RSP.

Loading an RSP file causes a small blip of lag. Previous versions of RSP Loading codes would load for each character as you hovered over them, causing noticable lag when selecting characters and costumes. By having an RSP Threshold of 5, Costumes 0-5 will load normally through the sc_selcharacter, loading and switching to the RSP file on Costumes 6+. This eliminates most of the lag from earlier versions in both FFA and Team mode.
