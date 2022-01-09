import Foundation

// struct Game: Sequence {
public struct Game {

    // grille de jeu
    var grid : [[Piece?]]

    // Est-ce qu'il reste des pièces à jouer ?
    // pieceAvailable : Game -> Bool
    // Post : true si il reste des pièces, false sinon
    var pieceAvailable : Bool

    // Liste des pièces encore disponibles
    var listePieces: [Piece]

    // Règlme du jeu
    // "Simples" ou "Complexes"
    var rules : String

    // Quel est le joueur courant ?
    var currentTour : String

    // Pour utiliser l'iterator
    // private var currentPiece : Piece

    // Création d'une Game : initialise un plateau de 16 cases ne contenant pas de pièces, initialise les deux joueurs : un qui choisit la pièce et l'autre qui pose la pièce
    // init : -> Game
    // crée un itérator "ItPlateau" pour parcourir les cases du plateau
    // pieceAvailable = true
    init() {
        self.grid = [[Piece?]](repeating: [Piece?](repeating: nil, count: 4), count: 4)
        self.pieceAvailable = true;
        self.rules = "Simples"
        self.currentTour = "tourJ1"
        self.listePieces = []
        //Créer l'iterator
    }

    // On créer toutes les pièces du jeu
    // On initialise listePieces avec toutes les pièces
    // createPieces: Game -> Game
    mutating func createPieces() {
        var listePieces : [Piece] = []
        var piece1 = Piece()
        piece1.color = "blanche"
        piece1.heigh = "basse"
        piece1.filling = "pleine"
        piece1.shape = "ronde"
        piece1.line = nil
        piece1.column = nil
        listePieces.append(piece1)

        var piece2 = Piece()
        piece2.color = "blanche"
        piece2.heigh = "basse"
        piece2.filling = "pleine"
        piece2.shape = "carré"
        piece2.line = nil
        piece2.column = nil
        listePieces.append(piece2)

        var piece3 = Piece()
        piece3.color = "blanche"
        piece3.heigh = "basse"
        piece3.filling = "creuse"
        piece3.shape = "ronde"
        piece3.line = nil
        piece3.column = nil
        listePieces.append(piece3)

        var piece4 = Piece()
        piece4.color = "blanche"
        piece4.heigh = "basse"
        piece4.filling = "creuse"
        piece4.shape = "carré"
        piece4.line = nil
        piece4.column = nil
        listePieces.append(piece4)

        var piece5 = Piece()
        piece5.color = "blanche"
        piece5.heigh = "haute"
        piece5.filling = "pleine"
        piece5.shape = "ronde"
        piece5.line = nil
        piece5.column = nil
        listePieces.append(piece5)

        var piece6 = Piece()
        piece6.color = "blanche"
        piece6.heigh = "haute"
        piece6.filling = "pleine"
        piece6.shape = "carré"
        piece6.line = nil
        piece6.column = nil
        listePieces.append(piece6)

        var piece7 = Piece()
        piece7.color = "blanche"
        piece7.heigh = "haute"
        piece7.filling = "creuse"
        piece7.shape = "ronde"
        piece7.line = nil
        piece7.column = nil
        listePieces.append(piece7)

        var piece8 = Piece()
        piece8.color = "blanche"
        piece8.heigh = "haute"
        piece8.filling = "creuse"
        piece8.shape = "carré"
        piece8.line = nil
        piece8.column = nil
        listePieces.append(piece8)

        var piece9 = Piece()
        piece9.color = "noire"
        piece9.heigh = "basse"
        piece9.filling = "pleine"
        piece9.shape = "ronde"
        piece9.line = nil
        piece9.column = nil
        listePieces.append(piece9)

        var piece10 = Piece()
        piece10.color = "noire"
        piece10.heigh = "basse"
        piece10.filling = "pleine"
        piece10.shape = "carré"
        piece10.line = nil
        piece10.column = nil
        listePieces.append(piece10)

        var piece11 = Piece()
        piece11.color = "noire"
        piece11.heigh = "basse"
        piece11.filling = "creuse"
        piece11.shape = "carré"
        piece11.line = nil
        piece11.column = nil
        listePieces.append(piece11)

        var piece12 = Piece()
        piece12.color = "noire"
        piece12.heigh = "basse"
        piece12.filling = "pleine"
        piece12.shape = "ronde"
        piece12.line = nil
        piece12.column = nil
        listePieces.append(piece12)

        var piece13 = Piece()
        piece13.color = "noire"
        piece13.heigh = "haute"
        piece13.filling = "creuse"
        piece13.shape = "ronde"
        piece13.line = nil
        piece13.column = nil
        listePieces.append(piece13)

        var piece14 = Piece()
        piece14.color = "noire"
        piece14.heigh = "haute"
        piece14.filling = "creuse"
        piece14.shape = "carré"
        piece14.line = nil
        piece14.column = nil
        listePieces.append(piece14)

        var piece15 = Piece()
        piece15.color = "noire"
        piece15.heigh = "haute"
        piece15.filling = "pleine"
        piece15.shape = "ronde"
        piece15.line = nil
        piece15.column = nil
        listePieces.append(piece15)

        var piece16 = Piece()
        piece16.color = "noire"
        piece16.heigh = "haute"
        piece16.filling = "pleine"
        piece16.shape = "carré"
        piece16.line = nil
        piece16.column = nil
        listePieces.append(piece16)

        self.listePieces = listePieces
    }
    
