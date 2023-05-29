// Cheats
boolean CHEAT_only_one_player;    // default: false

// Game settings
int board_w;
int board_h;
int in_a_row_to_win;
color background_color;

// Visual settings
int token_diagonal;               // The diagonal of a token, measured in pixels.

// Dynamic variables
int[][] board;                    // 0: empty slot. 1: player 1 token. 2: player 2 token
int player_turn;                  // 1 or 2
int winner;                       // 0: No one has won yet. 1: player 1 has won. 2: player 2 has won.

void setup() {
    size(800, 800);

    // Cheats
    CHEAT_only_one_player = false;

    // Game Settings
    board_w = 7;
    board_h = 6;
    in_a_row_to_win = 4;
    background_color = color(200);

    // Visual Settings
    token_diagonal = width/board_w;

    // Dynamic variables
    board = new int[board_h][board_w];
    player_turn = 1;
    winner = 0;
}
