(******************************************************************************)
(* OASIS: architecture for building OCaml libraries and applications          *)
(*                                                                            *)
(* Copyright (C) 2011-2016, Sylvain Le Gall                                   *)
(* Copyright (C) 2008-2011, OCamlCore SARL                                    *)
(*                                                                            *)
(* This library is free software; you can redistribute it and/or modify it    *)
(* under the terms of the GNU Lesser General Public License as published by   *)
(* the Free Software Foundation; either version 2.1 of the License, or (at    *)
(* your option) any later version, with the OCaml static compilation          *)
(* exception.                                                                 *)
(*                                                                            *)
(* This library is distributed in the hope that it will be useful, but        *)
(* WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY *)
(* or FITNESS FOR A PARTICULAR PURPOSE. See the file COPYING for more         *)
(* details.                                                                   *)
(*                                                                            *)
(* You should have received a copy of the GNU Lesser General Public License   *)
(* along with this library; if not, write to the Free Software Foundation,    *)
(* Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA              *)
(******************************************************************************)


(** Run tests
    @author Sylvain Le Gall
*)


open OASISTypes


(** [test lst pkg extra_args] Run all tests. [lst] elements are tuples
    [(f, cs, test)], apply in turn [f pkg (cs, test) extra_args] and
    collect their results. Combine all results to give a percentage of
    failure.
*)
val test:
  ctxt:OASISContext.t ->
  ((ctxt:OASISContext.t ->
    package ->
    common_section * test ->
    arg array ->
    float) *
     common_section *
     test) list ->
  package ->
  arg array ->
  unit
