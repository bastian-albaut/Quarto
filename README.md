# Quarto
How to run:
1-
<!-- swiftc -c main.swift GameProtocol.swift PieceProtocol.swift Game.swift Piece.swift -module-name Quarto -->
swiftc -c main.swift Game.swift Piece.swift -module-name Quarto

2-
swiftc -emit-executable main.o Game.o Piece.o -o Quarto
