import Foundation
import HealthKit

public enum AHWorkoutActivityType: String, CaseIterable, Sendable {
    case running
    case walking
    case cycling
    case hiking
    case swimming
    case yoga
    case strength
    case hiit
    case dance
    case badminton
    case basketball
    case football
    case tennis
    case cricket
    case volleyball
    case tableTennis
    case jumpRope
    case meditation
    case pilates
    case elliptical
    case rowing
    case stairClimber
    case boxing
    case kickboxing
    case martialArts
    case handball
    case hockey
    case baseball
    case rugby
    case surfing
    case paddleSports
    case downhillSkiing
    case snowboarding
    case crossCountrySkiing
    case skatingSports
    case golf
    case crossTraining
    case coreTraining
    case waterPolo
    case stretching
    case waterFitness
    case americanFootball
    case lacrosse
    case archery
    case bowling
    case fishing
    case hunting
    case gymnastics
    case pickleball
    case squash
    case discSports
    case equestrianSports
    case wheelchair
    case underwaterDiving
    case climbing
    case wrestling
    case barre
    case trackAndField
    case mixedCardio
    case fitnessGaming
    case sailing
    case other
    
    public init(from hkType: HKWorkoutActivityType) {
        // Underwater diving arrived in iOS 17, later than the deployment
        // target, so the switch below cannot name it.
        if #available(iOS 17.0, *), hkType == .underwaterDiving {
            self = .underwaterDiving
            return
        }
        switch hkType {
        case .running: self = .running
        case .walking: self = .walking
        case .cycling: self = .cycling
        case .hiking: self = .hiking
        case .swimming: self = .swimming
        case .yoga: self = .yoga
        case .traditionalStrengthTraining, .functionalStrengthTraining: self = .strength
        case .highIntensityIntervalTraining: self = .hiit
        case .dance, .socialDance, .cardioDance: self = .dance
        case .badminton: self = .badminton
        case .basketball: self = .basketball
        case .soccer: self = .football
        case .americanFootball, .australianFootball: self = .americanFootball
        case .tennis: self = .tennis
        case .cricket: self = .cricket
        case .volleyball: self = .volleyball
        case .tableTennis: self = .tableTennis
        case .jumpRope: self = .jumpRope
        case .mindAndBody: self = .meditation
        case .pilates: self = .pilates
        case .elliptical: self = .elliptical
        case .rowing: self = .rowing
        case .stairClimbing, .stepTraining, .stairs: self = .stairClimber
        case .boxing: self = .boxing
        case .kickboxing: self = .kickboxing
        case .martialArts: self = .martialArts
        case .handball: self = .handball
        case .hockey: self = .hockey
        case .baseball, .softball: self = .baseball
        case .rugby: self = .rugby
        case .surfingSports: self = .surfing
        case .sailing: self = .sailing
        case .paddleSports: self = .paddleSports
        case .downhillSkiing: self = .downhillSkiing
        case .snowboarding: self = .snowboarding
        case .crossCountrySkiing: self = .crossCountrySkiing
        case .skatingSports: self = .skatingSports
        case .golf: self = .golf
        case .crossTraining: self = .crossTraining
        case .coreTraining: self = .coreTraining
        case .waterPolo: self = .waterPolo
        case .flexibility, .cooldown: self = .stretching
        case .waterFitness: self = .waterFitness
        case .lacrosse: self = .lacrosse
        case .archery: self = .archery
        case .bowling: self = .bowling
        case .fishing: self = .fishing
        case .hunting: self = .hunting
        case .gymnastics: self = .gymnastics
        case .squash, .racquetball: self = .squash
        case .discSports: self = .discSports
        case .equestrianSports: self = .equestrianSports
        case .wheelchairWalkPace, .wheelchairRunPace: self = .wheelchair
        case .pickleball: self = .pickleball
        case .climbing: self = .climbing
        case .wrestling: self = .wrestling
        case .barre: self = .barre
        case .trackAndField: self = .trackAndField
        case .mixedCardio: self = .mixedCardio
        case .fitnessGaming: self = .fitnessGaming
        case .preparationAndRecovery: self = .stretching
        default: self = .other
        }
    }
}

