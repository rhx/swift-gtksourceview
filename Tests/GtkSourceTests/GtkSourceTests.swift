import XCTest
import CGtkSource
@testable import GtkSource

final class GtkSourceTests: XCTestCase {
    override class func setUp() {
        usleep(100000) // FIXME: ensure gtk is initialised
    }
    func testMajorVersion() { XCTAssertEqual(majorVersion, Int(gtk_source_get_major_version())) }
    func testMinorVersion() { XCTAssertEqual(minorVersion, Int(gtk_source_get_minor_version())) }
    func testMicroVersion() { XCTAssertEqual(microVersion, Int(gtk_source_get_micro_version())) }
}
