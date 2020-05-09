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
;; LEVEL MANAGER
;;


;; Constantes
max_levels == 61
num_groups == 4
tam_groups == 15
num_enem   == 3


;; Compresion y descompresion
decompress_buffer           == 0x2e0

tilesetmaxsize              == 0xC80
levelmaxsize                == 0x1F4
tileandlevemaxsize          == tilesetmaxsize + levelmaxsize

decompress_tilebuffer_end   == decompress_buffer + tilesetmaxsize - 1
decompress_levelbuffer_end  == decompress_buffer + tileandlevemaxsize - 1

tileset_ptr                 == decompress_buffer +  0
tilemap_ptr                 == decompress_buffer + tilesetmaxsize



.globl man_level_getArray
.globl man_level_init
.globl man_level_load
.globl man_level_map
.globl man_level_decrunch
.globl man_level_restart
.globl man_level_next
.globl man_level_all
.globl man_level_currentlimits
.globl man_level_update
.globl man_level_zonasegura
.globl man_level_setplayer