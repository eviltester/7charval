workspace {
  model {
    input = softwareSystem "Input"
    process = softwareSystem "Process"
    output = softwareSystem "Output"
    input -> process "flows to"
    process -> output "flows to"
  }
  views {
    systemLandscape {
      include *
      autoLayout lr
    }
  }
}