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
;; ANIMATION SYSTEM 
;;

.include "cmp/entity.h.s"
.include "man/entity.h.s"
.include "cpctelera.h.s"
.include "cpct_functions.h.s"
.include "assets/assets.h.s"


.module sys_animation

bucle: .db 3
bucle2: .db 3

espera: .db 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sys_animation_init
;;-----------------------------------------------------------
;; Inicializa el sistema de animaciones
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sys_animation_init::
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
sys_animation_update::
;; me creo una constante



_main_loop:
	
	ld a , (bucle)

	cp #3
	jr nz, comp2

	call man_entity_getPers
	
	jr _loop

	comp2:
	cp #2
	jr nz, comp1

	call man_entity_getBalas
	jr 	_loop

	comp1:
	cp #1
	jp nz, final
	call man_entity_getEnem
	jr 	_loop
	 

	           ;; Guardamos el numero de entidades
				
		_loop:
				
				cp #0
				jp z, salta
				ld (_ent_counter), a 



				call calculateAnimStatus

				ld a, e_ai_tipo(ix)
				cp #e_ai_tipo_arbol
				jr nz, sigue

				ld a, e_ai_patrol_step_l(ix)
				cp #2
				jr nz, _newAnimationStatus


				sigue:					;;checkea que el etado de animaciones es igual que el anterior
				ld 	a, e_anim_st(ix)
				cp	b
				jr 	z, _equalAnim		;;si los estados son iguales continua

				_newAnimationStatus:		;;si no son iguales, establezco un estado distinto
				ld 	e_anim_st(ix), b


				ex 	de, hl

				ld a, e_ai_st(ix)          ;; comprobando su IA
			      cp #e_ai_st_noAI
			      jr z, _no_enemigo
			      
			      _enemigo:

				      ld a, e_ai_tipo(ix)               ;; Comprobamos de que tipo es
					cp #e_ai_tipo_arbol
					   ;;jr z, _enemigoAveyArbol
					   jr z, _enemigoArbol

					cp #e_ai_tipo_camaleon
					   jr z, _enemigoLoboyCamaleon

					cp #e_ai_tipo_ave
					   jr z, _enemigoAveyArbol

					cp #e_ai_tipo_lobo
					   jr z, _enemigoLoboyCamaleon
					   jr _continuo

					_enemigoLoboyCamaleon:
					call man_animations_getAnimEnemyLoboyCamaleon

					jr _continuo

					_enemigoArbol:

					ld a, e_ai_patrol_step_l(ix)
					cp #1
					jr z, _arbolEating
					jr _enemigoAveyArbol

					_arbolEating: 
					ld e_ai_patrol_step_l(ix), #2
					call man_animations_getAnimEnemArbolEating
					jr _continuo

					_enemigoAveyArbol:
					call man_animations_getAnimEnemyAveyArbol
					jr _continuo

				_no_enemigo:
					call man_animations_getAnimHL ;;nos devuelve en hl el puntero a la animacion

				_continuo:
				ld 	e_anim_ptr_l(ix), l
				ld 	e_anim_ptr_h(ix), h

				ex 	de, hl
				_equalAnim:

				ld 	e, e_anim_ptr_l(ix)
				ld 	d, e_anim_ptr_h(ix)

				ex 	de, hl

				_continueAnim: 			;; para volver a hacer la animacion

				ld 	c, (hl)			;;|| 
				inc 	hl 				;;|| bc next sprite	
				ld 	b, (hl)			;;|| 
		
				inc 	hl 				;; siempre tengo hl apuntando a la siguiente posicion

				ld 	a, c				;; si es 0 el sprite actual		
				or 	b				;; resetear animacion
				jr 	z, _resetAnim 		;;
				
	
				ld 	e_anim_ptr_l(ix), l
				ld 	e_anim_ptr_h(ix), h

				ld 	e_pspr_l(ix), c 		;; puntero al sprite siguiente
				ld 	e_pspr_h(ix), b 		;; puntero al sprite siguiente 
				
				ex 	de, hl

				call setSpriteFinal
					
					_ent_counter = .+1
					ld    a, #0                      
					dec   a
					jr z, salta

					ld  bc, #sizeof_e
					add ix, bc

				jp _loop

				
	salta:
	ld a , (bucle)
	dec a
	ld (bucle), a
	jp _main_loop

	final:

	ld a, #3
	ld (bucle), a
	ret

	_resetAnim:
			;; cargo en HL aquello a lo que apunta HL

			ld  	a, (hl) 				;;almaceno primer valor en a
			inc 	hl					;;incremento		
			ld 	h, (hl)				;;almaceno segundo valor en h
			ld 	l, a					;;almaceno el valor de a en l			
			jr 	_continueAnim

        ;; Aqui empieza el bucle animaciones, ix apunta al bucle 
      	calculateAnimStatus:

      		ld 	b, #0

      		ld 	a, e_vida(ix)
   			cp 	#0
   			jr    z, _esPersonaje
   			ld 	b, #0x10

   			_esPersonaje:
   			                   ;; Bucle que recorre los enemigos
		      ld a, e_ai_st(ix)          ;; comprobando su IA
		      cp #e_ai_st_noAI
		      jr z, _no_AI_ent
		      _AI_ent: 



		      ld a, e_ai_tipo(ix)               ;; Comprobamos de que tipo es
			cp #e_ai_tipo_arbol
			jr z, _enemigoLoboyArbol

			cp #e_ai_tipo_camaleon
			   jr z, _enemigoCamaleonyAve

			cp #e_ai_tipo_ave
			   jr z, _enemigoCamaleonyAve

			cp #e_ai_tipo_lobo
			   jr z, _enemigoLoboyArbol
			   jr _continuo

			_enemigoLoboyArbol:
			jr _no_AI_ent

			_enemigoCamaleonyAve:
			;call man_animations_getAnimEnemyAveyArbol
			ld 	b, #0x10
		     
		      _no_AI_ent:

	      	ld 	a, e_vx(ix)
	      	or 	a
	      	jr 	z, _vxzero

      	_vxnozero:
      		jp 	m, _vxnegative
      	_vxpositive:
      		set 	1, b
      		jr 	_vxzero
      	_vxnegative:
      		set 	0, b
      	_vxzero:
      	

      	;;calculo para la y
      		ld 	a, e_vy(ix)
	      	or 	a
	      	jr 	z, _vyzero

      	_vynozero:
      		jp 	m, _vynegative
      	_vypositive:
      		set 	2, b
      		jr 	_vyzero
      	_vynegative:
      		set 	3, b
      	_vyzero:
      	

      	ret

