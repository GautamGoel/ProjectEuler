open Num

let rec expmod (r : num) (e : num) (n : num) = 
	if e =/ (num_of_int 0) then num_of_int 1 
   (* else if e == 1 then r mod n *)
	else let r2 = r */ r in 
		 let z = if r2 >/ n then mod_num r2 n else r2 in
			if mod_num e (num_of_int 2) =/ num_of_int 1 then mod_num (r */ (expmod z ((pred_num e) // ( num_of_int 2)) n)) n
			else mod_num (expmod z (e // (num_of_int 2)) n) n

let expmod2 r e n = expmod (num_of_int r) (num_of_int e) (num_of_int n)
	
let answer = mod_num ((num_of_int 28433) */ (expmod2 2 7830457 10000000000) +/ (num_of_int 1)) (num_of_int 10000000000)

let rec pow a = function
  | 0 -> 1
  | 1 -> a
  | n -> 
    let b = pow a (n / 2) in
    b * b * (if n mod 2 = 0 then 1 else a)