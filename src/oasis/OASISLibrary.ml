
(** Library schema and generator 
    @author Sylvain Le Gall
  *)

open OASISTypes;;
open OASISSchema;;
open OASISValueParser;;

let schema, generator =
  let schm =
    schema ()
  in
  let path =
    new_field schm "path" directory_exists
  in
  let buildable = 
    new_field schm "buildable"
      ~default:true
      boolean
  in
  let modules =
    new_field schm "modules" 
      ~default:[]
      modules
  in
    schm,
    (fun wrtr ->
       {
         lib_buildable = buildable wrtr;
         lib_path      = path wrtr;
         lib_modules   = modules wrtr;
         lib_extra     = extra wrtr;
       })
;;