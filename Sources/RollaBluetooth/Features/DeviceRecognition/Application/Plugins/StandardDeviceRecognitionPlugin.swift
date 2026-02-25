import Foundation

final class StandardDeviceRecognitionPlugin: DeviceRecognitionPlugin {

    let name = "StandardDeviceRecognition"

    let signatures: [DeviceSignature]

    init() {
        self.signatures = [
            HRSignature(),
            RSCSignature()
        ]
    }
}
