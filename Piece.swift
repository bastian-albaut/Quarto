import Foundation

public struct Piece {
    var color: String = "blanche"
    var heigh: String = "basse"
    var filling: String = "pleine"
    var shape: String = "ronde"

    var line: Int? = 10
    var column: Int? = 10

    //init: -> Piece
    init() {
      self.color = "blanche"
    }

    // est ce que la pièce est blanche
    // isWhite: Piece -> Bool
    // post : Bool = true si la pièce est blanche, false sinon
    func isWhite() -> Bool {
        return self.color == "blanche"
    }

    // est ce que la pièce est de grande taille
    // isTall: Piece -> Bool
    // post : Bool = true si la pièce est grande, false sinon
    func isTall() -> Bool {
        return self.heigh == "heigh"
    }

    // est ce que la pièce est pleine
    // isFull: Piece -> Bool
    // post : Bool = true si la pièce est pleine, false sinon
    func isFull() -> Bool {
        return self.filling == "pleine"
    }

    // est ce que la pièce est carré
    // isSquare: Piece -> Bool
    // post : Bool = true si la pièce est carré, false sinon
    func isSquare() -> Bool {
        return self.shape == "carré"
    }
}