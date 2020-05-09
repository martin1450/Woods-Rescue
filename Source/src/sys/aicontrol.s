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
.include "cmp/entity.h.s"
.include "cpct_functions.h.s"
.include "assets/assets.h.s"
.include "man/patrol.h.s"
.include "man/level.h.s"
.include "sys/animation.h.s"
.include "man/game.h.s"

.module sys_entity_ai_control


_enem_array_ptr: .dw 0
_enem_counter: .db 0

_distance: .db 0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sys_ai_control_init
;;-----------------------------------------------------------
;; Inicializa el sistema de IA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sys_ai_control_init::
ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sys_ai_control_update
;;-----------------------------------------------------------
;; Update sistema de IA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sys_ai_control_update::
   call man_entity_getEnem
   ld (_enem_array_ptr), ix      ;; Almacenamos el array de enemigos
   ld (_enem_counter), a         ;; Contador de enemigos


   cp #0
   jr z, fin                     ;; Si no hay enemigos salimos

   _loop:

      ld a, e_ai_tipo(ix)                        ;; Bucle que recorre los enemigos
      cp #0
      jp z, _no_AI_ent
      
      ld a, e_ai_st(ix)          ;; comprobando su IA
      cp #e_ai_st_noAI
      jr z, _no_AI_ent

      _AI_ent:                   ;; Si tiene IA comprueba el tipo
         cp #e_ai_st_stand_by
            jr z, _st1
         cp #e_ai_st_move_to
            jr z, _st2
         cp #e_ai_st_patrol
            jr z, _st3
         cp #e_ai_st_follow
            jr z, _st4
         cp #e_ai_st_calm
            jr z, _st5

         _st1:
            call sys_ai_stand_by
            cp #1
            jr z, _xao
            jr _no_AI_ent

         _st2:
            call sys_ai_move_to
            jr _no_AI_ent

         _st3:
            call sys_ai_patrol
            jr _no_AI_ent

         _st4:
            call sys_ai_follow
            jr _no_AI_ent

         _st5:
            call sys_ai_calm
            jr _no_AI_ent

      _xao:

      ld e_ai_patrol_step_l(ix), #1
      call man_game_change2
      call sys_eren_deleteBoy
      ret

      _no_AI_ent:

      ld a, (_enem_counter)
      dec a
      ret z

      ld (_enem_counter), a

      ld de, #sizeof_e
      add ix, de
      ld (_enem_array_ptr), ix   ;; Pasa al siguiente enemigo 

   jr _loop

   fin:
ret



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sys_ai_trigger
;;-----------------------------------------------------------
;; Activa el trigger si se cumple la condicion
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sys_ai_trigger:
   ld a, e_ai_tipo(ix)               ;; Comprobamos de que tipo es

   cp #e_ai_tipo_arbol
      jr z, _t_t_1
   cp #e_ai_tipo_camaleon
      jr z, _t_t_2
   cp #e_ai_tipo_ave
      jr z, _t_t_3
   cp #e_ai_tipo_lobo
      jr z, _t_t_5


   _t_t_1:                           
      ld a, #10
      call sys_ai_distance
      jr _cp_t

   _t_t_2:                           
      call sys_ai_distance2
      jr _cp_t

   _t_t_3:                           
      ld a, #20
      call sys_ai_distance
      jr _cp_t

   _t_t_5:                           
      ld a, #30
      call sys_ai_distance
      jr _cp_t
      

   _cp_t:
      cp #1
      jr nz, _fin_t

      ld e_ai_trigger(ix), #1
      ret

   _fin_t:
      ld e_ai_trigger(ix), #0
ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sys_ai_aim_player
;;-----------------------------------------------------------
;; Fija como objetivo la posicion del jugador
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sys_ai_aim_player:
   call man_entity_getPers
   ld ix, (_enem_array_ptr)

   ld a, e_x(iy)
   ld e_ai_aim_x(ix), a
   ld a, e_y(iy)
   ld e_ai_aim_y(ix), a
ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sys_ai_distance
;;-----------------------------------------------------------
;; Comprueba si el enemigo esta cerca
;;-----------------------------------------------------------
;; SALIDA:
;;    A: 0-no cerca, 1-cerca
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sys_ai_distance:
   ld (_distance), a
   call man_entity_getPers
   ld ix, (_enem_array_ptr)

   ld a, e_x(ix)
   sbc e_x(iy)
   jr nc, positivo
   
   neg

   positivo:

   push af 
   ld a, (_distance)
   ld b, a
   pop af 
   sbc b
   jr nc, final

   ld a, e_y(ix)
   sbc e_y(iy)
   jr nc, positivo2
   
   neg

   positivo2:

   push af 
   ld a, (_distance)
   add a
   add a
   ld b, a
   pop af 
   sbc b
   jr nc, final

   ld a, #1
   ret

   final:
   ld a, #0
   ret 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sys_ai_distance2
