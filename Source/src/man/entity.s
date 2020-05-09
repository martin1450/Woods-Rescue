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
.include "cmp/array_structure.h.s"
.include "cpct_functions.h.s"
.include "man/level.h.s"
.include "cmp/level.h.s"

.module entity_manager

;; Estas variables son para tener punteros apuntando a las zonas donde empiezan y acaban las balas y los enemigos

lastenem:: .dw 0
firstenem:: .dw 0
lastbalas:: .dw 0
firstbalas:: .dw 0
first:: .dw 0

drx:: .db 1
dry:: .db 0

bucle:: .db 0
bucle2:: .db 0
var:: .db 0

triple_size == #sizeof_e*3


;; Definimos el array de entidades
DefineComponentArrayStructure _entity, max_entities, DefineCmp_Entity_default


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  man_entity_getPers 
;;-----------------------------------------------------------
;; Devuelve un puntero al array que se indica 
;;-----------------------------------------------------------
;; SALIDA:
;;		A: Numero de entidades en el array
;;	   IX: Puntero al inicio del array
;;     IY: Puntero al inicio del array
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
man_entity_getPers::
	ld       ix, #_entity_array
	ld       iy, #_entity_array ;(!)
	ld       a, #1
ret

man_entity_getPers2::
	ld       iy, #_entity_array ;(!)
ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  man_entity_getBalas
;;-----------------------------------------------------------
;; Devuelve un puntero al array que se indica 
;;-----------------------------------------------------------
;; SALIDA:
;;		A: Numero de entidades en el array
;;	   IX: Puntero al inicio del array
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
man_entity_getBalas::
	ld       ix, (firstbalas)
	ld       a, (_entity_numbalas)
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  man_entity_getEnem
;;-----------------------------------------------------------
;; Devuelve un puntero al array que se indica 
;;-----------------------------------------------------------
;; SALIDA:
;;		A: Numero de entidades en el array
;;	   IX: Puntero al inicio del array
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
man_entity_getEnem::
	ld       ix, (firstenem)
	ld       a, (_entity_numenem)
ret


man_entity_numenem::
	ld a, (_entity_numenem)
ret


man_entity_numbalas::
	ld a, (_entity_numbalas)
ret


man_entity_dir::
	
	ld a, e_vx(ix)
	ld (drx), a
	ld a, e_vy(ix)
	ld (dry), a
ret

man_entity_getDirecX::
	ld a, (drx)
ret


man_entity_getDirecY::
	ld a, (dry)
ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  man_entity_init
;;-----------------------------------------------------------
;; Inicializamos el manager de entidades. Ponemos a 0 el
;; numero de entidades y situamos el puntero al inicio
;; Colocamos los punteros de balas y enemigos apuntando al 
;; inicio de su zona
;;-----------------------------------------------------------
;; ENTRADA: -
;; DESTRUYE: AF, HL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
man_entity_init::
	xor      a                     ;; Siempre es 0
	ld  	(_entity_num), a
	ld  	(_entity_numbalas), a
	ld  	(_entity_numenem), a


	ld      hl, #_entity_array
	ld		(_entity_pend), hl
	ld      (first), hl


	ld bc, #sizeof_e
	add hl, bc
	ld		(lastbalas), hl
	ld      (firstbalas), hl

	ld bc, #triple_size
	add hl, bc

	ld		(lastenem), hl
	ld      (firstenem), hl

ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  man_entity_new
;;-----------------------------------------------------------
;; Añade una nueva entidad al array sin inicializar nada
;;-----------------------------------------------------------
;; ENTRADA: -
;; DESTRUYE: F, BC, DE, HL
;; SALIDA:
;;	   DE: Puntero al inicio del elemento añadido
;;	   BC: sizeof_e
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
man_entity_new::
	ld		hl, #_entity_num
	inc    (hl)
	                     ;; Contamos una entidad mas
	ld		hl, (_entity_pend)
	ld		 d, h
	ld 		 e, l 
	ld 		bc, #sizeof_e
	add 	hl, bc
	ld 		(_entity_pend), hl      ;; Movemos el puntero a la nueva posicion
