# _OOPs_

## _Class_

A class is a user-defined blueprint or prototype from which objects are created. It represents the set of properties or
methods that are common to all objects of one type.

* It provides the template for creating objects.
* It binds together the data and the functions that operate on the
  data.
* It supports the inheritance property of Object Oriented Programming and hence can maintain the class hierarchy.
* It helps in maintaining the access specifications of member variables.

## _Object_

* An object is an basic unit of Object Oriented Programming.
* It represents the real-life entities.

## _Constructor_

### 1. Default Constructor:

* While creating an object it gives an brand new object with default values.
* There can be only one default constructor in a class.
* It is created by the compiler if the class does not have any constructor.

### 2. Parameterized Constructor:

* The parameters are used to initialize the object while creating it.
* There can be multiple parameterized constructors in a class but the parameters must be different.
* If any parameterized constructor is present in the class, then the default constructor is not created by the compiler.

### 3. Private Constructor:

* When an class is initialized with a private constructor, it cannot be instantiated.

## _Components of OOP_

### 1. Abstraction

* Data abstraction is the process of hiding certain details and showing only essential information to the user.
* Abstraction can be achieved with either abstract classes or interfaces.

### 2. Encapsulation

- Encapsulation involves grouping data (fields) and methods (functions) that operate on that data into a single unit,
  typically a class.
- Encapsulation also hides the internal details and only exposes necessary parts of the class.
- Private variables are hidden from the outside world, other parts of the program cannot directly access or modify
  these private fields. Access is controlled through public methods `(Controller Access)` (getters and setters) to
  ensure safe interaction with the object's data.

### 3. Inheritance

* The Mechanism by which one class acquires the properties and behavior of another class.
* The instance of an child class can access all the public and protected members of the parent class.
  <br></br>
* **_SUPER_CLASS_ = _PARENT_CLASS_ = _BASE_CLASS_**
* **_SUB_CLASS_ = __CHILD_CLASS__ = _DERIVED_CLASS_**

#### Types of Inheritance

1. **Single Inheritance:** A class inherits from only one class.
2. **Multilevel Inheritance:** A class inherits from a class which in turn inherits from another class.
3. **Hierarchical Inheritance:** More than one class inherits from a single class.
4. Hybrid Inheritance: A combination of two or more types of inheritance.
5. **Multiple Inheritance:**
    * A class inherits from more than one class.
    * It is not supported in Java using class.
    * **`Reason:`** If a class inherits from two parent classes that both have a method with the same signature, the
      child class will have ambiguity about which method to use when it calls the method.
    * It can be achieved with interfaces, because the class can implement multiple interfaces. And Interface methods are
      not implemented in the interface, they are implemented in the class that implements the interface.

### 4. Polymorphism

* The ability of a function to have or to be displayed in more than one form.
* **`RunTime Polymorphism`:**
  It is achieved when a method in child class overriding a method in its super class.
* **`CompileTime Polymorphism`:**
  It is achieved when two methods have the same name but different parameters. 
