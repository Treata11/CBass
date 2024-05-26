import XCTest
@testable import Bass
import CBass

final class BassTests: XCTestCase {
    func testExample() throws {
        Bass_Start()
        StartBass()
             
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
    }
    
    func testBassMIDI() throws {
        BASS_MIDI_MARK
        BASS_MIDI_DECAYSEEK
    }
}
