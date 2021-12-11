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


print("Bienvenue dans le jeu QUARTO \n Veuillez choisir vos règles entre simples et complexes : \n")
game.defineRules()

print("Joueur 1, entrez votre nom : \n")
j1 = readLine()

print("Joueur 2, entrez votre nom : \n")
j2 = readLine()

print("Début de la partie... \n \(j1) commence !\n")

while !game.quarto() || game.pieceAvailable{

    var iterator = game.ItPlateau

    while let val = iterator.next(){
        if val == nil{
            print(val)
        }
        else{
            if p.isWhite(){
                color = "blanc"
            }
            else{
                color = "noir"
            }
            if p.isTall(){
                heigh = "grand"
            }
            else{
                heigh = "petit"
            }
            if p.isFull(){
                inside = "plein"
            }
            else{
                inside = "creux"
            }
            if p.isSquare(){
                shape = "carré"
            }
            else{
                shape = "rond"
            }
            print([color,heigh,inside,shape])
        }
        compteur += 1
        if compteur>=4 {
            print("\n")
            compteur = 0
        }
    }

    if game.tourJ1() {
        print("\(j1) choisis une pièce : \n")
    }
    else {
        print("\(j2) choisis une pièce : \n")
    }
    game.choosePiece()

    if game.tourJ1(){
        print("\(j2) choisis où poser la pièce : \n")
    }
    else {
        print("\(j1) choisis où poser la pièce : \n")
    }
    
    game.setPieceAt()   

    print("On inverse les rôles des joueurs !\n")
    game.changePlayer()     
    
}
print("Fin de la partie !")
if game.quarto(){
    if game.tourJ1(){
        print("\(j1) a gagné ! Bravo bg \n")
    }
    else {
        print("\(j2) a gagné ! Bravo champion \n")
    }
}
else {
    print("Egalité ! Refaites une partie \n")
}