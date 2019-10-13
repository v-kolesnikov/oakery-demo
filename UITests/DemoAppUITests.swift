import XCTest

class DemoAppUITests: XCTestCase {
  override func setUp() {
    continueAfterFailure = false
    XCUIApplication().launch()
  }

  func testTouchMeButton() {
    let app = XCUIApplication()
    XCTAssertTrue(app.buttons["Touch me"].exists)
  }

  func testInteractions() {
    let app = XCUIApplication()

    // Press "Home" and send app to background
    XCUIDevice.shared.press(.home)
    XCTAssertTrue(app.wait(for: .runningBackground, timeout: 5))
    XCTAssertTrue(app.state == .runningBackground)

    // Launch or bring to foreground - synchronous
    app.activate()
    XCTAssertTrue(app.state == .runningForeground)

    // Kill the App
    app.terminate()
  }
}
