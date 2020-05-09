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
.include "cmp/entity.h.s"
.include "sys/physics.h.s"
.include "sys/input.h.s"
.include "sys/render.h.s"
.include "sys/aicontrol.h.s"
.include "man/entity.h.s"
.include "assets/assets.h.s"
.include "cmp/array_structure.h.s"
.include "man/level.h.s"
.include "cmp/level.h.s"

.module game_manager


;; Definicion del personaje
hero:: DefineCmp_Entity  30, 100,   1,   2, 0x04, 0x10, _sp_hero_09, 0, e_ai_st_noAI, 0, no_patrol, _hero_standing, e_anim_st_standing	

state:: .db 0
state2:: .db 0

check:: .db 0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  man_game_init
;;-----------------------------------------------------------
;; Inicializa los managers y sistemas, carga el personaje y
;; el primer nivel, muestra la pantalla de inicio y cuando
;; comienza el juego dibuja el mapa del nivel base
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
man_game_init::
	call man_entity_init
	call man_level_init
	call sys_ai_control_init
	call sys_physics_init
	call sys_input_init 
	call sys_eren_init                      ;; Sistemas inicializados    

	ld    hl, #hero
	ld     a, #0                  
	call man_entity_create                  ;; Creamos el personaje
	call sys_animation_init

	call man_level_all                      ;; Cargamos los niveles

	call sys_eren_pressstart              	;; Pantalla de inicio
	call sys_input_pressstart
	call sys_eren_cleanscreen

	call man_level_map                  	;; Dibujo del nivel base
ret



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  man_game_update
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
man_game_update::
	call man_game_check
	cp #0
	jr nz, end
	call sys_input_update
	call sys_physics_update
	call sys_ai_control_update
	call sys_animation_update
	call man_level_update
	ret

	end:
	ld a, (state2)
	cp #2
	ret nz
	call sys_animation_update
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  man_game_render
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
man_game_render::
	call sys_eren_update
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  man_game_change
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
man_game_change::	
	ld a, #50
	ld (state), a
	ld a, #1
	ld (state2), a
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  man_game_change2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
man_game_change2::	
	ld a, #110
	ld (state), a
	ld a, #2
	ld (state2), a
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  man_game_check
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
man_game_check::	
	ld a, (state)
	cp #0
	ret z

	dec a
	ld (state), a
	cp #0
	ret nz

	ld a, (state2)
	cp #2
	jr z, dos

	call man_level_next
	ld a, #1
	ret

	dos:
	call sys_eren_setupBoy
	call man_level_restart
	ld a, #1
	ret

man_game_stop::

	ld a, #1
	ld (check), a
	ret


man_game_comp::
	ld a, (check)
	ret
ret