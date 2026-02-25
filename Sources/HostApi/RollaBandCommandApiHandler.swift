import Foundation

final class RollaBandCommandApiHandler {
    private let rollaBandManager: RollaBandManager

    init(rollaBandManager: RollaBandManager) {
        self.rollaBandManager = rollaBandManager
    }
}

extension RollaBandCommandApiHandler: BandCommandHostAPI {
    func updateUserData(uuid: String, userData: UserData, completion: @escaping (Result<Void, Error>) -> Void) {
        let completionResolver = CompletionResolver(completion)

        Task { [rollaBandManager] in
            do {
                guard let gender = Gender(rawValue: UInt8(userData.gender)) else {
                    throw RollaBandCommandError.invalidData(
                        command: .setUserInfo,
                        reason: .invalidGender(UInt8(userData.gender)),
                        raw: Data()
                    )
                }

                let userInfoModel = UserInfo(
                    gender: gender,
                    age: Int(userData.age),
                    height: Int(userData.height),
                    weight: userData.weight
                )

                try await rollaBandManager.setUserInfo(
                    identifier: uuid,
                    userInfo: userInfoModel
                )

                await MainActor.run {
                    completionResolver.resolve(.success(()))
                }
            } catch {
                await MainActor.run {
                    completionResolver.resolve(.failure(error))
                }
            }
        }
    }
    
    func getUserData(uuid: String, completion: @escaping (Result<UserData, Error>) -> Void) {
        let completionResolver = CompletionResolver(completion)

        Task { [rollaBandManager] in
            do {
                let userInfo = try await rollaBandManager.getUserInfo(identifier: uuid)

                let userData = UserData(
                    age: Int64(userInfo.age),
                    height: Double(userInfo.height),
                    weight: userInfo.weight,
                    gender: Int64(userInfo.gender.rawValue)
                )

                await MainActor.run {
                    completionResolver.resolve(.success(userData))
                }
            } catch {
                await MainActor.run {
                    completionResolver.resolve(.failure(error))
                }
            }
        }
    }
    
    func getFirmwareVersion(uuid: String, completion: @escaping (Result<String, Error>) -> Void) {
        let completionResolver = CompletionResolver(completion)

        Task { [rollaBandManager] in
            do {
                let firmwareVersion = try await rollaBandManager.getFirmwareVersion(identifier: uuid)

                await MainActor.run {
                    completionResolver.resolve(.success(firmwareVersion ?? ""))
                }
            } catch {
                await MainActor.run {
                    completionResolver.resolve(.failure(error))
                }
            }
        }
    }
    
    func getSerialNumber(uuid: String, completion: @escaping (Result<String, Error>) -> Void) {
        let completionResolver = CompletionResolver(completion)

        Task { [rollaBandManager] in
            do {
                let serialNumber = try await rollaBandManager.getSerialNumber(identifier: uuid)

                await MainActor.run {
                    completionResolver.resolve(.success(serialNumber ?? ""))
                }
            } catch {
                await MainActor.run {
                    completionResolver.resolve(.failure(error))
                }
            }
        }
    }
    
    func getBatteryLevel(uuid: String, completion: @escaping (Result<Int64, Error>) -> Void) {
        let completionResolver = CompletionResolver(completion)

        Task { [rollaBandManager] in
            do {
                let batteryLevel = try await rollaBandManager.getBatteryLevel(identifier: uuid)

                await MainActor.run {
                    completionResolver.resolve(.success(Int64(batteryLevel)))
                }
            } catch {
                await MainActor.run {
                    completionResolver.resolve(.failure(error))
                }
            }
        }
    }
}
