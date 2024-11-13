# Spring Stereotype Annotations

- Stereotype annotations are used to define the roles of various classes in a Spring application.
- These annotations help Spring to scan and register these classes as beans in the Spring Application Context during
  component scanning.

## 1. `@Component`

- `@Component` is a generic stereotype for any Spring-managed component or bean.
- It's a general-purpose annotation that marks a class as a Spring bean without specifying its role in the application.

### NOTE:

- _**All other stereotype annotations are basically a specialized version of @Component.**_

## 2. `@Service`

- `@Service` is used to indicate that a class provides business logic (services) to other parts of the application.
- Besides being used in the service layer, there isn’t any other special use for this annotation.
- This is only used for better organization and readability.

## 3. `@Repository`

- `@Repository` marks a class as a Data Access Object (DAO) that interacts with a database or another persistence layer.
- @Repository’s job is to catch persistence-specific exceptions and re-throw them as one of Spring’s unified unchecked
  exceptions.

## 4. `@Controller`

- `@Controller` indicates that a class is a Spring MVC controller that handles HTTP requests.
- This is another specialization of `@Component` and is specifically used in Spring MVC applications to designate
  request-handling classes.
- This will not be able to send directly a JSON response. It will return a view name which will be resolved by the view
  resolver.

## 5. `@RestController`

- `@RestController` is a combination of `@Controller` and `@ResponseBody`.
- It’s used in RESTful applications to return JSON or XML responses . All methods in a `@RestController`
  class implicitly have `@ResponseBody`.