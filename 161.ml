open List
open Pervasives
open Hashtbl
open Core.Std
open Format

type tile = int * int

let compare (a1, b1) (a2, b2) = if a1 = a2 then b1 - b2 else a1 - a2 

(*puts a list of tiles in a canonical form *)
let normalize (txs : tile list) =
        let sorted : tile list = List.sort compare txs in
        match sorted with 
                |[] -> []
                |(x0, y0) :: _ -> List.map sorted (fun (x, y) -> (x-x0, y-y0))

let removePiece (txs : tile list) (p : tile list) = 
        let diff l1 l2 = List.filter l1 (fun x -> not (List.mem l2 x)) in
        let d = diff txs p in
        if List.length d mod 3 <> 0 then None
        else Some (normalize d)

let p1 = [(0, 0); (1, 0); (0, 1)]
let p2 = [(0, 0); (1, 0); (0, -1)]
let p3 = [(0, 0); (-1, 0); (0, 1)]
let p4 = [(0, 0); (-1, 0); (0, -1)]
let p5 = [(0, 0); (1, 0); (2, 0)]
let p6 = [(0, 0); (0, 1); (0, 2)]

let pieces = List.map [p1; p2; p3; p4; p5; p6] normalize

(* the table in which we cache calls to solve *)
let table : (tile list, int) Hashtbl.Poly.t = Hashtbl.create ~hashable:Hashtbl.Poly.hashable ()

(*calculates the number of ways to tile txs with triominoes.
Precondition: txs is normalized *)
let rec solve (txs : tile list) = 
        if List.is_empty txs then 1 else
        match Hashtbl.find table txs with 
                |Some n -> n
                |None ->
                let branches = List.map pieces (removePiece txs) in
                let rec foldSum l = match l with
                        | [] -> 0
                        | None :: l' -> foldSum l'
                        | Some a :: l' -> solve a + foldSum l'
                in let n = foldSum branches in
                   let rotate xs = List.map xs (fun (x, y) -> (-y, x)) in
                   let r1 = rotate txs in
                   let r2 = rotate r1 in
                   let r3 = rotate r2 in
                   Hashtbl.add_exn table txs n; n (*
                   Hashtbl.add_exn table r1 n;
                   Hashtbl.add_exn table r2 n;
                   Hashtbl.add_exn table r3 n;
                   n *)

let makeRect m n = normalize @@ List.cartesian_product (List.range 0 m) (List.range 0 n)
let answer = solve (makeRect 9 12)
let () = printf "%d\n" answer
