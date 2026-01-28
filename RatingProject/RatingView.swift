//
//  RatingView.swift
//  RatingProject
//
//  Created by Navin Rai on 26/01/26.
//

import SwiftUI

/// A view of inline images that represent a rating.
/// Tapping on an image will change it from an unfilled to a filled version of the image
///
///  The following example shows a Ratings view with a maximum rating of 3 red hearts
///   bound to a heartRading property and a width of 50 specified
///
///                        RatingView(
///                             maxRating: 3,
///                             currentRating: $heartRating,
///                             width: 50,
///                             symbolEnum: "heart",
///                             color: .red)
///                             
struct RatingView: View {
    let maxRating: Int
    @Binding var currentRating: Int
    let width: Int
    let symbol: String?
    let symbolEnum: Symbol?
    let color: Color
    var symbolString: String
    
    
    /// Only two required parameters are maxRating and the binding to currentRataing. All other parameters have default values
    /// -Parameters:
    ///   - maxRating: The maximum rating on the scale
    ///   - currentRating: A binding to the current rating variable
    ///   - width: The width to the image used for the rating (Default - 20)
    ///   - symbol:  A string representing an SFImage(Default - "star")
    ///   - color: The color of the Image (Dafault - .yellow)
    ///
    ///
    init(
        maxRating: Int,
        currentRating: Binding <Int>,
        width: Int = 30,
        symbol: String? = "star",
        color: Color = .yellow
    ) {
        self.maxRating = maxRating
        self._currentRating = currentRating
        self.width = width
        self.symbol = symbol
        self.symbolEnum = nil
        self.color = color
        
        symbolString = if let symbolEnum { symbolEnum.rawValue } else { symbol! }
    }
    var body: some View {
        HStack {
            Image(systemName: "x.circle")
                .resizable()
                .scaledToFit()
                .foregroundStyle(color)
                .symbolVariant(.slash)
                .opacity(currentRating == 0 ? 0 : 1)
                .onTapGesture {
                    withAnimation {
                        currentRating = 0
                    }
                }
            ForEach(0..<maxRating, id: \.self) {
                rating in
                Image(systemName: symbolString)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(color)
                    .symbolVariant(rating < currentRating ? .fill : .none)
                    .onTapGesture {
                        withAnimation {
                            currentRating = rating + 1
                        }
                    }
            }
        }
        .frame(width: CGFloat(maxRating * width))
    }
}

#Preview {
    struct PreviewWrapper: View {
        let maxRating = 5
        @State var currentRating = 2
        var body: some View {
            RatingView(maxRating: maxRating, currentRating: $currentRating)
        }
    }
    return PreviewWrapper()
}

extension RatingView {
    /// Only two required parameters are maxRating and the binding to currentRataing. All other parameters have default values
    /// -Parameters:
    ///   - maxRating: The maximum rating on the scale
    ///   - currentRating: A binding to the current rating variable
    ///   - width: The width to the image used for the rating (Default - 20)
    ///   - symbol:  A selection of SFSymbol
    ///   - color: The color of the Image (Dafault - .yellow)
    ///
    ///
    init(
        maxRating: Int,
        currentRating: Binding<Int>,
        width: Int = 30,
        symbolEnum: Symbol?,
        color: Color = .yellow
    ) {
        self.maxRating = maxRating
        self._currentRating = currentRating
        self.width = width
        self.symbol = nil
        self.symbolEnum = symbolEnum
        self.color = color
        
        symbolString = if let symbolEnum { symbolEnum.rawValue } else { symbol! }
    }
}

enum Symbol: String {
    case bell
    case bookmark
    case diamond
    case eye
    case flag
    case heart
    case pencil
    case pin
    case star
    case thumbsUp = "hand.thumbsup"
    case tag
    case trash
}
