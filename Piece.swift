struct Piece: PieceProtocol {

  private var color : String
  private var heigh : String
  private var filling : String
  private var shape : String

  private var line: Int?
  private var column: Int?

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
    for i in 1...16 {
      // color:
      if i<=8 {
        var color = "blanche"
      } else {
        var color = "noire"
      }
      // heigh
      if i==1 || i==2 || i==5 || i==6  || i==9 || i==10 || i==13 || i==14 {
        var heigh = "basse"
      } else {
        var heigh = "haute"
      }   
      // filling: 
      if i%2==0 {
        var heigh = "creuse"
      } else {
        var heigh = "pleine"
      }
      // shape:
      if 1<=i<=4 && 9<=i<=12 {
        var shape = "ronde"
      } else {
        var shape = "carré"
      }

      // Créer la pièce avec les attributs définis
      var pieceName = "piece\(i)"
      var pieceName = Piece()
      pieceName.color = color
      pieceName.heigh = heigh
      pieceName.filling = filling
      pieceName.shape = shape
    }
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