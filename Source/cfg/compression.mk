##-----------------------------LICENSE NOTICE------------------------------------
##  This file is part of CPCtelera: An Amstrad CPC Game Engine 
##  Copyright (C) 2018 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
##
##  This program is free software: you can redistribute it and/or modify
##  it under the terms of the GNU Lesser General Public License as published by
##  the Free Software Foundation, either version 3 of the License, or
##  (at your option) any later version.
##
##  This program is distributed in the hope that it will be useful,
##  but WITHOUT ANY WARRANTY; without even the implied warranty of
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##  GNU Lesser General Public License for more details.
##
##  You should have received a copy of the GNU Lesser General Public License
##  along with this program.  If not, see <http://www.gnu.org/licenses/>.
##------------------------------------------------------------------------------
############################################################################
##                        CPCTELERA ENGINE                                ##
##                 Automatic compression utilities                        ##
##------------------------------------------------------------------------##
## This file is intended for users to automate the generation of          ##
## compressed files and their inclusion in users' projects.               ##
############################################################################

## COMPRESSION EXAMPLE (Uncomment lines to use)
##

## First 3 calls to ADD2PACK add enemy, hero and background
## graphics (previously converted to binary data) into the 
## compressed group 'mygraphics'. After that, call to PACKZX7B
## compresses all the data and generates an array with the result
## that is placed in src/mygraphics.c & src/mygraphics.h, ready
## to be included and used by other modules.
##
#$(eval $(call ADD2PACK,mygraphics,gfx/enemy.bin))
#$(eval $(call ADD2PACK,mygraphics,gfx/hero.bin))
#$(eval $(call ADD2PACK,mygraphics,gfx/background.bin))
#$(eval $(call PACKZX7B,mygraphics,src/))

$(eval $(call ADD2PACK,tsetpack,src/sprites/sp.bin))
$(eval $(call PACKZX7B,tsetpack,src/compression))

$(eval $(call ADD2PACK,iniciopack,src/tilemaps/inicio.bin))
$(eval $(call PACKZX7B,iniciopack,src/compression))

$(eval $(call ADD2PACK,finpack,src/tilemaps/fin.bin))
$(eval $(call PACKZX7B,finpack,src/compression))

$(eval $(call ADD2PACK,levelpack0,src/tilemaps/level0.bin))
$(eval $(call PACKZX7B,levelpack0,src/compression))

$(eval $(call ADD2PACK,levelpack11,src/tilemaps/level11.bin))
$(eval $(call PACKZX7B,levelpack11,src/compression))
$(eval $(call ADD2PACK,levelpack12,src/tilemaps/level12.bin))
$(eval $(call PACKZX7B,levelpack12,src/compression))
$(eval $(call ADD2PACK,levelpack13,src/tilemaps/level13.bin))
$(eval $(call PACKZX7B,levelpack13,src/compression))
$(eval $(call ADD2PACK,levelpack14,src/tilemaps/level14.bin))
$(eval $(call PACKZX7B,levelpack14,src/compression))
$(eval $(call ADD2PACK,levelpack15,src/tilemaps/level15.bin))
$(eval $(call PACKZX7B,levelpack15,src/compression))
$(eval $(call ADD2PACK,levelpack16,src/tilemaps/level16.bin))
$(eval $(call PACKZX7B,levelpack16,src/compression))
$(eval $(call ADD2PACK,levelpack17,src/tilemaps/level17.bin))
$(eval $(call PACKZX7B,levelpack17,src/compression))
$(eval $(call ADD2PACK,levelpack18,src/tilemaps/level18.bin))
$(eval $(call PACKZX7B,levelpack18,src/compression))
$(eval $(call ADD2PACK,levelpack19,src/tilemaps/level19.bin))
$(eval $(call PACKZX7B,levelpack19,src/compression))
$(eval $(call ADD2PACK,levelpack110,src/tilemaps/level110.bin))
$(eval $(call PACKZX7B,levelpack110,src/compression))
$(eval $(call ADD2PACK,levelpack111,src/tilemaps/level111.bin))
$(eval $(call PACKZX7B,levelpack111,src/compression))
$(eval $(call ADD2PACK,levelpack112,src/tilemaps/level112.bin))
$(eval $(call PACKZX7B,levelpack112,src/compression))
$(eval $(call ADD2PACK,levelpack113,src/tilemaps/level113.bin))
$(eval $(call PACKZX7B,levelpack113,src/compression))
$(eval $(call ADD2PACK,levelpack114,src/tilemaps/level114.bin))
$(eval $(call PACKZX7B,levelpack114,src/compression))
$(eval $(call ADD2PACK,levelpack115,src/tilemaps/level115.bin))
$(eval $(call PACKZX7B,levelpack115,src/compression))

