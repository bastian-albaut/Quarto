import Foundation

var game = Game()
var p = Piece()

var color : String
var heigh : String
var inside : String
var shape : String
var compteur : Int = 0
var j1 : String? = nil
var j2 : String? = nil

game.createPieces()

print("Bienvenue dans le jeu QUARTO \nVeuillez choisir vos règles entre simples et complexes:\n")
game.defineRules()

print("\nJoueur 1, entrez votre nom:")
j1 = readLine()

print("Joueur 2, entrez votre nom:")
j2 = readLine()

var piecePose = p

repeat {

    // Affichage du plateau de jeu
    print("\nPlateau actualisé:")
    for i in 0...3 { // ligne
        var stringLine: String = ""
        for j in 0...3 { // colonne
            var p : Piece? = game.grid[i][j]

            if p == nil{
                stringLine += "|xxxxxxxxxxxxxxxxxxxxxxxxxx|"
            } else{
                if p!.isWhite(){
                    color = "blanc"
                }
                else{
                    color = "noire"
                }
                if p!.isTall(){
                    heigh = "haute"
                }
                else{
                    heigh = "basse"
                }
                if p!.isFull(){
                    inside = "pleine"
                }
                else{
                    inside = "creuse"
                }
                if p!.isSquare(){
                    shape = "carré"
                }
                else{
                    shape = "ronde"
                }
                stringLine += "| \(color),\(heigh),\(inside),\(shape) |"
            }
        }
        // Après le parcours de toute la ligne: On l'affiche
        print(stringLine)
    }

    if game.tourJ1() {
        print("\n\(j1) choisis une pièce:")
    }
    else {
        print("\n\(j2) choisis une pièce:")
    }
    var pieceChoisie: Piece = game.choosePiece()

    if game.tourJ1(){
        print("\(j2) choisis où poser la pièce: \n")
    }
    else {
        print("\(j1) choisis où poser la pièce: \n")
    }
    
    piecePose = game.setPieceAt(pieceChoisie: &pieceChoisie)
    print("La pièce posé est: \(piecePose)\n")

    print("On inverse les rôles des joueurs !\n")
    game.changePlayer()    

} while !game.quarto(piecePose: piecePose) || game.pieceAvailable
