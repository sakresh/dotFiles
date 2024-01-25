//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
        /* {"", "cat /tmp/recordingicon 2>/dev/null",	0,	9}, */
	/* {"",	"sb-music",	0,	11}, */
	/* {"",	"sb-torrent",	20,	7}, */
	/* {"",	"sb-memory",	10,	14}, */
	/* {"",	"sb-cpu",		10,	18}, */
	{" ",	"volume",	0,	10},
	{"",	"battery",	5,	3},
	{"",	"internet",	5,	4},
	{"",	"clock",	60,	1},
	/* {"",	"sb-iplocate", 0,	27}, */
};

//Sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char *delim = "-";

// Have dwmblocks automatically recompile and run when you edit this file in
// vim with the following line in your vimrc/init.vim:

// autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid dwmblocks & }
