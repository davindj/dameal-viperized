//
//  DetailView.swift
//  dameal
//
//  Created by Davin Djayadi on 22/01/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    @ObservedObject var presenter: DetailPresenter

    var body: some View {
        ZStack {
            if presenter.isLoading {
                loadingIndicator
            } else if presenter.isError {
                errorIndicator
            } else {
                content
            }
        }.onAppear {
            self.presenter.getMeal()
        }.navigationBarTitle(
            Text(presenter.meal.title),
            displayMode: .inline
        )
    }
}

extension DetailView {
    var loadingIndicator: some View {
        VStack {
            Text("Loading...")
            ActivityIndicator()
        }
    }

    var errorIndicator: some View {
        CustomEmptyView(
            image: "error",
            title: presenter.errorMessage
        )
    }

    var emptyMeals: some View {
        CustomEmptyView(
            image: "no-results",
            title: "Meal not found"
        )
    }

    var contentBodyHeader: some View {
        let meal = presenter.meal

        return VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Text(meal.title)
                    .font(.title)
                    .bold()
                    .lineLimit(2)
                Spacer()
                Image(systemName: "heart.fill")
                    .font(.system(size: 28))
                    .foregroundColor(meal.favorite ? Color.red : Color.gray)
                    .onTapGesture { self.presenter.toggleFavoriteMeal() }
            }
            Text("\(meal.category); \(meal.area)")
            Text(meal.tag)
                .foregroundColor(.secondary)
        }
    }

    var contentBodyLink: some View {
        let meal = presenter.meal

        return HStack {
            VStack {
                Image(systemName: "link")
                    .font(.system(size: 28))
                    .onTapGesture {
                        self.openUrl(meal.source)
                    }
            }
            Spacer().frame(width: 10)
            Divider()
            Spacer().frame(width: 10)
            VStack {
                Image(systemName: "video")
                    .font(.system(size: 28))
                    .onTapGesture {
                        self.openUrl(meal.youtube)
                    }
            }
            Spacer()
        }
    }

    var contentBodyDetail: some View {
        let meal = presenter.meal

        return VStack(alignment: .leading) {
            if !meal.ingredients.isEmpty {
                Text("Ingredients")
                    .font(.title2)
                    .bold()
                Text(meal.ingredients)
            }
            Spacer(minLength: 10)
            Text("Instructions")
                .font(.title2)
                .bold()
            Text(meal.instructions)
        }
    }

    var contentBody: some View {
        return VStack(alignment: .leading) {
            contentBodyHeader
            contentBodyLink
            contentBodyDetail
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(20, corners: [.topLeft, .topRight])
    }

    var content: some View {
        let meal = presenter.meal

        return ScrollView(.vertical, showsIndicators: false) {
            WebImage(url: URL(string: meal.image))
                .resizable()
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .background(Color.gray)
            contentBody
                .offset(y: -50)
        }
    }
}

extension DetailView {
    func openUrl(_ linkUrl: String) {
        guard let link = URL(string: linkUrl) else { return }
        UIApplication.shared.open(link)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let meal = MealModel(
            id: "52874",
            title: "Beef and Mustard Pie",
            image: "https://www.themealdb.com/images/media/meals/wrssvt1511556563.jpg", category: "Beef",
            area: "British",
            instructions: "Season the beef cubes with salt and black pepper. Heat a tablespoon of oil in the frying pan and fry the meat over a high heat. Do this in three batches so that you don’t overcrowd the pan, transferring the meat to a large flameproof casserole dish once it is browned all over. Add extra oil if the pan seems dry.\r\nIn the same pan, add another tablespoon of oil and cook the shallots for 4-5 minutes, then add the garlic and fry for 30 seconds. Add the bacon and fry until slightly browned. Transfer the onion and bacon mixture to the casserole dish and add the herbs.\r\nPreheat the oven to 180C/350F/Gas 4.\r\nPour the stout into the frying pan and bring to the boil, stirring to lift any stuck-on browned bits from the bottom of the pan. Pour the stout over the beef in the casserole dish and add the stock. Cover the casserole and place it in the oven for 1½-2 hours, or until the beef is tender and the sauce is reduced.\r\nSkim off any surface fat, taste and add salt and pepper if necessary, then stir in the cornflour paste. Put the casserole dish on the hob – don’t forget that it will be hot – and simmer for 1-2 minutes, stirring, until thickened. Leave to cool.\r\nIncrease the oven to 200C/400F/Gas 6. To make the pastry, put the flour and salt in a very large bowl. Grate the butter and stir it into the flour in three batches. Gradually add 325ml/11fl oz cold water – you may not need it all – and stir with a round-bladed knife until the mixture just comes together. Knead the pastry lightly into a ball on a lightly floured surface and set aside 250g/9oz for the pie lid.\r\nRoll the rest of the pastry out until about 2cm/¾in larger than the dish you’re using. Line the dish with the pastry then pile in the filling, tucking the oysters in as well. Brush the edge of the pastry with beaten egg.\r\nRoll the remaining pastry until slightly larger than your dish and gently lift over the filling, pressing the edges firmly to seal, then trim with a sharp knife. Brush with beaten egg to glaze. Put the dish on a baking tray and bake for 25-30 minutes, or until the pastry is golden-brown and the filling is bubbling.",
            tag: "Meat, Pie",
            youtube: "https://www.youtube.com/watch?v=nMyBC9staMU",
            source: "https://www.bbc.co.uk/food/recipes/beef_and_mustard_pie_58002",
            favorite: false
        )

        let useCase = Injection.sharedInstance.resolve(DetailUseCase.self, argument: meal)!
        let presenter = DetailPresenter(detailUseCase: useCase)

        return DetailView(presenter: presenter)
    }
}
