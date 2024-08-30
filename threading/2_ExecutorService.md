# ExecutorService

## Overview

The `ExecutorService` is a high-level framework designed to simplify asynchronous task execution and thread management.
It provides a more flexible and manageable way to handle concurrency compared to using raw threads and `Runnable`
objects.

## Purpose

1. **Thread Management**: Abstracts the creation and management of threads, allowing you to submit tasks instead of
   manually handling threads.
2. **Task Scheduling**: Provides mechanisms to schedule tasks for future execution or periodic execution.
3. **Concurrency Control**: Manages concurrent task execution efficiently, helping to avoid issues such as thread
   starvation and resource contention.
4. **Resource Management**: Optimizes the use of system resources by managing a pool of threads.

### ThreadPoolExecutor Class

A commonly used implementation of `ExecutorService` that manages a pool of threads and reuses them for task execution.
It allows fine control over thread pool behavior.

### ScheduledExecutorService Interface

Extends `ExecutorService` for scheduling tasks:

- **`ScheduledFuture<?> schedule(Runnable command, long delay, TimeUnit unit)`**: Schedules a `Runnable` task for
  execution after a specified delay.
- **`ScheduledFuture<?> scheduleAtFixedRate(Runnable command, long initialDelay, long period, TimeUnit unit)`**:
  Schedules a `Runnable` task for periodic execution at a fixed rate.
- **`ScheduledFuture<?> scheduleWithFixedDelay(Runnable command, long initialDelay, long delay, TimeUnit unit)`**:
  Schedules a `Runnable` task for periodic execution with a fixed delay between executions.
