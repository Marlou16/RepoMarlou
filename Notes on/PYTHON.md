## Notes and Tips found during starting with Python ##

In this document I collect some learning notes from my personal Python development.
I enhanced my Python skills via the following (online) recources:

	A Simple Python Tutorial (somewhere in 2015)  
	Udacity - CS101 (summer 2016, encouraged via Google Get Ahead)  
	Udacity - CS212 (summer 2016, encouraged via Google Get Ahead)  

**All code written thusfar (summer 2016), works with Python 2.7.x**  
The learning notes will be sorted on category opposite to on course, for reference purposes

### ----- General Remarks ----- ###
*	Python is strongly typed and implicitly typed - declarations are not needed
*	Python can be used i.c.w. Django
*	The Python Interpreter we can reach (standard in Linux) via `python` (exit via `exit()`)
*	`python <filename>.py` is for execute a python file (outside the interpreter)
*	Comments we typ with _#_ or between _" comment "_.  
	_""" multiline comment """_ we can use to create multiline comments
*	Python interprets with use of enters and tabs, so we can not use _{ }_
*	Fun: A modern computer (2016) can execute 12 quadrillion instruction in a 7 week period
*	_Aspect-oriented programming_ has as a goal to seperate different aspects of code, such as correct (functional) code, efficiency checks and debug stuff

### ----- Notes on EXPRESSIONS (and INTS) ----- ###
*	An integer starting with a _0_ is a octonal numbers; 012 -> 10
*	`x,a = a,x` is an example of a _swap_ function
*	For a to the power b, use `a ** b`
*	`isinstance(<nr>,int)` checks whether the number nr is of type integer. 
*	Check on the boolean value of an expression can using `eval(<expression>)`
*	str.translate(<string>) creates an expression from the string (_import str!_ needed)


### ----- Notes on STRINGS ----- ###
**String are seen as lists, thus most of the points below also occur with lists!**
*	Strings can be declared between _" "_ or _' '_
*	We can multiply a string using * -> for example `! * 12` prints 12 exclamation marks
*	Python uses string indexing -> for example `Udacity[1+1]` gives _a_
*	String subsequences go via `<string>[<start> : <stop>]`  
		-> originally we get the sequeant start up to stop-1  
		-> _blanking_ start gives the string upto stop-1  
		-> _blanking_ stop gives the string from start to the end  
		-> `<string>[::-1]` gives the string mirrored
*	`<string>.find(<substring>)` gives the starting position of the first occurence of the substring, otherwise -1. **find is capital sensitive**
*	`<string>.find(<substring>, <nr>)` starts searching from location `<nr>`
*	`len(<string>)` gives the length of the string.
*	`<string>.isupper()` returns true if the string is capitalized
*	`<newvar> = <string>.lower() returns a de-capitalized string, stored in newvar.


### ----- LOOPS and CHECKS ----- ###
**These learning points mostly come from lesson 2 of CS101 (so see those files)**
* 	Firstly, never forget the `:` after `def`, `if`, `for` and `while` (etc)
*	_else If_ is done via `elif`
*	Also in Python, an second logical expression will not be evaluated in an `or`  
	when the first expression returns true.
*	In Python we use the word `not` for the `!` in Java, but we do have `!=`
* 	In Python we have `==` and `is`, where the second looks whether to objects are
	the same, although this also works for small integer-values!

### ----- Notes on LISTS (comprehensions), DICTIONARIES and GENERATORS ----- ###
**These learning points mostly come from lesson 2 of CS212 (so see those files)**
*	In a list, a negative index gives the location of a value from the end of the list -> `array[-2]` when `array=[1 2 3 4 5]` gives us 4
*	A dictionary can be any _key:value_ combination we want.  
	An example -> `mydict = {"key 1" : "Value", 2 : 3, 'pi' : 3.14}`
*	Also in a list we can put anything we want and mix it up!
*	We can simply do `print <list>`
*	In Python we have **ALIASING**, which means one refers to different lists.  
		-> `a = [1,2,3]; b = a; a[1] = 7` will thus also modify `b[1]`!!  
		-> One can copy a list by doing `b = list(a)`  
*	`<list>.append(<element>)` appends the element as one entry (also when it's a list)
*	For concatenation of lists, use `<list1> + <list2>` (both need to be lists)
*	`<list>.index(<value>)` gives the index of a value or an _error_ when its not in it  
		-> One could check this via `<value> in <list>`
*	Another built-in function is `<list>.pop()`
*	`<list>.count(<element>)` counts the number of occurences of the element in list
*	In a list we can also create duplicate entries easily by using the `*`  
	Example -> `max([l1] + 99 * [l2])` means repeat l2 99 times.
*	Getting the even-numbered entries of a list use `<list>[0::2]`, while getting the odd-numbered entries goes with `<list>[1::2]`
*	operations like `<list>.sort()` or `<list>.reverse()` happen in-place (or i.o.w. modify the `<list>`, not create a new one.)

*	The known datastructure _set_ is a advanced lists with no duplicates.
*	Both a dictionary and set are unstructured! You can sort lists.
*	Python knows the following _set-operations_:  
		-> `A | B` means A or B (naturally)  
		-> `A & B` means A and B (naturally)  
		-> `A ^ B` means A exclusive or B (A|B - A&B)  
		-> `A - B` means A not B (naturally, again)  
*	Python also has the datastructure _frozenset_, of which the library references says:  
	"The set type is mutable -- the contents can be changed using methods like add() and remove(). Since it is mutable, it has no hash value and cannot be used as either a dictionary key or as an element of another set. The frozenset type is immutable and hashable -- its contents cannot be altered after is created; however, it can be used as a dictionary key or as an element of another set."

*	To gain access to list permutations use the _itertools_ package (**CS212 L2!!**)



### ----- REGULAR EXPRESSIONS ----- ###
**Regular Expressions are frequently used in the CS212 course (so see those files)**
*	for regular expressions, use the _re_ package
*	In regular expressions, we have the following special charactes:  
		-> `a*`, which matcht with 0 to infinity occurences of the previous character (a)  
		-> `a?`, which matcht with `""` or `a` (0 or 1 occurence)  
		-> `.` , which matcht with any or multiple characters, but not `""`  
		-> `^b`, which matcht with any expressions starting with the set character  
		-> `a$`, which matcht with any expressions ending with the set character   


### ----- Notes on (Built-in) FUNCTIONS (or procedures) ----- ###
*	If we want to edit a local variable in a function, this function needs to be _global_
*	Procedures favor local variables over global ones (naturally like Java)
*	In Python, functions can return more than one output
*	In Python a function can also output different types of variables.  
	Say the function returns 2, then the order is -> `<var1>, <var2> = <ret1>, <ret2>`
*	Python has built-in `min` and `max` functions, which you can give an procedure used to calculate this minimum or maximum -> `max([3, 4, -5, 0], key=abs)` returns -5
*	We can find the `* args` combination on two locations:  
		1. declared a parameter, we can have as many arguments as we want, stored in a tuple  
		2. filled in as parameter, the tuple args will be unzipped as the function input  
	Example -> `def <something>(fn, *args):    ....... fn(*args)`
*	As clear from above, function can be given to other functions as a argument


