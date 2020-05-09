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
.include "man/entity.h.s"
.include "sys/render.h.s"
.include "cpct_functions.h.s"

.module collision_manager

screen_width = 80
screen_height = 200

aux:: .dw 0
aux2:: .db 0

bucle: .db 0

man_collision_check::
	
	call man_entity_numenem
	cp #0
	ret z

	ld (aux2), a
	ld hl, (firstenem)

	bucleloop:
	ld (aux), hl
	ld d, (hl)
	ld a, (hl)
	inc hl 
	ld e, (hl)
	inc hl
	inc hl
	inc hl
	add a, (hl)
	push af
	ld a, e_x(ix)
	add e_vx(ix)
	ld c, a
	pop af
	sub a, c

	jr z, no_collision
	jp m, no_collision


	ld a, e
	inc hl
	add a, (hl)
	push af
	ld a, e_y(ix)
	add e_vy(ix)
	ld c, a
	pop af
	sub c
	jr z, no_collision
	jp m, no_collision

	ld a, e_x(ix)
	add e_vx(ix)
	add a, e_w(ix)
	sub d
	jr z, no_collision
	jp m, no_collision

	ld a, e_y(ix)
	add a, e_vy(ix)
	add a, e_h(ix)
	sub e
	jr z, no_collision
	jp m, no_collision

	call man_collision_type
	ret

	no_collision:

	ld hl, (aux)
	ld de, #sizeof_e
	add hl, de

	ld a, (aux2)
	dec a
	ld (aux2), a
	jr nz, bucleloop

	ld a, #0

	ret

man_collision_type::
	ld hl, (aux)
	ld a, #17

	loophole:
		inc hl
		dec a
		jr nz, loophole

	ld a, (hl)
	cp #0
	ret z
	
	ld hl, (aux)
	ld a, #1
    ret

 man_collision_check2::

	ld hl, (first)

	ld d, (hl)
	ld a, (hl)
	inc hl 
	ld e, (hl)
	inc hl
	inc hl
	inc hl
	add a, (hl)
	push af
	ld a, e_x(ix)
	add e_vx(ix)
	ld c, a
	pop af
	sub a, c

	jr z, no_collision2
	jp m, no_collision2


	ld a, e
	inc hl
	add a, (hl)
	push af
	ld a, e_y(ix)
	add e_vy(ix)
	ld c, a
	pop af
	sub c
	jr z, no_collision2
	jp m, no_collision2

	ld a, e_x(ix)
	add e_vx(ix)
	add a, e_w(ix)
	sub d
	jr z, no_collision2
	jp m, no_collision2

	ld a, e_y(ix)
	add a, e_vy(ix)
	add a, e_h(ix)
	sub e
	jr z, no_collision2
	jp m, no_collision2

	ld a, #1
	ret

	no_collision2:

	ld a, #0
	ret

man_collision_map::

	ld a, e_vx(ix)
	cp #1
	jr nz, izquierda 

	ld a, #16
	ld (bucle), a

	loop:
	dec a
	ld de, #CPCT_VMEM_START_ASM
	ld b, e_y(ix)
	add a, b
	ld b, a
	ld a, e_x(ix)
    add a, #4
	ld c, a
	call cpct_getScreenPtr_asm

	ld a, (hl)
	cp #0
	jp z, next

	call man_collision_invalid
	ld a, e_ai_tipo(ix)
	cp #0
	jp z, abajo

	ld e_ai_patrol_step_l(ix), #1
	jp abajo

	next:
	ld a, (bucle)
	dec a
	ld (bucle), a
	jr nz, loop
	jp abajo

	izquierda:
	ld a, e_vx(ix)
	cp #0
	jp z, abajo

	ld a, #16
	ld (bucle), a

	loop2:
	dec a
	ld de, #CPCT_VMEM_START_ASM
	ld b, e_y(ix)
	add a, b
	ld b, a
	ld a, e_x(ix)
    add a, #-1
	ld c, a
	call cpct_getScreenPtr_asm

	ld a, (hl)
	cp #0
	jp z, next2

	call man_collision_invalid
	ld a, e_ai_tipo(ix)
	cp #0
	jp z, abajo

	ld e_ai_patrol_step_l(ix), #1
	jp abajo

	next2:
	ld a, (bucle)
	dec a
	ld (bucle), a
	jr nz, loop2

	abajo:
	ld a, e_vy(ix)
	cp #2
	jr nz, arriba

	ld a, #4
	add a, e_vx(ix)
	ld (bucle), a

	loop3:
	ld de, #CPCT_VMEM_START_ASM
	ld a, e_y(ix)
	add a, #17
	ld b, a
	ld a, (bucle)
	dec a
	ld c, e_x(ix)
    add a, c
	ld c, a
	call cpct_getScreenPtr_asm

	ld a, (hl)
	cp #0
	jp z, next3

	ld e_vy(ix), #0
	ld a, e_ai_tipo(ix)
	cp #0
	ret z

	ld e_ai_patrol_step_l(ix), #1
	ret

	next3:
    ld a, (bucle)
	dec a
	ld (bucle), a
	jr nz, loop3
	ret
	
	arriba:
	ld a, e_vy(ix)
	cp #0
	ret Z

	ld a, #4
	add a, e_vx(ix)
	ld (bucle), a

	loop4:
	ld de, #CPCT_VMEM_START_ASM
	ld a, e_y(ix)
	add a, #-2
	ld b, a
	ld a, (bucle)
	dec a
	ld c, e_x(ix)
    add a, c
	ld c, a
	call cpct_getScreenPtr_asm

	ld a, (hl)
	cp #0
	jp z, next4

    ld e_vy(ix), #0
	ld a, e_ai_tipo(ix)
	cp #0
	ret z

	ld e_ai_patrol_step_l(ix), #1
	ret

	next4:
    ld a, (bucle)
	dec a
	ld (bucle), a
	jr nz, loop4
	ret

