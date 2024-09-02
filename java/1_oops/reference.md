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

* Cannot be instantiated directly.
* Must be inherited by another class.
* Can have both abstract and concrete methods.
* Requires concrete subclasses to implement abstract methods.
* Can have constructors and static methods.
* Can have public, protected, and private access specifiers for its members.
* Can be a `partially completed` class.
* Can implement interfaces but is not required to implement all of their methods; remaining methods must be implemented
  by concrete subclasses.

---

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

# _Optionals_ TODO

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

# _MultiThreading_

* Threads in Java allow you to perform multiple tasks concurrently, which can improve the efficiency of your programs.
* The main thread acts as the parent thread in a program. When we start a program, the execution typically begins with
  the `main()` method. This method runs on the main thread, which can be understood as the parent thread because it
  spawns other threads.
* When you create and start other threads, they run concurrently with the main thread unless instructed otherwise. Under
  normal circumstances, all threads run independently of each other. More explicitly, no thread waits for another
  thread.

### Methods

* **`start()`:** Begins the execution of the thread; the run method is invoked.
* **`run()`:** Contains the code that constitutes the new thread.
* **`sleep(long millis)`:** Causes the currently executing thread to sleep (temporarily cease execution) for a specified
  period.
* **`join()`:** Waits for a thread to die (complete execution).
* **`interrupt()`:** Interrupts a thread that is sleeping or waiting.
* **`getState()`**: returns the current state of the thread.
* **`wait()`**: make a Thread wait until it is awakened by another thread using same **LOCK** object
* **`notify()`**: can be used for awaken Thread that is waiting on the same **LOCK** Object.
* **`getName()`**: returns the name of the thread.
* **`getPriority() / setPriority()`**: gets/sets the priority of the thread.

### States

* **NEW**: A thread that has been created but not yet started. It remains in this state until the **`start()`** method
  is invoked.
* **RUNNABLE**: A thread that is ready to run is moved to the RUNNABLE state. RUNNABLE does not necessarily mean that
  the thread is currently executing, it means that the thread is ready to run or is running.
* **BLOCKED**: A thread enters the BLOCKED state when it wants to acquire a lock that another thread holds. This state
  occurs during synchronization when a thread is waiting to acquire a lock on an object.
* **WAITING**: A thread enters the WAITING state when it is waiting indefinitely for another thread to perform a
  particular action. This state is usually reached by calling `Object.wait()` or **`Thread.join()`** with no timeout.
* **TIMED_WAITING**: A thread is in the TIMED_WAITING state when it is waiting for another thread to perform a
  particular action within a stipulated amount of time. This can occur by calling methods like **`Thread.sleep(millis)`
  **, **`Object.wait(millis)`**, or **`Thread.join(millis)`**.
* **TERMINATED**: A thread enters the TERMINATED state when it has completed its execution either because it finished
  its **`run()`** method or was otherwise terminated (e.g., by an exception).

### Code Snippets

* **Wait() & notify()**

```java
public static void main(String[] args) {
    Thread one = new Thread(() -> {
        try {
            one();
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    });
    Thread two = new Thread(() -> {
        try {
            two();
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    });
    one.start();
    two.start();
}

public static void one() throws InterruptedException {
    synchronized (LOCK) {
        System.out.println("hello from method one");
        LOCK.wait();
        System.out.println("back from method one");
    }
}

public static void two() throws InterruptedException {
    synchronized (LOCK) {
        System.out.println("hello from method two");
        LOCK.notify();
        System.out.println("message from method two");
    }
}
```

* **Join()**

```java
public static void main(String[] args) throws InterruptedException {

    Thread threadOne = new Thread(() -> {
        for (int i = 0; i < 25; i++) {
            System.out.println("Thread One : " + i);
        }
    });
    Thread threadTwo = new Thread(() -> {
        for (int i = 0; i < 25; i++) {
            System.out.println("Thread two : " + i);
        }
    });

    threadOne.start();
    threadTwo.start();
    threadOne.join();

    System.out.println("Thread Execution is done ");
}
```

## ExecutorService

The `ExecutorService` is a high-level framework designed to simplify asynchronous task execution and thread management.
It provides a more flexible and manageable way to handle concurrency compared to using raw threads and `Runnable`
objects.

- Abstracts the creation and management of threads, allowing you to submit tasks instead of
  manually handling threads.
- Provides mechanisms to schedule tasks for future execution or periodic execution.
- Optimizes the use of system resources by managing a pool of threads.

### Methods

- **`newSingleThreadExecutor()`:** Creates an Executor that uses a single worker thread to execute tasks sequentially.
- **`Executors.newScheduledThreadPool(int corePoolSize)`:** Creates a thread pool that can schedule tasks to run after a
  delay or periodically, with a fixed number of threads.
- **`newFixedThreadPool(int nThreads)`:** Creates a thread pool with a fixed number of threads, where the threads will
  be reused for executing tasks.
- **`newCachedThreadPool()`:** Creates a thread pool that creates new threads as needed, but reuses previously
  constructed threads when available.

* **`shutdown()`:** All tasks that were submitted before the shutdown() call will continue to be executed. This includes
  tasks that are currently running and those that are waiting in the queue.
* **`shutdownNow()`:** Attempts to stop all actively executing tasks, halts the processing of waiting tasks, and returns
  a list of the tasks that were waiting to be executed.

---
