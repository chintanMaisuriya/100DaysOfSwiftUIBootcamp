import UIKit

class Animal {
    var legs: Int

    init(legs: Int) {
        self.legs = max(legs, 0)
    }
}

//MARK: - Dogs

class Dog: Animal {
    func speak() {
        print("Dog barking!")
    }
}

class Corgi: Dog {
    override func speak() {
        print("Corgi barking!")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Poodle barking!")
    }
}

let poodleDog = Poodle(legs: 4)
poodleDog.speak()


//MARK: - Cats

class Cat: Animal {
    var isTame: Bool

    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }

    func speak() {
        print("Cat sounding!")
    }
}

class Persian: Cat {
    override func speak() {
        print("Persian sounding!")
    }
}

class Lion: Cat {
    override func speak() {
        print("Lion sounding!")
    }
}

let lionCat = Lion(isTame: false)
lionCat.speak()