ret



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  man_entity_create
;;-----------------------------------------------------------
;; Inicializa la nueva entidad en el array, usando el registro
;; a comprueba que objeto tiene que crear y que _entity_pend 
;; apunte a la zona del array que corresponde. Tambien comprueba
;; si ya se han creado el maximo de entidades permitidas, en ese 
;; caso no hace nada y se sale del metodo.
;;-----------------------------------------------------------
;; ENTRADA:
;;	   HL: Puntero para la inicializacion de la entidad
;; DESTRUYE: F, BC, DE, HL
;; SALIDA:
;;	   IX: Puntero a la entidad creada
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
man_entity_create::
	ld b , a 
	ld		a, (_entity_numbalas)
	cp #3
	ret z

	push hl
	ld a, b

	cp #1
	jr nz, dos 

	ld hl, (lastbalas)
	ld (_entity_pend), hl
	jr pers

	dos:
	cp #2
	jr nz, pers 

	push af
	ld a, #17
	loophole:
		inc hl
		dec a
		jr nz, loophole
	ld a, (hl)
	cp #0
	jr z, salir
	pop af

	ld hl, (lastenem)
	ld (_entity_pend), hl

	pers:
	call man_entity_new

	ld__ixh_d                    ;; Estas instrucciones 
	ld__ixl_e                    ;; hacen IX = DE
	pop hl
	ldir

	ld hl, (_entity_pend)
	
	cp #1
	jr nz, two

	ld (lastbalas), hl
	ld hl , #_entity_numbalas
	inc (hl)
	call man_entity_bala
	ret

	two:
	cp #2
	ret nz 

	ld (lastenem), hl
	ld hl , #_entity_numenem
	inc (hl)
	ret

	salir:
	pop af
	pop hl
	ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  man_entity_bala
;;-----------------------------------------------------------
;; Inicializa la posicion de la bala que se acaba de crear 
;; para que sea igual que el jugador.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
man_entity_bala::
	
	ld hl, (lastbalas)
	ld 		bc, #sizeof_e
	and a
	sbc hl, bc
	call man_entity_getPers

	ld a, (drx)
	ld b, a
	ld a, (dry)
	ld c, a

	ld a, e_x(ix)
	add a, b
	add a, b
	ld (hl), a
	inc hl
	ld a, e_y(ix)
	add a, c
	add a, c
	add a, c
	add a, c
	add a, c
	add a, c
	ld (hl), a


	inc hl
	ld a, (drx)
	add a, b
	ld (hl), a
	inc hl
	ld a, (dry)
	add a, c
	ld (hl), a

ret



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  man_entity_destroy
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
man_entity_destroy::

	ld hl, (lastenem)
	ld (_entity_pend), hl

	cp #1
	jr nz, start

	ld hl, (lastbalas)
	ld (_entity_pend), hl

	start:

	push af

	ld   e, e_lastVP_l(ix)
	ld   d, e_lastVP_h(ix)
	xor  a
	ld   c, e_w(ix)
	ld   b, e_h(ix)
	call cpct_drawSolidBox_asm

	ld__d_ixh
	ld__e_ixl


	ld hl, (_entity_pend)
	ld 		bc, #sizeof_e
	and a
	sbc hl, bc
	ld (_entity_pend), hl

	ld 		bc, #sizeof_e
	ldir

	ld	hl, #_entity_num
	dec    (hl)
	ld hl, (_entity_pend)

	pop af
	cp #1
	jr z, balas


	ld (lastenem), hl
	ld hl , #_entity_numenem
	dec (hl)
	ret

	balas:
	ld (lastbalas), hl
	ld hl , #_entity_numbalas
	dec (hl)	
ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  man_entity_check
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
man_entity_check::
	
	ld a, (drx)
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

	ld a, #1
	ret

	next:
	ld a, (bucle)
	dec a
	ld (bucle), a
	jr nz, loop
	jp abajo

	izquierda:
	ld a, (drx)
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

	ld a, #1
	ret

	next2:
	ld a, (bucle)
	dec a
	ld (bucle), a
	jr nz, loop2

	abajo:
	ld a, (dry)
	cp #2
	jr nz, arriba

	ld a, #9
	ld (bucle2), a
	ld a, #30
	ld (var), a

	ld a, #4
	add a, e_vx(ix)
	ld (bucle), a

	loop3:
	ld de, #CPCT_VMEM_START_ASM
	ld a, (var)
	add a, e_y(ix)
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

	ld a, #1
	ret

	next3:
    ld a, (bucle)
	dec a
	ld (bucle), a
	jr nz, loop3
	
    ld a, (bucle2)
	dec a
	jr z, final2

	ld (bucle2), a
	ld a, (var)
	dec a
	ld (var), a
	ld a, #4
	ld (bucle), a
	jp loop3

	final2:
	ld a, #0
	ret
	
	arriba:
	ld a, (dry)
	cp #0
	ret Z

	ld a, #12
	ld (bucle2), a
	neg 
	ld (var), a

	ld a, #4
	ld (bucle), a

	loop4:
	ld de, #CPCT_VMEM_START_ASM
	ld a, (var)
	add a, e_y(ix)
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

    ld a, #1
	ret

	next4:
    ld a, (bucle)
	dec a
	ld (bucle), a
	jr nz, loop4

	ld a, (bucle2)
	dec a
	jr z, final

	ld (bucle2), a
	neg 
	ld (var), a
	ld a, #4
	ld (bucle), a
	jp loop4

	final:
	ld a, #0
	ret
