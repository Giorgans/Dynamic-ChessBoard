# Dynamic-ChessBoard

# iOS Assessment:
Create an iOS application (Swift, Objective C) that should render an empty chessboard where the user will be able to mark a starting position and an ending position. The app should then render a list of all possible paths that one knight piece in the starting position could take to reach the ending position in 3 moves. Some inputs might not have a solution, in this case the program should display a message that no solution has been found. The user should be able to reset the board and start again. How the application will render the paths is up to you (e.g. render the paths using lines of different color, present a list of the moves in algebraic chess notation, animation of the knight along the path). The rendered chessboard could be of any size NxN where 6<=N<=16.

# My comments:
* Due to some testing, the app covers all the necessary requirements of the assesment 
* Focused more on the app functionallity and less on how fancy the moves look.
* Would prefer to use protocols-delegates instead of some global vars (to transfer data back and forth) I used , and the code in better order and cleaner
* The cell that the knight is moving is highlighted on orange color and the ending point with green color
* The knight does not move. It is always on the starting position. The app will show the path after clicking check 
* Build and run on XCode 14.3, iOS 16.4 (iPhone 14 Pro) , macOS Ventura 13.3.1 (Intel) 
