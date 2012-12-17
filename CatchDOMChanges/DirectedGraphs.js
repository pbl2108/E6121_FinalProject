if ("undefined" == typeof (VDomCheckerChrome)) {
	var VDomCheckerChrome = {};
};

(function ($V) {

	/* Represents a Graph Node */
	$V.GraphNode = function (nodeName) {
		this._nodeName = nodeName;
	}
	VDomCheckerChrome.GraphNode.prototype = {
		get_nodeName : function () {
			return this._nodeName;
		},

		set_nodeName : function (nodeName) {
			this._nodeName = nodeName;
		}
	}

	/* Represents a Directed Graph */


})(VDomCheckerChrome);