man_collision_bala::

	call man_collision_limits
	cp #1
	ret z
    
    ld a, e_vx(ix)
	cp #2
	jr nz, izquierda2 

	ld a, #16
	ld (bucle), a

	loop21:
	dec a
	ld de, #CPCT_VMEM_START_ASM
	ld b, e_y(ix)
	add a, b
	ld b, a
	ld a, e_x(ix)
    add a, #5
	ld c, a
	call cpct_getScreenPtr_asm

	ld a, (hl)
	cp #0
	jp z, next21

	ld a, #1
	ret

	next21:
	ld a, (bucle)
	dec a
	ld (bucle), a
	jr nz, loop21
	jp abajo2

	izquierda2:
	ld a, e_vx(ix)
	cp #0
	jp z, abajo2

	ld a, #16
	ld (bucle), a

	loop22:
	dec a
	ld de, #CPCT_VMEM_START_ASM
	ld b, e_y(ix)
	add a, b
	ld b, a
	ld a, e_x(ix)
    add a, #-2
	ld c, a
	call cpct_getScreenPtr_asm

	ld a, (hl)
	cp #0
	jp z, next22

	ld a, #1
	ret

	next22:
	ld a, (bucle)
	dec a
	ld (bucle), a
	jr nz, loop22

	abajo2:
	ld a, e_vy(ix)
	cp #4
	jr nz, arriba2

	ld a, #4
	ld (bucle), a

	loop23:
	ld de, #CPCT_VMEM_START_ASM
	ld a, e_y(ix)
	add a, #19
	ld b, a
	ld a, (bucle)
	dec a
	ld c, e_x(ix)
    add a, c
	ld c, a
	call cpct_getScreenPtr_asm

	ld a, (hl)
	cp #0
	jp z, next23

	ld a, #1
	ret

	next23:
    ld a, (bucle)
	dec a
	ld (bucle), a
	jr nz, loop23
	ld a, #0
	ret
	
	arriba2:
	ld a, e_vy(ix)
	cp #0
	ret z

	ld a, #4
	ld (bucle), a

	loop24:
	ld de, #CPCT_VMEM_START_ASM
	ld a, e_y(ix)
	add a, #-4
	ld b, a
	ld a, (bucle)
	dec a
	ld c, e_x(ix)
    add a, c
	ld c, a
	call cpct_getScreenPtr_asm

	ld a, (hl)
	cp #0
	jp z, next24

	ld a, #1
	ret

	next24:
    ld a, (bucle)
	dec a
	ld (bucle), a
	jr nz, loop24

	ld a, #0
	ret

man_collision_invalid::

	ld    a, #screen_width + 1    ;; Al ancho de la pantalla + 1
	sub   e_w(ix)                 ;; le restamos el ancho de la entidad = posicion limite      
	ld    c, a

	ld    a, e_x(ix)              ;; A la posicion en x le añadimos la velocidad en x,
	add   e_vx(ix)                ;; es decir, sumamos la velocidad
	cp    c                       ;; Comparamos con la posicion limite para ver si la 
	ret nc
	
	ld e_vx(ix), #0
    ret

 man_collision_limits::

   ld a, e_x(ix)
   add e_vx(ix)
   sbc #73
   jr c, left
   
   ld a, #1
   ret

   left:
   ld a, e_x(ix)
   add e_vx(ix)
   sbc #3
   jr nc, up

   ld a, #1
   ret

   up:
   ld a, e_y(ix)
   add e_vy(ix)
   sbc #6
   jr nc, down

   ld a, #1
   ret
   
   down:
   ld a, e_y(ix)
   add e_vy(ix)
   sbc #178
   jr c, end

   ld a, #1
   ret

   end:
   ld a, #0
   ret
