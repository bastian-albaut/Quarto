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


print("Bienvenue dans le jeu QUARTO \nVeuillez choisir vos règles entre simples et complexes:\n")
game.defineRules()

print("Joueur 1, entrez votre nom:")
j1 = readLine()

print("Joueur 2, entrez votre nom:")
j2 = readLine()

print("Début de la partie... \n\(j1) commence !")

var piecePose = p

// repeat {
    // Affichage du plateau de jeu
    for i in 0...3 { // ligne
        var stringLine: String = ""
        for j in 0...3 { // colonne
            var p : Piece? = game.grid[i][j]

            if p == nil{
                stringLine += " nil "
            } else{
                if p!.isWhite(){
                    color = "blanc"
                }
                else{
                    color = "noir"
                }
                if p!.isTall(){
                    heigh = "grand"
                }
                else{
                    heigh = "petit"
                }
                if p!.isFull(){
                    inside = "plein"
                }
                else{
                    inside = "creux"
                }
                if p!.isSquare(){
                    shape = "carré"
                }
                else{
                    shape = "rond"
                }
                stringLine += "| \(color),\(heigh),\(inside),\(shape) |"
            }
        }
        // Après le parcours de toute la ligne: On l'affiche
        print(stringLine)
    }

    // if game.tourJ1() {
    //     print("\(j1) choisis une pièce : \n")
    // }
    // else {
    //     print("\(j2) choisis une pièce : \n")
    // }
    // var pieceChoisie: Piece = game.choosePiece()

    // if game.tourJ1(){
    //     print("\(j2) choisis où poser la pièce : \n")
    // }
    // else {
    //     print("\(j1) choisis où poser la pièce : \n")
    // }
    
    // var piecePose: Piece = game.setPieceAt(pieceChoisie: Piece)

    // print("On inverse les rôles des joueurs !\n")
    // game.changePlayer()    

// } while !game.quarto(piecePose: Piece) || game.pieceAvailable
