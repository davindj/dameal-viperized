//
//  APIEndpoint.swift
//  dameal
//
//  Created by Davin Djayadi on 22/01/23.
//

import Foundation

struct API {
  static let baseUrl = "https://www.themealdb.com/api/json/v1/1"
}

protocol Endpoint {
  var url: String { get }
}

enum Endpoints {
  enum Gets: Endpoint {
    case meals
    case meal

    public var url: String {
      switch self {
      case .meals: return "\(API.baseUrl)/filter.php?c=beef"
      case .meal: return "\(API.baseUrl)/lookup.php"
      }
    }
  }
}
