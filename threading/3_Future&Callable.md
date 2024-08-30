# _Future and Callable_

## 1. `Callable<T>` Interface:

- used to define a task that returns a result and may throw a checked exception.

```java
import java.util.concurrent.Callable;

public class MyCallable implements Callable<Integer> {
    @Override
    public Integer call() throws Exception {
        Thread.sleep(2000);
        return 42;
    }
}
```

## 2. `Future<V>` Interface:

- used to manage the execution of that task, checking its status, waiting for its result, or
  canceling it.

### Methods

1. **`cancel(boolean mayInterruptIfRunning)`**: Attempts to cancel the execution of the task; if `mayInterruptIfRunning`
   is true, the task is interrupted if it's running.
2. **`isCancelled()`**: Checks if the task was cancelled before it completed.
3. **`isDone()`**: Checks if the task has completed, either successfully, through cancellation, or due to an exception.
4. **`get()`**: Waits for the task to complete and returns the result, blocking if necessary.
5. **`get(long timeout, TimeUnit unit)`**: Waits for the task to complete and returns the result, but only blocks up to
   the specified timeout.

----
Example:

```java
public class FutureCallable {
    public static void main(String[] args) {
        ExecutorService executor = Executors.newSingleThreadExecutor();

        Callable<Integer> callable = new MyCallable();
        Future<Integer> future = executor.submit(callable);

        try {
            System.out.println("Waiting for result...");
            Integer result = future.get(); // Blocks until the result is available
            System.out.println("Result: " + result);
        } catch (InterruptedException | ExecutionException e) {
            e.printStackTrace();
        } finally {
            executor.shutdown();
        }
    }
}
```