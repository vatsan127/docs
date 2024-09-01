# _CyclicBarrier_

* A CyclicBarrier is used to make threads wait for each other.
* Each thread calls the await() method when it finishes its part, pausing until all threads reach the barrier.
* Once all threads are at the barrier, they are allowed to continue.
* The barrier is reset after all threads have reached the barrier point, allowing the threads to reuse it.

### Diff b/w CyclicBarrier and CountDownLatch:

`CyclicBarrier` is for coordinating threads at specific points repeatedly, while `CountDownLatch` is for waiting until a
set of operations is completed, typically just once. CyclicBarrier is **reusable** and can execute a barrier action
repeatedly,
whereas CountDownLatch is a **one-time-use** latch with no barrier action.

## Methods

* **`await() / await(long timeout, TimeUnit unit)`:** Waits for all threads to reach the barrier. Can be used with / without
  a timeout.

* **`getNumberWaiting()`:** Returns the number of threads currently waiting at the barrier.

* **`getParties()`:** Returns the total number of threads required to trip the barrier.

* **`isBroken()`:** Returns `true` if the barrier is broken (e.g., due to thread interruption or timeout).

* **`reset()`:** Resets the barrier to its initial state, allowing it to be reused. If broken, it must be reset to be
  usable again.

### Code Snippet

```java
public static void main(String[] args) {
    int parties = 3;
    CyclicBarrier barrier = new CyclicBarrier(parties, () ->
            System.out.println("All parties have arrived, let's proceed.")
    );

    Runnable task = () -> {
        try {
            System.out.println(Thread.currentThread().getName() + " is waiting at the barrier.");
            barrier.await();
            System.out.println(Thread.currentThread().getName() + " has crossed the barrier.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    };

    for (int i = 0; i < parties; i++) {
        new Thread(task).start();
    }
}
```