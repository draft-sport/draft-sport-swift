import XCTest
@testable import DraftSport

final class DraftSportTests: XCTestCase {
    func testListPlayers() {
        
        let expectation = XCTestExpectation(
            description: "Player retrieval complete"
        )

        Player.retrieveMany(
            season: Season.SUPER_RUGBY_2020
        ){ (error, players) in
            XCTAssertNil(error)
            XCTAssertNotNil(players)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        //XCTAssertEqual(DraftSport().text, "Hello, World!")
    }

    static var allTests = [
        ("listPlayers", testListPlayers),
    ]
}
