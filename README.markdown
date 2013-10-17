# General Information:

Author:  Anthony Panozzo

Contact:  panozzaj@gmail.com

Script URL:  http://www.vim.org/scripts/script.php?script_id=2429

License:  GPL


## Detailed description:

Looking through the examples in Vim, there are examples of correcting typos and
misspellings like:

    iabbrev teh the
    iabbrev het the
    ...

However, it is very time-consuming to create this list by hand.  You also have
to enter the correct capitalization, which is a pain.  ('teh->the' is not equal
to 'Teh->The')

It seems silly for everyone to create their own autocorrect file, so hopefully
we can work together to make a sweet list.  I found a nice list from Wikipedia
and cleaned it up a bit as a basis, and incorporated the typo fixes from Vim
Cream.  I also added some words that I commonly misspelled or mistyped, and
have taken additional contributions from users of the script.

I'm sure there are some mistakes, or common mistakes that aren't in here yet,
so if you find any, please contact me and I will gladly change things.  There
are some additional details or thoughts as well as a shortcut to a
word-processing mode at
http://22ideastreet.com/blog/2008/11/06/vim-word-processing.

I find this script invaluable when using Mozex to edit forms online (blog
posts, web mail, etc.)

There is a GitHub repository that you can contribute to at
http://github.com/panozzaj/vim-autocorrect/tree/master


## Install details:

This plugin works with Vundle and Pathogen out of the box and so this is the
recommended method of installation. However, if you do not want to use Vundle
or Pathogen, download the .tar file, and add autocorrect.vim to the 'plugin'
folder in your .vim directory.

The plugin does not load all the correction mappings automatically, as this
slows down Vim's startup time by at least one second which is often annoying.
Instead, you can type:

    :call AutoCorrect()

inside Vim to load the corrections.

If you want to automatically load the corrections for certain filetypes, you
can put something like this in your .vimrc file (example is for .txt files):

    autocmd filetype text call AutoCorrect()

If you want to load the corrections all the time, and can bear waiting one
second every time you use Vim, put this in your .vimrc:

    call AutoCorrect()


### General thoughts:

Currently Vim has no built-in way to correct multiple words, so doing something
like 'a a->a' is not possible.  There is a file in the GitHub repository that
contains some of these in case there ever comes an easy way to do this.

It might be nice to generate this list in a way similar to how Google generates
spelling corrections (Bayesian approach.)  This would be require less labor on
my part, because there are many ways you can screw something up while typing.
However, it's not clear how fast this would be, or how good of a job it would
do of automatically correcting without having false positives.

My philosophy on contributions is to take only the ones that I could reasonably
see a sober person making on a qwerty keyboard who is in a hurry.  So if there
are random characters in there, it's not likely going to make it in.  That
should capture 95% of errors, since most are due to spelling errors or
transpositions.

If there is a questionable correction, I consult Google.  Slightly antiquated
words will be left as-is.  If the left side is correct already, I won't add
that correction.  If something is close to two words, I will take the more
common one, or just leave out the correction.

I've thought about adding ones like (c)->&copy;, but it's not clear to me how
many people would benefit from this.  So I guess in general, my philosophy is
to make the changes that will help most of the people most of the time.


## Contributions

Thanks to Duncan de Wet (duncannz) for turning this into a Vundler/Pathogen
style plugin and making some improvements.
