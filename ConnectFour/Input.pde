void mousePressed() {
    // column number x was pressed on the board
    int x = mouseX / token_diagonal;
    dropTokenInColumn(x);
}
