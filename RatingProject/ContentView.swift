//
//  ContentView.swift
//  RatingProject
//
//  Created by Navin Rai on 26/01/26.
//

import SwiftUI

struct ContentView: View {
    @State private var currentRating = 0
    @State private var heartRating = 0
    @State private var pinRating = 0
    @State private var tagRating = 0
    var body: some View {
        RatingView(
            maxRating: 5,
            currentRating: $currentRating,
            width: 40
        )
        RatingView(
            maxRating: 3,
            currentRating: $heartRating,
            width: 50,
            symbol: "heart",
            color: .red
        )
        RatingView(
            maxRating: 5,
            currentRating: $pinRating,
            width: 50,
            symbol: "pin",
            color: .blue
        )
        RatingView(maxRating: 5, currentRating: $tagRating, symbol: "tag")
        
    }
}

#Preview {
    ContentView()
}
