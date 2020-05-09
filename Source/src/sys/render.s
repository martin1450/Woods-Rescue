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
.include "assets/assets.h.s"
;.include "levelpack.h.s"

.module sys_entity_render

;; Constantes
screen_start = 0xC000
bucle: .db 3 ;; El numero de entidades distintas que tenemos en el array (??????)
norender: .db 0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sys_eren_init
;;-----------------------------------------------------------
;; Inicializa el sistema de render
;; Selecciona el modo y la paleta
;;-----------------------------------------------------------
;; DESTRUYE: AF, BC, DE, HL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sys_eren_init::
	ld c, #0
	call cpct_setVideoMode_asm

	ld hl, #_pal_main
	ld de, #16
	call cpct_setPalette_asm

	cpctm_setBorder_asm HW_BLACK

	ld a, #3
	ld (bucle), a

	ld a, #0
	ld (norender), a

ret

sys_eren_init2::
	ld a, #3
	ld (bucle), a

ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sys_eren_drawmap
;;-----------------------------------------------------------
;; Dibuja el mapa de tiles
;; ENTRADA:
;;    DE: Puntero al tilemap a dibujar
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sys_eren_drawmap::
	ld b, #25
	ld c, #20                                   ;; Tiles a dibujar (una pantalla entera)
	ld de, #0x0014                              ;; Tilemap width (!!)
	ld hl, #tileset_ptr                         ;; Puntero al tileset
	call cpct_etm_setDrawTilemap4x8_ag_asm

	ld hl, #screen_start                        ;; Pos donde empieza a dibujar
	ld de, #tilemap_ptr                              
	call cpct_etm_drawTilemap4x8_ag_asm

ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sys_eren_update
;;-----------------------------------------------------------
;; Dibuja todo (de momento las entidades)
;; (en un futuro tambien el mapa??)
;;-----------------------------------------------------------
;; ENTRADA:
;;    IX: Puntero al array de entidades
;;     A: Numero de elementos en el array
;; DESTRUYE: AF, BC, DE, HL, IX
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sys_eren_update::
	call sys_eren_render_entities
ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sys_eren_render_entities
;;-----------------------------------------------------------
;; Dibuja todas las entidades
;;-----------------------------------------------------------
;; ENTRADA:
;;    IX: Puntero a la primera entidad a dibujar
;;     A: Numero de elementos a renderizar
;; DESTRUYE: AF, BC, DE, HL, IX
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sys_eren_render_entities::


;; Miramos el valor de a y en funcion de este le pasamos a ix el puntero apuntando a balas, enemigos o personaje
_main_loop:
	
	ld a , (bucle)

	cp #3
	jr nz, comp2

	call man_entity_getPers
	jr start

	comp2:
	cp #2
	jr nz, comp1

	call man_entity_getBalas
	jr start

	comp1:
	cp #1
	jr nz, final

	call man_entity_getEnem

	start:
	cp #0
	jr z, salta
	ld (_ent_counter), a            ;; Guardamos el numero de entidades


_update_loop:
	
	ld a, (bucle)
	cp #1
	jr nz, actual

	ld a, e_ai_tipo(ix)
	cp #0
	jp z, next 

	actual:
	;; Borramos dibujando un cuadrado de color de fondo
	ld   e, e_lastVP_l(ix)
	ld   d, e_lastVP_h(ix)
	xor  a
	ld   c, e_w(ix)
	ld   b, e_h(ix)
	call cpct_drawSolidBox_asm

	ld a, (bucle)
	cp #3
	jr nz, seguim

	ld a, (norender)
	cp #1
	jp z, salta

	seguim:
	;; Calculamos la nueva posicion en memoria de video
	ld  de, #screen_start
	ld   c, e_x(ix)
	ld   b, e_y(ix)
	call cpct_getScreenPtr_asm

	;; Guardamos la ultima posicion en memoria de video
	ld   e_lastVP_l(ix), l
	ld   e_lastVP_h(ix), h

	;; Dibujamos el sprite
	ex   de, hl
	ld    l, e_pspr_l(ix)
	ld    h, e_pspr_h(ix)
	ld   c, e_w(ix)
	ld   b, e_h(ix)
	call cpct_drawSprite_asm

	next:
	_ent_counter = .+1
	ld    a, #0                      
	dec   a
	jr z, salta

	ld  (_ent_counter), a
	ld  bc, #sizeof_e
	add ix, bc
    jr  _update_loop

	salta:

	ld a , (bucle)
	dec a
	ld (bucle), a
	jp _main_loop

	final:

	ld a, #3
	ld (bucle), a
	ret

