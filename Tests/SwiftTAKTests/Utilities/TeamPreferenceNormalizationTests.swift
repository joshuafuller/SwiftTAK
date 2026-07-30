//
//  TeamPreferenceNormalizationTests.swift
//

import XCTest
@testable import SwiftTAK

final class TeamPreferenceNormalizationTests: XCTestCase {
    func testNormalizesTeamColorCaseInsensitively() {
        XCTAssertEqual(TeamColor.normalizedPreferenceValue("BLUE"), TeamColor.Blue.rawValue)
        XCTAssertEqual(TeamColor.normalizedPreferenceValue("dark blue"), TeamColor.DarkBlue.rawValue)
        XCTAssertEqual(TeamColor.normalizedPreferenceValue("DARKGREEN"), TeamColor.DarkGreen.rawValue)
    }

    func testNormalizesTeamRoleCaseInsensitively() {
        XCTAssertEqual(TeamRole.normalizedPreferenceValue("TEAM MEMBER"), TeamRole.TeamMember.rawValue)
        XCTAssertEqual(TeamRole.normalizedPreferenceValue("team lead"), TeamRole.TeamLead.rawValue)
        XCTAssertEqual(TeamRole.normalizedPreferenceValue("FORWARD OBSERVER"), TeamRole.ForwardObserver.rawValue)
        XCTAssertEqual(TeamRole.normalizedPreferenceValue("hq"), TeamRole.HQ.rawValue)
    }

    func testRejectsUnrecognizedTeamColor() {
        XCTAssertNil(TeamColor.normalizedPreferenceValue("Custom Color"))
    }

    func testRejectsUnrecognizedTeamRole() {
        XCTAssertNil(TeamRole.normalizedPreferenceValue("Custom Role"))
    }
}
