import Foundation


class NetworkManager {
    
    static let shared = NetworkManager()
    
    func getCurrencies(completion: @escaping (CurrencyResponse) -> ()) {
        
        let url = URL(string: "https://api.coincap.io/v2/assets")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
            }
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let currencies = try decoder.decode(CurrencyResponse.self, from: data)
                completion(currencies)
            } catch(let error) {
                print(error)
            }
            
        }.resume()
    }
    
}
