workspace {
  model {
    start = softwareSystem "Start"
    noResult = softwareSystem "Not Showing Result"
    invalid = softwareSystem "Invalid Value"
    valid = softwareSystem "Valid Value"

    start -> noResult "start"
    noResult -> invalid "check(invalid)"
    noResult -> valid "check(valid)"
    invalid -> invalid "check(invalid)"
    invalid -> valid "check(valid)"
    valid -> invalid "check(invalid)"
    valid -> valid "check(valid)"
  }
  views {
    systemLandscape {
      include *
      autoLayout lr
    }
  }
}