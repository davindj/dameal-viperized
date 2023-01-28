//
//  DetailPresenter.swift
//  dameal
//
//  Created by Davin Djayadi on 22/01/23.
//

import Foundation
import Combine
import DamealCore

public class DetailPresenter: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []
    private let detailUseCase: DetailUseCase

    @Published var meal: MealModel
    @Published var errorMessage: String = ""
    @Published var isLoading: Bool = false
    @Published var isError: Bool = false

    public init(detailUseCase: DetailUseCase) {
        self.detailUseCase = detailUseCase
        meal = detailUseCase.getMeal()
    }

    public func getMeal() {
        isLoading = true
        detailUseCase.getMeal()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.isError = true
                    self.isLoading = false
                case .finished:
                    self.isLoading = false
                }
            }, receiveValue: { meal in
                self.meal = meal
            })
            .store(in: &cancellables)
    }

    public func toggleFavoriteMeal() {
        detailUseCase.toggleFavoriteMeal()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                case .finished:
                    self.isLoading = false
                }
            }, receiveValue: { meal in
                self.meal = meal
            })
            .store(in: &cancellables)
    }
}
