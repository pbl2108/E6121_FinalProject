/**
 * VDomCheckerChrome namespace.
 */
if ("undefined" == typeof(VDomCheckerChrome)) {
  var VDomCheckerChrome = {};
};

_loadHandler = function(event) {
    VDomCheckerChrome.BrowserOverlay._onPageLoad(event);
};
 
gBrowser.addEventListener("load", _loadHandler, true);

/**
 * Controls the browser overlay for the DOm Checker Extension extension.
 */
VDomCheckerChrome.BrowserOverlay = {
  
  _onPageLoad : function(event) {
    // this is the content document of the loaded page.
    let doc = event.originalTarget;
    
    if (doc instanceof HTMLDocument) {
      // is this an inner frame?
      if (doc.defaultView.frameElement) {
        // Frame within a tab was loaded.
        // Find the root document:
        while (doc.defaultView.frameElement) {
          doc = doc.defaultView.frameElement.ownerDocument;
        }
      }
      
      this._onDocumentLoad(doc);
    }
  },
  
  _onDocumentLoad : function(objDocument) {
  },
  
  onMutation : function(mutation) {
    alert(mutation.type);
  },
  
  btnClickHandler : function(aEvent) {
    let stringBundle = document.getElementById("VDomChecker-string-bundle");
    let message = stringBundle.getString("VDomChecker.greeting.label");
    
    let btnCheck = document.getElementById("btnCheck");
    btnCheck.label = "Checking for Leaks...";
    
    let checker = new VDomCheckerChrome.HandlersChecker();
    checker._createObserver();
  }
};
