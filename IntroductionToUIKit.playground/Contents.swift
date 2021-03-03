import UIKit

class Person
{
  let name: String
    
  init(name: String)
  {
    self.name = name
  }
}

class Student: Person
{
  var favoriteSubject: String
    
  init(name: String, favoriteSubject: String)
  {
        self.favoriteSubject = favoriteSubject
        super.init(name: name)
  }
    
    func description() -> String
    {
        "\(name)'s favorite subject is \(favoriteSubject)."
    }
}

let student = Student(name: "Fred Javalera", favoriteSubject: "Math")
print(student.description())

let person = Person(name: "Tasha Javalera")
print(person.name)

class Human
{
	let name: String
	var age: Int
	let homeTown: String
	
	init(name: String, age: Int, homeTown: String)
	{
		self.age = age
		self.name = name
		self.homeTown = homeTown
	}
}

var fred = Human(name: "Fred", age: 39, homeTown: "Salt Lake City")

fred.age += 1

print(fred.age)

class Human2
{
	let name: String
	var age: Int
	let homeTown: String
	
	init()
	{
		name = "default"
		age = 0
		homeTown = "default"
	}
}

var human = Human2()

print(human.age)
