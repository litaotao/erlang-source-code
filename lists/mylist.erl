-module (mylist).
-export ([nth/2]).

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