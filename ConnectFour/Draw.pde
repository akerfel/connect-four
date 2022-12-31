void draw() {
    background(background_color);
    drawEverything();
}

void drawEverything() {
    drawBoard();
    drawPlayerTurnIndicator();
    drawWinnerText();
}

void drawBoard() {
    for (int y = 0; y < board_h; y++) {
        for (int x = 0; x < board_w; x++) {
            switch (board[y][x]) {
                case 0: 
                    fill(background_color);
                    break;
                case 1:
                    fill(0, 0, 255);
                    break;
                case 2:
                    fill(255, 0, 0);
            }
            circle(x * token_diagonal + token_diagonal/2, (y + 1) * token_diagonal + token_diagonal/2, token_diagonal);
        }
    }    
}

void drawPlayerTurnIndicator() {
    if (player_turn == 1) {
        fill(0, 0, 255);   
    }
    else {
        fill(255, 0, 0); 
    }
    circle(board_w/2 * token_diagonal + token_diagonal/2, token_diagonal/2, token_diagonal);
}

void drawWinnerText() {
    textAlign(CORNER);
    fill(50,205,50);
    if (winner == 1) {
        textSize(70);
        text("Blue won", 0, 55);    
    }
    else if (winner == 2) {
        textSize(70);
        text("Red won", 0, 55);    
    }
}
