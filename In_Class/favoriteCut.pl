
isFavorite(N, Message) :- member(N, [1, 2, 4, 8, 16, 32, 64, 128, 256]),
                          !,
                          Message = 'It is one of my favorite numbers'.
isFavorite(_, Message) :- Message = 'It is **not** one of my favorite numbers'.
