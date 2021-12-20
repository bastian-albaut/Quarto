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