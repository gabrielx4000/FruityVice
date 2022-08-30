import Combine
import XCTest
@testable import FruityVice

final class FruityViceTests: XCTestCase {
    
    var sut: FruityVice!
    
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        sut = FruityVice.shared
        cancellables = []
    }
    
    func testExample() throws {
        let expectation = expectation(description: "getFruitsPublisherExpectation")
        
        expectation.expectedFulfillmentCount = 2
        
        sut.getFruitsPublisher()?.sink(receiveCompletion: { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .finished:
                expectation.fulfill()
            }
        }, receiveValue: { fruits in
            XCTAssert(fruits.count > 0)
            
            expectation.fulfill()
        }).store(in: &cancellables)
        
        wait(for: [expectation], timeout: 10)
    }
}
