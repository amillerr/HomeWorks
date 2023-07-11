// 1. Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет
import Foundation

func bankAccount(initialSum: Double, period: Double, percentage: Double) -> Int {
    var newSum = initialSum * pow((1 + percentage / 100), period)
    return Int(newSum)
}
bankAccount(initialSum: 20, period: 5, percentage: 5)

//2. Найти факториал числа N

func factorial1(_ number: Int) -> Int {
    var fact = 1
    for i in 1...number {
        fact = fact * i
    }
    return fact
}

factorial1(6)

func factorial2(_ number: Int) -> Int {
    if number == 0 {
        return 1
    } else  {
        return number * factorial2(number - 1)
    }
}

factorial2(6)

//3. Написать функцию, которая определяет, четное число или нет.

func division1(_ number: Int) -> String {
  return number % 2 == 0 ? "Четное" : "Не четное"
}

division1(10)


//4. Написать функцию, которая определяет, делится ли число без остатка на 3.

func division2(_ number: Int) -> String {
  return number % 3 == 0 ? "Делится" : "Не делится"
}

division2(434)
