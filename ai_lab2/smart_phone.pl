company(sumsum).
company(appy).

tech(galactica_s3).

competitor(sumsum, appy).

developer(sumsum, galactica_s3).

stolen(galactica_s3, stevey).

boss(stevey).

unethical(X):- boss(X), business(Y), rival(Z), stolen(Y, X).

rival(X):-  competitor(X, appy).

business(X):- tech(X).

