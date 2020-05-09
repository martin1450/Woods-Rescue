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
.include "cmp/level.h.s"
.include "man/level.h.s"
.include "man/game.h.s"
.include "cmp/array_structure.h.s"


.module level_manager



;; Definimos el array de niveles
DefineComponentArrayStructure _level, max_levels, DefineCmp_Level_default


current_level: .dw 0
current_door: .db 0



;; LEVEL STATUS (Info de que niveles se han completado)
;;.....................................................................................
lvl_st_1:: 
	.db 0x00                  ;; 0-no superado, 1-superado
	.dw _sp_enemigo_53        ;; Sprite del amigo
	.db 74, 55                ;; Posicion del amigo
	.db 4, 50                 ;; Posicion de inicio del jugador
	.db 20, 40                ;; Limites zona segura
	.db 60, 140               ;; Win zone
	.dw _sp_enemigo_52        ;; Sprite del amigo jaula
	.db 66, 160               ;; Posicion del amigo jaula

lvl_st_2:: 
	.db 0x00                  ;; 0-no superado, 1-superado
	.dw _sp_enemigo_55        ;; Sprite del amigo
	.db 74, 155               ;; Posicion del amigo
	.db 4, 130                ;; Posicion de inicio del jugador
	.db 20, 146               ;; Limites zona segura
	.db 60, 60                ;; Win zone
	.dw _sp_enemigo_54        ;; Sprite del amigo jaula
	.db 66, 30                ;; Posicion del amigo jaula

lvl_st_3:: 
	.db 0x00                  ;; 0-no superado, 1-superado
	.dw _sp_enemigo_57        ;; Sprite del amigo
	.db 2, 55                 ;; Posicion del amigo
	.db 70, 50                ;; Posicion de inicio del jugador
	.db 56, 40                ;; Limites zona segura
	.db 18, 140               ;; Win zone
	.dw _sp_enemigo_56        ;; Sprite del amigo jaula
	.db 10, 160               ;; Posicion del amigo jaula

lvl_st_4:: 
	.db 0x00                  ;; 0-no superado, 1-superado
	.dw _sp_enemigo_59        ;; Sprite del amigo
	.db 2, 155                ;; Posicion del amigo
	.db 70, 130               ;; Posicion de inicio del jugador
	.db 56, 146               ;; Limites zona segura
	.db 18, 60                ;; Win zone
	.dw _sp_enemigo_58        ;; Sprite del amigo jaula
	.db 10, 30                ;; Posicion del amigo jaula


;; DATOS DE LOS NIVELES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; =====================================================================================
;;  NIVEL BASE
;; =====================================================================================
;; Definicion NIVEL 0 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl0:  DefineCmp_Level _levelpack0_end, 0, #enem0_1, 0
enem0_1: DefineCmp_Entity   0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus
enem0_2: DefineCmp_Entity   0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus
enem0_3: DefineCmp_Entity   0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus


;; =====================================================================================
;;  NIVEL 1
;; =====================================================================================
;; Definicion NIVEL 1.1 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl11:  DefineCmp_Level _levelpack11_end, 1, #enem11_1, 1
enem11_1: DefineCmp_Entity 0,  0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus
enem11_2: DefineCmp_Entity 0,  0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus
enem11_3: DefineCmp_Entity 0,  0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus

;; Definicion NIVEL 1.2 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl12:  DefineCmp_Level _levelpack12_end, 1, #enem12_1, 1
enem12_1: DefineCmp_Entity 70, 54,   0,  0,  0x04,  0x10, _sp_enemigo_42, 0, e_ai_st_stand_by, e_ai_tipo_arbol, no_patrol, _arbol_standing, e_anim_noStatus
enem12_2: DefineCmp_Entity  0,  0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus
enem12_3: DefineCmp_Entity  0,  0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus

;; Definicion NIVEL 1.3 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl13:  DefineCmp_Level _levelpack13_end, 1, #enem13_1, 1
enem13_1: DefineCmp_Entity 60,  50,   0,  0,  0x04,  0x10, _sp_enemigo_42, 0, e_ai_st_stand_by, e_ai_tipo_arbol, no_patrol, _arbol_standing, e_anim_noStatus
enem13_2: DefineCmp_Entity 50, 150,   0,  0,  0x04,  0x10, _sp_enemigo_17, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus
enem13_3: DefineCmp_Entity  0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus

;; Definicion NIVEL 1.4 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl14:  DefineCmp_Level _levelpack14_end, 1, #enem14_1, 1
enem14_1: DefineCmp_Entity 64,  100,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_arbol, no_patrol, _arbol_standing, e_anim_noStatus
enem14_2: DefineCmp_Entity 20,   30,   0,  0,  0x04,  0x10, _sp_enemigo_17, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus
enem14_3: DefineCmp_Entity 40,  140,   0,  0,  0x04,  0x10, _sp_enemigo_17, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus

;; Definicion NIVEL 1.5 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl15:  DefineCmp_Level _levelpack15_end, 1, #enem15_1, 1
enem15_1: DefineCmp_Entity 30, 160,   0,  0,  0x04,  0x10, _sp_enemigo_42, 0, e_ai_st_stand_by, e_ai_tipo_arbol, no_patrol, _arbol_standing, e_anim_noStatus
enem15_2: DefineCmp_Entity 40,  50,   0,  0,  0x04,  0x10, _sp_enemigo_42, 0, e_ai_st_stand_by, e_ai_tipo_arbol, no_patrol, _arbol_standing, e_anim_noStatus
enem15_3: DefineCmp_Entity  0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus

;; Definicion NIVEL 1.6 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl16:  DefineCmp_Level _levelpack16_end, 1, #enem16_1, 1
enem16_1: DefineCmp_Entity 70,  20,   0,  0,  0x04,  0x10, _sp_enemigo_30, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_01, _ave_standing, e_anim_noStatus
enem16_2: DefineCmp_Entity 30, 160,   0,  0,  0x04,  0x10, _sp_enemigo_17, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus
enem16_3: DefineCmp_Entity  0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus

