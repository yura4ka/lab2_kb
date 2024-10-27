% Vertebrate
is_a(vertebrate, animal).

is_a(warm, vertebrate).
is_a(cold, vertebrate).

is_a(mammal, warm).
is_a(bird, warm).
is_a(reptile, cold).
is_a(fish, cold).
is_a(amphibian, cold).

% Invertebrate

is_a(invertebrate, animal).
is_a(with_legs, without_legs).

is_a(insect, with_legs).
is_a(arachnid, with_legs).
is_a(myriapod, with_legs).

is_a(cnidarian, without_legs).
is_a(poriferan, without_legs).
is_a(echinoderm, without_legs).
is_a(worm, without_legs).

% Definitions

is_a(X, mammal) :- part_of(X, fur), part_of(X, leg), has_legs(X, 4).
is_a(X, bird) :- part_of(X, wing), part_of(X, beak).
is_a(X, reptile) :- part_of(X, scales), part_of(X, leg), has_legs(X, Legs), Legs > 0.
is_a(X, fish) :- part_of(X, gills), part_of(X, fin).
is_a(X, amphibian) :- part_of(X, skin), part_of(X, leg), has_legs(X, Legs), Legs > 0.

is_a(X, insect) :- part_of(X, exoskeleton), has_legs(X, 6).
is_a(X, arachnid) :- part_of(X, exoskeleton), has_legs(X, 8).
is_a(X, myriapod) :- part_of(X, exoskeleton), has_legs(X, Legs), Legs >= 10.

is_a(X, cnidarian) :- part_of(X, tentacles), part_of(X, stinging_cells).
is_a(X, poriferan) :- part_of(X, pores), part_of(X, sponge_body).
is_a(X, echinoderm) :- part_of(X, spiny_skin), part_of(X, tube_feet).
is_a(X, worm) :- part_of(X, segmented_body), has_legs(X, 0).

% Vertebrate Animals
part_of(lion, fur).
part_of(lion, leg).
part_of(lion, tail).

part_of(elephant, fur).
part_of(elephant, leg).
part_of(elephant, trunk).

part_of(dog, fur).
part_of(dog, leg).
part_of(dog, tail).

part_of(sparrow, wing).
part_of(sparrow, beak).
part_of(sparrow, feather).

part_of(eagle, wing).
part_of(eagle, beak).
part_of(eagle, feather).

part_of(penguin, wing).
part_of(penguin, beak).
part_of(penguin, feather).

part_of(crocodile, scales).
part_of(crocodile, leg).
part_of(crocodile, tail).

part_of(snake, scales).
part_of(snake, tongue).

part_of(lizard, scales).
part_of(lizard, leg).
part_of(lizard, tail).

part_of(shark, gills).
part_of(shark, fin).
part_of(shark, tail).

part_of(salmon, gills).
part_of(salmon, fin).
part_of(salmon, scale).

part_of(goldfish, gills).
part_of(goldfish, fin).
part_of(goldfish, tail).

part_of(frog, skin).
part_of(frog, leg).
part_of(frog, eye).

part_of(toad, skin).
part_of(toad, leg).
part_of(toad, wart).

part_of(salamander, skin).
part_of(salamander, leg).
part_of(salamander, tail).

% Invertebrate Animals
part_of(bee, exoskeleton).
part_of(bee, wing).

part_of(ant, exoskeleton).
part_of(ant, antenna).

part_of(butterfly, exoskeleton).
part_of(butterfly, wing).

part_of(spider, exoskeleton).
part_of(spider, fangs).

part_of(scorpion, exoskeleton).
part_of(scorpion, pincers).

part_of(tick, exoskeleton).
part_of(tick, mouth).

part_of(starfish, spiny_skin).
part_of(starfish, tube_feet).

part_of(sea_urchin, spiny_skin).
part_of(sea_urchin, tube_feet).

part_of(sand_dollar, spiny_skin).
part_of(sand_dollar, tube_feet).

part_of(millipede, exoskeleton).

part_of(centipede, exoskeleton).

part_of(jellyfish, tentacles).
part_of(jellyfish, stinging_cells).

part_of(sea_anemone, tentacles).
part_of(sea_anemone, stinging_cells).

part_of(spongia, pores).
part_of(spongia, sponge_body).

part_of(venus_flower_basket, pores).
part_of(venus_flower_basket, sponge_body).

part_of(earthworm, segmented_body).

part_of(flatworm, flat_body).

% Additional
has_legs(lion, 4).
has_legs(elephant, 4).
has_legs(elephant, 4).
has_legs(sparrow, 2).
has_legs(eagle, 2).
has_legs(penguin, 2).
has_legs(crocodile, 4).
has_legs(snake, 0).
has_legs(lizard, 4).
has_legs(shark, 0).
has_legs(salmon, 0).
has_legs(goldfish, 0).
has_legs(frog, 4).
has_legs(toad, 4).
has_legs(salamander, 4).
has_legs(bee, 6).
has_legs(ant, 6).
has_legs(butterfly, 6).
has_legs(spider, 8).
has_legs(scorpion, 8).
has_legs(tick, 8).
has_legs(millipede, 100).
has_legs(centipede, 30).
has_legs(earthworm, 0).
has_legs(flatworm, 0).

% Queries
is_class(X, Y) :- is_a(X, Y).
is_class(X, Y) :- is_a(X, Z), is_class(Z, Y).

has_features(_, []).
has_features(X, [Feature|Rest]) :- part_of(X, Feature), has_features(X, Rest).

% ?- is_class(lion, Class).
% ?- part_of(lion, Part).
% ?- is_class(Animal, bird).
% ?- has_features(Animal, [fur, leg]).
