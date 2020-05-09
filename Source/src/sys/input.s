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
.include "man/entity.h.s"
.include "man/level.h.s"
.include "man/game.h.s"
.include "cmp/entity.h.s"
.include "cpct_functions.h.s"
.include "assets/assets.h.s"


.module sys_entity_input


espera: .db 0 ;; Variable que se usa para poner una espera minima entre bala y bala 
bala: DefineCmp_Entity  0,   0,   0,   0, 0x04, 0x10, _sp_hero_18, 10, e_ai_st_noAI, 1, no_patrol, 0x0000, e_anim_noStatus  


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sys_input_init
;;-----------------------------------------------------------
;; Inicializa el sistema de input
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sys_input_init::
ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sys_input_update
;;-----------------------------------------------------------
;; Controla el teclado
;;-----------------------------------------------------------
;; ENTRADA:
;;    IX: Puntero a la entidad (nuestro personaje)
;; DESTRUYE: AF, BC, DE, HL, IX
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sys_input_update::
   call man_entity_getPers
   ld e_vx(ix), #0 
   ld e_vy(ix), #0                  ;; Reinicia las velocidades a 0
 
   call cpct_scanKeyboard_asm

   ld    hl, #Key_O
   call cpct_isKeyPressed_asm
   jr     z, o_no_pulsada           ;; Salta si la tecla NO esta pulsada
   ld e_vx(ix), #-1                 ;; Si esta pulsada cambia la velocidad
   call man_entity_dir
   
o_no_pulsada:
   
   ld    hl, #Joy1_Left
   call cpct_isKeyPressed_asm
   jr     z, joyleft_no_pulsada           ;; Salta si la tecla NO esta pulsada
   ld e_vx(ix), #-1                 ;; Si esta pulsada cambia la velocidad
   call man_entity_dir

joyleft_no_pulsada:

   ld    hl, #Key_P
   call cpct_isKeyPressed_asm
   jr     z, p_no_pulsada           ;; Salta si la tecla NO esta pulsada
   ld e_vx(ix), #1                  ;; Si esta pulsada cambia la velocidad
   call man_entity_dir

p_no_pulsada:

   ld    hl, #Joy1_Right
   call cpct_isKeyPressed_asm
   jr     z, joyright_no_pulsada           ;; Salta si la tecla NO esta pulsada
   ld e_vx(ix), #1                 ;; Si esta pulsada cambia la velocidad
   call man_entity_dir

joyright_no_pulsada:

   ld    hl, #Key_Q
   call cpct_isKeyPressed_asm
   jr     z, q_no_pulsada           ;; Salta si la tecla NO esta pulsada
   ld e_vy(ix), #-2  
   call man_entity_dir

q_no_pulsada:

   ld    hl, #Joy1_Up
   call cpct_isKeyPressed_asm
   jr     z, joyup_no_pulsada           ;; Salta si la tecla NO esta pulsada
   ld e_vy(ix), #-2                 ;; Si esta pulsada cambia la velocidad
   call man_entity_dir

joyup_no_pulsada:

   ld    hl, #Key_A
   call cpct_isKeyPressed_asm
   jr     z, a_no_pulsada           ;; Salta si la tecla NO esta pulsada
   ld e_vy(ix), #2
   call man_entity_dir 

a_no_pulsada:

   ld    hl, #Joy1_Down
   call cpct_isKeyPressed_asm
   jr     z, joydown_no_pulsada           ;; Salta si la tecla NO esta pulsada
   ld e_vy(ix), #2                 ;; Si esta pulsada cambia la velocidad
   call man_entity_dir

joydown_no_pulsada:
    
   ld a, (espera)
   cp #0
   jr nz, esperando

   ld    hl, #Key_Space
   call cpct_isKeyPressed_asm
   jr     z, sp_no_pulsada            ;; Salta si la tecla NO esta pulsada

   call man_entity_check
   cp #0
   ret nz
   
   ld a , #10
   ld (espera), a

   ld hl, #bala
   ld a, #1
   call man_entity_create
   jr fire_no_pulsada

sp_no_pulsada:  

   ld    hl, #Joy1_Fire1
   call cpct_isKeyPressed_asm
   jr     z, fire_no_pulsada            ;; Salta si la tecla NO esta pulsada  

   call man_entity_check
   cp #0
   ret nz
   
   ld a , #10
   ld (espera), a

   ld hl, #bala
   ld a, #1
   call man_entity_create
   jr fire_no_pulsada

   esperando:
   dec a
   ld (espera), a
   
fire_no_pulsada:

   ld    hl, #Key_S
   call cpct_isKeyPressed_asm
   jr     z, z_no_pulsada           ;; Salta si la tecla NO esta pulsada
   z_pulsada:
   call man_game_stop
   z_no_pulsada:

ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sys_input_pressstart
;;-----------------------------------------------------------
;; Controla el inicio del juego creando un bucle del que
;; solo sale al pulsar la tecla 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sys_input_pressstart::
   loop_start::
      call   cpct_scanKeyboard_asm

      ld     hl, #Key_1
      call   cpct_isKeyPressed_asm
      jr     nz, pulsada           ;; Si se pulsa finaliza

      ld     hl, #Joy1_Fire2
      call   cpct_isKeyPressed_asm
      jr     nz, pulsada 

   jr  loop_start       

   pulsada:
ret



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sys_input_tryagain
;;-----------------------------------------------------------
;; Reinicia el juego al pulsar R
;; SALIDA
;;    A: Se pone a 1 si ha finalizado el juego
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sys_input_tryagain::
   loop_cngts:
      call   cpct_scanKeyboard_asm

      ld     hl, #Key_1
      call   cpct_isKeyPressed_asm
      jr     nz, pulsada2

      ld     hl, #Joy1_Fire2
      call   cpct_isKeyPressed_asm
      jr     nz, pulsada2  

   jr  loop_cngts       

   pulsada2:
ret