;; Definicion NIVEL 1.7 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl17:  DefineCmp_Level _levelpack17_end, 1, #enem17_1, 1
enem17_1: DefineCmp_Entity 38, 100,   0,  0,  0x04,  0x10, _sp_enemigo_42, 0, e_ai_st_stand_by, e_ai_tipo_arbol, no_patrol, _arbol_standing, e_anim_noStatus
enem17_2: DefineCmp_Entity 36,  20,   0,  0,  0x04,  0x10, _sp_enemigo_30, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_02, _ave_standing, e_anim_noStatus
enem17_3: DefineCmp_Entity 40, 170,   0,  0,  0x04,  0x10, _sp_enemigo_30, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_03, _ave_standing, e_anim_noStatus

;; Definicion NIVEL 1.8 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl18:  DefineCmp_Level _levelpack18_end, 1, #enem18_1, 1
enem18_1: DefineCmp_Entity 50,  40,   0,  0,  0x04,  0x10, _sp_enemigo_17, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus
enem18_2: DefineCmp_Entity 64, 130,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_lobo, no_patrol, _lobo_standing, e_anim_noStatus
enem18_3: DefineCmp_Entity  0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus

;; Definicion NIVEL 1.9 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl19:  DefineCmp_Level _levelpack19_end, 1, #enem19_1, 1
enem19_1: DefineCmp_Entity 36,  20,   0,  0,  0x04,  0x10, _sp_enemigo_30, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_06, _ave_standing, e_anim_noStatus
enem19_2: DefineCmp_Entity 20,  80,   0,  0,  0x04,  0x10, _sp_enemigo_17, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus
enem19_3: DefineCmp_Entity 40,  100,   0,  0,  0x04,  0x10, _sp_enemigo_17, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus

;; Definicion NIVEL 1.10 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl110:  DefineCmp_Level _levelpack110_end, 1, #enem110_1, 1
enem110_1: DefineCmp_Entity 74,  36,   0,  0,  0x04,  0x10, _sp_enemigo_42, 0, e_ai_st_stand_by, e_ai_tipo_arbol, no_patrol, _arbol_standing, e_anim_noStatus
enem110_2: DefineCmp_Entity 30,  38,   0,  0,  0x04,  0x10, _sp_enemigo_17, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus
enem110_3: DefineCmp_Entity 35, 155,   0,  0,  0x04,  0x10, _sp_enemigo_17, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus


;; Definicion NIVEL 1.11 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl111:  DefineCmp_Level _levelpack111_end, 1, #enem111_1, 1
enem111_1: DefineCmp_Entity 70,  20,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_25, _ave_standing, e_anim_noStatus
enem111_2: DefineCmp_Entity 18,  50,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_23, _ave_standing, e_anim_noStatus
enem111_3: DefineCmp_Entity 40, 140,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_24, _ave_standing, e_anim_noStatus

;; Definicion NIVEL 1.12 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl112:  DefineCmp_Level _levelpack112_end, 1, #enem112_1, 1
enem112_1: DefineCmp_Entity 60, 143,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_lobo, no_patrol, _lobo_standing, e_anim_noStatus
enem112_2: DefineCmp_Entity 52, 166,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_lobo, no_patrol, _lobo_standing, e_anim_noStatus
enem112_3: DefineCmp_Entity 0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus

;; Definicion NIVEL 1.13 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl113:  DefineCmp_Level _levelpack113_end, 1, #enem113_1, 1
enem113_1: DefineCmp_Entity 30, 40,   0,  0,  0x04,  0x10, _sp_enemigo_30, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_19, _ave_standing, e_anim_noStatus
enem113_2: DefineCmp_Entity 60, 10,   0,  0,  0x04,  0x10, _sp_enemigo_30, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_20, _ave_standing, e_anim_noStatus
enem113_3: DefineCmp_Entity 70, 150,   0,  0,  0x04,  0x10, _sp_enemigo_30, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_35, _ave_standing, e_anim_noStatus

;; Definicion NIVEL 1.14 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl114:  DefineCmp_Level _levelpack114_end, 1, #enem114_1, 1
enem114_1: DefineCmp_Entity 0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus
enem114_2: DefineCmp_Entity 0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus
enem114_3: DefineCmp_Entity 0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus

;; Definicion NIVEL 1.15 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl115:  DefineCmp_Level _levelpack115_end, 1, #enem115_1, 2
enem115_1: DefineCmp_Entity 68, 120,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_lobo, no_patrol, _lobo_standing, e_anim_noStatus
enem115_2: DefineCmp_Entity 52, 166,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_lobo, no_patrol, _lobo_standing, e_anim_noStatus
enem115_3: DefineCmp_Entity 60, 143,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_lobo, no_patrol, _lobo_standing, e_anim_noStatus


;; =====================================================================================
;;  NIVEL 2
;; =====================================================================================
;; Definicion NIVEL 2.1 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl21:  DefineCmp_Level _levelpack21_end, 2, #enem21_1, 1
enem21_1: DefineCmp_Entity 0,  0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus
enem21_2: DefineCmp_Entity 0,  0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus
enem21_3: DefineCmp_Entity 0,  0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus

;; Definicion NIVEL 2.2 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl22:  DefineCmp_Level _levelpack22_end, 2, #enem22_1, 1
enem22_1: DefineCmp_Entity 30, 120,   0,  0,  0x04,  0x10, _sp_enemigo_42, 0, e_ai_st_stand_by, e_ai_tipo_arbol, no_patrol, _arbol_standing, e_anim_noStatus
enem22_2: DefineCmp_Entity 56, 160,   0,  0,  0x04,  0x10, _sp_enemigo_42, 0, e_ai_st_stand_by, e_ai_tipo_arbol, no_patrol, _arbol_standing, e_anim_noStatus
enem22_3: DefineCmp_Entity  0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus

;; Definicion NIVEL 2.3 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl23:  DefineCmp_Level _levelpack23_end, 2, #enem23_1, 1
enem23_1: DefineCmp_Entity 26,  106,   0,  0,  0x04,  0x10, _sp_enemigo_42, 0, e_ai_st_stand_by, e_ai_tipo_arbol, no_patrol, _arbol_standing, e_anim_noStatus
enem23_2: DefineCmp_Entity 60,   30,   0,  0,  0x04,  0x10, _sp_enemigo_17, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus
enem23_3: DefineCmp_Entity 60,  160,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus

;; Definicion NIVEL 2.4 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl24:  DefineCmp_Level _levelpack24_end, 2, #enem24_1, 1
enem24_1: DefineCmp_Entity 30,  170,   0,  0,  0x04,  0x10, _sp_enemigo_06, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus
enem24_2: DefineCmp_Entity 50,   20,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus
enem24_3: DefineCmp_Entity  0,    0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus

