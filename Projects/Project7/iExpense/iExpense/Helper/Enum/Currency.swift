//
//  Currency.swift
//  iExpense
//
//  Created by Chintan Maisuriya on 12/05/24.
//

import Foundation


enum Currency: String, Codable, CaseIterable {
    case AED
    case AUD
    case BGN
    case BRL
    case CAD
    case CHF
    case CLP
    case CNY
    case COP
    case CZK
    case DKK
    case EGP
    case EUR
    case GBP
    case HKD
    case HRK
    case HUF
    case IDR
    case ILS
    case INR
    case JPY
    case KRW
    case KZT
    case MXN
    case MYR
    case NGN
    case NOK
    case NZD
    case PEN
    case PKR
    case PHP
    case PLN
    case QAR
    case RON
    case RUB
    case SAR
    case SEK
    case SGD
    case THB
    case TRY
    case TWD
    case TZS
    case USD
    case VND
    case ZAR
    
    var name: String {
        switch self {
        case .AED: return "United Arab Emirates Dirham"
        case .AUD: return "Australian Dollar"
        case .BGN: return "Bulgarian Lev"
        case .BRL: return "Brazilian Real"
        case .CAD: return "Canadian Dollar"
        case .CHF: return "Swiss Franc"
        case .CLP: return "Chilean Peso"
        case .CNY: return "Chinese Yuan"
        case .COP: return "Colombian Peso"
        case .CZK: return "Czech Koruna"
        case .DKK: return "Danish Krone"
        case .EGP: return "Egyptian Pound"
        case .EUR: return "Euro"
        case .GBP: return "Pound Sterling"
        case .HKD: return "Hong Kong Dollar"
        case .HRK: return "Croatian Kuna"
        case .HUF: return "Hungarian Forint"
        case .IDR: return "Indonesian Rupiah"
        case .ILS: return "Israeli New Shekel"
        case .INR: return "Indian Rupee"
        case .JPY: return "Japanese Yen"
        case .KRW: return "Korean Won"
        case .KZT: return "Kazakhstani Tenge"
        case .MXN: return "Mexican Peso"
        case .MYR: return "Malaysian Ringgit"
        case .NGN: return "Nigerian Naira"
        case .NOK: return "Norwegian Krone"
        case .NZD: return "New Zealand Dollar"
        case .PEN: return "Peruvian Sol"
        case .PKR: return "Pakistani Rupee"
        case .PHP: return "Philippine Peso"
        case .PLN: return "Polish Zloty"
        case .QAR: return "Qatari Riyal"
        case .RON: return "Romanian Leu"
        case .RUB: return "Russian Ruble"
        case .SAR: return "Saudi Riyal"
        case .SEK: return "Swedish Krona"
        case .SGD: return "Singapore Dollar"
        case .THB: return "Thai Baht"
        case .TRY: return "Turkish Lira"
        case .TWD: return "New Taiwan Dollar"
        case .TZS: return "Tanzanian Shilling"
        case .USD: return "United States Dollar"
        case .VND: return "Vietnamese Dong"
        case .ZAR: return "South African Rand"
        }
    }
    
    var label: String {
        switch self {
        case .AED: return "Dirham"
        case .AUD: return "Dollar"
        case .BGN: return "Lev"
        case .BRL: return "Real"
        case .CAD: return "Dollar"
        case .CHF: return "Franc"
        case .CLP: return "Peso"
        case .CNY: return "Yuan"
        case .COP: return "Peso"
        case .CZK: return "Koruna"
        case .DKK: return "Krone"
        case .EGP: return "Pound"
        case .EUR: return "Euro"
        case .GBP: return "Pound"
        case .HKD: return "Dollar"
        case .HRK: return "Kuna"
        case .HUF: return "Forint"
        case .IDR: return "Rupiah"
        case .ILS: return "Shekel"
        case .INR: return "Rupee"
        case .JPY: return "Yen"
        case .KRW: return "Won"
        case .KZT: return "Tenge"
        case .MXN: return "Peso"
        case .MYR: return "Ringgit"
        case .NGN: return "Naira"
        case .NOK: return "Krone"
        case .NZD: return "Dollar"
        case .PEN: return "Sol"
        case .PKR: return "Rupee"
        case .PHP: return "Peso"
        case .PLN: return "Zloty"
        case .QAR: return "Riyal"
        case .RON: return "Leu"
        case .RUB: return "Ruble"
        case .SAR: return "Riyal"
        case .SEK: return "Krona"
        case .SGD: return "Dollar"
        case .THB: return "Baht"
        case .TRY: return "Lira"
        case .TWD: return "Dollar"
        case .TZS: return "Shilling"
        case .USD: return "Dollar"
        case .VND: return "Dong"
        case .ZAR: return "Rand"
        }
    }
    
    var symbol: String {
        switch self {
        case .AED: return "د.إ"
        case .AUD: return "A$"
        case .BGN: return "лв"
        case .BRL: return "R$"
        case .CAD: return "C$"
        case .CHF: return "CHF"
        case .CLP: return "CLP$"
        case .CNY: return "¥"
        case .COP: return "COL$"
        case .CZK: return "Kč"
        case .DKK: return "kr"
        case .EGP: return "ج.م"
        case .EUR: return "€"
        case .GBP: return "£"
        case .HKD: return "HK$"
        case .HRK: return "kn"
        case .HUF: return "Ft"
        case .IDR: return "Rp"
        case .ILS: return "₪"
        case .INR: return "₹"
        case .JPY: return "¥"
        case .KRW: return "₩"
        case .KZT: return "₸"
        case .MXN: return "Mex$"
        case .MYR: return "RM"
        case .NGN: return "₦"
        case .NOK: return "kr"
        case .NZD: return "NZ$"
        case .PEN: return "S/"
        case .PKR: return "₨"
        case .PHP: return "₱"
        case .PLN: return "zł"
        case .QAR: return "ر.ق"
        case .RON: return "lei"
        case .RUB: return "₽"
        case .SAR: return "ر.س"
        case .SEK: return "kr"
        case .SGD: return "S$"
        case .THB: return "฿"
        case .TRY: return "₺"
        case .TWD: return "NT$"
        case .TZS: return "TSh"
        case .USD: return "$"
        case .VND: return "₫"
        case .ZAR: return "R"
        }
    }
}
