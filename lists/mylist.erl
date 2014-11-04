-module (mylist).
-export ([nth/2, seq/3]).

-spec nth(N, List) -> Elem when
      N :: pos_integer(),
      List :: [T,...],
      Elem :: T,
      T :: term().

nth(1, [H|_]) -> H;
nth(N, []) when N > 0 ->
	error_exceed;
nth(N, [_|T]) when N > 1 ->
	case T of
		[] -> error_exceed;
		_  ->
    		nth(N - 1, T)
    end.
% nth(N, [_|T]) when N > 1 ->
% 	nth(N-1, T);

% nth(N, [_|T]) when N > 0, T=:=[] ->
% 	error_exceed.


-spec seq(From, To, Incr) -> Seq when
      From :: integer(),
      To :: integer(),
      Incr :: integer(),
      Seq :: [integer()].

seq(First, Last, Inc) 
    when is_integer(First), is_integer(Last), is_integer(Inc) -> 
    if
        Inc > 0, First - Inc =< Last;
        Inc < 0, First - Inc >= Last ->
            N = (Last - First + Inc) div Inc,
            seq_loop(N, Inc*(N-1)+First, Inc, []);
        Inc =:= 0, First =:= Last ->
            seq_loop(1, First, Inc, [])
    end.

seq_loop(N, X, D, L) when N >= 4 ->
     Y = X-D, Z = Y-D, W = Z-D,
     seq_loop(N-4, W-D, D, [W,Z,Y,X|L]);
seq_loop(N, X, D, L) when N >= 2 ->
     Y = X-D,
     seq_loop(N-2, Y-D, D, [Y,X|L]);
seq_loop(1, X, _, L) ->
     [X|L];
seq_loop(0, _, _, L) ->
     L.