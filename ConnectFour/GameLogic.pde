void checkIfWon() {
    checkHorizontalWins();
    checkVerticalWins();
    checkDownRightDiagonalWins();
    checkDownLeftDiagonalWins();
}

// Drop a token in column number x.
void dropTokenInColumn(int x) {
    // if top-square is full: do nothing. Else, find y-coord to place disc.
    if (winner == 0 && board[0][x] == 0) { 
        for (int y = 0; y <= board_h; y++) {
            if (y == board_h || board[y][x] != 0) {
                board[y-1][x] = player_turn;
                break;
            }
        }
        
        if (player_turn == 1) {
            player_turn = 2;
        }
        else {
            player_turn = 1;
        }
        if (CHEAT_only_one_player) {
            player_turn = 1;    
        }
        checkIfWon();
    }
}

void checkHorizontalWins() {
    for (int y = 0; y < board_h; y++) {
        int p1_counter = 0;
        int p2_counter = 0;
        for (int x = 0; x < board_w; x++) {
            if (board[y][x] == 1) {
                p1_counter++;
                p2_counter = 0;
            }
            else if (board[y][x] == 2) {
                p2_counter++;
                p1_counter = 0;
            }
            else {
                p1_counter = 0;
                p2_counter = 0;
            }
            
            if (p1_counter == in_a_row_to_win) {
                winner = 1;
            }
            else if (p2_counter == in_a_row_to_win) {
                winner = 2;    
            }
        }
    }    
}

void checkVerticalWins() {
    for (int x = 0; x < board_w; x++) {
        int p1_counter = 0;
        int p2_counter = 0;
        for (int y = 0; y < board_h; y++) {
            if (board[y][x] == 1) {
                p1_counter++;
                p2_counter = 0;
            }
            else if (board[y][x] == 2) {
                p2_counter++;
                p1_counter = 0;
            }
            else {
                p1_counter = 0;
                p2_counter = 0;
            }
            
            if (p1_counter == in_a_row_to_win) {
                winner = 1;
            }
            else if (p2_counter == in_a_row_to_win) {
                winner = 2;    
            }
        }
    }    
}

void checkDownRightDiagonalWins() {
    checkDownRightDiagonalWinsInLowerLeftHalf();
    checkDownRightDiagonalWinsInUpperRightHalf();
}

// Check all diagonals going down and right in the lower left half of the board.
// |\
// |_\
// |__\
void checkDownRightDiagonalWinsInLowerLeftHalf() {
    for (int y_start = 0; y_start <= board_h - in_a_row_to_win; y_start++) {
        int x = 0;
        int y = y_start;
        int p1_counter = 0;
        int p2_counter = 0;
        while (y < board_h && x < board_w) {
            if (board[y][x] == 1) {
                p1_counter++;
                p2_counter = 0;
            }
            else if (board[y][x] == 2) {
                p2_counter++;
                p1_counter = 0;
            }
            else {
                p1_counter = 0;
                p2_counter = 0;
            }
            
            if (p1_counter == in_a_row_to_win) {
                winner = 1;
            }
            else if (p2_counter == in_a_row_to_win) {
                winner = 2;    
            }
            x++;
            y++;
        }
    }
}

// Check all diagonals going right and down in the upper right half of the board.
// \‾‾|
//  \ |
//   \|
void checkDownRightDiagonalWinsInUpperRightHalf() {
    for (int x_start = 0; x_start <= board_w - in_a_row_to_win; x_start++) {
        int x = x_start;
        int y = 0;
        int p1_counter = 0;
        int p2_counter = 0;
        while (y < board_h && x < board_w) {
            if (board[y][x] == 1) {
                p1_counter++;
                p2_counter = 0;
            }
            else if (board[y][x] == 2) {
                p2_counter++;
                p1_counter = 0;
            }
            else {
                p1_counter = 0;
                p2_counter = 0;
            }
            
            if (p1_counter == in_a_row_to_win) {
                winner = 1;
            }
            else if (p2_counter == in_a_row_to_win) {
                winner = 2;    
            }
            x++;
            y++;
        }
    }
}

void checkDownLeftDiagonalWins() {
    checkDownLeftDiagonalWinsInLowerRightHalf();
    checkDownLeftDiagonalWinsInUpperLeftHalf();
}

// Check all diagonals going left and down in the lower right half of the board.
//   /|
//  / |
// /__|
void checkDownLeftDiagonalWinsInLowerRightHalf() {
    for (int y_start = 0; y_start <= board_h - in_a_row_to_win; y_start++) {
        int x = board_w - 1;
        int y = y_start;
        int p1_counter = 0;
        int p2_counter = 0;
        while (y < board_h && x > -1) {
            if (board[y][x] == 1) {
                p1_counter++;
                p2_counter = 0;
            }
            else if (board[y][x] == 2) {
                p2_counter++;
                p1_counter = 0;
            }
            else {
                p1_counter = 0;
                p2_counter = 0;
            }
            
            if (p1_counter == in_a_row_to_win) {
                winner = 1;
            }
            else if (p2_counter == in_a_row_to_win) {
                winner = 2;    
            }
            x--;
            y++;
        }
    }
}


// Check all diagonals going left and down in the upper left half of the board.
// |‾‾/
// | /
// |/
void checkDownLeftDiagonalWinsInUpperLeftHalf() {
    for (int x_start = in_a_row_to_win; x_start < board_h; x_start++) {
        int x = x_start;
        int y = 0;
        int p1_counter = 0;
        int p2_counter = 0;
        while (y < board_h && x > -1) {
            if (board[y][x] == 1) {
                p1_counter++;
                p2_counter = 0;
            }
            else if (board[y][x] == 2) {
                p2_counter++;
                p1_counter = 0;
            }
            else {
                p1_counter = 0;
                p2_counter = 0;
            }
            
            if (p1_counter == in_a_row_to_win) {
                winner = 1;
            }
            else if (p2_counter == in_a_row_to_win) {
                winner = 2;    
            }
            x--;
            y++;
        }
    }
}
