import Foundation

struct Piece {
    var color: String = "blanche"
    var heigh: String = "basse"
    var filling: String = "pleine"
    var shape: String = "ronde"

    var line: Int? = 10
    var column: Int? = 10

    // Création des pièces : 16 pièces :
    //
    // blanche basse pleine ronde
    // blanche basse creuse ronde
    // blanche haute pleine ronde
    // blanche haute creuse ronde
    // blanche basse pleine carré
    // blanche basse creuse carré
    // blanche haute pleine carré
    // blanche haute creuse carré
    //
    // noire basse pleine ronde
    // noire basse creuse ronde
    // noire haute pleine ronde
    // noire haute creuse ronde
    // noire basse pleine carré
    // noire basse creuse carré
    // noire haute pleine carré
    // noire haute creuse carré
    //
    //init: -> Piece
    //crée 16 pièces différentes

    init() {
      self.color = "blanche"
    }

    init(test: Int?) {
        var piece1 = Piece()
        piece1.color = "blanche"
        piece1.heigh = "basse"
        piece1.filling = "pleine"
        piece1.shape = "ronde"
        piece1.line = 2
        piece1.column = 2

        var piece2 = Piece()
        piece2.color = "blanche"
        piece2.heigh = "basse"
        piece2.filling = "creuse"
        piece2.shape = "ronde"
        piece2.line = nil
        piece2.column = nil

        var piece3 = Piece()
        piece3.color = "blanche"
        piece3.heigh = "haute"
        piece3.filling = "pleine"
        piece3.shape = "ronde"
        piece3.line = nil
        piece3.column = nil

        var piece4 = Piece()
        piece4.color = "blanche"
        piece4.heigh = "haute"
        piece4.filling = "creuse"
        piece4.shape = "ronde"
        piece4.line = nil
        piece4.column = nil

        var piece5 = Piece()
        piece5.color = "blanche"
        piece5.heigh = "basse"
        piece5.filling = "pleine"
        piece5.shape = "carré"
        piece5.line = nil
        piece5.column = nil

        var piece6 = Piece()
        piece6.color = "blanche"
        piece6.heigh = "basse"
        piece6.filling = "creuse"
        piece6.shape = "carré"
        piece6.line = nil
        piece6.column = nil

        var piece7 = Piece()
        piece7.color = "blanche"
        piece7.heigh = "haute"
        piece7.filling = "pleine"
        piece7.shape = "carré"
        piece7.line = nil
        piece7.column = nil

        var piece8 = Piece()
        piece8.color = "blanche"
        piece8.heigh = "haute"
        piece8.filling = "creuse"
        piece8.shape = "carré"
        piece8.line = nil
        piece8.column = nil

        var piece9 = Piece()
        piece9.color = "noire"
        piece9.heigh = "basse"
        piece9.filling = "pleine"
        piece9.shape = "ronde"
        piece9.line = nil
        piece9.column = nil

        var piece10 = Piece()
        piece10.color = "noire"
        piece10.heigh = "basse"
        piece10.filling = "creuse"
        piece10.shape = "ronde"
        piece10.line = nil
        piece10.column = nil

        var piece11 = Piece()
        piece11.color = "noire"
        piece11.heigh = "haute"
        piece11.filling = "pleine"
        piece11.shape = "ronde"
        piece11.line = nil
        piece11.column = nil

        var piece12 = Piece()
        piece12.color = "noire"
        piece12.heigh = "haute"
        piece12.filling = "creuse"
        piece12.shape = "ronde"
        piece1.line = nil
        piece1.column = nil

        var piece13 = Piece()
        piece13.color = "noire"
        piece13.heigh = "basse"
        piece13.filling = "pleine"
        piece13.shape = "carré"
        piece13.line = nil
        piece13.column = nil

        var piece14 = Piece()
        piece14.color = "noire"
        piece14.heigh = "basse"
        piece14.filling = "creuse"
        piece14.shape = "carré"
        piece14.line = nil
        piece14.column = nil

        var piece15 = Piece()
        piece15.color = "noire"
        piece15.heigh = "haute"
        piece15.filling = "pleine"
        piece15.shape = "carré"
        piece15.line = nil
        piece15.column = nil

        var piece16 = Piece()
        piece16.color = "noire"
        piece16.heigh = "haute"
        piece16.filling = "creuse"
        piece16.shape = "carré"
        piece16.line = nil
        piece16.column = nil
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