;;-----------------------------------------------------------
;; Comprueba si el enemigo coincide en x o en y
;;-----------------------------------------------------------
;; SALIDA:
;;    A: 0-no coincide, 1-coincide
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sys_ai_distance2:
   call man_entity_getPers
   ld ix, (_enem_array_ptr)

   ld a, e_x(ix)
   cp e_x(iy)
   jr nz, ejey

   ld a, #1
   ret

   ejey:
   ld a, e_y(ix)
   cp e_y(iy)
   ret nz

   ld a, #1
   ret




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sys_ai_patrol_trigger
;;-----------------------------------------------------------
;; Comprueba el trigger si el enemigo esta patrullando
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sys_ai_patrol_trigger:
   call sys_ai_trigger                       ;; Llama al metodo que activa el trigger si procede

   ld a, e_ai_trigger(ix)                    ;; Comprueba si esta el trigger activo o no
   or a                                      
   ret z

   call sys_ai_aim_player                    ;; Se lanza al personaje
ret




;;  ===============
;; | ESTADOS DE IA |
;;  ===============

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sys_ai_stand_by [1]
;;-----------------------------------------------------------
;; IA: Espera un trigger
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sys_ai_stand_by:
   call sys_ai_trigger                       ;; Llama al metodo que activa el trigger si procede

   ld a, e_ai_trigger(ix)                    ;; Comprueba si esta el trigger activo o no
   or a                                      ;; Da si mismo, sirve para distinguir si es 0 o no
   ret z                                     ;; Si es 0 no hace nada

                                     
      ld a, e_ai_tipo(ix)                    ;; Si es 1 comprobamos de que tipo es

      cp #e_ai_tipo_arbol
         jr z, _t1
      cp #e_ai_tipo_camaleon
         jr z, _t2
      cp #e_ai_tipo_lobo
         jr z, _t5


      _t1:                                    ;; El arbol te mata automaticamente
         ld a, #1
         ret

      _t2:                                    ;; El camaleon fija tu posicion y se lanza
         call sys_ai_aim_player

         ld  e_ai_st(ix), #e_ai_st_move_to    
         ld  e_ai_trigger(ix), #0
         jr _fin_sb

      _t5:                                    ;; El lobo comienza a perseguirte
         ld  e_ai_st(ix), #e_ai_st_follow
         ld  e_ai_trigger(ix), #0
         jr _fin_sb


   _fin_sb:
   ld e_ai_pre_st(ix), #e_ai_st_stand_by      ;; Indicamos el estado actual

ret



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sys_ai_move_to [2]
;;-----------------------------------------------------------
;; IA: Cambia la velocidad para llegar al objetivo
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sys_ai_move_to:


   ld a, e_ai_tipo(ix)                   
   cp #e_ai_tipo_ave
   jr z, _normal

   ld a, e_ai_patrol_step_l(ix)
   cp #1
   jr nz, _normal

   ld e_ai_patrol_step_l(ix), #0
   ld a, e_ai_pre_st(ix)                     
   ld e_ai_st(ix), a                         
   ld e_ai_pre_st(ix), #e_ai_st_move_to
   jr _fin_move_to 

_normal:
   ;; UPDATE X 
   ld   a, e_ai_aim_x(ix)            ;; A = x_objetivo
   sub  e_x(ix)                      ;; A = obj_x - x      Si es negativo, hay carry
   jr nc, _objx_greater_or_equal     ;; if(obj_x - x > 0)

_objx_lesser:
   ld e_vx(ix), #-1
   jr _endif_X
_objx_greater_or_equal:
   jr z, _arrived_x
   ld e_vx(ix), #1
   jr _endif_X
_arrived_x:
   ld e_vx(ix), #0
