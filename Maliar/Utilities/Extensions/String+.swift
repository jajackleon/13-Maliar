//
//  Provinces.swift
//  Maliar
//
//  Created by Jackie Leonardy on 19/08/21.
//

import Foundation

extension String {
    func getProvince(id: String) -> String{
        switch id {
        case "reczczWUqMUP9iU16":
            return "ACEH"
        case "recRguE3LhoqW1uAJ":
            return "KALIMANTAN BARAT"
        case "recAzefXMlVbcnUPu":
            return "SUMATERA UTARA"
        case "recFAVgRScpiLnrB1":
            return "SUMATERA BARAT"
        case "reclLbM9XcmqGqFaj":
            return "KEPULAUAN RIAU"
        case "recY0Ep7Ptj4lhiWZ":
            return "JAWA TENGAH"
        case "recaRUw1eikriE9aS":
            return "BALI"
        case "recxI50S63fLHsn7m":
            return "BANTEN"
        case "recVNEoxIASCziibF":
            return "RIAU"
        case "recdjGYUdqlEq1hZl":
            return "LAMPUNG"
            
        case "recj75EuKxuvGDGJq":
            return "MALUKU"
        case "recljjCfKWdQNMJjw":
            return "KALIMANTAN TENGAH"
        case "recQ2KumtH4AHDj6R":
            return "DI YOGYAKARTA"
        case "recRaWYvCVm8Vsoj0":
            return "DKI JAKARTA"
        case "recS2i4Weii8RteMO":
            return "BENGKULU"
        case "recZdYkObwiE359Fs":
            return "JAWA TIMUR"
        case "rec0R2X4HTnxB7UxX":
            return "SULAWESI UTARA"
        case "rec1neeGXji7SvddG":
            return "KALIMANTAN UTARA"
        case "rec2MdDjyzvTrBKng":
            return "SUMATERA SELATAN"
        case "rec3Ojk1lWCVPVOBv":
            return "NUSA TENGGARA BARAT"
            
        case "rec4U6G0HKp2QaWZR":
            return "MALUKU UTARA"
        case "rec85J8X1pNY8yaJ3":
            return "KALIMANTAN SELATAN"
        case "recoc6n3TQad6STRw":
            return "SULAWESI BARAT"
        case "recpGnvmM5lcHpQhT":
            return "PAPUA"
        case "recpkgXJvnfraCmZ8":
            return "SULAWESI TENGGARA"
        case "recqzNQ0bKtLS5Oee":
            return "KALIMANTAN TIMUR"
        case "recuCgcAJowFvI7yK":
            return "SULAWESI SELATAN"
        case "recuSUVyrAPFGnRWV":
            return "KEPULAUAN BANGKA BELITUNG"
        case "recvSxnYwxgO1LSUM":
            return "JAMBI"
        case "reczPeoRadIF3LfDP":
            return "PAPUA BARAT"
            
        case "recC3oTeBFVOrFy2f":
            return "NUSA TENGGARA TIMUR"
        case "recGX8TfZjy8LLk1k":
            return "SULAWESI TENGAH"
        case "recGYW5DD9LpYmBuB":
            return "JAWA BARAT"
        case "recKj5oO4KHpg1dJR":
            return "GORONTALO"
            
        default:
            return "Not Represented on Database"
        }
    }
    
    func convertProvinceID(province: String) -> String {
        switch province {
            case "ACEH":
                return "reczczWUqMUP9iU16"
            case "KALIMANTAN BARAT":
                return "recRguE3LhoqW1uAJ"
            case "SUMATERA UTARA":
                return "recAzefXMlVbcnUPu"
            case "SUMATERA BARAT":
                return "recFAVgRScpiLnrB1"
            case "KEPULAUAN RIAU":
                return "reclLbM9XcmqGqFaj"
            case "JAWA TENGAH":
                return "recY0Ep7Ptj4lhiWZ"
            case "BALI":
                return "recaRUw1eikriE9aS"
            case "BANTEN":
                return "recxI50S63fLHsn7m"
            case "RIAU":
                return "recVNEoxIASCziibF"
            case "LAMPUNG":
                return "recdjGYUdqlEq1hZl"
                
            case "MALUKU":
                return "recj75EuKxuvGDGJq"
            case "KALIMANTAN TENGAH":
                return "recljjCfKWdQNMJjw"
            case "DI YOGYAKARTA":
                return "recQ2KumtH4AHDj6R"
            case "DKI JAKARTA":
                return "recRaWYvCVm8Vsoj0"
            case "BENGKULU":
                return "recS2i4Weii8RteMO"
            case "JAWA TIMUR":
                return "recZdYkObwiE359Fs"
            case "SULAWESI UTARA":
                return "rec0R2X4HTnxB7UxX"
            case "KALIMANTAN UTARA":
                return "rec1neeGXji7SvddG"
            case "SUMATERA SELATAN":
                return "rec2MdDjyzvTrBKng"
            case "NUSA TENGGARA BARAT":
                return "rec3Ojk1lWCVPVOBv"
                
            case "MALUKU UTARA":
                return "rec4U6G0HKp2QaWZR"
            case "KALIMANTAN SELATAN":
                return "rec85J8X1pNY8yaJ3"
            case "SULAWESI BARAT":
                return "recoc6n3TQad6STRw"
            case "PAPUA":
                return "recpGnvmM5lcHpQhT"
            case "SULAWESI TENGGARA":
                return "recpkgXJvnfraCmZ8"
            case "KALIMANTAN TIMUR":
                return "recqzNQ0bKtLS5OeeR"
            case "SULAWESI SELATAN":
                return "recuCgcAJowFvI7yK"
            case "KEPULAUAN BANGKA BELITUNG":
                return "recuSUVyrAPFGnRWV"
            case "JAMBI":
                return "recvSxnYwxgO1LSUM"
            case "PAPUA BARAT":
                return "reczPeoRadIF3LfDP"
                
            case "NUSA TENGGARA TIMUR":
                return "recC3oTeBFVOrFy2f"
            case "SULAWESI TENGAH":
                return "recGX8TfZjy8LLk1k"
            case "JAWA BARAT":
                return "recGYW5DD9LpYmBuB"
            case "GORONTALO":
                return "recKj5oO4KHpg1dJR"
                
            default:
                return "Not Represented on Database"
            }
        }
    }

