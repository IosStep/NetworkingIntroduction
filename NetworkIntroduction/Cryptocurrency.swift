import Foundation

struct CurrencyResponse: Codable {
    let data: [Currency]
    let timestamp: Int
}

struct Currency: Codable {
    let rank: String
    let symbol: String
    let name: String
    let priceUsd: String
}
