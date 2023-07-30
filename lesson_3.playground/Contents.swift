import Foundation


//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//2. Описать пару его наследников TrunkCar и SportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет TrunkCar, а какие – SportСar. Добавить эти действия в перечисление.
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

enum CarAction {
    case engineStart
    case engineStop
    case windowsOpen
    case windowsClose
    case trunkLoad
    case trunkUnload
    case nitroOn
    case nitroOff
}

class Car {
    var brand: String
    var carColor: String
    var realiseDate: Int
    var isEngineStart: Bool = false
    var isWindowsClose: Bool = false
    
    init(brand: String, carColor: String, realiseDate: Int) {
        self.brand = brand
        self.carColor = carColor
        self.realiseDate = realiseDate
    }

    func doAction(action: CarAction) {
        switch action {
        case .engineStart:
            isEngineStart = true
            print("Двигатель \(brand) запущен")
        case .engineStop:
            isEngineStart = false
            print("Двигатель \(brand) заглушен")
        case .windowsOpen:
            isWindowsClose = true
            print("Окна \(brand) открыты")
        case .windowsClose:
            isWindowsClose = false
            print("Окна \(brand) закрыты")
        default:
            return
        }
    }
}

class trunkCar: Car {
    var trunkVolume: Int
    var trunkUsedPlace: Int = 0
    
    init(volume: Int, brand: String, carColor: String, realiseDate: Int) {
        trunkVolume = volume
        super.init(brand: brand, carColor: carColor, realiseDate: realiseDate)
    }
    
    override func doAction(action: CarAction) {
        super.doAction(action: action)
        
        switch action {
        case .trunkLoad:
            trunkUsedPlace = min(trunkUsedPlace + 1, trunkVolume)
            print(trunkUsedPlace)
        case .trunkUnload:
            trunkUsedPlace = max(trunkUsedPlace - 1, 0)
            print(trunkUsedPlace)
        default:
            return
        }
    }
}

class sportCar: Car {
    var isNitroOn: Bool = false
    
    override func doAction(action: CarAction) {
        super.doAction(action: action)
        
        switch action {
        case .nitroOn:
            isNitroOn = true
            print("Ускорение включено, держи руль")
        case .nitroOff:
            isNitroOn = false
            print("Ускорение закончилось, расслабься")
        default:
            return
        }
    }
}


let gruzovik = trunkCar(volume: 20, brand: "Scania", carColor: "черный", realiseDate: 2018)
gruzovik.doAction(action: .trunkLoad)
gruzovik.doAction(action: .trunkUnload)
let porsche = sportCar(brand: "porsche", carColor: "белый", realiseDate: 2022)
porsche.doAction(action: .engineStart)
print(porsche.isEngineStart)