;; Definicion NIVEL 2.5 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl25:  DefineCmp_Level _levelpack25_end, 2, #enem25_1, 1
enem25_1: DefineCmp_Entity 30,   20,   0,  0,  0x04,  0x10, _sp_enemigo_42, 0, e_ai_st_stand_by, e_ai_tipo_arbol, no_patrol, _arbol_standing, e_anim_noStatus
enem25_2: DefineCmp_Entity 50,  170,   0,  0,  0x04,  0x10, _sp_enemigo_42, 0, e_ai_st_stand_by, e_ai_tipo_arbol, no_patrol, _arbol_standing, e_anim_noStatus
enem25_3: DefineCmp_Entity  0,    0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus

;; Definicion NIVEL 2.6 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl26:  DefineCmp_Level _levelpack26_end, 2, #enem26_1, 1
enem26_1: DefineCmp_Entity 66,  20,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_arbol, no_patrol, _enemigo_standing, e_anim_noStatus
enem26_2: DefineCmp_Entity 42,  86,   0,  0,  0x04,  0x10, _sp_enemigo_30, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_04, _ave_standing, e_anim_noStatus
enem26_3: DefineCmp_Entity 60,  70,   0,  0,  0x04,  0x10, _sp_enemigo_30, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_05, _ave_standing, e_anim_noStatus

;; Definicion NIVEL 2.7 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl27:  DefineCmp_Level _levelpack27_end, 2, #enem27_1, 1
enem27_1: DefineCmp_Entity 40,  140,   0,  0,  0x04,  0x10, _sp_enemigo_17, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus
enem27_2: DefineCmp_Entity 50,   60,   0,  0,  0x04,  0x10, _sp_enemigo_30, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_07, _camaleon_standing, e_anim_noStatus
enem27_3: DefineCmp_Entity   0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus

;; Definicion NIVEL 2.8 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl28:  DefineCmp_Level _levelpack28_end, 2, #enem28_1, 1
enem28_1: DefineCmp_Entity 36,   24,   0,  0,  0x04,  0x10, _sp_enemigo_17, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus
enem28_2: DefineCmp_Entity 60,   30,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_lobo, no_patrol, _lobo_standing, e_anim_noStatus
enem28_3: DefineCmp_Entity 46,  150,   0,  0,  0x04,  0x10, _sp_enemigo_42, 0, e_ai_st_stand_by, e_ai_tipo_arbol, no_patrol, _arbol_standing, e_anim_noStatus

;; Definicion NIVEL 2.9 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl29:  DefineCmp_Level _levelpack29_end, 2, #enem29_1, 1
enem29_1: DefineCmp_Entity 60,   30,   0,  0,  0x04,  0x10, _sp_enemigo_17, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus
enem29_2: DefineCmp_Entity 26,   66,   0,  0,  0x04,  0x10, _sp_enemigo_30, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_08, _ave_standing, e_anim_noStatus
enem29_3: DefineCmp_Entity 20,  170,   0,  0,  0x04,  0x10, _sp_enemigo_17, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus

;; Definicion NIVEL 2.10 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl210:  DefineCmp_Level _levelpack210_end, 2, #enem210_1, 1
enem210_1: DefineCmp_Entity 29,  48,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus
enem210_2: DefineCmp_Entity 29,  88,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus
enem210_3: DefineCmp_Entity 18, 160,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus

;; Definicion NIVEL 2.11 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl211:  DefineCmp_Level _levelpack211_end, 2, #enem211_1, 1
enem211_1: DefineCmp_Entity 30,  20,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_28, _ave_standing, e_anim_noStatus
enem211_2: DefineCmp_Entity 18,  90,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_27, _ave_standing, e_anim_noStatus
enem211_3: DefineCmp_Entity 18, 120,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_26, _ave_standing, e_anim_noStatus

;; Definicion NIVEL 2.12 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl212:  DefineCmp_Level _levelpack212_end, 2, #enem212_1, 1
enem212_1: DefineCmp_Entity 52,  26,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_lobo, 0, _lobo_standing, e_anim_noStatus
enem212_2: DefineCmp_Entity 60,  48,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_lobo, 0, _lobo_standing, e_anim_noStatus
enem212_3: DefineCmp_Entity 0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus

;; Definicion NIVEL 2.13 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl213:  DefineCmp_Level _levelpack213_end, 2, #enem213_1, 1
enem213_1: DefineCmp_Entity 70, 30,   0,  0,  0x04,  0x10, _sp_enemigo_30, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_36, _ave_standing, e_anim_noStatus
enem213_2: DefineCmp_Entity 30, 40,   0,  0,  0x04,  0x10, _sp_enemigo_30, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_19, _ave_standing, e_anim_noStatus
enem213_3: DefineCmp_Entity 60, 10,   0,  0,  0x04,  0x10, _sp_enemigo_30, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_20, _ave_standing, e_anim_noStatus

;; Definicion NIVEL 2.14 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl214:  DefineCmp_Level _levelpack214_end, 2, #enem214_1, 1
enem214_1: DefineCmp_Entity 0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus
enem214_2: DefineCmp_Entity 0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus
enem214_3: DefineCmp_Entity 0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus

;; Definicion NIVEL 2.15 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl215:  DefineCmp_Level _levelpack215_end, 2, #enem215_1, 2
enem215_1: DefineCmp_Entity 52,  26,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_lobo, 0, _lobo_standing, e_anim_noStatus
enem215_2: DefineCmp_Entity 68,  70,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_lobo, 0, _lobo_standing, e_anim_noStatus
enem215_3: DefineCmp_Entity 60,  48,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_lobo, 0, _lobo_standing, e_anim_noStatus


;; =====================================================================================
;;  NIVEL 3
;; =====================================================================================
;; Definicion NIVEL 3.1 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl31:  DefineCmp_Level _levelpack31_end, 3, #enem31_1, 1
enem31_1: DefineCmp_Entity 0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus
enem31_2: DefineCmp_Entity 0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus
enem31_3: DefineCmp_Entity 0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus

