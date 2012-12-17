/**
 * VDomCheckerChrome namespace.
 */
if ("undefined" == typeof(VDomCheckerChrome)) {
  var VDomCheckerChrome = {};
};

/**
 * Checker that checks whether the handlers have been detached
 * from the HTML element, before removing the handler itself.
 */
VDomCheckerChrome.HandlersChecker = function() {
};
 
/**
 * Members of the HandlersChecker class.
 */
VDomCheckerChrome.HandlersChecker.prototype = { 
  _observer : null,
  
  _createObserver : function() {
    var documentElmenet = content.document.documentElement;
    var target = documentElmenet;
    
    var self = this;
    // create an observer instance
    this._observer = new MutationObserver(function (mutations)
    {
      mutations.forEach(function (mutation)
      {
        self.onMutation(mutation);
      });
    });
    
    // configuration of the observer:
    var config = { attributes: true, childList: true, subtree : true, characterData: true };

    // pass in the target node, as well as the observer options
    this._observer.observe(target, config);

    // later, you can stop observing
    //observer.disconnect();
  },
  
  onMutation : function(mutation) {
    this.handleMutation(mutation);
  },

  handleMutation : function(mutation)
  {
    this.handleRemovedHTML(mutation.removedNodes);
  },
  
  handleRemovedHTML : function(removedNodes) {
    if (!removedNodes) return;
    let txtConsole = document.getElementById("txtConsole");
    var length = removedNodes.length;
    for (var i = 0; i < length; i++)
    {
      var t = this.checkHandlers(removedNodes[i]);
      if (t)
        txtConsole.value += i + ". Memory Leak at Element: " + removedNodes[i].outerHTML + "\n\n";
    }
  },
  
  checkHandlers : function(objElement) {
    
    var listenerService = Components.classes["@mozilla.org/eventlistenerservice;1"]
            .getService(Components.interfaces.nsIEventListenerService);
    var infos = listenerService.getListenerInfoFor(objElement, {});
    var types = [];
    for (var i = 0; i < infos.length; ++i) {
      var info = infos[i].QueryInterface(Components.interfaces.nsIEventListenerInfo);
      types.push(info.type);
    }
    
    if (types.length)
      return types.length > 0;
    return false;
  },
  
};
