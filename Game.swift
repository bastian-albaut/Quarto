struct Game: GameProtocol {
    private var grid : [[String]]
    private var pieceAvailable : Bool
    private var rules : String
    private var currentTour : String = "tourJ1"

    // Création d'une Game : initialise un plateau de 16 cases ne contenant pas de pièces, initialise les deux joueurs : un qui choisit la pièce et l'autre qui pose la pièce
    // init : -> Game
    // crée un itérator "ItPlateau" pour parcourir les cases du plateau
    // pieceAvailable = true
    init() {
        self.grid = [[Piece]](repeating: [String](repeating: " _ ", count: 4), count: 4)
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
}