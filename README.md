# Logic-Formula-Finder
Finds formulas with and, or and not from data.

* logic_ff1.pl

# Getting Started

Please read the following instructions on how to install the project on your computer for finding logical formulas.

# Prerequisites

* Use a search engine to find the Homebrew (or other) Terminal install command for your platform and install it, and search for the Terminal command to install swipl using Homebrew and install it or download and install SWI-Prolog for your machine at <a href="https://www.swi-prolog.org/build/">SWI-Prolog</a>.

# Mac, Linux and Windows (with Linux commands installed): Prepare to run swipl

* In Terminal settings (Mac), make Bash the default shell:

```
/bin/bash
```

* In Terminal, edit the text file `~/.bashrc` using the text editor Nano:

```
nano ~/.bashrc
```

* Add the following to the file `~/.bashrc`:

```
export PATH="$PATH:/opt/homebrew/bin/"
```

* Link to swipl in Terminal:

```
sudo ln -s /opt/homebrew/bin/swipl /usr/local/bin/swipl
```

# 1. Install manually

Download <a href="http://github.com/luciangreen/Logic-Formula-Finder/">this repository</a>.

# 2. Or Install from List Prolog Package Manager (LPPM)

* Download the <a href="https://github.com/luciangreen/List-Prolog-Package-Manager">LPPM Repository</a>:

```
mkdir GitHub
cd GitHub/
git clone https://github.com/luciangreen/List-Prolog-Package-Manager.git
cd List-Prolog-Package-Manager
swipl
['lppm'].
lppm_install("luciangreen","Logic-Formula-Finder").
../
halt.
```

# Running

* In Shell:
`cd Logic-Formula-Finder`
`swipl`
`['logic_ff1.pl'].`
* Run with: 
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