;; Definicion NIVEL 3.2 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl32:  DefineCmp_Level _levelpack32_end, 3, #enem32_1, 1
enem32_1: DefineCmp_Entity 44,  84,   0,  0,  0x04, 0x10, _sp_enemigo_42, 0, e_ai_st_stand_by, e_ai_tipo_arbol, no_patrol, _arbol_standing, e_anim_noStatus
enem32_2: DefineCmp_Entity 0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus
enem32_3: DefineCmp_Entity 0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus

;; Definicion NIVEL 3.3 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl33:  DefineCmp_Level _levelpack33_end, 3, #enem33_1, 1
enem33_1: DefineCmp_Entity 40,  120,   0,  0,  0x04, 0x10, _sp_enemigo_17, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus
enem33_2: DefineCmp_Entity 0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus
enem33_3: DefineCmp_Entity 0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus

;; Definicion NIVEL 3.4 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl34:  DefineCmp_Level _levelpack34_end, 3, #enem34_1, 1
enem34_1: DefineCmp_Entity  8,  40,   0,  0,  0x04, 0x10, _sp_enemigo_17, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus
enem34_2: DefineCmp_Entity 42, 140,   0,  0,  0x04, 0x10, _sp_enemigo_17, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus
enem34_3: DefineCmp_Entity  0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus

;; Definicion NIVEL 3.5 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl35:  DefineCmp_Level _levelpack35_end, 3, #enem35_1, 1
enem35_1: DefineCmp_Entity 6,  36,   0,  0,  0x04, 0x10, _sp_enemigo_17, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus
enem35_2: DefineCmp_Entity 46,  60,   0,  0,  0x04, 0x10, _sp_enemigo_42, 0, e_ai_st_stand_by, e_ai_tipo_arbol, no_patrol, _arbol_standing, e_anim_noStatus
enem35_3: DefineCmp_Entity 50,  100,  0,  0,  0x04, 0x10, _sp_enemigo_42,0, e_ai_st_stand_by, e_ai_tipo_arbol, no_patrol, _arbol_standing, e_anim_noStatus

;; Definicion NIVEL 3.6 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl36:  DefineCmp_Level _levelpack36_end, 3, #enem36_1, 1
enem36_1: DefineCmp_Entity 15,  40,   0,  0,  0x04, 0x10, _sp_enemigo_30, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_09, _ave_standing, e_anim_noStatus
enem36_2: DefineCmp_Entity 50, 140,   0,  0,  0x04, 0x10, _sp_enemigo_42, 0, e_ai_st_stand_by, e_ai_tipo_arbol, no_patrol, _arbol_standing, e_anim_noStatus
enem36_3: DefineCmp_Entity  0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus

;; Definicion NIVEL 3.7 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl37:  DefineCmp_Level _levelpack37_end, 3, #enem37_1, 1
enem37_1: DefineCmp_Entity 10,  50,   0,  0,  0x04, 0x10, _sp_enemigo_00, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_11, _ave_standing, e_anim_noStatus
enem37_2: DefineCmp_Entity 50, 140,   0,  0,  0x04, 0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_arbol, no_patrol, _arbol_standing, e_anim_noStatus
enem37_3: DefineCmp_Entity 30, 110,   0,  0,  0x04, 0x10, _sp_enemigo_00, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_12, _ave_standing, e_anim_noStatus

;; Definicion NIVEL 3.8 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl38:  DefineCmp_Level _levelpack38_end, 3, #enem38_1, 1
enem38_1: DefineCmp_Entity 50,  20,   0,  0,  0x04, 0x10, _sp_enemigo_17, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus
enem38_2: DefineCmp_Entity 10,  44,   0,  0,  0x04, 0x10, _sp_enemigo_42, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus
enem38_3: DefineCmp_Entity 20, 140,   0,  0,  0x04, 0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_lobo, no_patrol, _lobo_standing, e_anim_noStatus

;; Definicion NIVEL 3.9 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl39:  DefineCmp_Level _levelpack39_end, 3, #enem39_1, 1
enem39_1: DefineCmp_Entity 10,  20,   0,  0,  0x04, 0x10, _sp_enemigo_30, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_10, _ave_standing, e_anim_noStatus
enem39_2: DefineCmp_Entity 56, 160,   0,  0,  0x04, 0x10, _sp_enemigo_17, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus
enem39_3: DefineCmp_Entity 46,  70,   0,  0,  0x04, 0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_arbol, no_patrol, _enemigo_standing, e_anim_noStatus

;; Definicion NIVEL 3.10 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl310:  DefineCmp_Level _levelpack310_end, 3, #enem310_1, 1
enem310_1: DefineCmp_Entity 46,  38,   0,  0,  0x04, 0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus
enem310_2: DefineCmp_Entity 22,  38,   0,  0,  0x04, 0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus
enem310_3: DefineCmp_Entity 38, 142,   0,  0,  0x04, 0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus

;; Definicion NIVEL 3.11 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl311:  DefineCmp_Level _levelpack311_end, 3, #enem311_1, 1
enem311_1: DefineCmp_Entity  6,  40,   0,  0,  0x04, 0x10, _sp_enemigo_00, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_31, _ave_standing, e_anim_noStatus
enem311_2: DefineCmp_Entity 38,  70,   0,  0,  0x04, 0x10, _sp_enemigo_00, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_30, _ave_standing, e_anim_noStatus
enem311_3: DefineCmp_Entity  5, 170,   0,  0,  0x04, 0x10, _sp_enemigo_00, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_29, _ave_standing, e_anim_noStatus

;; Definicion NIVEL 3.12 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl312:  DefineCmp_Level _levelpack312_end, 3, #enem312_1, 1
enem312_1: DefineCmp_Entity 20,  143,   0,  0,  0x04, 0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_lobo, no_patrol, _lobo_standing, e_anim_noStatus
enem312_2: DefineCmp_Entity 28,  165,   0,  0,  0x04, 0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_lobo, no_patrol, _lobo_standing, e_anim_noStatus
enem312_3: DefineCmp_Entity 0,  0,   0,  0,  0x04, 0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus

;; Definicion NIVEL 3.13 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl313:  DefineCmp_Level _levelpack313_end, 3, #enem313_1, 1
enem313_1: DefineCmp_Entity 16, 40,   0,  0,  0x04,  0x10, _sp_enemigo_30, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_21, _ave_standing, e_anim_noStatus
enem313_2: DefineCmp_Entity 46, 10,   0,  0,  0x04,  0x10, _sp_enemigo_30, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_22, _ave_standing, e_anim_noStatus
enem313_3: DefineCmp_Entity 8, 110,   0,  0,  0x04,  0x10, _sp_enemigo_30, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_37, _ave_standing, e_anim_noStatus

