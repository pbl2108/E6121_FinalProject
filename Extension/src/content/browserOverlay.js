/**
 * XULSchoolChrome namespace.
 */
if ("undefined" == typeof(VDomCheckerChrome)) {
  var VDomCheckerChrome = {};
};

/**
 * Controls the browser overlay for the DOm Checker Extension extension.
 */
VDomCheckerChrome.BrowserOverlay = {
  /**
   * Says 'Hello' to the user.
   */
  sayHello : function(aEvent) {
    let stringBundle = document.getElementById("VDomChecker-string-bundle");
    let message = stringBundle.getString("VDomChecker.greeting.label");
    
    window.alert(message);
  }
};
