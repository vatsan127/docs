# _Threads_

* Threads in Java allow you to perform multiple tasks concurrently, which can improve the efficiency of your programs.
* The main thread acts as the parent thread in a program. When we start a program, the execution typically begins with
  the `main()` method. This method runs on the main thread, which can be understood as the parent thread because it
  spawns other threads.
* When you create and start other threads, they run concurrently with the main thread unless instructed otherwise. Under
  normal circumstances, all threads run independently of each other. More explicitly, no thread waits for another
  thread.

## Methods

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

## States

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

## Code Snippets

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

