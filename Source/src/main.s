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

.include "cpctelera.h.s"
.include "cpct_functions.h.s"
.include "man/game.h.s"


.globl _song_menu

.module main

.area _DATA
.area _CODE

uncontador: .db 6
int_handler:
	
	push af
	push bc
	push de
	push hl

	ld a, (uncontador)
	dec a
	jr nz, cont

	zero:
	call man_game_comp
	cp #0
	jr nz, fin2
    call cpct_akp_musicPlay_asm
	ld a, #6

	cont:
	ld (uncontador), a
	
	fin:
	pop hl
	pop de
	pop bc
	pop af

	ei
	reti

	fin2:
	call cpct_akp_stop_asm
	jp fin

set_int_handler:
	
	ld hl, #0x38
	ld (hl), #0xC3
	inc hl
	ld (hl), #<int_handler
	inc hl
	ld (hl), #>int_handler
	inc hl
	ld (hl), #0xC9
	ret

_main::

   ;; Deshabilitamos el firmware
   ;;call cpct_disableFirmware_asm
   call set_int_handler

   ld de, #_song_menu
   call cpct_akp_musicInit_asm
   ;; Inicializamos el juego
   call man_game_init

loop:

   ;; UPDATE
   call man_game_update


   call cpct_waitVSYNC_asm

   ;; RENDER
   call man_game_render




jr loop