import Foundation

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. *Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
//
//1. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//2. Разработать замыкание выполняющее сортировку массива схожий с методом высшего порядка sort

struct Stack<T> {
    private var elements = [T]()
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.popLast()
    }
    
    subscript(index: Int) -> T? {
        guard index < elements.count, index >= 0 else { return nil }
        return elements[index]
    }
    
    mutating func filter(_ isIncluded: (T) -> Bool) {
            elements = elements.filter(isIncluded)
        }
}

var stack = Stack<Int>()
stack.push(23)
stack.push(32)
stack.push(34)
stack.push(67)
stack.push(39)
print(stack)
stack.pop()
print(stack[6] as Any)

stack.filter { $0 % 2 == 0 }
print(stack)
