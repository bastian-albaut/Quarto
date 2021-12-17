# Quarto
How to run:
1-
swiftc -c main.swift GameProtocol.swift PieceProtocol.swift Game.swift Piece.swift -module-name Quarto

swiftc -c main.swift Game.swift Piece.swift -module-name Quarto

2-



Ce que on aurait fait différement dans les spécifications fonctionnelles:

Faire une fonction getPosition() de Piece qui renvoie la ligne et la colonne de la piece
Ou sinon on peut le stocker en attribut global avec Int?

Faire un attribut piecePlace de Piece qui renvoie un booleun indiquant si la piece est placé ou non


repetiton dans chaque fonction quarto 