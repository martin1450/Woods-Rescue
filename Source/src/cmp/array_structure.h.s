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
;; Macros que generan codigo
;;

.macro DefineComponentArrayStructure _Tname, _N, _DefineTypeMacroDefault
	_Tname'_num:	.db 0xAB
	_Tname'_numbalas:	.db 0xCD
	_Tname'_numenem:	.db 0xEF
	_Tname'_pend: .dw _Tname'_array
	_Tname'_array:
	.rept _N
		_DefineTypeMacroDefault
	.endm
.endm

.macro DefineComponentArrayStructure_Size _Tname, _N, _ComponentSize
	_Tname'_num:	.db 0
	_Tname'_pend: 	.dw _Tname'_array
	_Tname'_first: 	.dw _Tname'_array
	_Tname'_single: .dw _Tname'_array
	_Tname'_array:
		.ds _N*_ComponentSize
.endm