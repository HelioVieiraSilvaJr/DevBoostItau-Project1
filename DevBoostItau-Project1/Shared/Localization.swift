//
//  Localization.swift
//  DevBoostItau-Project1
//
//  Created by Gabriel den Hartog on 12/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import Foundation

enum Localization {
    static let seeMyProfile = "SEE_MY_PROFILE".localized
    static let invest = "INVEST".localized
    static let yourMoney = "YOUR_MONEY".localized
    static let signUp = "SIGN_UP".localized
    static let card = "CARD".localized
    static let askForHelp = "ASK_FOR_HELP".localized
    static let speakWithAnAssistant = "SPEAK_WITH_AN_ASSISTANT".localized
    static let everythingAboutYourIti = "EVERYTHING_ABOUT_YOUR_ITI".localized
    static let myWealth = "MY_WEALTH".localized
    static let newInvestment = "NEW_INVESTMENT".localized
    static let editInformation = "EDIT_INFORMATION".localized
    static let quantity = "QUANTITY".localized
    static let purchaseDate = "PURCHASE_DATE".localized
    static let purchasePrice = "PURCHASE_PRICE".localized
    static let quotationPriceToday = "QUOTATION_PRICE_TODAY".localized
    static let valueToday = "VALUE_TODAY".localized
    static let rentabilityObtainedUpToToday = "RENTABILITY_OBTAINED_UP_TO_TODAY".localized
    static let previous = "PREVIOUS".localized
    static let next = "NEXT".localized
    static let delete = "DELETE".localized
    static let edit = "EDIT".localized
    static let save = "SAVE".localized
    static let currentBalance = "CURRENT_BALANCE".localized
    static let percentWallet = "PERCENT_WALLET".localized
    static let fillOutInvestmentTitle = "FILL_OUT_INVESTMENT_TITLE".localized
    static let totalValue = "TOTAL_VALUE".localized
    static let active = "ACTIVE".localized
    static let itiFunds = "ITI_FUNDS".localized
    static let userName = "USERNAME".localized
    static let startDate = "START_DATE".localized
}

extension String {
   var localized: String {
       return NSLocalizedString(self, comment: "")
   }
}
