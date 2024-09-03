# _Streams_

Stream API is a way to process collections of objects. it helps us to perform operations like filtering, mapping,
reducing, and sorting in a pipeline .

## Intermediate Operations

These are operations that transform a stream into another stream. They are lazy, meaning they are not executed until a
terminal operation is invoked.

* **`filter`:** filters elements based on the Perdicate.
* **`map`:** It converts each element in the Stream into another form or type.
* **`sorted`:** Sorts elements in a natural order or using a comparator.
* **`distinct`:** Removes duplicate elements.

## Terminal Operations

These operations produce a result ,when the stream pipeline is executed.

sampleCollection:

```
List<String> list = Arrays.asList("Apple", "Avocado", "Banana", "Blueberry");
List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5);
```

* **`forEach`:** Performs an action for each element.

```
list.stream().forEach(System.out::println);
```

* **`collect`:** Converts the stream to a collection or other data type.

```
Set<String> set = list.stream().collect(Collectors.toSet());
```

* **`reduce`:** Aggregates elements to produce a single result.

```
int sum = numbers.stream().reduce(0, Integer::sum);
```

* **`count`:** Returns the number of elements.

```
long numberOfFruits = list.stream().count();
```

* **`findFirst`:** Returns the first element, if present.

```
Optional<String> firstFruit = list.stream().findFirst();
```

* **`joining()`:** String concatenation on the elements in the stream

```
String str = list.stream().collect(Collectors.joining(", "));
```

* **`maxBy()`:** returns max element takes comparator as an input parameter and optional as an output

```
Optional<String> largestLength = list.stream().collect
(
    Collectors.maxBy(Comparator.comparingInt(String::length))
);

```

* **`minBy()`:** returns min element takes comparator as an input parameter and optional as an output

```
Optional<String> shortestFruit = list.stream().collect(
    Collectors.minBy(Comparator.comparingInt(String::length))
);
```

* **`summingInt()`:** returns sum as a result

```
int totalSum = numbers.stream().collect
(
    Collectors.summingInt(Integer::intValue)
);
```

* **`averageint()`:** returns average as a result

```
OptionalDouble average = numbers.stream().mapToInt(Integer::intValue).average();

```

* **`groupingBy()`:** based elements based on property ...gives an output Map<K,V>

```
Map<Character, List<String>> groupedByFirstLetter = list.stream()
    .collect(Collectors.groupingBy(fruit -> fruit.charAt(0)));
```

---