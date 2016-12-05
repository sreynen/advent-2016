#!/usr/bin/env escript

md5_hex(S) ->
  Md5_bin =  erlang:md5(S),
  Md5_list = binary_to_list(Md5_bin),
  lists:flatten(list_to_hex(Md5_list)).

list_to_hex(L) ->
  lists:map(fun(X) -> int_to_hex(X) end, L).

int_to_hex(N) when N < 256 ->
  [hex(N div 16), hex(N rem 16)].

hex(N) when N < 10 ->
  $0+N;
hex(N) when N >= 10, N < 16 ->
  $a + (N-10).

first_five(String) -> string:left(String, 5).

same(X, X) -> true;
same(_, _) -> false.

starts_with_zeros(String) -> same(first_five(String), "00000").

md5_from_integer(Integer) ->
  md5_hex(string:concat("ojvtpuvg", integer_to_list(Integer))).

is_valid(Integer) -> starts_with_zeros(md5_from_integer(Integer)).

next_valid(Integer) ->
  % io:format(integer_to_list(Integer)),
  % io:format("~n"),
  case is_valid(Integer) of
    true -> Integer;
    false -> next_valid(Integer+1)
  end.

main(_) ->
  Value = next_valid(23173948),
  io:format(integer_to_list(Value)),
  io:format("~n").

% _ _ _ _ _ _ _ _
% 1469591 : 4c : _ _ _ _ c _ _ _
% 1925351 : 5b : _ _ _ _ c b _ _
% 4310992 : 49 : SKIP
% 4851204 : 30 : _ _ _ 0 c b _ _
% 6610226 : c4 : SKIP
% 6840976 : 10 : _ 0 _ 0 c b _ _
% 9504234 : 57 : SKIP
% 10320588 : 43 : SKIP
% 11009275 : 8b : SKIP
% 11540947 : cf : SKIP
% 12705714 : bf : SKIP
% 13057078 : 97 : SKIP
% 13615245 : 25 : _ 0 5 0 c b _ _
% 14718986 : 4c : SKIP
% 16706030 : 7d : _ 0 5 0 c b _ d
% 17045303 : c8 : SKIP
% 20797756 : 15 : SKIP
% 21799376 : 54 : SKIP
% 22569314 : da : SKIP
% 22717846 : e8 : SKIP
% 23056264 : f0 : SKIP
% 23173947 : 6b : _ 0 5 0 c b b d
% 27649592 : 01 : 1 0 5 0 c b b d

% 5a: 4543c154
% 5b: 1050cbbd
