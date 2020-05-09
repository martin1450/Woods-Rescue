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
;;ANIMATIONS MANAGER
;;

.include "assets/assets.h.s"
.include "cmp/entity.h.s"
.include "cpctelera.h.s"

;;---------------------------------------------------

_animations_array:
	.dw _hero_standing    		
	.dw _hero_walking_left		
	.dw _hero_walking_right		
	.dw nullptr				
	.dw _hero_walking_down		
	.dw _hero_walking_downleft	
	.dw _hero_walking_downright	
	.dw nullptr				
	.dw _hero_walking_up		
	.dw _hero_walking_upleft	
	.dw _hero_walking_upright	
	.dw nullptr				
	.dw nullptr				
	.dw nullptr				
	.dw nullptr				
	.dw nullptr				
	.dw _bala_standing		
	.dw _bala_left			
	.dw _bala_right			
	.dw nullptr					
	.dw _bala_down			
	.dw _bala_downleft		
	.dw _bala_downright		
	.dw nullptr				
	.dw _bala_up			
	.dw _bala_upleft			
	.dw _bala_upright			
	
_animations_array_enemyigoLoboyCamaleon:
	.dw _lobo_standing    	
	.dw _lobo_walking_left	
	.dw _lobo_walking_right	
	.dw nullptr			
	.dw _lobo_walking_down	
	.dw _lobo_walking_downleft	
	.dw _lobo_walking_downright
	.dw nullptr				
	.dw _lobo_walking_up		
	.dw _lobo_walking_upleft	
	.dw _lobo_walking_upright	
	.dw nullptr				
	.dw nullptr				
	.dw nullptr				
	.dw nullptr				
	.dw nullptr				
	.dw _camaleon_standing    	
	.dw _camaleon_walking_left	
	.dw _camaleon_walking_right	
	.dw nullptr			
	.dw _camaleon_walking_down	
	.dw _camaleon_walking_downleft	
	.dw _camaleon_walking_downright
	.dw nullptr				
	.dw _camaleon_walking_up		
	.dw _camaleon_walking_upleft	
	.dw _camaleon_walking_upright

_animations_array_enemyigoAveyArbol::
	.dw _arbol_standing    	
	.dw _arbol_standing	
	.dw _arbol_standing
	.dw nullptr			
	.dw _arbol_standing	
	.dw _arbol_standing	
	.dw _arbol_standing
	.dw nullptr				
	.dw _arbol_standing		
	.dw _arbol_standing	
	.dw _arbol_standing
	.dw nullptr				
	.dw nullptr				
	.dw nullptr				
	.dw nullptr				
	.dw nullptr				
	.dw _ave_standing    	
	.dw _ave_walking_left	
	.dw _ave_walking_right	
	.dw nullptr			
	.dw _ave_walking_down	
	.dw _ave_walking_downleft	
	.dw _ave_walking_downright
	.dw nullptr				
	.dw _ave_walking_up		
	.dw _ave_walking_upleft	
	.dw _ave_walking_upright

_animations_array_enemyigoArbolEating::	
	.dw _arbol_eating    	
	.dw _arbol_eating	
	.dw _arbol_eating
	.dw nullptr			
	.dw _arbol_eating	
	.dw _arbol_eating	
	.dw _arbol_eating
	.dw nullptr				
	.dw _arbol_eating		
	.dw _arbol_eating	
	.dw _arbol_eating				


man_animations_getAnimHL::
	ld 	hl, #_animations_array
	ld 	a, b
	add 	a

	add_hl_a

	ld 	a, (hl)
	inc	hl
	ld 	h, (hl)
	ld 	l, a

	ret
man_animations_getAnimEnemyLoboyCamaleon::
	ld 	hl, #_animations_array_enemyigoLoboyCamaleon
	ld 	a, b
	add 	a

	add_hl_a

	ld 	a, (hl)
	inc	hl
	ld 	h, (hl)
	ld 	l, a

	ret

man_animations_getAnimEnemyAveyArbol::
	ld 	hl, #_animations_array_enemyigoAveyArbol
	ld 	a, b
	add 	a

	add_hl_a

	ld 	a, (hl)
	inc	hl
	ld 	h, (hl)
	ld 	l, a

	ret

man_animations_getAnimEnemArbolEating::
	ld 	hl, #_animations_array_enemyigoArbolEating
	ld 	a, b
	add 	a

	add_hl_a

	ld 	a, (hl)
	inc	hl
	ld 	h, (hl)
	ld 	l, a

	ret


