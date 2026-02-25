import Foundation

public struct RawLogsFormatter: Sendable {
    
    public init() {}
    
    public func formatSection(
        header: String,
        content: Result<String, Error>
    ) -> String {
        var lines: [String] = []
        lines.append("=== \(header) ===")
        
        switch content {
        case .success(let data):
            lines.append(data.isEmpty ? "(no data)" : data)
        case .failure(let error):
            lines.append("(error: \(error.localizedDescription))")
        }
        
        lines.append("")
        return lines.joined(separator: "\n")
    }
    
    public func formatUserProfile(_ userInfo: UserInfo) -> String {
        var lines: [String] = []
        lines.append("=== USER PROFILE ===")
        lines.append("Gender: \(userInfo.gender.displayName)")
        lines.append("Age: \(userInfo.age)")
        lines.append("Height: \(userInfo.height) cm")
        lines.append("Weight: \(String(format: "%.1f", userInfo.weight)) kg")
        lines.append("")
        return lines.joined(separator: "\n")
    }
    
    public func formatUserProfileError(_ error: Error) -> String {
        var lines: [String] = []
        lines.append("=== USER PROFILE ===")
        lines.append("(error: \(error.localizedDescription))")
        lines.append("")
        return lines.joined(separator: "\n")
    }
}

