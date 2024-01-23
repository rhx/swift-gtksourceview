import XCTest
import CGtkSourceView
@testable import GtkSourceView

final class GtkSourceViewTests: XCTestCase {
    override class func setUp() {
        usleep(100000) // FIXME: ensure gtk is initialised
    }
    func testMajorVersion() { XCTAssertEqual(getMajorVersion(), Int(gtk_source_get_major_version())) }
    func testMinorVersion() { XCTAssertEqual(getMinorVersion(), Int(gtk_source_get_minor_version())) }
    func testMicroVersion() { XCTAssertEqual(getMicroVersion(), Int(gtk_source_get_micro_version())) }
    func testInterfaceAge() { XCTAssertEqual(getInterfaceAge(), Int(gtk_source_get_interface_age())) }
    func testBinaryAge()    { XCTAssertEqual(getBinaryAge(),    Int(gtk_source_get_binary_age()))    }
}
