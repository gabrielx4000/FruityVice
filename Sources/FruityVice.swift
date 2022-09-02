import Combine
import Foundation

public struct FruityVice {
    
    public static let shared = FruityVice(session: URLSession.shared, urlString: "https://www.fruityvice.com/api/fruit/all")
    
    let session: URLSession
    
    let urlString: String
    
    public init (session: URLSession, urlString: String) {
        self.session = session
        self.urlString = urlString
    }
    
    
    
    
    
    
    
    
    
    public func getFruitsPublisher() -> AnyPublisher<[Fruit], Error>? {
        guard let url = URL(string: urlString) else { return nil }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Fruit].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}
