// Update modules manualy whit update signals by running one of these two commands:
//    pkill -RTMIN+[signal] dwmblocks
//    kill -[signal + 34] $(pidof dwmblocks)

static const Block blocks[] = {
    // Icon     Command     Update interval     Update signal
    {"", "sb-cmus",    0, 4},
    {"", "sb-volume",  0, 3},
    {"", "sb-network", 5, 2},
    {"", "sb-date",    1, 1},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = "   ";
static unsigned int delimLen = 5;
