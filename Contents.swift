
import Foundation

// MARK: 1. Перелік типів ноутбуків

enum LaptopType {
    case ultrabook
    case gaming
    case business

    // Повертає назву типу українською мовою
    var title: String {
        switch self {
        case .ultrabook:
            return "Ультрабук"
        case .gaming:
            return "Ігровий ноутбук"
        case .business:
            return "Бізнес-ноутбук"
        }
    }
}

// MARK: 2. Структура Laptop

struct Laptop {
    var model: String
    var manufacturer: String
    var releaseYear: Int?
    var memoryGB: Int?
    var type: LaptopType

    // Метод для формування опису ноутбука
    func describe() -> String {
        var yearText = "Не вказано"
        var memoryText = "Не вказано"

        // Перевіряємо наявність року випуску
        if let year = releaseYear {
            yearText = String(year)
        }

        // Перевіряємо наявність обсягу пам'яті
        if let memory = memoryGB {
            memoryText = "\(memory) ГБ"
        }

        return """
        Модель: \(model)
        Виробник: \(manufacturer)
        Рік випуску: \(yearText)
        Обсяг пам'яті: \(memoryText)
        Тип: \(type.title)
        """
    }
}

// MARK: 3. Клас із методом опису ноутбука

class LaptopManager {
    class func describeLaptop(laptop: Laptop) -> String {
        return laptop.describe()
    }
}

// MARK: 4. Клас User

class User {
    var name: String
    var laptop: Laptop?

    init(name: String, laptop: Laptop? = nil) {
        self.name = name
        self.laptop = laptop
    }

    // Виводить інформацію про ноутбук користувача
    func showLaptopInfo() {
        print("\nКористувач: \(name)")

        // Якщо ноутбука немає, використовуємо запасний текст
        let modelName = laptop?.model ?? "Ноутбук відсутній"
        print("Модель ноутбука: \(modelName)")

        // Перевіряємо, чи є ноутбук
        if let laptop = laptop {
            print(laptop.describe())
        } else {
            print("У користувача немає ноутбука.")
        }
    }
}

// MARK: 5. Глобальна функція опису ноутбука

func describeLaptop(laptop: Laptop) -> String {
    return laptop.describe()
}

// MARK: 6. Створення масиву ноутбуків

let laptops: [Laptop] = [
    Laptop(
        model: "MacBook Air",
        manufacturer: "Apple",
        releaseYear: 2024,
        memoryGB: 16,
        type: .ultrabook
    ),
    Laptop(
        model: "ROG Strix",
        manufacturer: "ASUS",
        releaseYear: nil,
        memoryGB: 32,
        type: .gaming
    ),
    Laptop(
        model: "ThinkPad T14",
        manufacturer: "Lenovo",
        releaseYear: 2023,
        memoryGB: nil,
        type: .business
    )
]

// MARK: 7. Виведення інформації про ноутбуки

print("=== СПИСОК НОУТБУКІВ ===")

for (index, laptop) in laptops.enumerated() {
    print("\nНоутбук №\(index + 1)")
    print(describeLaptop(laptop: laptop))
    print("--------------------")
}

// Перевіряємо метод класу
print("\n=== МЕТОД КЛАСУ ===")
print(LaptopManager.describeLaptop(laptop: laptops[0]))

// Перевіряємо метод структури
print("\n=== МЕТОД СТРУКТУРИ ===")
print(laptops[0].describe())

// MARK: 8. Копіювання структури

print("\n=== КОПІЮВАННЯ СТРУКТУРИ ===")

let originalLaptop = laptops[0]
var copiedLaptop = originalLaptop

// Змінюємо модель лише в копії
copiedLaptop.model = "MacBook Pro"

print("Оригінал: \(originalLaptop.model)")
print("Копія: \(copiedLaptop.model)")

// MARK: 9. Перевірка класу User

let userWithLaptop = User(
    name: "Олексій",
    laptop: laptops[0]
)

let userWithoutLaptop = User(name: "Марія")

print("\n=== ІНФОРМАЦІЯ ПРО КОРИСТУВАЧІВ ===")
userWithLaptop.showLaptopInfo()
userWithoutLaptop.showLaptopInfo()
