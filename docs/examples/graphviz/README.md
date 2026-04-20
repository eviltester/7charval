# Graphviz Examples

This folder contains Graphviz `.dot` sources and generated `.png` images.

## Inline Graphviz source example

This is the source from `7charval-testing-example.dot`.

```dot
digraph G {
    rankdir=LR;
    Start -> NoResult;
    NoResult -> Invalid [label="check(invalid)"];
    NoResult -> Valid [label="check(valid)"];
    Invalid -> Invalid [label="check(invalid)"];
    Invalid -> Valid [label="check(valid)"];
    Valid -> Invalid [label="check(invalid)"];
    Valid -> Valid [label="check(valid)"];
}
```

## Generated images

### Coverage path from start to valid/no-result

Source: [7charval-coverage-path-start-noresult-valid.dot](7charval-coverage-path-start-noresult-valid.dot)

![Graphviz coverage path](7charval-coverage-path-start-noresult-valid.png)

### Clustered testing view

Source: [7charval-testing-example-clusters.dot](7charval-testing-example-clusters.dot)

![Graphviz clustered testing view](7charval-testing-example-clusters.png)

### Basic testing example

Source: [7charval-testing-example.dot](7charval-testing-example.dot)

![Graphviz testing example](7charval-testing-example.png)
