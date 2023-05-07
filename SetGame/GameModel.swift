//
//  Model.swift
//  SetGame
//
//  Created by Joao Barros on 05/05/23.
//

import Foundation

struct GameModel<CardContent>{
    private(set) var cards: Array<Card>
    
    private var selectedCardsIndices: Array<Int> = []
    private var nextCardIndex = 0
    
    init(arrayOfContent: Array<CardInfo>){
        cards = Array<Card>()
        for index in 0..<arrayOfContent.count{
            cards.append(Card(id: index, content: arrayOfContent[index]))
        }
        cards.shuffle()
        for _ in 0..<12{
            cards[nextCardIndex].isOnDisplay.toggle()
            nextCardIndex += 1
        }
    }
    
    mutating func addCards(){
        if nextCardIndex < 81{
            for _ in 0..<3{
                cards[nextCardIndex].isOnDisplay.toggle()
                nextCardIndex += 1
            }
        }
    }
    
    
    mutating func choose (card: Card){
//        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
//           
//        if selectedCardsIndices.count < 3 {
//            cardsOnDisplay.first(where: )
//            selectedCardsIndices.append(card.id)
//
//        }
    }
    
    struct Card: Identifiable{
        var id: Int
        var isSelected: Bool = false
        var isMatched: Bool = false
        var isOnDisplay: Bool = false
        var content: CardInfo
    }
    
    struct CardInfo{
        let color: CardDetails.Color
        let shape: CardDetails.Shape
        let number: CardDetails.Number
        let shade: CardDetails.Shade
    }
}
