# _OOPs_

## _Class_

A class is a user-defined blueprint or prototype from which objects are created. It represents the set of properties or
methods that are common to all objects of one type.

* It provides the template for creating objects.
* It binds together the data and the functions that operate on the data.
* It supports the inheritance property of Object-Oriented Programming and hence can maintain the class hierarchy.
* It helps in maintaining the access specifications of member variables.

## _Object_

* An object is a basic unit of Object-Oriented Programming.
* It represents real-life entities.

## _Constructor_

### 1. Default Constructor:

* When creating an object, it provides a brand new object with default values.
* There can be only one default constructor in a class.
* It is created by the compiler if the class does not have any constructor.

### 2. Parameterized Constructor:

* Parameters are used to initialize the object while creating it.
* There can be multiple parameterized constructors in a class, but the parameters must be different.
* If any parameterized constructor is present in the class, then the default constructor is not created by the compiler.

### 3. Private Constructor:

* When a class is initialized with a private constructor, it cannot be instantiated.

## _Components of OOP_

### 1. Abstraction

* Data abstraction is the process of hiding certain details and showing only essential information to the user.
* Abstraction can be achieved with either abstract classes or interfaces.

### 2. Encapsulation

* Encapsulation involves grouping data (fields) and methods (functions) that operate on that data into a single unit,
  typically a class.
* Encapsulation also hides the internal details and only exposes the necessary parts of the class.
* Private variables are hidden from the outside world; other parts of the program cannot directly access or modify these
  private fields. Access is controlled through public methods (getters and setters) to ensure safe interaction with the
  object's data.

### 3. Inheritance

* The mechanism by which one class acquires the properties and behavior of another class.
* An instance of a child class can access all the public and protected members of the parent class.
  <br></br>
* **_SUPER_CLASS_ = _PARENT_CLASS_ = _BASE_CLASS_**
* **_SUB_CLASS_ = _CHILD_CLASS_ = _DERIVED_CLASS_**

#### Types of Inheritance

1. **Single Inheritance:** A class inherits from only one class.
2. **Multilevel Inheritance:** A class inherits from a class which, in turn, inherits from another class.
3. **Hierarchical Inheritance:** More than one class inherits from a single class.
4. **Hybrid Inheritance:** A combination of two or more types of inheritance.
5. **Multiple Inheritance:**
    * A class inherits from more than one class.
    * It is not supported in Java using classes.
    * **`Reason:`** If a class inherits from two parent classes that both have a method with the same signature, the
      child class will have ambiguity about which method to use when it calls the method.
    * It can be achieved with interfaces because a class can implement multiple interfaces. Interface methods are not
      implemented in the interface; they are implemented in the class that implements the interface.

### 4. Polymorphism

* The ability of a function to have or be displayed in more than one form.
* **`RunTime Polymorphism:`** Achieved when a method in a child class overrides a method in its superclass.
* **`CompileTime Polymorphism:`** Achieved when two methods have the same name but different parameters.

# _Interface_

* An interface is a completely `abstract class` that is used to group related methods with empty bodies.
* Like abstract classes, interfaces cannot be used to create objects.
* Interface methods do not have a body - the body is provided by the `implement` class.
* On implementation of an interface, you must override all of its methods.
* Interface methods are by `default abstract` and `public`.
* Interface attributes are by `default public, static and final`.
* An interface cannot contain a constructor (as it cannot be used to create objects).
* It can be achieved with interfaces, because the class can implement multiple interfaces

### Multiple Inheritance in Java

```java
interface FirstInterface {
    public void myMethod(); // interface method
}

interface SecondInterface {
    /* Note: the Method name should not be same as the other interface method .
    Since this implemented by the same class will cause compilation error. */
    public void myOtherMethod(); // interface method 2 
}

class DemoClass implements FirstInterface, SecondInterface {
    public void myMethod() {
        System.out.println("Some text..");
    }

    public void myOtherMethod() {
        System.out.println("Some other text...");
    }
}

class Main {
    public static void main(String[] args) {
        DemoClass myObj = new DemoClass();
        myObj.myMethod();
        myObj.myOtherMethod();
    }
}
```

# _Abstract_

## Abstract method:

* can only be used in an abstract class, and it does not have a body.
* The body is provided by the subclass .

## Abstract class:

* Cannot be instantiated directly.
* Must be inherited by another class.
* Can have both abstract and concrete methods.
* Requires concrete subclasses to implement abstract methods.
* Can have constructors and static methods.
* Can have public, protected, and private access specifiers for its members.
* Can be a `partially completed` class.
* Can implement interfaces but is not required to implement all of their methods; remaining methods must be implemented
  by concrete subclasses.

# _Enum_

* An enum is just like a class, have attributes and methods.
* The only difference is that enum constants are `public, static and final` (unchangeable - cannot be overridden).
* An enum cannot be used to create objects, and it cannot extend other classes (but it can implement interfaces).
* Used enums when you have values that you know aren't going to change, like month days, days, colors, etc.

```java
public enum ErrorCode {
    MONDAY("MONDAY"),
    TUESDAY("TUESDAY");
}
```

