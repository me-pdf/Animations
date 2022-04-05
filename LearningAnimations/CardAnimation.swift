//
//  CardAnimation.swift
//  LearningAnimations
//
//  Created by Piera Di Fusco on 24/03/22.
//


import SwiftUI

struct Card: Identifiable, Equatable {
    let id = UUID()
    let question: String
    let color: Color
}
struct Deck {
    
    var topCardOffset: CGSize = .zero
    var activeCard: Card? = nil
    
    var cards = [
        Card(question: "1", color: .yellow),
        Card(question: "2", color: .cyan),
        Card(question: "3", color: .orange),
        Card(question: "4", color: .brown),
        Card(question: "5", color: .indigo),
        Card(question: "6", color: .black)
    ]
    
    var topCard: Card {
        return cards[0]
    }
    
    var count: Int {
        return cards.count
    }
    
    func position(of card: Card) -> Int {
        return cards.firstIndex(of: card) ?? 0
    }
    
    func scale(of card: Card) -> CGFloat {
        let deckPosition = position(of: card)
        let scale = CGFloat(deckPosition) * 0.02
        return CGFloat(1 - scale)
    }
    
    func deckOffset(of card: Card) -> CGFloat {
        let deckPosition = position(of: card)
        let offset = deckPosition * -10
        return CGFloat(offset)
    }
    
    func zIndex(of card: Card) -> Double {
        return Double(count - position(of: card))
    }
    
    func rotation(for card: Card, offset: CGSize = .zero) -> Angle {
        return .degrees(Double(offset.width) / 20.0)
    }
    
    mutating func moveToBack(_ state: Card) {
        let topCard = cards.remove(at: position(of: state))
        cards.append(topCard)
    }
    
    mutating func moveToFront(_ state: Card) {
        let topCard = cards.remove(at: position(of: state))
        cards.insert(topCard, at: 0)
    }
}

struct CardAnimation: View {
    
    @State var deck: Deck = Deck()
    
    var body: some View {
        ZStack {
            ForEach(deck.cards) { card in
                CardView(card: card)
                    .zIndex(self.deck.zIndex(of: card))
                    .shadow(radius: 2)
                    .offset(x: self.offset(for: card).width, y: self.offset(for: card).height)
                    .offset(y: self.deck.deckOffset(of: card))
                    .scaleEffect(x: self.deck.scale(of: card), y: self.deck.scale(of: card))
                    .rotationEffect(self.rotation(for: card))
                    .gesture(
                        DragGesture()
                            .onChanged({ (drag) in
                                if self.deck.activeCard == nil {
                                    self.deck.activeCard = card
                                }
                                if card != self.deck.activeCard {return}

                                withAnimation(.spring()) {
                                    self.deck.topCardOffset = drag.translation
                                    if
                                        drag.translation.width < -200 ||
                                            drag.translation.width > 200 ||
                                            drag.translation.height < -250 ||
                                            drag.translation.height > 250 {
                                        self.deck.moveToBack(card)
                                    } else {
                                        self.deck.moveToFront(card)
                                    }
                                }
                            })
                            .onEnded({ (drag) in
                                withAnimation(.spring()) {
                                    self.deck.activeCard = nil
                                    self.deck.topCardOffset = .zero
                                }
                            })
                )
            }
        }
    }
    
    func offset(for card: Card) -> CGSize {
        if card != self.deck.activeCard {return .zero}
        
        return deck.topCardOffset
    }
    
    func rotation(for card: Card) -> Angle {
        guard let activeCard = self.deck.activeCard
            else {return .degrees(0)}
        
        if card != activeCard {return .degrees(0)}
        
        return deck.rotation(for: activeCard, offset: deck.topCardOffset)
    }
}

struct CardView: View {
    let card: Card
    
    var body: some View {
        VStack {
            VStack {
                Text("CARD N.")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                Divider()
                Spacer()
                Text(card.question)
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                Spacer()
            }
        }
        .padding()
        .frame(width: 200, height: 200)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(card.color)
        )
    }
}

struct CardAnimation_Previews: PreviewProvider {
    static var previews: some View {
        CardAnimation()
    }
}