_endif_X:


   ;; UPDATE Y
   ld   a, e_ai_aim_y(ix)            
   sbc  e_y(ix)
   cp #1
   jr z, _arrived_y
   cp #-1
   jr z, _arrived_y

   ld   a, e_ai_aim_y(ix)            
   sub  e_y(ix)                      
   jr nc, _objy_greater_or_equal     

_objy_lesser:
   ld e_vy(ix), #-2
   jr _endif_Y
_objy_greater_or_equal:
   jr z, _arrived_y
   ld e_vy(ix), #2
   jr _endif_Y
_arrived_y:
   ld e_vy(ix), #0

   ld   a, e_vx(ix)
   or   a
   jr nz, _endif_Y
   

   ld a, e_ai_pre_st(ix)                     ;; Si ha llegado al punto se
   ld e_ai_st(ix), a                         ;; devuelve al estado anterior
   ld e_ai_pre_st(ix), #e_ai_st_move_to

_endif_Y:
   
   ld a, e_ai_pre_st(ix)                     ;; Si esta persiguiendo vuelve a
   cp #e_ai_st_follow                        ;; follow para recalcular la pos
   jr nz, _fin_move_to

   ld e_ai_st(ix), a                         ;; devuelve al estado anterior
   ld e_ai_pre_st(ix), #e_ai_st_move_to   

   _fin_move_to:
ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sys_ai_patrol [3]
;;-----------------------------------------------------------
;; IA: Patrulla moviendose a una serie de puntos
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sys_ai_patrol:

   ld   l, e_ai_patrol_step_l(ix)
   ld   h, e_ai_patrol_step_h(ix)

   ld   a, (hl)                         ;; A = x

      cp   #patrol_invalid_move_x
      jr   z, _reset_patrol             ;; Si es -1 volvemos a empezar

   ld   e_ai_aim_x(ix), a
   inc  hl
   ld   a, (hl)                         ;; A = y
   ld   e_ai_aim_y(ix), a

   inc  hl
   ld   e_ai_patrol_step_l(ix), l
   ld   e_ai_patrol_step_h(ix), h

   ld   e_ai_pre_st(ix), #e_ai_st_patrol
   ld   e_ai_st(ix), #e_ai_st_move_to

ret

_reset_patrol:                          ;; Vuelve al inicio de la patrulla
   inc  hl
   ld   a, (hl)
   inc  hl
   ld   h, (hl)
   ld   e_ai_patrol_step_l(ix), a
   ld   e_ai_patrol_step_h(ix), h
ret



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sys_ai_follow [4]
;;-----------------------------------------------------------
;; IA: Sigue al jugador
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sys_ai_follow:
   call man_level_currentlimits
   call man_level_zonasegura                  ;; Comprobamos si el jugador se ha movido a la zona segura
   cp #1                                   
   jr z, _frenar                           


   call sys_ai_aim_player                   ;; Si el jugador esta en zona de peligro se le persigue
   ld   e_ai_pre_st(ix), #e_ai_st_follow
   ld   e_ai_st(ix), #e_ai_st_move_to
   ret

   _frenar:                                 ;; Si el jugador esta en zona segura se deja de perseguir
      ld ix, (_enem_array_ptr)
      ld   a, e_ai_sb_x(ix)
      ld   e_ai_aim_x(ix), a 
      ld   a, e_ai_sb_y(ix)                     
      ld   e_ai_aim_y(ix), a
      ld   e_ai_pre_st(ix), #e_ai_st_follow
      ld   e_ai_st(ix), #e_ai_st_calm

ret



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sys_ai_calm [5]
;;-----------------------------------------------------------
;; IA: Frena la persecucion para volver a la pos inicial
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sys_ai_calm:

   ld a, e_x(ix)                            ;; Comprobamos si ha llegado en X
   cp e_ai_sb_x(ix)
   jr nz, _sigue

   ld a, e_y(ix)                            ;; Comprobamos si ha llegado en Y
   cp e_ai_sb_y(ix)
   jr nz, _sigue

   ld   e_ai_pre_st(ix), #e_ai_st_calm      ;; Si ha llegado vuelve a stand by
   ld   e_ai_st(ix), #e_ai_st_stand_by
   ret 

   _sigue:
   ld   e_ai_pre_st(ix), #e_ai_st_calm      ;; Si no ha llegado sigue volviendo
   ld   e_ai_st(ix), #e_ai_st_move_to

ret