;;-------------------------------------

_hero_standing::
	.dw _sp_hero_00
	.dw nullptr
	.dw _hero_standing

_hero_walking_up::
	.dw _sp_hero_04
	.dw _sp_hero_05
	.dw _sp_hero_06
	.dw _sp_hero_07
	.dw nullptr
	.dw _hero_walking_up

_hero_walking_upleft::
	.dw _sp_hero_16
	.dw _sp_hero_17
	.dw _sp_hero_18
	.dw _sp_hero_19
	.dw nullptr
	.dw _hero_walking_upleft

_hero_walking_upright::
	.dw _sp_hero_20
	.dw _sp_hero_21
	.dw _sp_hero_22
	.dw _sp_hero_23
	.dw nullptr
	.dw _hero_walking_upright

_hero_walking_down::
	.dw _sp_hero_00
	.dw _sp_hero_01
	.dw _sp_hero_02
	.dw _sp_hero_03
	.dw nullptr
	.dw _hero_walking_down

_hero_walking_downleft::
	.dw _sp_hero_12
	.dw _sp_hero_13
	.dw _sp_hero_14
	.dw _sp_hero_15
	.dw nullptr
	.dw _hero_walking_downleft

_hero_walking_downright::
	.dw _sp_hero_08
	.dw _sp_hero_09
	.dw _sp_hero_10
	.dw _sp_hero_11
	.dw nullptr
	.dw _hero_walking_downright

_hero_walking_right::
	.dw _sp_hero_24
	.dw _sp_hero_25
	.dw _sp_hero_26
	.dw _sp_hero_27
	.dw nullptr
	.dw _hero_walking_right

_hero_walking_left::
	.dw _sp_hero_28
	.dw _sp_hero_29
	.dw _sp_hero_30
	.dw _sp_hero_31
	.dw nullptr
	.dw _hero_walking_left

_bala_standing::
	.dw _sp_hero_32
	.dw nullptr
	.dw _bala_standing

_bala_left::
	.dw _sp_hero_32
	.dw nullptr
	.dw _bala_left
_bala_right::
	.dw _sp_hero_32
	.dw nullptr
	.dw _bala_right

_bala_up::
	.dw _sp_hero_33
	.dw nullptr
	.dw _bala_up
_bala_upleft::
	.dw _sp_hero_34
	.dw nullptr
	.dw _bala_upleft
_bala_upright::
	.dw _sp_hero_35
	.dw nullptr
	.dw _bala_upright

_bala_down::
	.dw _sp_hero_33
	.dw nullptr
	.dw _bala_down
_bala_downleft::
	.dw _sp_hero_35
	.dw nullptr
	.dw _bala_downleft
_bala_downright::
	.dw _sp_hero_34
	.dw nullptr
	.dw _bala_downright


;;-------------------------------
;; ENEMIGOS

_enemigo_standing::
	.dw _sp_enemigo_00
	.dw nullptr
	.dw _enemigo_standing


_lobo_standing::
	.dw _sp_enemigo_00
	.dw nullptr
	.dw _lobo_standing

_lobo_walking_up::
	.dw _sp_enemigo_05
	.dw _sp_enemigo_06
	.dw _sp_enemigo_07
	.dw _sp_enemigo_08
	.dw nullptr
	.dw _lobo_walking_up

_lobo_walking_upleft::
	.dw _sp_enemigo_05
	.dw _sp_enemigo_06
	.dw _sp_enemigo_07
	.dw _sp_enemigo_08
	.dw nullptr
	.dw _lobo_walking_upleft

_lobo_walking_upright::
	.dw _sp_enemigo_05
	.dw _sp_enemigo_06
	.dw _sp_enemigo_07
	.dw _sp_enemigo_08
	.dw nullptr
	.dw _lobo_walking_upright

_lobo_walking_down::
	.dw _sp_enemigo_01
	.dw _sp_enemigo_02
	.dw _sp_enemigo_03
	.dw _sp_enemigo_04
	.dw nullptr
	.dw _lobo_walking_down

_lobo_walking_downleft::
	.dw _sp_enemigo_01
	.dw _sp_enemigo_02
	.dw _sp_enemigo_03
	.dw _sp_enemigo_04
	.dw nullptr
	.dw _lobo_walking_downleft

