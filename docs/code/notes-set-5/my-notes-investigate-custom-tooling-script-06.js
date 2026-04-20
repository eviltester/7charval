var registered = [];
var setDetectChangeHandler = function(field) {
  if (!registered.includes(field)) {
    var superProps = Object.getPrototypeOf(field);
    var superSet = Object.getOwnPropertyDescriptor(superProps, "value").set;
    var superGet = Object.getOwnPropertyDescriptor(superProps, "value").get;
    var newProps = {
      get: function() {
        return superGet.apply(this, arguments);
      },
      set: function (t) {
        var _this = this;
        setTimeout( function() { 
            _this.dispatchEvent(new Event("change"));
            }, 50);
        return superSet.apply(this, arguments);
      }
    };
    Object.defineProperty(field, "value", newProps);
    registered.push(field);
  }
}