setSpriteFinal:


		ld a, e_ai_st(ix)          
		cp #e_ai_st_noAI
	      jr z, _no_IA_ent
	      
	      _IA_ent: 
	      
	      jr _velnozerox

	      _no_IA_ent:
		ld 	a, e_vx(ix)
		or 	a
		jr 	nz, _velnozerox

		_velzerox:
			
	   	ld 	a, e_vy(ix)
		or 	a
		jr 	nz, _velnozeroy

		_velzeroy:
		call 	man_entity_getDirecX
		cp 	#1
		jp 	z, _vamosAlaDerecha

	   	call 	man_entity_getDirecY
		or 	a
		jp 	z, _vamosHaciaAbajo
	   	

	   	_vamosHaciaArriba:
		ld 	e_pspr_l(ix), #<_sp_hero_00	;; arriba izq
	   	ld 	e_pspr_h(ix), #>_sp_hero_00
	   	jr 	_velnozerox
	   	_vamosHaciaAbajo:
	   	ld 	e_pspr_l(ix), #<_sp_hero_28	;; arriba izq
	   	ld 	e_pspr_h(ix), #>_sp_hero_28
	   	jr 	_velnozerox
		_vamosAlaDerecha:
	   	ld 	e_pspr_l(ix), #<_sp_hero_24	;; arriba izq
	   	ld 	e_pspr_h(ix), #>_sp_hero_24
	   	

		_velnozeroy:
		

	   	_velnozerox:

	   		
	   	
	   	ret