_lobo_walking_downright::
	.dw _sp_enemigo_01
	.dw _sp_enemigo_02
	.dw _sp_enemigo_03
	.dw _sp_enemigo_04
	.dw nullptr
	.dw _lobo_walking_downright

_lobo_walking_right::
	.dw _sp_enemigo_09
	.dw _sp_enemigo_10
	.dw _sp_enemigo_11
	.dw _sp_enemigo_12
	.dw nullptr
	.dw _lobo_walking_right

_lobo_walking_left::
	.dw _sp_enemigo_13
	.dw _sp_enemigo_14
	.dw _sp_enemigo_15
	.dw _sp_enemigo_16
	.dw nullptr
	.dw _lobo_walking_left


;;------------------------------------------
_camaleon_standing::
	.dw _sp_enemigo_17
	.dw nullptr
	.dw _camaleon_standing

_camaleon_walking_up::
	.dw _sp_enemigo_28
	.dw _sp_enemigo_29
	.dw nullptr
	.dw _camaleon_walking_up

_camaleon_walking_upleft::
	.dw _sp_enemigo_28
	.dw _sp_enemigo_29
	.dw nullptr
	.dw _camaleon_walking_upleft

_camaleon_walking_upright::
	.dw _sp_enemigo_28
	.dw _sp_enemigo_29
	.dw nullptr
	.dw _camaleon_walking_upright

_camaleon_walking_down::
	.dw _sp_enemigo_26
	.dw _sp_enemigo_27
	.dw nullptr
	.dw _camaleon_walking_down

_camaleon_walking_downleft::
	.dw _sp_enemigo_26
	.dw _sp_enemigo_27
	.dw nullptr
	.dw _camaleon_walking_downleft

_camaleon_walking_downright::
	.dw _sp_enemigo_26
	.dw _sp_enemigo_27
	.dw nullptr
	.dw _camaleon_walking_downright

_camaleon_walking_right::
	.dw _sp_enemigo_18
	.dw _sp_enemigo_19
	.dw _sp_enemigo_20
	.dw _sp_enemigo_21
	.dw nullptr
	.dw _camaleon_walking_right

_camaleon_walking_left::
	.dw _sp_enemigo_22
	.dw _sp_enemigo_23
	.dw _sp_enemigo_24
	.dw _sp_enemigo_25
	.dw nullptr
	.dw _camaleon_walking_left

;-----------------------------------------------

_arbol_standing::
	.dw _sp_enemigo_42
	.dw nullptr
	.dw _arbol_standing


