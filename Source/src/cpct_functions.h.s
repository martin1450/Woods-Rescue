;;----------------------------------------------------------------------------------------
;;    This file is part of Woods Rescue 
;;    Copyright (C) 2019, Martin Quirante Berna, Monica Ramperez Andres, Maŕia Sanchez Tenias
;;
;;    This program is free software: you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;   the Free Software Foundation, either version 3 of the License, or
;;    (at your option) any later version.

;;    This program is distributed in the hope that it will be useful,
;;    but WITHOUT ANY WARRANTY; without even the implied warranty of
;;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;    GNU General Public License for more details.

;;    You should have received a copy of the GNU General Public License
;;    along with this program.  If not, see <https://www.gnu.org/licenses/>.
;;---------------------------------------------------------------------------------------

;;
;; CPCTELERA FUNCTIONS
;;

.globl cpct_disableFirmware_asm
.globl cpct_setVideoMode_asm
.globl cpct_waitVSYNC_asm

.globl cpct_getScreenPtr_asm

.globl cpct_scanKeyboard_asm
.globl cpct_isKeyPressed_asm

.globl cpct_drawSprite_asm
.globl cpct_setPalette_asm
.globl cpct_drawSolidBox_asm

.globl cpct_memset_asm

.globl cpct_zx7b_decrunch_s_asm
.globl cpct_etm_setDrawTilemap4x8_ag_asm
.globl cpct_etm_drawTilemap4x8_ag_asm