// task 1

enum Chess {
    case Piece(name: Name, color: Color, letter: String, number: Int)
    enum Color : String {
        case White = "White"
        case Afroamerican = "Afroamerican"
    }
    enum Name : String {
    case King = "King"
    case Queen = "Queen"
    case Pawn = "Pawn"
    case Rook = "Rook"
   }
}

let afroamericanKing = Chess.Piece(name: .King, color: .Afroamerican, letter: "E", number: 1)
let whiteQueen = Chess.Piece(name: .Queen, color: .White, letter: "B", number: 2)
let afroamericanRook = Chess.Piece(name: .Rook, color: .Afroamerican, letter: "A", number: 1)

var chessArray = [Chess]()
chessArray.append(afroamericanKing)
chessArray.append(whiteQueen)
chessArray.append(afroamericanRook)

// task 2

func piecePrint(piece: Chess) {
    switch piece {
    case .Piece(let name, let color, let letter, let number):
        print("\(color), \(name) on \(letter)\(number)")
    }
}

func chessBoardPrint(array: [Chess]) {
    for piece in array {
        piecePrint(piece: piece)
    }
}
chessBoardPrint(array: chessArray)


// task 3























