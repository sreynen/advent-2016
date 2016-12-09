open Str
open List
open Printf;;

let grid = Hashtbl.create 301;;

let grid_index x y =
  String.concat "" [(string_of_int x); "x"; (string_of_int y)]
  ;;

let fill_rect width height value =
  for x = 1 to height do
    for y = 1 to width do
      Hashtbl.add grid (grid_index x y) value
    done
  done
  ;;

let rect s =
  print_string s;
  printf "\n";
  let params = Str.split (Str.regexp "x") s in
  let width = (int_of_string (nth params 0)) in
  let height = (int_of_string (nth params 1)) in
  fill_rect width height "#"
  ;;

let print_grid a_grid =
  for x = 1 to 6 do
    for y = 1 to 50 do
      print_string (Hashtbl.find a_grid (grid_index x y))
    done;
    printf "\n"
  done
  ;;

let rotate_grid direction position amount =
  for i = 1 to amount do
    if direction = "column" then (
      let temp = Hashtbl.find grid (grid_index 6 position) in
      for x = 6 downto 2 do
        Hashtbl.add grid (grid_index x position) (Hashtbl.find grid (grid_index (x - 1) position))
      done;
      Hashtbl.add grid (grid_index 1 position) temp
    )
    else (
      Hashtbl.add grid "temp" (Hashtbl.find grid (grid_index position 50));
      for y = 50 downto 2 do
        Hashtbl.add grid (grid_index position y) (Hashtbl.find grid (grid_index position (y - 1)))
      done;
      Hashtbl.add grid (grid_index position 1) (Hashtbl.find grid "temp")
    );
  done
  ;;

let rotate s =
  print_string s;
  printf "\n";
  let params = Str.split (Str.regexp " ") s in
  let direction = (nth params 0) in
  let amount = (int_of_string (nth params 3)) in
  let position_params = Str.split (Str.regexp "=") (nth params 1) in
  let position = (int_of_string (nth position_params 1)) in
  rotate_grid direction (position + 1) amount
  ;;

