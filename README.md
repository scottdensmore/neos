# NEOs

SwiftUI iOS prototype. The project uses Swift 5 language mode and targets iOS 16.1 or later.

## CI

The build/test workflow uses the existing Xcode and iOS simulators on the standard macOS 26 runner. It compiles unsigned Release and runs every existing unit/UI test on both an iPhone and an iPad. The shared NEOs scheme includes both test targets. Tests run once without retry flags or test filters; no signing credentials or setup/tool installation scripts are used. Failure diagnostics are retained for three days.

The retained unit tests are Xcode template placeholders; UI tests exercise application launch, launch performance and screenshots. Passing CI verifies compilation and these limited smoke checks, not NASA API integration, orbit correctness or broad feature coverage. The checked-in app currently has no network client or external package dependencies. SwiftLint/Sourcery from Brewfile are not installed or claimed as CI checks.
