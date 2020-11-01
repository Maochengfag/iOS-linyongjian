//
//  InternalMenuFeatureToggleItemViewModel.swift
//  Moments
//
//  Created by Jake Lin on 31/10/20.
//

import Foundation

class InternalMenuFeatureToggleItemViewModel: InternalMenuItemViewModel {
    var type: InternalMenuItemType {
        .featureToggle
    }

    var title: String { fatalError(L10n.Development.fatalErrorSubclassToImplement) }
    var on: Bool { false }

    // swiftlint:disable unavailable_function
    func toggleOn() { fatalError(L10n.Development.fatalErrorSubclassToImplement) }
    func toggleOff() { fatalError(L10n.Development.fatalErrorSubclassToImplement) }
    func select() { }
}

// swiftlint:disable type_name
final class InternalMenuLikeButtonToggleItemViewModel: InternalMenuFeatureToggleItemViewModel {
    private let toggleDataStore: TogglesDataStoreType
    private var isOn: Bool

    override var title: String {
        return L10n.InternalMenu.likeButtonForMomentEnabled
    }

    override var on: Bool {
       return isOn
    }

    init(toggleDataStore: TogglesDataStoreType) {
        self.toggleDataStore = toggleDataStore
        self.isOn = toggleDataStore.isToggleOn(.isLikeButtonForMomentEnabled)
    }

    override func toggleOn() {
        toggleDataStore.update(toggle: .isLikeButtonForMomentEnabled, value: true)
    }

    override func toggleOff() {
        toggleDataStore.update(toggle: .isLikeButtonForMomentEnabled, value: false)
    }
}
