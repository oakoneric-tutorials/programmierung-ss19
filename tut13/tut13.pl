istree(nil).
istree(tree(_, L, R)) :- istree(L), istree(R).
insert(nil , _, nil).
insert(tree(v, _, _), T, T) :- istree(T).
insert(tree(X, L, R), T, tree(X, LT , RT)) :- insert(L, T, LT), insert(R, T, RT).
