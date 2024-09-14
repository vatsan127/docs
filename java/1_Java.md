# _OOPs_

## _Class_

A class is a user-defined blueprint or prototype from which objects are created. It represents the set of properties or
methods that are common to all objects of one type.

* It provides the template for creating objects.
* It binds together the data and the functions that operate on the data.
* It supports the inheritance property of Object-Oriented Programming and hence can maintain the class hierarchy.
* It helps in maintaining the access specifications of member variables.

---

## _Object_

* An object is a basic unit of Object-Oriented Programming.
* It represents real-life entities.

---

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

---

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

---

# _Abstract_

## Abstract method:

* can only be used in an abstract class, and it does not have a body.
* The body is provided by the subclass .

## Abstract class:

* Cannot be instantiated directly. Must be inherited by another class.
* Can have both abstract and concrete methods.
* Can have constructors and static methods.
* Can have public, protected, and private access specifiers for its members.
* Can be a `partially completed` class.
* Can implement interfaces but is not required to implement all of their methods; remaining methods must be implemented
  by concrete subclasses.

---

# _Interface_

* An Interface tells what needs to be implemented and a class can decide how it can be implemented.
* An interface cannot contain a constructor (as it cannot be used to create objects).
* On implementation of an interface, you must override all of its methods.
* Interface attributes are by `default public, static and final`.
* Interface methods are by `public` and `default abstract`.

## _Interface References_

* An interface reference can be assigned to any implementation.
* For example, `List<?> list` can refer to any implementation such as `ArrayList`, `LinkedList`, etc. However,
  when using the interface type to create an object, only the methods defined by the interface can be accessed; methods
  specific to the implementation class cannot be accessed.
* This approach provides flexibility and abstraction. It allows to write code that is not dependent on a specific
  implementation. This can be useful for writing generic code

## _Default Methods_

* Default methods provide implementations within an interface.
* These methods can be overridden by the class implementing the interface.
* Can be called with the Object that is implementing this interface.

## _Static Methods_

* Static methods provide implementations within an interface.
* These methods cannot be overridden by the class implementing the interface.
* They can be invoked directly using the containing interface.



### Multiple Inheritance in Java with Interface

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

---

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

----

# _Records_

- Records are immutable, meaning that once an instance is created, its fields cannot be modified.
- Records require only the type and name of fields.
- **Automatic Methods**:
    - **`equals(Object o)`**: Compares two records for equality based on their fields.
    - **`hashCode()`**: Computes a hash code based on the fields.
    - **`toString()`**: Provides a string representation that includes the record's name and fields.
- Fields in a record are by default private and final.
- Getters are generated for each field and named after the fields .

## Canonical Constructor

- It initializes all fields of the record and ensures they are properly set.
- The canonical constructor is automatically provided by the Java compiler.
- **Example**:

```java
public record Person(String name, String address) {
    // Canonical constructor is automatically provided
}
```

## Compact Constructor

* An optional constructor that you can define to perform additional validation or processing.
* It is invoked by the canonical constructor and does not need to reinitialize fields.

```java
public record Person(String name, String address) {
    // Compact constructor for additional validation
    public Person {
        if (name == null || address == null) {
            throw new IllegalArgumentException("Name and address cannot be null");
        }
    }
}

```

## Static Factory Methods

* Methods that provide alternative ways to create instances of the record.
* They can include custom logic or constraints for instance creation.

```java
public record Person(String name, String address) {
    // Static factory method
    public static Person of(String name, String address) {
        if (name == null || address == null) {
            throw new IllegalArgumentException("Name and address cannot be null");
        }
        return new Person(name, address);
    }
}

```

---

# _Optionals_

Optionals is a container object that may or may not contain a non-null value.

- **`get()`:** Retrieves the value contained in the Optional if present; otherwise, it throws
  `NoSuchElementException`.

- **`isPresent()`:** Checks if the Optional contains a non-null value. Returns `true` if a value is present, `false`
  otherwise.

- **`orElse(T other)`:** Returns the value if present; otherwise, returns the provided default value `other`.

- **`orElseThrow()`:** Returns the value if present; otherwise, throws an exception

- **`empty()`:** Creates an empty Optional that contains no value.

- **`of(T value)`:** Creates an Optional containing the specified non-null value. Throws `NullPointerException` if the
  value is `null`.

- **`ofNullable(T value)`:** Creates an Optional containing the specified value if it's non-null; otherwise, creates
  an empty Optional.

---

# _Access Modifiers_

1. **`public`**: it is accessible by any other class.
2. **`private`**: it is accessible only within the class in which it is declared.
3. **`protected`**: it is accessible by the classes of the same package and the subclasses residing in any package.
4. **`default`**: it is accessible only by the classes of the same package.

----

# _Final Keyword_

1. **`Final variable`:** A final variable can only be initialized once, either when it is declared or within the
   constructor.
2. **`Final method`:** A final method cannot be overridden by subclasses.
3. **`Final class`:** A final class cannot be inherited by other classes.

---

# _Static / NonStatic_ TODO

---

# _Garbage Collection_ TODO

---