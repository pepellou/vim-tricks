My vim tricks
=============

In this project I keep updated my local .vimrc file to share it with you.
And I also keep updated this README to explain in detail every configuration I have, just in case some of them are useful to you.


How to install
--------------

If you find my configurations useful, you just need to copy the file I share as "home.vimrc.txt" to your home folder with the name ".vimrc".

Be careful! For a reason still unknown to me, github displays only the first 10 lines of that file in the normal view. You can see the whole file in the 'Raw view' or, obviously, cloning my repo.


Code generation
---------------

As an example, the following code adds a keymap for Ctrl+F which writes PHP code for getters and setters for a previously yanked variable name:

	map <C-F> o	public function get^[pb3l~A(^M	) {^M		return $this->;^[Po	}^M^M	public function set^[pb3l~A(^M		$^[po	) {^M		$this->^[pA = $^[pA;^M	}^M^[

For instance, if you yank the word 'example', pressing Ctrl+F will generate the following code:

	public function getExample(
	) {
		return $this->example;
	}

	public function setExample(
		$example
	) {
		$this->example = $example;
	}


Shortcut for ESCAPE
-------------------

If you find it annoying, as I do, to move your left hand away from alphanumeric keyboard to press ESCAPE to change vim mode, here we have a nice trick to get the same behavior within the alphanumeric keys:

	inoremap jj <Esc>

With this configuration, you can use the shortcut 'jj' to get the same effect as pressing ESCAPE.
Be careful, though, because after pressing the first 'j' vim waits for a while to see if you press a second one or another key. This means that you have to wait a little if you really do need to write 'jj'. I used this character because I don't really think I ever have to write 'jj' when coding.


Disable arrow keys
------------------

If you're still on your way to mastering vim and you have the bad habit of using arrow keys to navigate through the document, here you have a way to force you back into the right path:

	noremap <Up> <nop>
	noremap <Down> <nop>
	noremap <Left> <nop>
	noremap <Right> <nop>

With these configurations you won't use the arrow keys anymore.
Be careful, though, because this doesn't apply to editing mode, where you still can use them.


Contextual selection
--------------------

This is my first try on contextual selection, the only Eclipse feature I really miss since I use vim.

With this simple shortcut:

	map <C-k> ?{\^Mv%

Each time you press Ctrl+K, you'll visually select the next-upper code block enclosed by { }
Of course, since the '%' can also apply to [ ] and ( ), I guess it's very easy to make this command work with those.
Moreover, I plan to add another shortcuts (and extend this one) to be able to change the current selection like Eclipse, i.e., going up or down in context with Ctrl+k and Ctrl+j or selecting same level contexts with Ctrl+h and Ctrl+l


Running tests from the editor
-----------------------------

As an example, I use the following configuration to run my PHPUnit tests from the editor:

	map <f2> :!phpunit <cr>
	map <f3> :!phpunit % <cr>

This way, by pressing <F2> I can run all the project tests (namely the command 'phpunit'). Note that this works because I have configured my project to be able to run the tests with that simple command from the root project dir, and because I always edit my code running vim from the project root dir. You have to bear in mind both questions when making your own configurations.

The second keymap allows me to run with <F3> the tests of only the current file, because '%' is expendad to the current file name.


Getting superuser
-----------------

Have you ever edited a file in vim and when you try to save it you find that you need superuser privileges that you don't have? Have you then left with q! and reentered with 'sudo' to make your changes again?

Forget about that annoying situation with this configuration:

	command W w !sudo tee % > /dev/null

With this shortcut, you now have the choice to run the command :W (instead of normal :w), which will ask you for your sudoer password and, once entered, will scale the privileges and save the file.


My folding configuration
------------------------

Folding is a very useful thing, but I think there's no perfect configuration for it. You have several folding methods available for you and the best choice depends on your way to work.

I show here my configuration and why I use it.

For many cases 'syntax' folding method is very useful, since depending on the programming language of your file you have a perfect automatic folding done for you. But chances are you don't like some things to be folded. 

In my case, for instance, I don't want most of the production code to be folded, because I don't want relationships in the code to be hidden, and for my cohesions purposes methods that are together should be related. On the other hand it's very useful for me to have test code folded, since each test should be independent and folding allows me to narrow my focus when working on a test. In addition, when I'm working on non-code stuff I don't want automatic folding at all, although I'll probably collapse some things manually to hide lower abstraction levels.

For those reasons I have my folding method set to manual:

	set foldmethod=manual

But in order to be more efficient, it's very important for me to save my folds whenever I leave a file and restore them when opening it. That's what I get with this:

	au BufWinLeave * silent! mkview
	au BufWinEnter * silent! loadview

I really think I'll add some specific folding shortcuts soon. For example, a shortcut to fold all test methods in the current file.