sys_eren_delete::
	
	ex de, hl
	ld__ixh_d                    ;; Estas instrucciones 
	ld__ixl_e                    ;; hacen IX = DE
	ld   e, e_lastVP_l(ix)
	ld   d, e_lastVP_h(ix)
	xor  a
	ld   c, e_w(ix)
	ld   b, e_h(ix)
	call cpct_drawSolidBox_asm
ret

sys_eren_deleteBoy::
	
	ld a, #1
	ld (norender), a

	ret

sys_eren_setupBoy::
	
	ld a, #0
	ld (norender), a

	ret




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sys_eren_pressstart
;;-----------------------------------------------------------
;; Dibuja la imagen de inicio (de momento pinta la pantalla)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sys_eren_pressstart::
   ;; Dibuja fondo
   ;ld   de, #screen_start
   ;ld   bc, #0x4000   ;;0x4000 (16K) bytes a copiar (full video memory)
   ;ld    a, #0x26
   ;call cpct_memset_asm 
   ;;ld  hl, #_G_inicio
   ;;ld  de, #screen_start
   ;;ld  bc, #0x4000
   ;;ldir
   	ld     hl, #_iniciopack_end

	ld de, #decompress_levelbuffer_end
	call man_level_decrunch
                
	call sys_eren_drawmap
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sys_eren_congrats
;;-----------------------------------------------------------
;; Dibuja la imagen de inicio (de momento pinta la pantalla)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sys_eren_congrats::
   ;; Dibuja fondo
   ;ld   de, #screen_start
   ;ld   bc, #0x4000   ;;0x4000 (16K) bytes a copiar (full video memory)
   ;ld    a, #0x26
   ;call cpct_memset_asm 
   ;;ld  hl, #_G_inicio
   ;;ld  de, #screen_start
   ;;ld  bc, #0x4000
   ;;ldir
   	ld     hl, #_finpack_end

	ld de, #decompress_levelbuffer_end
	call man_level_decrunch
                
	call sys_eren_drawmap
ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sys_eren_cleanscreen
;;-----------------------------------------------------------
;; Limpia la pantalla
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sys_eren_cleanscreen::
   ;; Dibuja fondo
   ld   de, #screen_start
   ld   bc, #0x4000
   ld    a, #0x00
   call cpct_memset_asm 
ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sys_eren_friends
;;-----------------------------------------------------------
;; Renderiza tus amigos en el nivel base
;;-----------------------------------------------------------
;; ENTRADA:
;;    IX: Puntero a los datos
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sys_eren_friends::

	ld a, #num_groups
	ld ix, #lvl_st_1

	_bucle_f:

	push af
		ld a, 0(ix)
		cp #1
		jr nz, _sig

		;; Calculamos la nueva posicion en memoria de video
		ld  de, #screen_start
		ld   c, 3(ix)
		ld   b, 4(ix)
		call cpct_getScreenPtr_asm

		;; Dibujamos el sprite
		ex   de, hl
		ld    l, 1(ix)
		ld    h, 2(ix)
		ld   a, #0x04
		ld   c, a
		ld   a, #0x10
		ld   b, a
		call cpct_drawSprite_asm

		_sig:
		ld  bc, #tam_groups
		add ix, bc

	pop af
	dec a
	jr nz, _bucle_f
ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sys_eren_friends
;;-----------------------------------------------------------
;; Renderiza tus amigos en la jaula
;;-----------------------------------------------------------
;; ENTRADA:
;;    IX: Puntero a los datos
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sys_eren_jaula::
	ld ix, #lvl_st_1

		_bucle_rj:
			dec a
			jr z, _fin_rj
			ld  bc, #tam_groups
			add ix, bc
		jr _bucle_rj

	_fin_rj:

		ld  de, #screen_start
		ld   c, 13(ix)
		ld   b, 14(ix)
		call cpct_getScreenPtr_asm

		;; Dibujamos el sprite
		ex   de, hl
		ld    l, 11(ix)
		ld    h, 12(ix)
		ld   a, #0x04
		ld   c, a
		ld   a, #0x10
		ld   b, a
		call cpct_drawSprite_asm
ret