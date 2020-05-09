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

.include "man/patrol.h.s"


;; DATOS NO PATRULLA
;; ................................
no_patrol::
	.db  0, 0


;; DATOS PATRULLA 1
;; ................................
patrol_01::
	.db  70,  20
	.db  70,  140
	.db  50,  140
	.db  50,  20
	.db patrol_invalid_move_x
	.dw patrol_01


;; DATOS PATRULLA 2
;; ................................
patrol_02::
	.db  36,  20
	.db  36,  70
	.db  68,  70
	.db  68,  20
	.db patrol_invalid_move_x
	.dw patrol_02


;; DATOS PATRULLA 3
;; ................................
patrol_03::
	.db  40,  170
	.db   8,  170
	.db   8,  120
	.db  40,  120
	.db patrol_invalid_move_x
	.dw patrol_03


;; DATOS PATRULLA 4
;; ................................
patrol_04::
	.db  42,  86
	.db  18,  86
	.db  18,  28
	.db  42,  28
	.db patrol_invalid_move_x
	.dw patrol_04


;; DATOS PATRULLA 5
;; ................................
patrol_05::
	.db  60,  70
	.db  50,  90
	.db  50,  70
	.db patrol_invalid_move_x
	.dw patrol_05


;; DATOS PATRULLA 6
;; ................................
patrol_06::
	.db  36,  16
	.db  36,  75
	.db  70,  75
	.db  70,  16
	.db patrol_invalid_move_x
	.dw patrol_06


;; DATOS PATRULLA 7
;; ................................
patrol_07::
	.db  50,  60
	.db  60,  80
	.db  60,  130
	.db  50,  90
	.db patrol_invalid_move_x
	.dw patrol_07


;; DATOS PATRULLA 8
;; ................................
patrol_08::
	.db  25,  66
	.db  51,  66
	.db  51,  116
	.db  25,  116
	.db patrol_invalid_move_x
	.dw patrol_08


;; DATOS PATRULLA 9
;; ................................
patrol_09::
	.db  15,  30
	.db  43,  30
	.db  43,  100
	.db  37,  100
	.db  37,  48
	.db  21,  48
	.db  21,  100
	.db  15,  100
	.db patrol_invalid_move_x
	.dw patrol_09


;; DATOS PATRULLA 10
;; ................................
patrol_10::
	.db  10,  20
	.db  30,  20
	.db  30,  80
	.db  22,  80
	.db  22,  60
	.db  10,  60
	.db patrol_invalid_move_x
	.dw patrol_10


;; DATOS PATRULLA 11
;; ................................
patrol_11::
	.db  10,  30
	.db  34, 30
	.db  34, 140
	.db  10,  140
	.db patrol_invalid_move_x
	.dw patrol_11


;; DATOS PATRULLA 12
;; ................................
patrol_12::
	.db  26,  110
	.db  26,  50
	.db  16,  50
	.db  16,  110
	.db patrol_invalid_move_x
	.dw patrol_12


;; DATOS PATRULLA 13
;; ................................
patrol_13::
	.db  62,  130
	.db  62,  170
	.db  50,  170
	.db  50,  130
	.db patrol_invalid_move_x
	.dw patrol_13


;; DATOS PATRULLA 14
;; ................................
patrol_14::
	.db  30,  100
	.db  46,  100
	.db  30,  144
	.db  10,  144
	.db patrol_invalid_move_x
	.dw patrol_14


;; DATOS PATRULLA 15
;; ................................
patrol_15::
	.db  10,  120
	.db  30,  120
	.db  30,  160
	.db  10,  160
	.db patrol_invalid_move_x
	.dw patrol_15


;; DATOS PATRULLA 16
;; ................................
patrol_16::
	.db  40,  140
	.db  40,  100
	.db  20,  100
	.db  20,  140
	.db patrol_invalid_move_x
	.dw patrol_16


;; DATOS PATRULLA 17
;; ................................
patrol_17::
	.db  44,  20
	.db  68,  20
	.db  68,  60
	.db  44,  60
	.db patrol_invalid_move_x
	.dw patrol_17


;; DATOS PATRULLA 18
;; ................................
patrol_18::
	.db   54,  80
	.db   34, 150
	.db   54, 150
	.db patrol_invalid_move_x
	.dw patrol_18


;; DATOS PATRULLA 19
;; ................................
patrol_19::
	.db   30, 40
	.db   60, 80
	.db   30, 120
	.db   60, 160
	.db   30, 120
	.db   60, 80
	.db patrol_invalid_move_x
	.dw patrol_19