;; Definicion NIVEL 3.14 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl314:  DefineCmp_Level _levelpack314_end, 3, #enem314_1, 1
enem314_1: DefineCmp_Entity 0,  0,   0,  0,  0x04, 0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus
enem314_2: DefineCmp_Entity 0,  0,   0,  0,  0x04, 0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus
enem314_3: DefineCmp_Entity 0,  0,   0,  0,  0x04, 0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus

;; Definicion NIVEL 3.15 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl315:  DefineCmp_Level _levelpack315_end, 3, #enem315_1, 2
enem315_1: DefineCmp_Entity 20,  143,   0,  0,  0x04, 0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_lobo, no_patrol, _lobo_standing, e_anim_noStatus
enem315_2: DefineCmp_Entity 28,  165,   0,  0,  0x04, 0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_lobo, no_patrol, _lobo_standing, e_anim_noStatus
enem315_3: DefineCmp_Entity 12,  120,   0,  0,  0x04, 0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_lobo, no_patrol, _lobo_standing, e_anim_noStatus



;; =====================================================================================
;;  NIVEL 4
;; =====================================================================================
;; Definicion NIVEL 4.1 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl41:  DefineCmp_Level _levelpack41_end, 4, #enem41_1, 1
enem41_1: DefineCmp_Entity 0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus
enem41_2: DefineCmp_Entity 0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus
enem41_3: DefineCmp_Entity 0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus

;; Definicion NIVEL 4.2 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl42:  DefineCmp_Level _levelpack42_end, 4, #enem42_1, 1
enem42_1: DefineCmp_Entity 10,  130,   0,  0,  0x04, 0x10, _sp_enemigo_42, 0, e_ai_st_stand_by, e_ai_tipo_arbol, no_patrol, _arbol_standing, e_anim_noStatus
enem42_2: DefineCmp_Entity  0,    0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus
enem42_3: DefineCmp_Entity  0,    0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus

;; Definicion NIVEL 4.3 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl43:  DefineCmp_Level _levelpack43_end, 4, #enem43_1, 1
enem43_1: DefineCmp_Entity 40,  30,   0,  0,  0x04, 0x10, _sp_enemigo_17, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus
enem43_2: DefineCmp_Entity 14, 150,   0,  0,  0x04, 0x10, _sp_enemigo_17, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus
enem43_3: DefineCmp_Entity  0,   0,   0,  0,  0x04, 0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus

;; Definicion NIVEL 4.4 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl44:  DefineCmp_Level _levelpack44_end, 4, #enem44_1, 1
enem44_1: DefineCmp_Entity 40,  166,   0,  0,  0x04, 0x10, _sp_enemigo_42, 0, e_ai_st_stand_by, e_ai_tipo_arbol, no_patrol, _arbol_standing, e_anim_noStatus
enem44_2: DefineCmp_Entity 30,  20,   0,  0,  0x04, 0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_arbol, no_patrol, _arbol_standing, e_anim_noStatus
enem44_3: DefineCmp_Entity 14,  90,   0,  0,  0x04, 0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus

;; Definicion NIVEL 4.5 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl45:  DefineCmp_Level _levelpack45_end, 4, #enem45_1, 1
enem45_1: DefineCmp_Entity 12, 160,   0,  0,  0x04, 0x10, _sp_enemigo_42, 0, e_ai_st_stand_by, e_ai_tipo_arbol, no_patrol, _arbol_standing, e_anim_noStatus
enem45_2: DefineCmp_Entity 50,  26,   0,  0,  0x04, 0x10, _sp_enemigo_17, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus
enem45_3: DefineCmp_Entity  0,   0,   0,  0,  0x04, 0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus

;; Definicion NIVEL 4.6 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl46:  DefineCmp_Level _levelpack46_end, 4, #enem46_1, 1
enem46_1: DefineCmp_Entity 62,  130,   0,  0,  0x04, 0x10, _sp_enemigo_30, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_13, _ave_standing, e_anim_noStatus
enem46_2: DefineCmp_Entity 30,  100,   0,  0,  0x04, 0x10, _sp_enemigo_30, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_14, _ave_standing, e_anim_noStatus
enem46_3: DefineCmp_Entity 0,  0,   0,  0,  0x04, 0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus

;; Definicion NIVEL 4.7 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl47:  DefineCmp_Level _levelpack47_end, 4, #enem47_1, 1
enem47_1: DefineCmp_Entity 10,  120,   0,  0,  0x04, 0x10, _sp_enemigo_30, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_15, _ave_standing, e_anim_noStatus
enem47_2: DefineCmp_Entity 40,  140,   0,  0,  0x04, 0x10, _sp_enemigo_30, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_16, _ave_standing, e_anim_noStatus
enem47_3: DefineCmp_Entity 50,  50,   0,  0,  0x04, 0x10, _sp_enemigo_17, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol _camaleon_standing, e_anim_noStatus

;; Definicion NIVEL 4.8 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl48:  DefineCmp_Level _levelpack48_end, 4, #enem48_1, 1
enem48_1: DefineCmp_Entity 20,  30,   0,  0,  0x04, 0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_lobo, no_patrol, _lobo_standing, e_anim_noStatus
enem48_2: DefineCmp_Entity 44,  20,   0,  0,  0x04, 0x10, _sp_enemigo_30, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_17, _ave_standing, e_anim_noStatus
enem48_3: DefineCmp_Entity 54,  80,   0,  0,  0x04, 0x10, _sp_enemigo_30, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_18, _ave_standing, e_anim_noStatus

;; Definicion NIVEL 4.9 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl49:  DefineCmp_Level _levelpack49_end, 4, #enem49_1, 1
enem49_1: DefineCmp_Entity 10,  110,   0,  0,  0x04, 0x10, _sp_enemigo_42, 0, e_ai_st_stand_by, e_ai_tipo_arbol, no_patrol, _arbol_standing, e_anim_noStatus
enem49_2: DefineCmp_Entity 32,  30,   0,  0,  0x04, 0x10, _sp_enemigo_17, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus
enem49_3: DefineCmp_Entity 50, 150,   0,  0,  0x04, 0x10, _sp_enemigo_17, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus

