import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(VisionTestRowFinder1Tests.allTests),
    ]
}
#endif
