//
//  MealRow.swift
//  dameal
//
//  Created by Davin Djayadi on 23/01/23.
//

import SwiftUI
import SDWebImageSwiftUI
import DamealCore

public struct MealRow: View {
    var meal: MealModel

    public init(meal: MealModel) {
        self.meal = meal
    }

    public var body: some View {
        HStack(alignment: .center) {
            WebImage(url: URL(string: meal.image))
                .resizable()
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .frame(width: 128, height: 128)
                .background(Color.gray)
                .cornerRadius(20)
            Text(meal.title)
                .font(.title2)
                .bold()
                .lineLimit(3)
            Spacer()
            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFit()
                .frame(height: 24)
                .foregroundColor(meal.favorite ? Color.red : Color.gray)
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(20)
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
    }
}

struct MealRow_Previews: PreviewProvider {
    static var previews: some View {
        let meal = MealModel(
            id: "123456",
            title: "Beef and Mustard Pie",
            image: "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg",
            favorite: true
        )

        let longTitleMeal = MealModel(
            id: "123456",
            title: "Beef and Oyster pie",
            image: "https://www.themealdb.com/images/media/meals/wrssvt1511556563.jpg",
            favorite: false
        )

        return ZStack {
            AppBackground()
            VStack {
                Spacer()
                MealRow(meal: meal)
                MealRow(meal: longTitleMeal)
                Spacer()
            }
        }
    }
}