;; Definicion NIVEL 4.10 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl410:  DefineCmp_Level _levelpack410_end, 4, #enem410_1, 1
enem410_1: DefineCmp_Entity 55,  48,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus
enem410_2: DefineCmp_Entity 55,  88,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_camaleon, no_patrol, _camaleon_standing, e_anim_noStatus
enem410_3: DefineCmp_Entity  5, 156,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_arbol, no_patrol, _arbol_standing, e_anim_noStatus
;; Definicion NIVEL 4.11 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl411:  DefineCmp_Level _levelpack411_end, 4, #enem411_1, 1
enem411_1: DefineCmp_Entity 58,   20,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_32, _ave_standing, e_anim_noStatus
enem411_2: DefineCmp_Entity  8,  150,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_34, _ave_standing, e_anim_noStatus
enem411_3: DefineCmp_Entity 46,   75,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_33, _ave_standing, e_anim_noStatus

;; Definicion NIVEL 4.12 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl412:  DefineCmp_Level _levelpack412_end, 4, #enem412_1, 1
enem412_1: DefineCmp_Entity 20,  48,   0,  0,  0x04, 0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_lobo, no_patrol, _lobo_standing, e_anim_noStatus
enem412_2: DefineCmp_Entity 28,  26,   0,  0,  0x04, 0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_lobo, no_patrol, _lobo_standing, e_anim_noStatus
enem412_3: DefineCmp_Entity 0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus

;; Definicion NIVEL 4.13 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl413:  DefineCmp_Level _levelpack413_end, 4, #enem413_1, 1
enem413_1: DefineCmp_Entity 16, 40,   0,  0,  0x04,  0x10, _sp_enemigo_30, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_21, _ave_standing, e_anim_noStatus
enem413_2: DefineCmp_Entity 46, 10,   0,  0,  0x04,  0x10, _sp_enemigo_30, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_22, _ave_standing, e_anim_noStatus
enem413_3: DefineCmp_Entity 8, 26,   0,  0,  0x04,  0x10, _sp_enemigo_30, 0, e_ai_st_patrol, e_ai_tipo_ave, patrol_38, _ave_standing, e_anim_noStatus

;; Definicion NIVEL 4.14 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl414:  DefineCmp_Level _levelpack414_end, 4, #enem414_1, 1
enem414_1: DefineCmp_Entity 0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus
enem414_2: DefineCmp_Entity 0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus
enem414_3: DefineCmp_Entity 0,   0,   0,  0,  0x04,  0x10, _sp_enemigo_00, 0, e_ai_st_noAI, e_null, no_patrol, _enemigo_standing, e_anim_noStatus

;; Definicion NIVEL 4.15 (no tocar la estructura)
;; -------------------------------------------------------------------------------------
lvl415:  DefineCmp_Level _levelpack415_end, 4, #enem415_1, 2
enem415_1: DefineCmp_Entity 20,  48,   0,  0,  0x04, 0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_lobo, no_patrol, _lobo_standing, e_anim_noStatus
enem415_2: DefineCmp_Entity 28,  26,   0,  0,  0x04, 0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_lobo, no_patrol, _lobo_standing, e_anim_noStatus
enem415_3: DefineCmp_Entity 12,  70,   0,  0,  0x04, 0x10, _sp_enemigo_00, 0, e_ai_st_stand_by, e_ai_tipo_lobo, no_patrol, _lobo_standing, e_anim_noStatus
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  man_level_getArray
;;-----------------------------------------------------------
;; Devuelve un puntero al array de niveles
;;-----------------------------------------------------------
;; ENTRADA: -
;; DESTRUYE: IX
;; SALIDA:
;;		A: Numero de niveles
;;	   IX: Puntero al inicio del array
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
man_level_getArray::
	ld       ix, #_level_array
	ld       a, (_level_num)
ret



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  man_level_decrunch
;;-----------------------------------------------------------
;; Descomprime el pack comprimido
;; ENTRADA:
;;    DE: Final del buffer de descompresion
;;    HL: Final del pack a descomprimir
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
man_level_decrunch::
	call cpct_zx7b_decrunch_s_asm