    // fonction au démarage du jeu, demande aux joueurs de choisir si ils jouent avec les règles simples(quarto sur ligne, colonne ou diagonale) ou complexes(simples plus quarto sur une carré de 4 cases)
    // defineRules: Game -> Game
    mutating func defineRules() {
        var correctInformation: Bool = false
        while(!correctInformation) {
            print("Tapez 1 pour les règles simples\nTapez 2 pour les règles complexes")
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
        } else {
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
    mutating func choosePiece() -> Piece {
        print("\nLa liste des pièces actualisée:")
        // affficher les pieces encore disponible
        for i in 0...self.listePieces.count-1 {
            print("Pièce \(i+1): \(self.listePieces[i])")
        }

        // Demander et récupérer la pièce choisie
        var correctInformation: Bool = false
        while (!correctInformation) {
            print("\nDonner le numéro de la pièce choisie:")
            if let numString: String = readLine() {
                let num: Int = Int(numString) ?? 20

                // Vérifier que le numéro est bien dans le tableau
                if 1 <= num && num <= self.listePieces.count {
                    correctInformation = true
                    let pieceChoisie: Piece = self.listePieces[num-1]
                    return pieceChoisie
                }
            }
        }
    }

    // Demande au joueur où placer la pièce(que l'autre joueur lui a donné) sur le plateau, vérifie que la case est libre et place la pièce
    // Enlève la pièce de la liste des pièces disponibles
    // setPieceAt : Piece x Game -> Game x Piece
    // Post: place la pièce sur le plateau à l'endroit indiqué par l'utilisateur
    mutating func setPieceAt(pieceChoisie: inout Piece) -> Piece {
        var correctInformation: Bool = false
        var x : Int = 0
        var y : Int = 0
        while(!correctInformation) {
            print("Donner la ligne: (de 0 à 3)")
            if let numString: String = readLine() {
                x = Int(numString) ?? 20
                print("Donner la colonne: (de 0 à 3)")
                if let numString2: String = readLine() {
                    y = Int(numString2) ?? 20

                    // On vérifie que la position indiqué est bien sur le plateau et ne contient pas déjà une pièce
                    if 0<=x && x<=3 && 0<=y && y<=3 {
                        if self.grid[x][y] == nil{
                            correctInformation = true
                        } else {
                            print("La position indiquée contient déjà une pièce. \n")
                        }
                    } else {
                        print("La position indiquée n'appartient pas au plateau. \n")
                    }
                }
            }
        }
        var i: Int = 0
        var j: Int = 0
        var piecePose: Bool = false
        // Parcours de la grille
        while i<self.grid.count && !piecePose { // Parcours des lignes
            while j < self.grid[i].count && !piecePose { // Parcours des colonnes
                if i == x && j == y {
                    // On place la pièce
                    self.grid[i][j] = pieceChoisie
                    // On modifie les attributs de position de la pièce
                    pieceChoisie.line = i
                    pieceChoisie.column = j
                    // On enlève la pièce de la liste des pièces disponibles
                    if let index = self.listePieces.firstIndex(where: {$0.color == pieceChoisie.color && $0.heigh == pieceChoisie.heigh && $0.filling == pieceChoisie.filling && $0.shape == pieceChoisie.shape}) {
                        self.listePieces.remove(at: index)
                    }
                    piecePose = true
                }
                j += 1
            }
            j=0
            i += 1
        }
      return pieceChoisie
    }

    // Regarde si il y a un quarto effectué, après la pose d'une pièce, en fonction des règles choisies au début de la partie et s'il y a un quarto
    // quarto: Game x Piece -> Bool
    // Il y a quarto si, sur une même ligne, colonne ou diagonale, les 4 pièces ont une caractéristique identique avec les règles simples
    // Il y a quarto si, sur une même ligne, colonne, diagonale ou carré, les 4 pièces ont une caractéristique identique avec les règles complexes
    func quarto(piecePose: Piece) -> Bool {
        if(self.rules=="Simples") {
            return self.quartoLigne(piecePose: piecePose) || self.quartoCol(piecePose: piecePose) || self.quartoDiag(piecePose: piecePose)
        }
        if(self.rules=="Complexes") {
            return self.quartoLigne(piecePose: piecePose) || self.quartoCol(piecePose: piecePose) || self.quartoDiag(piecePose: piecePose) || self.quartoCarre(piecePose: piecePose)
        }
        return false
    }


    // vérifie s'il y a un quarto (ou non) sur la ligne après la pose d'une pièce
    // quartoLigne : Game x Piece -> Bool
    // Post : Bool = true si quarto sur la ligne, false sinon
    func quartoLigne(piecePose: Piece) -> Bool {
        // On récupère dans un tableau toutes les pièces à analyser
        // Si il y a des cases qui ne contiennent pas encore de pièces alors on renvoie false
        var listePieces = [Piece]()
        var nilFound = false
        var j=0
        while j<4 && !nilFound {
            guard let piece = self.grid[piecePose.line!][j] else {
                nilFound = true
                return false
            }
            
            listePieces.append(piece)
            j+=1
        }
    
        // On vérifie pour chaque attribut de pièce la possibilité d'un quarto
        var quartoByColor: Bool = false
        var quartoByHeigh: Bool = false
        var quartoByFilling: Bool = false
        var quartoByShape: Bool = false

        if(!nilFound) {
            if (piecePose.color == listePieces[0].color) && (listePieces[1].color == listePieces[2].color) && (listePieces[2].color == listePieces[3].color) {
                quartoByColor = true
            }
            if (piecePose.heigh == listePieces[0].heigh) && (listePieces[1].heigh == listePieces[2].heigh) && (listePieces[2].heigh == listePieces[3].heigh) {
                quartoByHeigh = true
            }
            if (piecePose.filling == listePieces[0].filling) && (listePieces[1].filling == listePieces[2].filling) && (listePieces[2].filling == listePieces[3].filling) {
                quartoByFilling = true
            }
            if (piecePose.shape == listePieces[0].shape) && (listePieces[1].shape == listePieces[2].shape) && (listePieces[2].shape == listePieces[3].shape) {
                quartoByShape = true
            }
        }
        return !nilFound && (quartoByColor || quartoByHeigh || quartoByFilling || quartoByShape)
    }

    // vérifie s'il y a un quarto (ou non) sur la colone après la pose d'une pièce
    // quartoCol : Game x Piece -> Bool
    // Post : Bool = true si quarto sur la colonne, false sinon
    func quartoCol(piecePose: Piece) -> Bool {
        // On récupère dans un tableau toutes les pièces à analyser
        var listePieces = [Piece]()
        var nilFound = false
        var i=0
        while i<4 && !nilFound {
            if(self.grid[i][piecePose.column!] == nil) {
                nilFound = true
                return false
            } else {
                listePieces.append(self.grid[i][piecePose.column!]!)
            }
            i+=1
        }
        
        // On vérifie pour chaque attribut de pièce la possibilité d'un quarto
        var quartoByColor: Bool = false
        var quartoByHeigh: Bool = false
        var quartoByFilling: Bool = false
        var quartoByShape: Bool = false

        if(!nilFound) {
            if (piecePose.color == listePieces[0].color) && (listePieces[1].color == listePieces[2].color) && (listePieces[2].color == listePieces[3].color) {
                quartoByColor = true
            }
            if (piecePose.heigh == listePieces[0].heigh) && (listePieces[1].heigh == listePieces[2].heigh) && (listePieces[2].heigh == listePieces[3].heigh) {
                quartoByHeigh = true
            }
            if (piecePose.filling == listePieces[0].filling) && (listePieces[1].filling == listePieces[2].filling) && (listePieces[2].filling == listePieces[3].filling) {
                quartoByFilling = true
            }
            if (piecePose.shape == listePieces[0].shape) && (listePieces[1].shape == listePieces[2].shape) && (listePieces[2].shape == listePieces[3].shape) {
                quartoByShape = true
            }
        }
        return !nilFound && (quartoByColor || quartoByHeigh || quartoByFilling || quartoByShape)
    }

    // vérifie s'il y a un quarto (ou non) sur la diagonale après la pose d'une pièce
    // quartoDiag: Game x Piece -> Bool
    // Post : Bool = true si quarto sur la diagonale, false sinon
    func quartoDiag(piecePose: Piece) -> Bool {       
        var listePieces = [Piece]()
        var x: Int = 0
        var y: Int = 0
        var caseVideTrouve: Bool = false
        var nbPieceDiag: Int = 0
        var quartoByColor: Bool = false
        var quartoByHeigh: Bool = false
        var quartoByFilling: Bool = false
        var quartoByShape: Bool = false

        // On regarde sur la première diagonale s'il y a un Quarto
        // x - - - 
        // - x - -
        // - - x -
        // - - - x
        while(x<4 && y<4 && !caseVideTrouve) {
            if(self.grid[x][y] != nil) {
                listePieces.append(self.grid[x][y]!)
                nbPieceDiag+=1
                x+=1
                y+=1
            } else {
                // Il y a une case qui ne contient pas de pièce sur la diagonale
                // Il n'y a donc pas de quarto sur cette diagonale
                // Ainsi pas besoin de regarder les autres cases de la diagonale
                // Mais il faut vérifier la seconde diagonale :
                // Donc on supprime toutes pièces à vérifier de listePieces
                caseVideTrouve = true
                listePieces.removeAll()
            }
        }

        // On vérifie s'il y avait 4 pièces sur la diagonale
        if nbPieceDiag == 4 {
            // On vérifie pour chaque attribut de pièce la possibilité d'un quarto
            if (listePieces[0].color == listePieces[1].color) && (listePieces[1].color == listePieces[2].color) && (listePieces[2].color == listePieces[3].color) {
                quartoByColor = true
            }
            if (listePieces[0].heigh == listePieces[1].heigh) && (listePieces[1].heigh == listePieces[2].heigh) && (listePieces[2].heigh == listePieces[3].heigh) {
                quartoByHeigh = true
            }
            if (listePieces[0].filling == listePieces[1].filling) && (listePieces[1].filling == listePieces[2].filling) && (listePieces[2].filling == listePieces[3].filling) {
                quartoByFilling = true
            }
            if (listePieces[0].shape == listePieces[1].shape) && (listePieces[1].shape == listePieces[2].shape) && (listePieces[2].shape == listePieces[3].shape) {
                quartoByShape = true
            }
            // Si il y a un quarto dans la diagonale1 : Pas besoin de vérifier l'autre diagonale
            if quartoByColor || quartoByHeigh || quartoByFilling || quartoByShape {
                return true
            }
        } 
        else {
            // On regarde sur la deuxième diagonale s'il y a un Quarto
            // - - - x
            // - - x -
            // - x - -
            // x - - -
            x = 0
            y = 3
            caseVideTrouve = false
            nbPieceDiag = 0
            while(x<4 && y>=0 && !caseVideTrouve) {
                if(self.grid[x][y] != nil) {
                    listePieces.append(self.grid[x][y]!)
                    nbPieceDiag+=1
                    x+=1
                    y-=1
                } else {
                    // Il y a une case qui ne contient pas de pièce sur la diagonale
                    return false
                }
            }
            // On vérifie pour chaque attribut de pièce la possibilité d'un quarto
            if (listePieces[0].color == listePieces[1].color) && (listePieces[1].color == listePieces[2].color) && (listePieces[2].color == listePieces[3].color) {
                quartoByColor = true
            }
            if (listePieces[0].heigh == listePieces[1].heigh) && (listePieces[1].heigh == listePieces[2].heigh) && (listePieces[2].heigh == listePieces[3].heigh) {
                quartoByHeigh = true
            }
            if (listePieces[0].filling == listePieces[1].filling) && (listePieces[1].filling == listePieces[2].filling) && (listePieces[2].filling == listePieces[3].filling) {
                quartoByFilling = true
            }
            if (listePieces[0].shape == listePieces[1].shape) && (listePieces[1].shape == listePieces[2].shape) && (listePieces[2].shape == listePieces[3].shape) {
                quartoByShape = true
            }
            return quartoByColor || quartoByHeigh || quartoByFilling || quartoByShape
        }
        return false
    }

    // vérifie s'il y a un quarto (ou non) dans un carré après la pose d'une pièce
    // quartoCarre: Game x Piece -> Bool
    // Post : Bool = true si quarto sur un carré, false sinon
    func quartoCarre(piecePose: Piece) -> Bool {
        // On récupère dans un tableau toutes les pièces à analyser
        var listePieces = [Piece]()
        var carre1verif: Bool = false
        var carre2verif: Bool = false
        var carre3verif: Bool = false
        var carre4verif: Bool = false
        var carre5verif: Bool = false
        var carre6verif: Bool = false
        var carre7verif: Bool = false
        var carre8verif: Bool = false
        var carre9verif: Bool = false
        var quartoTrouve: Bool = false
        var quatrepieceTrouve: Bool = false

        while !quartoTrouve {
            // On vérifie si il y a quarto dans le carré 1
            // x x - -
            // x x - -
            // - - - -
            // - - - -
            if(!carre1verif && self.grid[0][0] != nil && self.grid[0][1] != nil && self.grid[1][0] != nil && self.grid[1][1] != nil) {
                carre1verif = true
                listePieces.append(self.grid[0][0]!)
                listePieces.append(self.grid[0][1]!)
                listePieces.append(self.grid[1][0]!)
                listePieces.append(self.grid[1][1]!)
                quatrepieceTrouve = true // Pour ne pas vérifier tous les autres carrés
            }

            // On vérifie si il y a quarto dans le carré 2
            // - - x x
            // - - x x
            // - - - -
            // - - - -
            if(!quatrepieceTrouve && !carre2verif && self.grid[0][2] != nil && self.grid[0][3] != nil && self.grid[1][2] != nil && self.grid[1][3] != nil) {
                carre2verif = true
                listePieces.append(self.grid[0][2]!)
                listePieces.append(self.grid[0][3]!)
                listePieces.append(self.grid[1][2]!)
                listePieces.append(self.grid[1][3]!)
                quatrepieceTrouve = true // Pour ne pas vérifier tous les autres carrés
            }

            // On vérifie si il y a quarto dans le carré 3
            // - - - -
            // - - - -
            // x x - -
            // x x - -
            if(!quatrepieceTrouve && !carre3verif && self.grid[2][0] != nil && self.grid[2][1] != nil && self.grid[3][0] != nil && self.grid[3][1] != nil) {
                carre3verif = true
                listePieces.append(self.grid[2][0]!)
                listePieces.append(self.grid[2][1]!)
                listePieces.append(self.grid[3][0]!)
                listePieces.append(self.grid[3][1]!)
                quatrepieceTrouve = true // Pour ne pas vérifier tous les autres carrés
            }

            // On vérifie si il y a quarto dans le carré 4
            // - - - -
            // - - - -
            // - - x x
            // - - x x
            if(!quatrepieceTrouve && !carre4verif && self.grid[0][2] != nil && self.grid[0][3] != nil && self.grid[1][2] != nil && self.grid[1][3] != nil) {
                carre4verif = true
                listePieces.append(self.grid[0][2]!)
                listePieces.append(self.grid[0][3]!)
                listePieces.append(self.grid[1][2]!)
                listePieces.append(self.grid[1][3]!)
                quatrepieceTrouve = true // Pour ne pas vérifier tous les autres carrés
            }

            // On vérifie si il y a quarto dans le carré 5
            // - x x -
            // - x x -
            // - - - -
            // - - - -
            if(!quatrepieceTrouve && !carre5verif && self.grid[0][1] != nil && self.grid[0][2] != nil && self.grid[1][1] != nil && self.grid[1][2] != nil) {
                carre5verif = true
                listePieces.append(self.grid[0][1]!)
                listePieces.append(self.grid[0][2]!)
                listePieces.append(self.grid[1][1]!)
                listePieces.append(self.grid[1][2]!)
                quatrepieceTrouve = true // Pour ne pas vérifier tous les autres carrés
            }

            // On vérifie si il y a quarto dans le carré 6
            // - - - -
            // - - - -
            // - x x -
            // - x x -
            if(!quatrepieceTrouve && !carre6verif && self.grid[2][1] != nil && self.grid[2][2] != nil && self.grid[3][1] != nil && self.grid[3][2] != nil) {
                carre6verif = true
                listePieces.append(self.grid[2][1]!)
                listePieces.append(self.grid[2][2]!)
                listePieces.append(self.grid[3][1]!)
                listePieces.append(self.grid[3][2]!)
                quatrepieceTrouve = true // Pour ne pas vérifier tous les autres carrés
            }

            // On vérifie si il y a quarto dans le carré 7
            // - - - -
            // x x - -
            // x x - -
            // - - - -
            if(!quatrepieceTrouve && !carre7verif && self.grid[1][0] != nil && self.grid[1][1] != nil && self.grid[2][0] != nil && self.grid[2][1] != nil) {
                carre7verif = true
                listePieces.append(self.grid[1][0]!)
                listePieces.append(self.grid[1][1]!)
                listePieces.append(self.grid[2][0]!)
                listePieces.append(self.grid[2][1]!)
                quatrepieceTrouve = true // Pour ne pas vérifier tous les autres carrés
            }

            // On vérifie si il y a quarto dans le carré 8
            // - - - -
            // - - x x
            // - - x x
            // - - - -
            if(!quatrepieceTrouve && !carre8verif && self.grid[1][2] != nil && self.grid[1][3] != nil && self.grid[2][2] != nil && self.grid[2][3] != nil) {
                carre8verif = true
                listePieces.append(self.grid[1][2]!)
                listePieces.append(self.grid[1][3]!)
                listePieces.append(self.grid[2][2]!)
                listePieces.append(self.grid[2][3]!)
                quatrepieceTrouve = true // Pour ne pas vérifier le dernier carré
            }

            // On vérifie si il y a quarto dans le carré 9
            // - - - -
            // - x x -
            // - x x -
            // - - - -
            if(!quatrepieceTrouve && !carre9verif && self.grid[1][1] != nil && self.grid[1][2] != nil && self.grid[2][1] != nil && self.grid[2][2] != nil) {
                carre9verif = true
                listePieces.append(self.grid[1][1]!)
                listePieces.append(self.grid[1][2]!)
                listePieces.append(self.grid[2][1]!)
                listePieces.append(self.grid[2][2]!)
            }

            if(listePieces.isEmpty) {
                // Aucun carré ne contient 4 pièces donc il n'y a pas de quarto
                return false
            } else {
                // On vérifie pour chaque attribut de pièce la possibilité d'un quarto
                var quartoByColor: Bool = false
                var quartoByHeigh: Bool = false
                var quartoByFilling: Bool = false
                var quartoByShape: Bool = false
                if (piecePose.color == listePieces[0].color) && (listePieces[1].color == listePieces[2].color) && (listePieces[2].color == listePieces[3].color) {
                    quartoByColor = true
                }
                if (piecePose.heigh == listePieces[0].heigh) && (listePieces[1].heigh == listePieces[2].heigh) && (listePieces[2].heigh == listePieces[3].heigh) {
                    quartoByHeigh = true
                }
                if (piecePose.filling == listePieces[0].filling) && (listePieces[1].filling == listePieces[2].filling) && (listePieces[2].filling == listePieces[3].filling) {
                    quartoByFilling = true
                }
                if (piecePose.shape == listePieces[0].shape) && (listePieces[1].shape == listePieces[2].shape) && (listePieces[2].shape == listePieces[3].shape) {
                    quartoByShape = true
                }
                if quartoByColor || quartoByHeigh || quartoByFilling || quartoByShape {
                    quartoTrouve = true
                } else {
                    // on doit vérifier les autres carrés
                    listePieces.removeAll()
                    quatrepieceTrouve = false
                }
            }
        }
        if quartoTrouve {
            return true
        } else {
            return false
        }
    }
}

//     // makeIterator: Game -> ItPlateau
//     // crée un itérateur sur le plateau pour le parcourir dans l'ordre des cases
//     func makeIterator() -> ItPlateau {
//         return ItPlateau(grid: self)
//     }
// }

// public struct ItPlateau: IteratorProtocol {
//     var grid: [[Piece]]
//     var indexLine = 0
//     var indexColumn = 0

//     init(grid: [[Piece]]) {
//         self.grid = grid
//     }

//     mutating func next() -> Piece? {
//         guard indexLine<grid.count && indexColumn<grid[indexLine].count else { return nil }
//         indexLine+=1
//         indexColumn+=1
//         return grid[indexLine-1][indexColumn-1]
//     }
// }