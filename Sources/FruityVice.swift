import Combine
import Foundation

/// FruityVice object.
public struct FruityVice {

    /// The shared singleton session object.
    public static let shared = FruityVice(session: URLSession.shared, urlString: "https://www.fruityvice.com/api/fruit/all")

    let session: URLSession

    let urlString: String

    /// Creates a custom FruityVice object with the specified session configuration and server URL.
    ///
    /// - Parameter session: URLSession object.
    /// - Parameter urlString: Server URL.
    ///
    /// - Returns: custom FruityVice object with the specified session configuration and server URL.
    public init (session: URLSession, urlString: String) {
        self.session = session
        self.urlString = urlString
    }

    /// Returns a publisher that wraps a network session data task to the FruityVice server.
    ///
    /// The publisher publishes data when the task completes, or terminates if the task fails with an error.
    /// - Returns: A publisher that wraps a network session data task to the FruityVice server.
    public func getFruitsPublisher() -> AnyPublisher<[Fruit], Error>? {
        guard let url = URL(string: urlString) else { return nil }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Fruit].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

}