$(eval $(call ADD2PACK,levelpack21,src/tilemaps/level21.bin))
$(eval $(call PACKZX7B,levelpack21,src/compression))
$(eval $(call ADD2PACK,levelpack22,src/tilemaps/level22.bin))
$(eval $(call PACKZX7B,levelpack22,src/compression))
$(eval $(call ADD2PACK,levelpack23,src/tilemaps/level23.bin))
$(eval $(call PACKZX7B,levelpack23,src/compression))
$(eval $(call ADD2PACK,levelpack24,src/tilemaps/level24.bin))
$(eval $(call PACKZX7B,levelpack24,src/compression))
$(eval $(call ADD2PACK,levelpack25,src/tilemaps/level25.bin))
$(eval $(call PACKZX7B,levelpack25,src/compression))
$(eval $(call ADD2PACK,levelpack26,src/tilemaps/level26.bin))
$(eval $(call PACKZX7B,levelpack26,src/compression))
$(eval $(call ADD2PACK,levelpack27,src/tilemaps/level27.bin))
$(eval $(call PACKZX7B,levelpack27,src/compression))
$(eval $(call ADD2PACK,levelpack28,src/tilemaps/level28.bin))
$(eval $(call PACKZX7B,levelpack28,src/compression))
$(eval $(call ADD2PACK,levelpack29,src/tilemaps/level29.bin))
$(eval $(call PACKZX7B,levelpack29,src/compression))
$(eval $(call ADD2PACK,levelpack210,src/tilemaps/level210.bin))
$(eval $(call PACKZX7B,levelpack210,src/compression))
$(eval $(call ADD2PACK,levelpack211,src/tilemaps/level211.bin))
$(eval $(call PACKZX7B,levelpack211,src/compression))
$(eval $(call ADD2PACK,levelpack212,src/tilemaps/level212.bin))
$(eval $(call PACKZX7B,levelpack212,src/compression))
$(eval $(call ADD2PACK,levelpack213,src/tilemaps/level213.bin))
$(eval $(call PACKZX7B,levelpack213,src/compression))
$(eval $(call ADD2PACK,levelpack214,src/tilemaps/level214.bin))
$(eval $(call PACKZX7B,levelpack214,src/compression))
$(eval $(call ADD2PACK,levelpack215,src/tilemaps/level215.bin))
$(eval $(call PACKZX7B,levelpack215,src/compression))

$(eval $(call ADD2PACK,levelpack31,src/tilemaps/level31.bin))
$(eval $(call PACKZX7B,levelpack31,src/compression))
$(eval $(call ADD2PACK,levelpack32,src/tilemaps/level32.bin))
$(eval $(call PACKZX7B,levelpack32,src/compression))
$(eval $(call ADD2PACK,levelpack33,src/tilemaps/level33.bin))
$(eval $(call PACKZX7B,levelpack33,src/compression))
$(eval $(call ADD2PACK,levelpack34,src/tilemaps/level34.bin))
$(eval $(call PACKZX7B,levelpack34,src/compression))
$(eval $(call ADD2PACK,levelpack35,src/tilemaps/level35.bin))
$(eval $(call PACKZX7B,levelpack35,src/compression))
$(eval $(call ADD2PACK,levelpack36,src/tilemaps/level36.bin))
$(eval $(call PACKZX7B,levelpack36,src/compression))
$(eval $(call ADD2PACK,levelpack37,src/tilemaps/level37.bin))
$(eval $(call PACKZX7B,levelpack37,src/compression))
$(eval $(call ADD2PACK,levelpack38,src/tilemaps/level38.bin))
$(eval $(call PACKZX7B,levelpack38,src/compression))
$(eval $(call ADD2PACK,levelpack39,src/tilemaps/level39.bin))
$(eval $(call PACKZX7B,levelpack39,src/compression))
$(eval $(call ADD2PACK,levelpack310,src/tilemaps/level310.bin))
$(eval $(call PACKZX7B,levelpack310,src/compression))
$(eval $(call ADD2PACK,levelpack311,src/tilemaps/level311.bin))
$(eval $(call PACKZX7B,levelpack311,src/compression))
$(eval $(call ADD2PACK,levelpack312,src/tilemaps/level312.bin))
$(eval $(call PACKZX7B,levelpack312,src/compression))
$(eval $(call ADD2PACK,levelpack313,src/tilemaps/level313.bin))
$(eval $(call PACKZX7B,levelpack313,src/compression))
$(eval $(call ADD2PACK,levelpack314,src/tilemaps/level314.bin))
$(eval $(call PACKZX7B,levelpack314,src/compression))
$(eval $(call ADD2PACK,levelpack315,src/tilemaps/level315.bin))
$(eval $(call PACKZX7B,levelpack315,src/compression))

