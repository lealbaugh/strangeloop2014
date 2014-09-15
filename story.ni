"Strange Loop Adventure" by Lea Albaugh


Chapter 1 - Creating the heavens and the earth, and seeing that they're good

The Heavens is a room.

Earth is down from The Heavens. The description of Earth is "Solid ground, except for the parts that are water."

Eden is inside from Earth. "Peaceful. Too peaceful."

A rock is in Eden. The description of the rock is "Gathering moss."

[This is designed to feel kind of like setting out props for a play.]

[How do we double-check that this stuff is how it should be? The world map, and testing commands:  gonear, showme, and purloin. You now have all the necessary knowledge to win this game: http://ifdb.tads.org/viewgame?id=i9n10ur9c7vrpas6 ]



Chapter 2 - Kinds of things

The rock is fixed in place.

Some water is in Earth. The water is scenery.

The player is carrying a top hat.  The top hat is wearable.

The player is wearing a tiara.

The printed name of the tiara is "extra sparkly super cool tiara".  The indefinite article of the tiara is "your".

A table is in the bookstore.  A bowl is on the table.  A banana is in the bowl.  The banana is edible.

[Inform makes some assumptions. If you declare that the player is wearing a tiara, Inform will give the tiara the "wearable" property.  If the banana is in a bowl and the bowl is on a table, the table will be made as a supporter and the bowl a container.]


A marble is a kind of thing.  A marble is usually not edible.  A marble is usually portable.

Five marbles are in the bowl.


[How do we know what properties and kinds are available?  Let's look in the index!]
[§4.1: "As another example, it may seem curious that Inform doesn't usually think "man" is a kind of "animal". This is really because, in English, people don't usually expect something like "if an animal is in the garden" to be true when it's only the Revd Mr Beebe going for a walk. People expect the word "animal" not to mean a human being, despite our common genetic ancestry. But if we want to rearrange Inform's default ideas, we can do that quite easily."]


The bookstore is a room.

A book is a kind of thing. The Odyssey, To Kill a Mockingbird, the map, and East of Eden are books in the bookstore.  

[§4.4: "Such plurals are allowed in almost any context, and we could even define two kinds at once:
Bucket and basket are kinds of container.
Inform constructs plurals by a form of Conway's pluralisation algorithm, which is quite good - for example, it gets oxen, geese (but mongooses), sheep, wildebeest, bream, vertebrae, quartos, wharves, phenomena, jackanapes and smallpox correct. But English is a very irregular language, and multiple-word nouns sometimes pluralise in unexpected ways"]

The indefinite article of The Odyssey is "the".
A book called Pride & Prejudice is in the bookstore.

A book has some text called the introduction.  The introduction of a book is usually "Once upon a time...".  

The introduction of The Odyssey is "Tell me, O muse, of that ingenious hero who travelled far and wide after he had sacked the famous town of Troy."

The introduction of the map is "It is of the utmost importance that you...".


Chapter 3 - Kinds of values

Color is a kind of value.  The colors are magenta, yellow, cerulean, chartreuse, and ochre.
Paint is a kind of thing.  Paint has a color called hue.

[The default value is whichever you named first, so paint is magenta unless you specify otherwise.]

["Now for an even more abbreviated way to create a new kind of value, and at the same time create a property to hold it."  The property has a default name of "[thing] condition" or can be specified in this short form; see §4.10.]

A book is either new, like new, good, fair, or poor.

The Odyssey is like new.  The map is poor.  To Kill a Mockingbird is fair.



Chapter 4 - Variables

The number of wishes is a number that varies.  The number of wishes is three.

The player's favorite book is a book that varies.  The player's favorite book is Pride & Prejudice.



Chapter 5 - Text substitutions

[Okay, so what can we *do* with the things and values? Well, since these are text-based games, we can do a fair amount with just "adaptive text."]

The description of a book is usually "You pick up the book and read for a bit: '[introduction]'".

The description of the tiara is "[if worn]Currently making you very sparkly.[else if the player is wearing the top hat]It might be a bit much, with the top hat.[else]You could be wearing it.[end if]"

The description of the banana is "It's a little [one of]riper[or]less ripe[or]smaller[or]bigger[at random] than you'd like, to be honest."

The description of the player is "[one of]An expert chef[or]A motorcycle mechanic[or]A renegade librarian[or]An international jewelry thief[sticky random]."





Chapter 6 - Rules

[The game loop, and where we get chances to hook in.]

Instead of jumping:
	say "Wheee!"

Instead of taking the rock:
	say "It's too heavy."

Instead of taking a new book in the Bookstore:
	say "It looks so shiny; you couldn't bear to remove it."


A Heisenberg Pixie is an animal in the Heavens. 

Instead of examining the Heisenberg Pixie:
	if the number of rooms is greater than two:
		let R be a random room;
		while R is the location:
			let R be a random room;
		now the Heisenberg Pixie is in R;
		say "It's gone in a blink -- you have a suspicion that it's now in [R].";
	else:
		say "You get the distinct feeling it would rather be somewhere else."


[How do we know what action to hook into?  The actions command, the actions index]


A book can be read or unread.  A book is usually unread.
	
Instead of examining a read book:
	say "It was pretty much the same as the first time you read it."

After examining a book:
	now the noun is read.
	
[*lots* more rules examples in §7!]


Chapter 7 - Making Friends

[parts of things]
Suzy is a person. Al is a person.  Dorothy is a person.  Cynthia is a person.  John is a person.

Liking relates various people to various people.

The verb to like means the liking relation. 

Suzy likes Al.  Al likes Dorothy.  Dorothy likes Al.  Dorothy likes Cynthia.

After giving a book to a person (called the recipient):
	now the recipient likes the player.

[We could also:]
The verb to be enamored of means the liking relation.

Cynthia is enamored of Suzy.

[Or: define a relation based on other facts]

Mutual affection relates a person (called X) to a person (called Y) when X likes Y and Y likes X.  The verb to be in mutual admiration with means the mutual affection relation.

Nearness relates a room (called A) to a room (called B) when the number of moves from B to A is less than 3. The verb to be near means the nearness relation.


Chapter 8 - Verbing

[Put the game logic in place...]

Petting is an action applying to one touchable thing.  An animal can be happy.

Check petting:
	if the noun is not an animal:
		say "That doesn't sound particularly fun." instead.
		
Carry out petting:
	now the noun is happy.
		
Report petting:
	say "[The noun] purrs."
	
[...and then tell the parser how the player can access this verb.]

Understand "pet [something]" as petting.  Understand "skritch [something]" as petting.

[Let's do something with two nouns and a more elaborate change of the world.]

The studio is a room.

Color is a kind of value.  The colors are magenta, yellow, cerulean, chartreuse, and ochre.
Paint is a kind of thing.  Paint has a color called hue.  The printed name of a paint is usually "[hue] paint".  The indefinite article of a paint is usually "some".

Paint1 is a paint in the studio.  The hue of paint1 is magenta.

Item is a kind of thing.  Item has a color called hue.
A block, a ball, and a cone are items in the studio. 

Painting it with is an action applying to two things.

Check painting it with:
	if the second noun is not a paint:
		say "[The second noun] is not a paint!" instead;
	else if the noun is not an item:
		say "You can't paint that." instead.

Carry out painting it with:
	now the hue of the noun is the hue of the second noun.
	
Report painting it with:
	say "[The noun] is now [hue of the second noun]."
	
Understand "paint [something] [something]" and "paint [something] with [something]" as painting it with.


Chapter 9 - Understanding

Understand "tourist/Paris/lost" as the map.

Understand "cindy" as Cynthia when Cynthia likes the player.

Understand the hue property as describing a paint.


Chapter 10 - A handful of other kinds of rules

A magenta apple is in the Studio.
Does the player mean eating a paint: it is very unlikely.

[§17.19 for more charming examples.]

Every turn:
	say "This rule is going to get old really fast.".
	
When play begins:
	let B be a random book;
	now the player carries B.

[The Rules Chart]


Chapter 11 - Testing! - Not for release

When play begins, say "You are the very best interactive fiction author of all times, yes you are."

[The Test command; the skein, the transcript, controlled randomness, releasing, not-for-releasing.]


Chapter 12 - The wider world of Inform

Use the serial comma. Use american dialect.

[Release options. Interpreters, including Parchment / Vorple.  Extensions.]


Chapter 13 - Stuff we could go over if we have time

[Code structure: definitions, loops, lists, tables]
[More-detailed modeling: parts of things, parts of every things]
[Best practices: Does the Player Mean, BENT, writing for playability]
[Weird legacy stuff: Doors? One way room connections? Initial descriptions, locks/keys]



Chapter 14 - Resources
[
The "Inform 6 and 7 Development" board at intfiction.org/forum is a great place to receive friendly and often very quick answers to your code questions, and there are other boards for talking about game design and playing existing games.

This forum post has a list of places to find Inform 7 documentation for a variety of tastes: 
http://www.intfiction.org/forum/viewtopic.php?f=7&t=3988

Among which I find these particularly helpful:
Inform 7 for Programmers by Ron Newcomb: http://www.plover.net/~pscion/Inform%207%20for%20Programmers.pdf

Aaron Reed's textbook on I7: http://inform7.textories.com/

Oliver Reiser's I7 cheatsheet: http://user.cs.tu-berlin.de/~moreiser/inform/Inform7_CheatSheet.pdf

Emily Short's rules flowchart: http://inform7.com/learn/documents/Rules%20Chart.pdf

Note that the version of Inform we're using today is the latest release and the community is used to a leisurely pace between releases. Some of the above links may contain out-of-date information.

Juhana Leinonen released the full source for his Speed IF game Sparkle, written in the latest version of Inform 7, and with an index pointing out the places he uses various language features:
http://nitku.net/if/sparkle/source_index.html
]
