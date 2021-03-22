

% The objects and thier domain

houses(1..5).
colors(red;green;white;yellow;blue).
nationalities(brit;swede;dane;norwegian;german).
pets(dog;cat;horse;fish;birds).
drinks(coffee;tea;milk;beer;water).
cigarettes(dunhill; pall_mall; blends; blue_master; prince).

next_to(H1, H2) :- right_of(H1, H2), houses(H1), houses(H2).
next_to(H1, H2) :- left_of(H1, H2), houses(H1), houses(H2).

left_of(H1, H2) :- H2 = H1 + 1, houses(H1), houses(H2).
right_of(H1, H2) :- H2 = H1 - 1, houses(H1), houses(H2).

%Relations
1 { color(House, Color) : colors(Color) } 1 :- houses(House).
1 { color(House, Color) : houses(House) } 1 :- colors(Color).

1 { nationality(House, Nationality) : nationalities(Nationality) } 1 :- houses(House).
1 { nationality(House, Nationality) : houses(House) } 1 :- nationalities(Nationality).

1 { pet_of(House, Animal) : pets(Animal) } 1 :- houses(House).
1 { pet_of(House, Animal) : houses(House) } 1 :- pets(Animal).

1 { drink(House, Drink) : drinks(Drink) } 1 :- houses(House).
1 { drink(House, Drink) : houses(House) } 1 :- drinks(Drink).

1 { smoke(House, Cigarette) : cigarettes(Cigarette) } 1 :- houses(House).
1 { smoke(House, Cigarette) : houses(House) } 1 :- cigarettes(Cigarette).

% The riddle clues:

%1.  The Brit lives in the red house.
nationality(H, brit):- color(H, red).

%2.  The Swede keeps dogs as pets.
pet_of(H,dog) :- nationality(H, swede).

%3.  The Dane drinks tea.
 nationality(H, dane) :- drink(H, tea).

%4.  The green house is on the left of the white house.
color(H1, green) :- color(H2, white),  left_of(H1,H2).

%5.  The green house's owner drinks coffee.
drink(H, coffee) :- color(H, green).

%6.  The person who smokes "Pall Mall" rears birds.
pet_of(H, birds):- smoke(H, pall_mall).

%7.  The owner of the yellow house smokes Dunhill.
smoke(H, dunhill) :- color(H, yellow).

%8.  The man living in the center house drinks milk.
drink(3, milk).

%9.  The Norwegian lives in the first house.
nationality(1, norwegian).

%10.  The man who smokes blends lives next to the one who keeps cats.
:- smoke(H1, blends), pet_of(H2, cat), not next_to(H1,H2).

%11.  The man who keeps horses lives next to the man who smokes Dunhill.
:- smoke(H1, dunhill), pet_of(H2, horse), not next_to(H1,H2).


%12.  The owner who smokes "Blue Master" drinks beer.
smoke(H, blue_master) :- drink(H, beer).

%13.  The German smokes Prince.
nationality(H, german) :- smoke(H, prince).

%14.  The Norwegian lives next to the blue house.
:- nationality(H1, norwegian), color(H2, blue), not next_to(H1, H2).

%15.  The man who smokes blends has a neighbor who drinks water.
:- smoke(H1, blends), drink(H2, water), not next_to(H1, H2).




#show nationality/2.
#show color/2.
#show smoke/2.
#show pet_of/2.
#show drink/2.