_arbol_eating::
	.dw _sp_enemigo_43
	.dw _sp_enemigo_43
	.dw _sp_enemigo_43
	.dw _sp_enemigo_43
	.dw _sp_enemigo_43
	.dw _sp_enemigo_43
	.dw _sp_enemigo_43
	.dw _sp_enemigo_43
	.dw _sp_enemigo_44
	.dw _sp_enemigo_44
	.dw _sp_enemigo_44
	.dw _sp_enemigo_44
	.dw _sp_enemigo_44
	.dw _sp_enemigo_44
	.dw _sp_enemigo_44
	.dw _sp_enemigo_45
	.dw _sp_enemigo_45
	.dw _sp_enemigo_45
	.dw _sp_enemigo_45
	.dw _sp_enemigo_45
	.dw _sp_enemigo_45
	.dw _sp_enemigo_45
	.dw _sp_enemigo_45
	.dw _sp_enemigo_46
	.dw _sp_enemigo_46
	.dw _sp_enemigo_46
	.dw _sp_enemigo_46
	.dw _sp_enemigo_46
	.dw _sp_enemigo_46
	.dw _sp_enemigo_46
	.dw _sp_enemigo_46
	.dw _sp_enemigo_46
	.dw _sp_enemigo_46
	.dw _sp_enemigo_46
	.dw _sp_enemigo_46
	.dw _sp_enemigo_46
	.dw _sp_enemigo_46
	.dw _sp_enemigo_46
	.dw _sp_enemigo_47
	.dw _sp_enemigo_47
	.dw _sp_enemigo_47
	.dw _sp_enemigo_47
	.dw _sp_enemigo_47
	.dw _sp_enemigo_47
	.dw _sp_enemigo_47
	.dw _sp_enemigo_47
	.dw _sp_enemigo_47
	.dw _sp_enemigo_47
	.dw _sp_enemigo_47
	.dw _sp_enemigo_47
	.dw _sp_enemigo_47
	.dw _sp_enemigo_48
	.dw _sp_enemigo_48
	.dw _sp_enemigo_48
	.dw _sp_enemigo_48
	.dw _sp_enemigo_48
	.dw _sp_enemigo_48
	.dw _sp_enemigo_48
	.dw _sp_enemigo_48
	.dw _sp_enemigo_48
	.dw _sp_enemigo_48
	.dw _sp_enemigo_48
	.dw _sp_enemigo_48
	.dw _sp_enemigo_48
	.dw _sp_enemigo_48
	.dw _sp_enemigo_49
	.dw _sp_enemigo_49
	.dw _sp_enemigo_49
	.dw _sp_enemigo_49
	.dw _sp_enemigo_49
	.dw _sp_enemigo_49
	.dw _sp_enemigo_49
	.dw _sp_enemigo_49
	.dw _sp_enemigo_49
	.dw _sp_enemigo_49
	.dw _sp_enemigo_49
	.dw _sp_enemigo_49
	.dw _sp_enemigo_49
	.dw _sp_enemigo_49
	.dw _sp_enemigo_49
	.dw _sp_enemigo_49
	.dw _sp_enemigo_50
	.dw _sp_enemigo_50
	.dw _sp_enemigo_50
	.dw _sp_enemigo_50
	.dw _sp_enemigo_50
	.dw _sp_enemigo_50
	.dw _sp_enemigo_50
	.dw _sp_enemigo_50
	.dw _sp_enemigo_50
	.dw _sp_enemigo_50
	.dw _sp_enemigo_50
	.dw _sp_enemigo_50
	.dw _sp_enemigo_50
	.dw _sp_enemigo_50
	.dw _sp_enemigo_50
	.dw _sp_enemigo_50
	.dw _sp_enemigo_51
	.dw _sp_enemigo_51
	.dw _sp_enemigo_51
	.dw _sp_enemigo_51
	.dw _sp_enemigo_51
	.dw _sp_enemigo_51
	.dw _sp_enemigo_51
	.dw _sp_enemigo_51
	.dw _sp_enemigo_51
	.dw _sp_enemigo_51
	.dw _sp_enemigo_51
	.dw _sp_enemigo_51
	.dw _sp_enemigo_51
	.dw _sp_enemigo_51
	.dw nullptr
	.dw _arbol_eating

;;_arbol_eating::
;;	.dw _sp_enemigo_43
;;	.dw _sp_enemigo_44
;;	.dw _sp_enemigo_45
;;	.dw _sp_enemigo_46
;;	.dw nullptr
;;	.dw _arbol_eating

_arbol_phrase::
	.dw _sp_enemigo_47
	.dw _sp_enemigo_48
	.dw _sp_enemigo_49
	.dw _sp_enemigo_50
	.dw _sp_enemigo_51
	.dw nullptr
	.dw _arbol_phrase

;--------------------------------

_ave_standing::
	.dw _sp_enemigo_30
	.dw nullptr
	.dw _ave_standing

_ave_walking_up::
	.dw _sp_enemigo_35
	.dw _sp_enemigo_34
	.dw nullptr
	.dw _ave_walking_up

_ave_walking_upleft::
	.dw _sp_enemigo_35
	.dw _sp_enemigo_34
	.dw nullptr
	.dw _ave_walking_upleft

_ave_walking_upright::
	.dw _sp_enemigo_35
	.dw _sp_enemigo_34
	.dw nullptr
	.dw _ave_walking_upright

_ave_walking_down::
	.dw _sp_enemigo_36
	.dw _sp_enemigo_37
	.dw nullptr
	.dw _ave_walking_down

_ave_walking_downleft::
	.dw _sp_enemigo_36
	.dw _sp_enemigo_37
	.dw nullptr
	.dw _ave_walking_downleft

_ave_walking_downright::
	.dw _sp_enemigo_36
	.dw _sp_enemigo_37
	.dw nullptr
	.dw _ave_walking_downright

_ave_walking_right::
	.dw _sp_enemigo_32
	.dw _sp_enemigo_33
	.dw nullptr
	.dw _ave_walking_right

_ave_walking_left::
	.dw _sp_enemigo_30
	.dw _sp_enemigo_31
	.dw nullptr
	.dw _ave_walking_left