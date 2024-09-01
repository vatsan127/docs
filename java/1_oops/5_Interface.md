## _Interface_

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

## _Abstract_

### Abstract method:

* can only be used in an abstract class, and it does not have a body.
* The body is provided by the subclass .

### Abstract class:

* Cannot be instantiated directly.
* Must be inherited by another class.
* Can have both abstract and concrete methods.
* Requires concrete subclasses to implement abstract methods.
* Can have constructors and static methods.
* Can have public, protected, and private access specifiers for its members.
* Can be a `partially completed` class.
* Can implement interfaces but is not required to implement all of their methods; remaining methods must be implemented
  by concrete subclasses.

## _Enum_

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