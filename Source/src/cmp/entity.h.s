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
;; Macro que define las entidades
;;

.macro DefineCmp_Entity _x, _y, _vx, _vy, _w, _h, _pspr, _vida, _aist, _tip, _patr, _anim_ptr, _anim_st
	.db _x, _y
	.db _vx, _vy
	.db _w, _h
	.dw _pspr
	.db _vida
	.dw 0xC054
	.db 0x00, 0x00 ;; Objetivo
	.db _aist	   ;; IA Estado
	.db _aist	   ;; IA Estado previo
	.dw _patr      ;; Siguiente patrol step     ¡¡METERLO COMO PARAMETRO!!
	.db _tip       ;; Tipo de enemigo
	.db 0x00       ;; Trigger (1-activo, 0-no activo)
	.db _x, _y
	.dw _anim_ptr  
	.db _anim_st
.endm


;; Constantes para acceder a las posiciones

e_x 		       =  0   ;; Posicion en x
e_y 		       =  1   ;; Posicion en y
e_vx 		       =  2   ;; Velocidad en x
e_vy		       =  3   ;; Velocidad en y
e_w 		       =  4   ;; Ancho
e_h 		       =  5   ;; Alto
e_pspr_l           =  6   ;; 
e_pspr_h	       =  7   ;; Puntero a spritee_ai_st 
e_vida             =  8
e_lastVP_l         =  9   ;;
e_lastVP_h         =  10  ;; Puntero a la ultima posicion de memoria de video
e_ai_aim_x         =  11  ;;
e_ai_aim_y         =  12  ;; Objetivo
e_ai_st            =  13  ;; Estado IA
e_ai_pre_st        =  14  ;; Estado IA previo
e_ai_patrol_step_l =  15  ;;
e_ai_patrol_step_h =  16  ;; Puntero al patrol step
e_ai_tipo          =  17  ;; Tipo de enemigo
e_ai_trigger       =  18  ;; Trigger activado o no
e_ai_sb_x          =  19  ;; Posicion x donde descansan los lobos
e_ai_sb_y          =  20  ;; Posicion y donde descansan los lobos
e_anim_ptr_l  	   =  21 ;; Puntero a la animación
e_anim_ptr_h 	   =  22
e_anim_st 		   =  23

sizeof_e           =  24   ;; Tamaño de la entidad


num_max_balas = 3

nullptr= 0x0000

;; Estado de la IA
e_ai_st_noAI      = 0
e_ai_st_stand_by  = 1
e_ai_st_move_to   = 2
e_ai_st_patrol    = 3
e_ai_st_follow    = 4
e_ai_st_calm      = 5


;; Tipos de enemigos
e_null             = 0
e_ai_tipo_arbol    = 1
e_ai_tipo_camaleon = 2
e_ai_tipo_ave      = 3
e_ai_tipo_ave2     = 4
e_ai_tipo_lobo     = 5

;; ANIMACIONES
e_anim_st_noAnim       = 0x0000
e_anim_noStatus 	     = 0x00

;;Estados de animacion
e_anim_st_standing      = 0
e_anim_st_walking_up    = 1
e_anim_st_walking_down  = 2

;; Estados de bala
e_anim_st_bala_up      = 0
e_anim_st_bala_down    = 1
e_anim_st_bala_right   = 2
e_anim_st_bala_left    = 3	


.macro DefineCmp_Entity_default
	DefineCmp_Entity 0, 0, 0, 0, 1, 1, 0, 0, e_ai_st_noAI, 0, 0, e_anim_st_noAnim, e_anim_noStatus
.endm