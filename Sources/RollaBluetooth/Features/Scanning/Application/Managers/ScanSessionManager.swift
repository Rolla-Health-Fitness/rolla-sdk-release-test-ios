import Foundation

actor ScanSessionManager: ScanSessionManaging {
    private let centralManager: CoreBLECentralManaging
    private var activeSession: ScanSession?
    private var isPhysicallyScanning = false
    
    private let logger: Logging
    private let logCategory: LogCategory = .scanning

    init(
        centralManager: CoreBLECentralManaging,
        logger: Logging
    ) {
        self.centralManager = centralManager
        self.logger = logger
    }
    
    func startSession(_ session: ScanSession) async throws {
        if let existingSession = activeSession {
            logger.info(
                "Replacing existing session from '\(existingSession.owner)' with new session from '\(session.owner)'",
                category: logCategory
            )
            await stopAllSessions()
        }

        let isAlreadyScanning = await centralManager.isScanning()
        if isAlreadyScanning {
            logger.warning(
                "Detected external scanning after stopping our session. Attempting to start anyway.",
                category: logCategory
            )
            throw ScanningError.alreadyScanning(sessionOwner: "External (Core Bluetooth)")
        }

        activeSession = session
        try await startPhysicalScanning()

        logger.success("Started scan session for '\(session.owner)'", category: logCategory)
    }

    func stopSession(_ sessionId: UUID) async throws {
        guard let activeSession = activeSession else {
            throw ScanningError.noActiveSession
        }

        guard activeSession.id == sessionId else {
            throw ScanningError.sessionNotFound(sessionId)
        }

        await stopAllSessions()
        logger.info("Stopped scan session \(sessionId)", category: logCategory)
    }

    func stopAllSessions() async {
        if let session = activeSession {
            logger.info("Stopping scan session for '\(session.owner)'", category: logCategory)
        }

        centralManager.stopScanning()
        activeSession = nil
        isPhysicallyScanning = false
        logger.debug("Physical scanning stopped", category: logCategory)
    }
    
    func isScanning() async -> Bool {
        return isPhysicallyScanning
    }
    
    func hasSession(_ sessionId: UUID) async -> Bool {
        return activeSession?.id == sessionId
    }
    
    func getActiveSession() async -> ScanSession? {
        return activeSession
    }
    
    func getActiveSessionOwner() async -> String? {
        return activeSession?.owner
    }
    
    func scanResultsStream() async -> AsyncStream<ScanResult> {
        await centralManager.scanResultsStream()
    }
    
    func getActiveSessions() async -> [ScanSession] {
        return activeSession.map { [$0] } ?? []
    }
    
    func getActiveSessionCount() async -> Int {
        return activeSession != nil ? 1 : 0
    }
    
    func canStartNewSession() async -> Bool {
        return true // Always can start - will stop existing session for now
    }
    
    func startScanningSession(_ session: ScanSession) async throws -> AsyncStream<ScanResult> {
        try await startSession(session)
        return await scanResultsStream()
    }
    
    private func startPhysicalScanning() async throws {
        guard let session = activeSession else {
            throw ScanningError.noActiveSession
        }

        guard !isPhysicallyScanning else {
            logger.debug("Physical scanning already active", category: logCategory)
            return
        }

        let scanOptions = ScanOptions(
            allowDuplicates: false,
            serviceUUIDs: session.filters.serviceTypes?.compactMap({ $0.uuid })
        )

        do {
            try await centralManager.startScanning(options: scanOptions)
            isPhysicallyScanning = true
            logger.info(
                "Physical scanning started - Owner: '\(session.owner)', Services: \(scanOptions.serviceUUIDs?.count ?? 0), Duplicates: \(scanOptions.allowDuplicates)",
                category: logCategory
            )
        } catch {
            activeSession = nil
            isPhysicallyScanning = false
            logger.failure("Failed to start physical scanning: \(error.localizedDescription)", category: logCategory)
            throw error
        }
    }
}


