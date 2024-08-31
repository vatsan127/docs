# _ExecutorService_

The `ExecutorService` is a high-level framework designed to simplify asynchronous task execution and thread management.
It provides a more flexible and manageable way to handle concurrency compared to using raw threads and `Runnable`
objects.

- Abstracts the creation and management of threads, allowing you to submit tasks instead of
  manually handling threads.
- Provides mechanisms to schedule tasks for future execution or periodic execution.
- Optimizes the use of system resources by managing a pool of threads.

## Methods

### create

- **`newSingleThreadExecutor()`:** Creates an Executor that uses a single worker thread to execute tasks sequentially.
- **`Executors.newScheduledThreadPool(int corePoolSize)`:** Creates a thread pool that can schedule tasks to run after a
  delay or periodically, with a fixed number of threads.
- **`newFixedThreadPool(int nThreads)`:** Creates a thread pool with a fixed number of threads, where the threads will
  be reused for executing tasks.
- **`newCachedThreadPool()`:** Creates a thread pool that creates new threads as needed, but reuses previously
  constructed threads when available.

### delete

* **`shutdown()`:** All tasks that were submitted before the shutdown() call will continue to be executed. This includes
  tasks that are currently running and those that are waiting in the queue.
* **`shutdownNow()`:** Attempts to stop all actively executing tasks, halts the processing of waiting tasks, and returns
  a list of the tasks that were waiting to be executed.
