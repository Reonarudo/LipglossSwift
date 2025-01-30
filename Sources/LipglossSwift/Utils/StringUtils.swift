// Sources/LipglossSwift/Utils/StringUtils.swift
import Foundation

extension String {
    func toCString() -> UnsafeMutablePointer<CChar>? {
        return strdup(self)
    }
}