# Logic-Formula-Finder
Finds formulas with and, or and not from data.

* logic_ff1.pl

# Getting Started

Please read the following instructions on how to install the project on your computer for finding logical formulas.

# Prerequisites

* Install <a href="https://www.swi-prolog.org/build/">SWI-Prolog</a> for your machine.

# Installation from List Prolog Package Manager (LPPM)

* Optionally, you can install from LPPM by installing <a href="https://www.swi-prolog.org/build/">SWI-Prolog</a> for your machine, downloading the <a href="https://github.com/luciangreen/List-Prolog-Package-Manager">LPPM Repository</a>, loading LPPM with `['lppm'].` then installing the package by running `lppm_install("luciangreen","Logic-Formula-Finder").`.

# Installing and Logic Formula Finder

* Install by downloading the prerequisites above and saving in folders next to each other or by using LPPM above.
* Run swipl
* Load with ['logic_ff1.pl'].
* In swipl, run with: 
```
?- logic_ff0([
[[[a, true], [b,  false],[c,true],[d,false]], [true]],
[[[a, true], [b,  false],[c,false],[d,false]], [true]],
[[[a, false], [b,  false],[c,true],[d,false]], [true]],
[[[a, true], [b,  true],[c,true],[d,false]], [true]],
[[[a, false], [b,  false],[c,false],[d,false]], [true]]
],F).
```
to find formulae with this set of specs (concluding with the result at the end of each line) and some results:
```
F=[[not,d],[not,[a,and,[d,and,[b,and,c]]]],[not,[a,and,[d,and,[b,or,c]]]],[not,[a,and,[d,and,[c,and,b]]]],[not,[a,and,[d,and,[c,or,b]]]],[not,[a,and,[d,and,[not,[b,and,c]]]]],[not,[a,and,[d,and,[not,[b,or,c]]]]],[not,[a,and,[d,and,[not,[c,and,b]]]]],[not,[a,and,[d,and,[not,[c,or,b]]]]],[not,[a,and,[[d,and,b],and,c]]],[not,[a,and,[[d,and,c],and,b]]],[not,[a,and,[[not,[d,or,c]],and,b]]],[not,[b,and,[d,and,[a,and,c]]]],[not,[b,and,[d,and,[a,or,c]]]],[not,[b,and,[d,and,[c,and,a]]]],[not,[b,and,[d,and,[c,or,a]]]],
.
.
.
```

# Authors

Lucian Green - Initial programmer - <a href="https://www.lucianacademy.com/">Lucian Academy</a>

# License

I licensed this project under the BSD3 License - see the <a href="LICENSE">LICENSE.md</a> file for details



