# _CountDownLatch_

CountDownLatch is used to make sure that a task waits for other threads before it starts.

### 1. CountDownLatch Initialization

- A `CountDownLatch` is initialized with a count value, which represents the number of events that must occur before the
  latch is considered **released**.

### 2. Awaiting

- Threads that need to wait for the completion of other operations call the `await()` method on the `CountDownLatch`.
- When a thread calls `await()`, it blocks and waits until the count reaches zero.

### 3. Counting Down

- Other threads signal that an event has occurred by calling the `countDown()` method on the `CountDownLatch`.
- Each call to `countDown()` decrements the count by one. When the count reaches zero, all waiting threads are released
  and can proceed with their execution.

### 4. Usage Example

Imagine you have a main thread that needs to wait until three worker threads complete their tasks. You could initialize
a `CountDownLatch` with a count of three and have each worker thread call `countDown()` when it finishes its task. The
main thread would call `await()`, blocking until all three workers have finished.

### 5.Code Snippet

```java
    public static void main(String[] args) {
    int NUMBER_OF_THREADS = 3;
    CountDownLatch latch = new CountDownLatch(NUMBER_OF_THREADS);
    for (int i = 0; i < NUMBER_OF_THREADS; i++) {
        new Thread(new Task(latch)).start();
    }
    try {
        latch.await(); // Main Thread will wait until all the threads count down
    } catch (InterruptedException e) {
        e.printStackTrace();
    }
    // Once All task is completed then this message will be printed
    System.out.println("All tasks are completed");
}
```

```java
/* Thread Class*/
@RequiredArgsConstructor
public class Task implements Runnable {

    private final CountDownLatch latch;

    @Override
    public void run() {
        System.out.println("Executing task in Thread " + Thread.currentThread().getName());
        try {
            TimeUnit.SECONDS.sleep(3);
            latch.countDown();  // Decrease latch count
            System.out.println("Task completed by " + Thread.currentThread().getName());
        } catch (InterruptedException e) {
            throw new RuntimeException(e);  // Handle interruption
        }
    }
}

```