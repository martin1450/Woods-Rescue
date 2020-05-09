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

.include "cmp/entity.h.s"
.include "man/entity.h.s"
.include "cpctelera.h.s"
.include "cpct_functions.h.s"

.module sys_entity_physics


;; Constantes
screen_width = 80
screen_height = 200

bucle: .db 0 ;; El numero de entidades distintas que tenemos en el array


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sys_physics_init
;;-----------------------------------------------------------
;; Inicializa el sistema de fisicas
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sys_physics_init::
	ld a, #3
	ld (bucle), a
ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sys_physics_update
;;-----------------------------------------------------------
;; Actualiza la fisica de todas las entidades
;;-----------------------------------------------------------
;; ENTRADA:
;;    IX: Puntero al array de entidades
;;	   A: Numero de entidades en el array
;; DESTRUYE: AF, BC, DE, IX
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sys_physics_update::

;; Miramos el valor de a y en funcion de este le pasamos a ix el puntero apuntando a balas, enemigos o personaje
	_update_loop:

			ld a , (bucle)

			cp #3
			jr nz, comp2

			call man_entity_getPers
			ld b, a
			call man_collision_check
			cp #1
			jr z, rei

			push bc
			call man_collision_map
			pop bc
			jr loop

			rei:
			call man_level_restart
			jp final

			comp2:
			cp #2
			jr nz, comp1

			call man_entity_getBalas
			ld b, a
			cp #0
			jp z, salta
			jr loop

			comp1:
			cp #1
			jp nz, final

			call man_entity_getEnem
			ld b, a
			cp #0
			jp z, salta

        ;; Aqui empieza el bucle fisicas, ix apunta al bucle 

			loop:
			call sys_physics_life
			cp #50
			jp z, endif_y

			ld a, (bucle)
			cp #1
			jr nz, balas

			call man_collision_check2
			cp #1
			jr z, rei2
		    push bc
			call man_collision_map
			pop bc
			jp actual

			rei2:				
			call man_level_restart
			jp final
			
			balas:

			ld a, (bucle)
			cp #2
			jr nz, actual

			call sys_physics_collision
			cp #1
			jp z, salta

			push bc
			call man_collision_bala
			pop bc
			cp #1
			jr nz, actual

			push bc
			ld a, #1
			call man_entity_destroy
			pop bc
			jp endif_y

		actual:

		;; Actualizamos X
			ld    a, #screen_width + 1    ;; Al ancho de la pantalla + 1
			sub   e_w(ix)                 ;; le restamos el ancho de la entidad = posicion limite      
			ld    c, a

			ld    a, e_x(ix)              ;; A la posicion en x le añadimos la velocidad en x,
			add   e_vx(ix)                ;; es decir, sumamos la velocidad
			cp    c                       ;; Comparamos con la posicion limite para ver si la 
			jr   nc, invalid_x            ;; nueva x es valida o no
		valid_x:
				ld   e_x(ix), a           ;; Si es valida la guardamos
				jr   endif_x
		invalid_x:

				ld   a, (bucle)
				cp #3
				jr z, prota

				ld   a, e_vx(ix)
				neg
				ld   e_vx(ix), a          ;; Si no es valida, no guardamos x y cambiamos la velocidad
				jr endif_x

				prota:
				call sys_physics_check
				call man_level_next
				jp final

		endif_x:

		;; Actualizamos Y
			ld    a, #screen_height+1
			sub   e_h(ix)
			ld    c, a

			ld    a, e_y(ix)
			add   e_vy(ix)
			cp    c
			jr   nc, invalid_y
		valid_y:
				ld e_y(ix), a
				jr endif_y
		invalid_y:
				ld a, e_vy(ix)
				neg
				ld e_vy(ix),a
		endif_y:


		;; Con esto nos movemos dentro de las entidades, por ejemplo dentro de los enemigos
		dec b
		jr z, salta

		ld de, #sizeof_e
		add ix, de
		jp  loop


	;; Con esto pasamos de hacer el bucle con una entidad a otra, por ejemplo pasamos de recorrerlo con balas a recorrerlo con enemigos
	salta:

	ld a , (bucle)
	dec a
	ld (bucle), a
	jp _update_loop

	final:

	ld a, #3
	ld (bucle), a
	ret

sys_physics_life::
	
	ld a, e_vida(ix)
	cp #0
	ret z

	dec a
	ld e_vida(ix), a
	ret nz

	push bc
	ld a, #1
	call man_entity_destroy
	pop bc
	ld a, #50
	ret


sys_physics_collision::

	call man_collision_check
	cp #1
	ret nz

	push bc
	push ix
	ex de, hl
	ld__ixh_d                    ;; Estas instrucciones 
	ld__ixl_e                    ;; hacen IX = DE
	ld a, #2
	call man_entity_destroy
	pop ix

	ld a, #1
	call man_entity_destroy
	pop bc
	ld a, #1
	ret

sys_physics_check::

	ld a, e_vx(ix)
	cp #1
	jr nz, izquierda

	ld a, e_y(ix)
	sbc #93
	jr nc, menos 

	ld a, #1
	ret

	menos:
	ld a, #2
	ret

	izquierda:

	ld a, e_y(ix)
	sbc #93
	jr nc, menos2

	ld a, #3
	ret

	menos2:
	ld a, #4
	ret