let () =

  fill_rect 50 6 "_";

  rect "1x1";
  rotate "row y=0 by 10";
  rect "1x1";
  rotate "row y=0 by 10";
  rect "1x1";
  rotate "row y=0 by 5";
  rect "1x1";
  rotate "row y=0 by 3";
  rect "2x1";
  rotate "row y=0 by 4";
  rect "1x1";
  rotate "row y=0 by 3";
  rect "1x1";
  rotate "row y=0 by 2";
  rect "1x1";
  rotate "row y=0 by 3";
  rect "2x1";
  rotate "row y=0 by 2";
  rect "1x1";
  rotate "row y=0 by 3";
  rect "2x1";
  rotate "row y=0 by 5";
  rotate "column x=0 by 1";
  rect "4x1";
  rotate "row y=1 by 12";
  rotate "row y=0 by 10";
  rotate "column x=0 by 1";
  rect "9x1";
  rotate "column x=7 by 1";
  rotate "row y=1 by 3";
  rotate "row y=0 by 2";
  rect "1x2";
  rotate "row y=1 by 3";
  rotate "row y=0 by 1";
  rect "1x3";
  rotate "column x=35 by 1";
  rotate "column x=5 by 2";
  rotate "row y=2 by 5";
  rotate "row y=1 by 5";
  rotate "row y=0 by 2";
  rect "1x3";
  rotate "row y=2 by 8";
  rotate "row y=1 by 10";
  rotate "row y=0 by 5";
  rotate "column x=5 by 1";
  rotate "column x=0 by 1";
  rect "6x1";
  rotate "row y=2 by 7";
  rotate "row y=0 by 5";
  rotate "column x=0 by 1";
  rect "4x1";
  rotate "column x=40 by 2";
  rotate "row y=2 by 10";
  rotate "row y=0 by 12";
  rotate "column x=5 by 1";
  rotate "column x=0 by 1";
  rect "9x1";
  rotate "column x=43 by 1";
  rotate "column x=40 by 2";
  rotate "column x=38 by 1";
  rotate "column x=15 by 1";
  rotate "row y=3 by 35";
  rotate "row y=2 by 35";
  rotate "row y=1 by 32";
  rotate "row y=0 by 40";
  rotate "column x=32 by 1";
  rotate "column x=29 by 1";
  rotate "column x=27 by 1";
  rotate "column x=25 by 1";
  rotate "column x=23 by 2";
  rotate "column x=22 by 1";
  rotate "column x=21 by 3";
  rotate "column x=20 by 1";
  rotate "column x=18 by 3";
  rotate "column x=17 by 1";
  rotate "column x=15 by 1";
  rotate "column x=14 by 1";
  rotate "column x=12 by 1";
  rotate "column x=11 by 3";
  rotate "column x=10 by 1";
  rotate "column x=9 by 1";
  rotate "column x=8 by 2";
  rotate "column x=7 by 1";
  rotate "column x=4 by 1";
  rotate "column x=3 by 1";
  rotate "column x=2 by 1";
  rotate "column x=0 by 1";
  rect "34x1";
  rotate "column x=44 by 1";
  rotate "column x=24 by 1";
  rotate "column x=19 by 1";
  rotate "row y=1 by 8";
  rotate "row y=0 by 10";
  rotate "column x=8 by 1";
  rotate "column x=7 by 1";
  rotate "column x=6 by 1";
  rotate "column x=5 by 2";
  rotate "column x=3 by 1";
  rotate "column x=2 by 1";
  rotate "column x=1 by 1";
  rotate "column x=0 by 1";
  rect "9x1";
  rotate "row y=0 by 40";
  rotate "column x=43 by 1";
  rotate "row y=4 by 10";
  rotate "row y=3 by 10";
  rotate "row y=2 by 5";
  rotate "row y=1 by 10";
  rotate "row y=0 by 15";
  rotate "column x=7 by 2";
  rotate "column x=6 by 3";
  rotate "column x=5 by 2";
  rotate "column x=3 by 2";
  rotate "column x=2 by 4";
  rotate "column x=0 by 2";
  rect "9x2";
  rotate "row y=3 by 47";
  rotate "row y=0 by 10";
  rotate "column x=42 by 3";
  rotate "column x=39 by 4";
  rotate "column x=34 by 3";
  rotate "column x=32 by 3";
  rotate "column x=29 by 3";
  rotate "column x=22 by 3";
  rotate "column x=19 by 3";
  rotate "column x=14 by 4";
  rotate "column x=4 by 3";
  rotate "row y=4 by 3";
  rotate "row y=3 by 8";
  rotate "row y=1 by 5";
  rotate "column x=2 by 3";
  rotate "column x=1 by 3";
  rotate "column x=0 by 2";
  rect "3x2";
  rotate "row y=4 by 8";
  rotate "column x=45 by 1";
  rotate "column x=40 by 5";
  rotate "column x=26 by 3";
  rotate "column x=25 by 5";
  rotate "column x=15 by 5";
  rotate "column x=10 by 5";
  rotate "column x=7 by 5";
  rotate "row y=5 by 35";
  rotate "row y=4 by 42";
  rotate "row y=2 by 5";
  rotate "row y=1 by 20";
  rotate "row y=0 by 45";
  rotate "column x=48 by 5";
  rotate "column x=47 by 5";
  rotate "column x=46 by 5";
  rotate "column x=43 by 5";
  rotate "column x=41 by 5";
  rotate "column x=38 by 5";
  rotate "column x=37 by 5";
  rotate "column x=36 by 5";
  rotate "column x=33 by 1";
  rotate "column x=32 by 5";
  rotate "column x=31 by 5";
  rotate "column x=30 by 1";
  rotate "column x=28 by 5";
  rotate "column x=27 by 5";
  rotate "column x=26 by 5";
  rotate "column x=23 by 1";
  rotate "column x=22 by 5";
  rotate "column x=21 by 5";
  rotate "column x=20 by 1";
  rotate "column x=17 by 5";
  rotate "column x=16 by 5";
  rotate "column x=13 by 1";
  rotate "column x=12 by 3";
  rotate "column x=7 by 5";
  rotate "column x=6 by 5";
  rotate "column x=3 by 1";
  rotate "column x=2 by 3";

  print_grid grid
  ;;