;; DATOS PATRULLA 20
;; ................................
patrol_20::
	.db   60, 40
	.db   30, 80
	.db   60, 120
	.db   30, 160
	.db   60, 120
	.db   30, 80
	.db patrol_invalid_move_x
	.dw patrol_20


;; DATOS PATRULLA 21
;; ................................
patrol_21::
	.db   16, 40
	.db   46, 80
	.db   16, 120
	.db   46, 160
	.db   16, 120
	.db   46, 80
	.db patrol_invalid_move_x
	.dw patrol_21


;; DATOS PATRULLA 22
;; ................................
patrol_22::
	.db   46, 40
	.db   16, 80
	.db   46, 120
	.db   16, 160
	.db   46, 120
	.db   16, 80
	.db patrol_invalid_move_x
	.dw patrol_22

;; DATOS PATRULLA 23
;; ................................
patrol_23::
	.db   18, 50
	.db   30, 50
	.db   30, 120
	.db   30, 50
	.db   18, 50
	.db patrol_invalid_move_x
	.dw patrol_23

;; DATOS PATRULLA 24
;; ................................
patrol_24::
	.db   40, 140
	.db   70, 140
	.db   40, 140
	.db patrol_invalid_move_x
	.dw patrol_24

;; DATOS PATRULLA 25
;; ................................
patrol_25::
	.db   72, 20
	.db   44, 20
	.db   44, 48
	.db   72, 48
	.db   72, 20
	.db patrol_invalid_move_x
	.dw patrol_25

;; DATOS PATRULLA 26
;; ................................
patrol_26::
	.db   18, 120
	.db   18, 170
	.db   70, 170
	.db   18, 170
	.db   18, 120
	.db patrol_invalid_move_x
	.dw patrol_26

;; DATOS PATRULLA 27
;; ................................
patrol_27::
	.db   18, 90
	.db   50, 90
	.db   50, 110
	.db   30, 110
	.db   30, 90
	.db   18, 90
	.db patrol_invalid_move_x
	.dw patrol_27

;; DATOS PATRULLA 28
;; ................................
patrol_28::
	.db   30, 20
	.db   30, 45
	.db   63, 45
	.db   63, 100
	.db   63, 45
	.db   30, 45
	.db   30, 20
	.db patrol_invalid_move_x
	.dw patrol_28

;; DATOS PATRULLA 29
;; ................................
patrol_29::
	.db    5, 170
	.db   43, 170
	.db    5, 170
	.db patrol_invalid_move_x
	.dw patrol_29

;; DATOS PATRULLA 30
;; ................................
patrol_30::
	.db   38, 70
	.db   38, 100
	.db   46, 100
	.db   46, 130
	.db   70, 130
	.db   46, 130
	.db   46, 100
	.db   38, 100
	.db   38, 70
	.db patrol_invalid_move_x
	.dw patrol_30

;; DATOS PATRULLA 31
;; ................................
patrol_31::
	.db    6, 40
	.db    6, 10
	.db   46, 10
	.db   46, 30
	.db   16, 30
	.db   16, 10
	.db   6,  10
	.db   6,  40
	.db patrol_invalid_move_x
	.dw patrol_31

;; DATOS PATRULLA 32
;; ................................
patrol_32::
	.db  58, 20
	.db  58, 170
	.db  58, 20  
	.db patrol_invalid_move_x
	.dw patrol_32

;; DATOS PATRULLA 33
;; ................................
patrol_33::
	.db  46,  75
	.db  34,  75
	.db  34,  175
	.db  24,  175
	.db  34,  175
	.db  34,  75
	.db  46,  75 
	.db patrol_invalid_move_x
	.dw patrol_33

;; DATOS PATRULLA 34
;; ................................
patrol_34::
	.db   8, 150
	.db   8, 30
	.db  30, 30
	.db   8, 30
	.db   8, 150  
	.db patrol_invalid_move_x
	.dw patrol_34


;; DATOS PATRULLA 35
;; ................................
patrol_35::
	.db   70, 110
	.db   70, 162
	.db patrol_invalid_move_x
	.dw patrol_35


;; DATOS PATRULLA 36
;; ................................
patrol_36::
	.db   70, 26
	.db   70, 100
	.db patrol_invalid_move_x
	.dw patrol_36


;; DATOS PATRULLA 37
;; ................................
patrol_37::
	.db   8, 110
	.db   8, 162
	.db patrol_invalid_move_x
	.dw patrol_37


;; DATOS PATRULLA 38
;; ................................
patrol_38::
	.db   8, 26
	.db   8, 100
	.db patrol_invalid_move_x
	.dw patrol_38