ret



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  man_level_init
;;-----------------------------------------------------------
;; Inicializamos el manager de niveles. Ponemos a 0 el
;; numero de nivel actual y situamos el puntero al inicio.
;; Descomprime el tileset.
;;-----------------------------------------------------------
;; ENTRADA: -
;; DESTRUYE: AF, HL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
man_level_init::
	xor      a                     ;; Siempre es 0
	ld  	(_level_num), a

	ld      hl, #_level_array
	ld		(_level_pend), hl


	ld hl, #_tsetpack_end
	ld de, #decompress_tilebuffer_end
	call man_level_decrunch
ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  man_level_all
;;-----------------------------------------------------------
;; Crea todos los niveles y carga el primero (!!!)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
man_level_all::

	ld    hl, #lvl0
	call man_level_create


	ld    hl, #lvl11
	call man_level_create

	ld    hl, #lvl12
	call man_level_create

	ld    hl, #lvl13
	call man_level_create

	ld    hl, #lvl14
	call man_level_create

	ld    hl, #lvl15
	call man_level_create

	ld    hl, #lvl16
	call man_level_create

	ld    hl, #lvl17
	call man_level_create

	ld    hl, #lvl18
	call man_level_create

	ld    hl, #lvl19
	call man_level_create

	ld    hl, #lvl110
	call man_level_create

	ld    hl, #lvl111
	call man_level_create

	ld    hl, #lvl112
	call man_level_create

	ld    hl, #lvl113
	call man_level_create

	ld    hl, #lvl114
	call man_level_create

	ld    hl, #lvl115
	call man_level_create



	ld    hl, #lvl21
	call man_level_create

	ld    hl, #lvl22
	call man_level_create

	ld    hl, #lvl23
	call man_level_create

	ld    hl, #lvl24
	call man_level_create

	ld    hl, #lvl25
	call man_level_create

	ld    hl, #lvl26
	call man_level_create

	ld    hl, #lvl27
	call man_level_create

	ld    hl, #lvl28
	call man_level_create

	ld    hl, #lvl29
	call man_level_create

	ld    hl, #lvl210
	call man_level_create

	ld    hl, #lvl211
	call man_level_create

	ld    hl, #lvl212
	call man_level_create

	ld    hl, #lvl213
	call man_level_create

	ld    hl, #lvl214
	call man_level_create

	ld    hl, #lvl215
	call man_level_create


	ld    hl, #lvl31
	call man_level_create

	ld    hl, #lvl32
	call man_level_create

	ld    hl, #lvl33
	call man_level_create

	ld    hl, #lvl34
	call man_level_create

	ld    hl, #lvl35
	call man_level_create

	ld    hl, #lvl36
	call man_level_create

	ld    hl, #lvl37
	call man_level_create

	ld    hl, #lvl38
	call man_level_create

	ld    hl, #lvl39
	call man_level_create

	ld    hl, #lvl310
	call man_level_create

	ld    hl, #lvl311
	call man_level_create

	ld    hl, #lvl312
	call man_level_create

	ld    hl, #lvl313
	call man_level_create

	ld    hl, #lvl314
	call man_level_create

	ld    hl, #lvl315
	call man_level_create


	ld    hl, #lvl41
	call man_level_create

	ld    hl, #lvl42
	call man_level_create

	ld    hl, #lvl43
	call man_level_create

	ld    hl, #lvl44
	call man_level_create

	ld    hl, #lvl45
	call man_level_create

	ld    hl, #lvl46
	call man_level_create

	ld    hl, #lvl47
	call man_level_create

	ld    hl, #lvl48
	call man_level_create

	ld    hl, #lvl49
	call man_level_create

	ld    hl, #lvl410
	call man_level_create

	ld    hl, #lvl411
	call man_level_create

	ld    hl, #lvl412
	call man_level_create

	ld    hl, #lvl413
	call man_level_create

	ld    hl, #lvl414
	call man_level_create

	ld    hl, #lvl415
	call man_level_create


	;; Cargamos el primer nivel
	ld     a, #1
	call man_level_load
	
ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  man_level_create
;;-----------------------------------------------------------
;; Inicializa el nuevo nivel en el array
;;-----------------------------------------------------------
;; ENTRADA:
;;	   HL: Puntero para la inicializacion del nivel
;; DESTRUYE: F, BC, DE, HL
;; SALIDA:
;;	   IX: Puntero a la entidad creada
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
man_level_create:
	push hl
	call man_level_new

	ld__ixh_d                    ;; Estas instrucciones 
	ld__ixl_e                    ;; hacen IX = DE
 
	pop hl
	ldir

ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  man_level_new
;;-----------------------------------------------------------
;; Añade un nuevo nivel al array sin inicializar nada
;;-----------------------------------------------------------
;; ENTRADA: -
;; DESTRUYE: F, BC, DE, HL
;; SALIDA:
;;	   DE: Puntero al inicio del nivel añadido
;;	   BC: sizeof_l
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
man_level_new:
	ld		hl, #_level_num
	inc    (hl)                     ;; Contamos un nivel mas

	ld		hl, (_level_pend)
	ld		 d, h
	ld 		 e, l 
	ld 		bc, #sizeof_l
	add 	hl, bc
	ld 		(_level_pend), hl      ;; Movemos el puntero a la nueva posicion
ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  man_level_load
;;-----------------------------------------------------------
;; Carga los enemigos en el array de entidades
;;-----------------------------------------------------------
;; ENTRADA: A -> Nivel a cargar (+1)
;; DESTRUYE:
;; SALIDA: -
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
man_level_load::
	push af
	ld      ix, #_level_array
	pop af

	dec a
	jr  z, load_enem

search_loop:
	ld      bc, #sizeof_l
	add     ix, bc
	dec a
	jr   nz, search_loop                 


load_enem:

	ld     l, e_p_tile_l(ix)
	ld     h, e_p_tile_h(ix)
	ld (current_level), ix

	call man_level_loadenem

