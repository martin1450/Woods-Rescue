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
;; Macro que define los niveles
;;

.macro DefineCmp_Level _tile, _grupo, _enem, _next
	.dw _tile
	.db _grupo
	.dw _enem
	.db _next
.endm


;; Constantes para acceder a las posiciones

e_p_tile_l  =  0   ;; 
e_p_tile_h	=  1   ;; Puntero a array de enemigos
e_grupo     =  2   ;; Superado o no
e_p_enem_l  =  3   ;; 
e_p_enem_h	=  4   ;; Puntero a array de enemigos
e_num 		=  5   ;; 0 -> nivel base
				   ;; 1 -> continua
				   ;; 2 -> vuelve al nivel base

sizeof_l    =  6   ;; Tamaño del nivel
sizeof_3l   = sizeof_l * 15

.macro DefineCmp_Level_default
	DefineCmp_Level 0xADDE, 0x00, 0xEFBE, 0xFF
.endm