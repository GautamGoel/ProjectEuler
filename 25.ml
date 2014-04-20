open Num


let answer = 
	let fm = ref (num_of_int 1) in (* f_(n-1) *)
	let fn = ref (num_of_int 1) in
	let i = ref 2 in
	let tmp = ref (num_of_int 1) in
	while !fn <=/ power_num (num_of_int 10) (num_of_int 999) do 
		tmp := !fn;
		fn := !fn +/ !fm;
		fm := !tmp;
		i := !i + 1
	done;
	!i