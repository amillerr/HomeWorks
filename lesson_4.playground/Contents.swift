import Foundation

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//3. Создать два класса, имплементирующих протокол «Car»: trunkCar и sportCar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//4. Для каждого класса написать расширение, имплементирующее протокол «CustomStringConvertible».
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести сами объекты в консоль.

//MARK: Color of cars
enum Color: String {
    case white = "белый", red = "красный", blue = "синий", black = "черный", yellow = "желтый"
}

//MARK: Car actions
enum EngineAction {
    case start
    case stop
}

enum WindowsAction {
    case open
    case close
}

//MARK: Main Protocol
protocol Car {
    var brand: String { get set }
    var realiseYear: Int { get set }
    var color: Color { get set }
    
    func turnLight()
}

extension Car {
    func engineAction(action: EngineAction) {
        switch action {
        case .start:
            print("Двигатель \(brand) запущен")
        case .stop:
            print("Двигатель \(brand) заглушен")
        }
    }
    
    func windowsAction(action: WindowsAction) {
        switch action {
        case .open:
            print("Окна \(brand) открыты")
        case .close:
            print("Окна \(brand) закрыты")
        }
    }
    
    func turnLight() {
        print("Функция внутри протокола через расширение")
    }
}

//MARK: Class TrunkCar
class TrunkCar: Car {
    
    enum HaveTrailer: String {
        case yes = "с прицепом"
        case no = "без прицепа"
    }
    
    var brand: String
    var realiseYear: Int
    var color: Color
    
    var isHaveTrailer: HaveTrailer
    
    init(brand: String, realiseYear: Int, color: Color, isHaveTrailer: HaveTrailer) {
        self.brand = brand
        self.realiseYear = realiseYear
        self.color = color
        self.isHaveTrailer = isHaveTrailer
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Грузовик \(self.brand) с цветом \(self.color.rawValue) вышел на линию \(self.isHaveTrailer.rawValue)"
    }
}

class SportCar: Car {
    
    enum HaveSpoiler: String {
        case yes = "со спойлером"
        case no = "без спойлера"
    }
    
    var brand: String
    var realiseYear: Int
    var color: Color
    
    var isHaveSpoiler: HaveSpoiler
    
    init(brand: String, realiseYear: Int, color: Color, isHaveSpoiler: HaveSpoiler) {
        self.brand = brand
        self.realiseYear = realiseYear
        self.color = color
        self.isHaveSpoiler = isHaveSpoiler
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
         return "Спорткар \(self.brand) с цветом \(self.color.rawValue) вышел на гонку \(self.isHaveSpoiler.rawValue)"
    }
}

let trunk = TrunkCar(brand: "Scania", realiseYear: 2018, color: .black, isHaveTrailer: .yes)
print(trunk)
let sport = SportCar(brand: "Porsche", realiseYear: 2020, color: .yellow, isHaveSpoiler: .no)
print(sport)