ret



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  man_level_loadenem
;;-----------------------------------------------------------
;; Carga los enemigos
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
man_level_loadenem:

	ld ix, (#current_level)

	ld     a, #num_enem

	ld     l, e_p_enem_l(ix)
	ld     h, e_p_enem_h(ix)

	create_enem_loop:
		push af
		push hl
		
		ld       a, #2
		call man_entity_create             ;; Este bucle crea en el array de entidades
                                           ;; todos los enemigos del nivel
		pop hl
		pop af

		ld      bc, #sizeof_e
		add     hl, bc
		dec a
	jr nz, create_enem_loop
ret



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  man_level_map
;;-----------------------------------------------------------
;; Descomprime y dibuja el map del current level
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
man_level_map::

	ld ix, (#current_level)

	ld     l, e_p_tile_l(ix)
	ld     h, e_p_tile_h(ix)

	ld de, #decompress_levelbuffer_end
	call man_level_decrunch
    
    call man_level_setplayer            
	call sys_eren_drawmap

	ld ix, (#current_level)                     ;; Si estamos en el nivel base dibujamos los amigos que correspondan
	ld  a, e_grupo(ix)
	cp #0
	jr nz, _sg1 
	call sys_eren_friends
	ret

	_sg1:
	ld a, e_num(ix)                             ;; Si estamos en el ultimo nivel de cada zona dibujamos el sprite que toca 
	cp #2
	jr nz, _sg2 
	ld ix, (#current_level)
	ld  a, e_grupo(ix)
	call sys_eren_jaula
	ret

	_sg2:
ret



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  man_level_restart
;;-----------------------------------------------------------
;; Reinicia el nivel actual
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
man_level_restart::

	call man_entity_init

	ld    hl, #hero
	ld     a, #0                  
	call man_entity_create
	call man_level_setplayer

	call sys_eren_drawmap
	call man_level_loadenem
	
	ld ix, (#current_level)  
	ld a, e_num(ix)                             ;; Si estamos en el ultimo nivel de cada zona dibujamos el sprite que toca 
	cp #2
	jr nz, _sg3 
	ld ix, (#current_level)
	ld  a, e_grupo(ix)
	call sys_eren_jaula
	ret
	_sg3:

ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  man_level_next
;;-----------------------------------------------------------
;; Carga el siguiente nivel
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
man_level_next::
	ld    (current_door), a       ;; Almacenamos el lado por el que ha entrado


	call man_entity_init
	 
	ld    hl, #hero
	ld     a, #0                  
	call man_entity_create         ;; Reiniciamos el array de entidades

	ld ix, (current_level)         ;; Comprobamos cual es el nivel actual
	ld  a, e_num(ix)               ;; y de que tipo es


 	cp #2
	jr z, inicio                   ;; Si es tipo 2 cargamos el nivel base
 

 	cp #1
 	jr z, siguiente                ;; Si es tipo 1 cargamos el siguiente nivel
 	
 	                               
		ld    a, (current_door)    ;; Si es tipo 0 comprobamos que nivel se carga

		dec a
		jr  z, cargar_nivel

		search_loop2:
			ld      bc, #sizeof_3l
			add     ix, bc
			dec a
			jr   nz, search_loop2                 

		cargar_nivel:
			ld      bc, #sizeof_l
			add     ix, bc
 	jr ufin

 	siguiente:
		ld      ix, (current_level)    ;; Cargamos el siguiente nivel
		ld      bc, #sizeof_l
		add     ix, bc
	jr ufin

	inicio:                            ;; Cargamos el nivel base porque nos lo hemos pasado
		ld      ix, (current_level)

		ld       a, e_grupo(ix)        ;; Señalamos que esta completado ese grupo de niveles
		ld      ix, #lvl_st_1

		_bucle_l:
			dec a
			jr z, _fin_bl
			ld  bc, #tam_groups
			add ix, bc
		jr _bucle_l

		_fin_bl:
			ld   0(ix), #1
			ld      ix, #_level_array
			ld (current_level), ix

			call man_level_compr
			cp #3
			jr nz, ufin2

			jp man_game_init         ;; Si has completado la partida vuelve a inicio

	ufin:
		ld (current_level), ix
	ufin2:
		call man_level_map
		call man_level_loadenem
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  man_level_compr
;;-----------------------------------------------------------
;; Comprueba si se han superado todos los niveles
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
man_level_compr:
	ld d, #num_groups
	ld ix, #lvl_st_1

	_bucle_f:
		ld a, 0(ix)
		cp #1
		jr nz, _no_sup

		ld  bc, #tam_groups
		add ix, bc
	dec d
	jr nz, _bucle_f

	call sys_eren_congrats              	;; Pantalla de inicio
	call sys_input_tryagain

	ld d, #num_groups
	ld ix, #lvl_st_1

	_bucle_f2:
		ld 0(ix), #0

		ld  bc, #tam_groups
		add ix, bc
	dec d
	jr nz, _bucle_f2

	ld a, #3

	_no_sup:
ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  man_level_currentlimits
;;-----------------------------------------------------------
;; Devuelve en DE los limites del current level
;; y en A el grupo
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
man_level_currentlimits::
	ld ix, (#current_level)
	ld  a, e_grupo(ix)

	ld ix, #lvl_st_1

		_bucle_cl:
			dec a
			jr z, _fin_cl
			ld  bc, #tam_groups
			add ix, bc
		jr _bucle_cl

	_fin_cl:
		ld d, 7(ix)
		ld e, 8(ix)

	ld ix, (#current_level)
	ld  a, e_grupo(ix)
ret




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  man_level_winlimits
;;-----------------------------------------------------------
;; Devuelve en DE los limites del current level
;; y en A el grupo
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
man_level_winlimits:
	ld ix, (#current_level)
	ld  a, e_grupo(ix)

	ld ix, #lvl_st_1

		_bucle_wl:
			dec a
			jr z, _fin_wl
			ld  bc, #tam_groups
			add ix, bc
		jr _bucle_wl

	_fin_wl:
		ld d, 9(ix)
		ld e, 10(ix)

	ld ix, (#current_level)
	ld  a, e_grupo(ix)
ret



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  man_level_update
;;-----------------------------------------------------------
;; Devuelve en DE los limites del current level
;; y en A el grupo
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
man_level_update::
	ld ix, (#current_level)
	ld  a, e_num(ix)

	cp #2
	ret nz                             ;; Si es 2 comprobamos si se encuentra en la zona win

   call man_level_winlimits
   call man_level_zonasegura 
   cp #1                                   
   ret z

   call man_game_change
ret



;;                                                 ¡ MEJORABLE !
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sys_ai_zonasegura
;;-----------------------------------------------------------
;;  Comprueba si el jugador esta en la zona segura o no
;;-----------------------------------------------------------
;; ENTRADA:
;;    D: Limite x
;;    E: Limite y
;; SALIDA:
;;    A: 0-zona peligro, 1-zona segura
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
man_level_zonasegura::

   cp #1
      jr z, _cas2
   cp #2
      jr z, _cas1
   cp #3
      jr z, _cas4
   cp #4
      jr z, _cas3
 


      _cas1:
         call man_entity_getPers
         ld a, e_x(ix)
         sbc a, d
         jr nc, _comp_y1
         jr _zonaseg

         _comp_y1:
         ld a, e_y(ix)
         sbc e
         ld a, e
         ret c
         jr _zonaseg


      _cas2:
         call man_entity_getPers
         ld a, e_x(ix)
         sbc a, d
         jr nc, _comp_y2
         jr _zonaseg

         _comp_y2:
         ld a, e_y(ix)
         sbc e
         ld a, e
         ret nc
         jr _zonaseg


      _cas3:
         call man_entity_getPers
         ld a, e_x(ix)
         sbc a, d
         jr c, _comp_y3
         jr _zonaseg

         _comp_y3:
         ld a, e_y(ix)
         sbc e
         ld a, e
         ret c
         jr _zonaseg


      _cas4:
         call man_entity_getPers
         ld a, e_x(ix)
         sbc a, d
         jr c, _comp_y4
         jr _zonaseg

         _comp_y4:
         ld a, e_y(ix)
         sbc e
         ld a, e
         ret nc
         jr _zonaseg



      _zonaseg:
      ld a, #1
ret


man_level_setplayer::
	ld ix, (#current_level)
	ld  a, e_grupo(ix)

	cp #0
	ret z

	ld ix, #lvl_st_1

		_bucle_sp:
			dec a
			jr z, _fin_sp
			ld  bc, #tam_groups
			add ix, bc
		jr _bucle_sp

	_fin_sp:

	call man_entity_getPers2
	ld a, 5(ix)
	ld e_x(iy), a
	ld a, 6(ix)
	ld e_y(iy), a

ret
