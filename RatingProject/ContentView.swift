//
//  ContentView.swift
//  RatingProject
//
//  Created by Navin Rai on 26/01/26.
//

import SwiftUI

struct ContentView: View {
    @State private var currentRating = 0
    var body: some View {
        RatingView(
            maxRating: 5,
            currentRating: $currentRating,
            width: 40
        )
    }
}

#Preview {
    ContentView()
}