$(eval $(call ADD2PACK,levelpack41,src/tilemaps/level41.bin))
$(eval $(call PACKZX7B,levelpack41,src/compression))
$(eval $(call ADD2PACK,levelpack42,src/tilemaps/level42.bin))
$(eval $(call PACKZX7B,levelpack42,src/compression))
$(eval $(call ADD2PACK,levelpack43,src/tilemaps/level43.bin))
$(eval $(call PACKZX7B,levelpack43,src/compression))
$(eval $(call ADD2PACK,levelpack44,src/tilemaps/level44.bin))
$(eval $(call PACKZX7B,levelpack44,src/compression))
$(eval $(call ADD2PACK,levelpack45,src/tilemaps/level45.bin))
$(eval $(call PACKZX7B,levelpack45,src/compression))
$(eval $(call ADD2PACK,levelpack46,src/tilemaps/level46.bin))
$(eval $(call PACKZX7B,levelpack46,src/compression))
$(eval $(call ADD2PACK,levelpack47,src/tilemaps/level47.bin))
$(eval $(call PACKZX7B,levelpack47,src/compression))
$(eval $(call ADD2PACK,levelpack48,src/tilemaps/level48.bin))
$(eval $(call PACKZX7B,levelpack48,src/compression))
$(eval $(call ADD2PACK,levelpack49,src/tilemaps/level49.bin))
$(eval $(call PACKZX7B,levelpack49,src/compression))
$(eval $(call ADD2PACK,levelpack410,src/tilemaps/level410.bin))
$(eval $(call PACKZX7B,levelpack410,src/compression))
$(eval $(call ADD2PACK,levelpack411,src/tilemaps/level411.bin))
$(eval $(call PACKZX7B,levelpack411,src/compression))
$(eval $(call ADD2PACK,levelpack412,src/tilemaps/level412.bin))
$(eval $(call PACKZX7B,levelpack412,src/compression))
$(eval $(call ADD2PACK,levelpack413,src/tilemaps/level413.bin))
$(eval $(call PACKZX7B,levelpack413,src/compression))
$(eval $(call ADD2PACK,levelpack414,src/tilemaps/level414.bin))
$(eval $(call PACKZX7B,levelpack414,src/compression))
$(eval $(call ADD2PACK,levelpack415,src/tilemaps/level415.bin))
$(eval $(call PACKZX7B,levelpack415,src/compression))


############################################################################
##              DETAILED INSTRUCTIONS AND PARAMETERS                      ##
##------------------------------------------------------------------------##
##                                                                        ##
## Macros used for compression are ADD2PACK and PACKZX7B:                 ##
##                                                                        ##
##	ADD2PACK: Adds files to packed (compressed) groups. Each call to this ##
##  		  macro will add a file to a named compressed group.          ##
##  PACKZX7B: Compresses all files in a group into a single binary and    ##
##            generates a C-array and a header to comfortably use it from ##
##            inside your code.                                           ##
##                                                                        ##
##------------------------------------------------------------------------##
##                                                                        ##
##  $(eval $(call ADD2PACK,<packname>,<file>))                            ##
##                                                                        ##
##		Sequentially adds <file> to compressed group <packname>. Each     ##
## call to this macro adds a new <file> after the latest one added.       ##
## packname could be any valid C identifier.                              ##
##                                                                        ##
##  Parameters:                                                           ##
##  (packname): Name of the compressed group where the file will be added ##
##  (file)    : File to be added at the end of the compressed group       ##
##                                                                        ##
##------------------------------------------------------------------------##
##                                                                        ##
##  $(eval $(call PACKZX7B,<packname>,<dest_path>))                       ##
##                                                                        ##
##		Compresses all files in the <packname> group using ZX7B algorithm ##
## and generates 2 files: <packname>.c and <packname>.h that contain a    ##
## C-array with the compressed data and a header file for declarations.   ##
## Generated files are moved to the folder <dest_path>.                   ##
##                                                                        ##
##  Parameters:                                                           ##
##  (packname) : Name of the compressed group to use for packing          ##
##  (dest_path): Destination path for generated output files              ##
##                                                                        ##
############################################################################
##                                                                        ##
## Important:                                                             ##
##  * Do NOT separate macro parameters with spaces, blanks or other chars.##
##    ANY character you put into a macro parameter will be passed to the  ##
##    macro. Therefore ...,src/sprites,... will represent "src/sprites"   ##
##    folder, whereas ...,  src/sprites,... means "  src/sprites" folder. ##
##  * You can omit parameters by leaving them empty.                      ##
##  * Parameters (4) and (5) are optional and generally not required.     ##
############################################################################
