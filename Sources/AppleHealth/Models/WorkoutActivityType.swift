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
    case other
    
    public init(from hkType: HKWorkoutActivityType) {
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
        case .soccer, .americanFootball, .australianFootball: self = .football
        case .tennis: self = .tennis
        case .cricket: self = .cricket
        case .volleyball: self = .volleyball
        case .tableTennis: self = .tableTennis
        case .jumpRope: self = .jumpRope
        case .mindAndBody: self = .meditation
        case .pilates: self = .pilates
        case .elliptical: self = .elliptical
        case .rowing: self = .rowing
        case .stairClimbing, .stepTraining: self = .stairClimber
        case .boxing: self = .boxing
        case .kickboxing: self = .kickboxing
        case .martialArts: self = .martialArts
        case .handball: self = .handball
        case .hockey: self = .hockey
        case .baseball, .softball: self = .baseball
        case .rugby: self = .rugby
        case .surfingSports: self = .surfing
        case .paddleSports: self = .paddleSports
        case .downhillSkiing: self = .downhillSkiing
        case .snowboarding: self = .snowboarding
        case .crossCountrySkiing: self = .crossCountrySkiing
        case .skatingSports: self = .skatingSports
        case .golf: self = .golf
        case .crossTraining: self = .crossTraining
        case .coreTraining: self = .coreTraining
        case .waterPolo: self = .waterPolo
        case .flexibility: self = .stretching
        case .waterFitness: self = .waterFitness
        default: self = .other
        }
    }
}

