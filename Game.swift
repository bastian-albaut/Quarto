struct Game: GameProtocol, Sequence {
  associatedtype ItPlateau : IteratorProtocol
  private var grid : [[Piece?]]

  // Est-ce qu'il reste des pièces à jouer ?
  // pieceAvailable : Game -> Bool
  // Post : true si il reste des pièces, false sinon
  private var pieceAvailable : Bool
  private var rules : String
  private var currentTour : String = "tourJ1"

  // Pour utiliser l'iterator
  private var currentPiece : Piece

  // Création d'une Game : initialise un plateau de 16 cases ne contenant pas de pièces, initialise les deux joueurs : un qui choisit la pièce et l'autre qui pose la pièce
  // init : -> Game
  // crée un itérator "ItPlateau" pour parcourir les cases du plateau
  // pieceAvailable = true
  init() {
      self.grid = [[nil]](repeating: [nil](repeating: nil, count: 4), count: 4)
      self.pieceAvailable = true;
      //Créer l'iterator
  }

  // fonction au démarage du jeu, demande aux joueurs de choisir si ils jouent avec les règles simples(quarto sur ligne, colonne ou diagonale) ou complexes(simples plus quarto sur une carré de 4 cases)
  // defineRules: Game -> Game
  mutating func defineRules() {
      var correctInformation = false
      while(!correctInformation) {
          print("Tapez 1 pour les règles simples\nTapez 2 pour les règles complexes\n")
          if let input = readLine() {
              if(input == "1") {
                  correctInformation = true
                  self.rules = "Simples"
              } else if input == "2"{
                  correctInformation = true
                  self.rules = "Complexes"
              }
          }
      }
  }

  // échange les rôles des deux joueurs, le joueur ayant choisi la pièce devient le joueur qui pose la pièce et inversement
  // Les joueurs échangent de rôle à chaque tour
  // changePlayer: Game -> Game
  mutating func changePlayer() {
      if(self.currentTour == "tourJ1") {
          self.currentTour = "tourJ2"
      }
      if(self.currentTour == "tourJ2") {
          self.currentTour = "tourJ1"
      }
  }

  // Regarde si c'est le tour de j1
  // tourJ1 : Game -> Bool
  // Post : renvoie true si c'est le tour du joueur 1, false si c'est le tour du joueur 2
  func tourJ1() -> Bool {
      return self.currentTour == "tourJ1"
  }

  // Demande à un joueur de choisir une pièce à donner à l'autre joueur
  // choosePiece: Game -> Game x Piece
  // Pre: La pièce n'est pas encore posée sur le plateau, il reste des pièces à poser
  // Récupère la pièce choisie par le joueur et la donne à l'autre joueur afin qu'il la pose sur le plateau
  mutating func choosePiece() {
    // print
  }

  // Demande au joueur où placer la pièce(que l'autre joueur lui a donné) sur le plateau, vérifie que la case est libre et place la pièce
  // setPieceAt : Piece x Game -> Game x Piece
  // Post: place la pièce sur le plateau à l'endroit indiqué par l'utilisateur
  mutating func setPieceAt(piece: Piece) {
    print("Donner la ligne: \n")
    var line: Int = readLine()
    print("Donner la colonne: \n")
    var column: Int = readLine()

    var i: Int = 0
    var j: Int = 0
    var piecePose: Bool = False
    // Parcours de la grille
    while i<self.grid.count && !piecePose { // Parcours des lignes
      while j<self.grid[i].count && !piecePose { // Parcours des colonnes
          if i==line && j==column {
            self.grid[i][j] = piece
            piece.line = i
            piece.column = j
            piecePose = True
          }
        j++
      }
      i++
    }
    return piece
  }

  // Regarde si il y a un quarto effectué, après la pose d'une pièce, en fonction des règles choisies au début de la partie et s'il y a un quarto
  // quarto: Game x Piece -> Bool
  // Il y a quarto si, sur une même ligne, colonne ou diagonale, les 4 pièces ont une caractéristique identique avec les règles simples
  // Il y a quarto si, sur une même ligne, colonne, diagonale ou carré, les 4 pièces ont une caractéristique identique avec les règles complexes
  func quarto(piece: Piece) -> Bool {

    if(self.rules=="Simples") {
      return self.quartoLigne(piece) || self.quartoCol(piece) || self.quartoDiag(piece)
    }
    if(self.rules=="Complexes") {
      return self.quartoLigne(piece) || self.quartoCol(piece) || self.quartoDiag(piece) || self.quartoCarre(piece)
    }
  }
  

  // vérifie s'il y a un quarto (ou non) sur la ligne après la pose d'une pièce
  // quartoLigne : Game x Piece -> Bool
  // Post : Bool = true si quarto sur la ligne, false sinon
  func quartoLigne(piecePose: Piece) -> Bool {
    
    // On récupère dans un tableau toutes les pièces à analyser
    listePieces = [Int]()
    for j in 0...self.grid[piecePose.line].count {
      listePieces.append(self.grid[piecePose.line][j])
    }

    // On vérifie pour chaque attribut de pièce la possibilité d'un quarto
    var quartoByColor: Bool = False
    var quartoByHeigh: Bool = False
    var quartoByFilling: Bool = False
    var quartoByShape: Bool = False
    if piecePose.color == listePieces[0].color == listePieces[1].color == listePieces[2].color == listePieces[3].color {
      quartoByColor = True
    }
    if piecePose.heigh == listePieces[0].heigh == listePieces[1].heigh == listePieces[2].heigh == listePieces[3].heigh {
      quartoByHeigh = True
    }
    if piecePose.filling == listePieces[0].filling == listePieces[1].filling == listePieces[2].filling == listePieces[3].filling {
      quartoByFilling = True
    }
    if piecePose.shape == listePieces[0].shape == listePieces[1].shape == listePieces[2].shape == listePieces[3].shape {
      quartoByShape = True
    }
    return quartoByColor || quartoByHeigh || quartoByFilling || quartoByShape
  }

  // vérifie s'il y a un quarto (ou non) sur la colone après la pose d'une pièce
  // quartoCol : Game x Piece -> Bool
  // Post : Bool = true si quarto sur la colonne, false sinon
  func quartoCol(piecePose: Piece) -> Bool {
    
    // On récupère dans un tableau toutes les pièces à analyser
    listePieces = [Int]()
    for i in 0...self.grid[][piecePose.column].count {
      listePieces.append(self.grid[i][piecePose.column])
    }

    // On vérifie pour chaque attribut de pièce la possibilité d'un quarto
    var quartoByColor: Bool = False
    var quartoByHeigh: Bool = False
    var quartoByFilling: Bool = False
    var quartoByShape: Bool = False
    if piecePose.color == listePieces[0].color == listePieces[1].color == listePieces[2].color == listePieces[3].color {
      quartoByColor = True
    }
    if piecePose.heigh == listePieces[0].heigh == listePieces[1].heigh == listePieces[2].heigh == listePieces[3].heigh {
      quartoByHeigh = True
    }
    if piecePose.filling == listePieces[0].filling == listePieces[1].filling == listePieces[2].filling == listePieces[3].filling {
      quartoByFilling = True
    }
    if piecePose.shape == listePieces[0].shape == listePieces[1].shape == listePieces[2].shape == listePieces[3].shape {
      quartoByShape = True
    }
    return quartoByColor || quartoByHeigh || quartoByFilling || quartoByShape
  }

  // vérifie s'il y a un quarto (ou non) sur la diagonale après la pose d'une pièce
  // quartoDiag: Game x Piece -> Bool
  // Post : Bool = true si quarto sur la diagonale, false sinon
  func quartoDiag(piecePose: Piece) -> Bool {
    var indexLine: Int = piecePose.line
    var indexColumn: Int = piecePose.line
    listePieces = [Int]()

    // On récupère dans un tableau toutes les pièces à analyser
    // On ajoute les pièces 
    // for indexLine...4
    // listePieces.append()
    return True
  }

  // vérifie s'il y a un quarto (ou non) dans un carré après la pose d'une pièce
  // quartoCarre: Game x Piece -> Bool
  // Post : Bool = true si quarto sur un carré, false sinon
  func quartoCarre(piecePose: Piece) -> Bool {
    // if hautDroite {

    // }

    // if hautGauche {

    // }

    // if basDroite {

    // }

    // if basGauche {
    
    // }
    return True
  }


  // makeIterator: Game -> ItPlateau
  // crée un itérateur sur le plateau pour le parcourir dans l'ordre des cases
  func makeIterator() -> ItPlateau {
    return ItPlateau(self)
  }
}

public struct ItPlateau: IteratorProtocol {
  var grid: [[Pieces]]
  var indexLine = 0
  var indexColumn = 0

  init(grid: [[Pieces]]) {
        self.grid = grid
    }

  public mutating func next() -> Piece? {
    guard indexLine<plateau.count && indexColumn<plateau[indexLine].count else { return nil }
    indexLine+=1
    indexColumn+=1
    return plateau[indexLine-1][indexColumn-1]
  }
}