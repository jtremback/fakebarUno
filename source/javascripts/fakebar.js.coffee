app = angular.module("myApp", ["filters"])

###
Truncate Filter
@Param text
@Param length, default is 10
@Param end, default is "..."
@return string
###
angular.module("filters", []).filter "truncate", ->
  (text, length, end) ->
    length = text.length if isNaN(length)
    end = "..."  if end is `undefined`
    if text.length <= length or text.length - end.length <= length
      text
    else
      String(text).substring(0, length - end.length) + end

###
Usage

var myText = "This is an example.";

{{myText|Truncate}}
{{myText|Truncate:5}}
{{myText|Truncate:25:" ->"}}
Output
"This is..."
"Th..."
"This is an e ->"
###

#BUCKET VIEW

#Templating for bucket
app.directive 'bucket', ($compile) -> {

restrict: 'E',
scope: {
  node: "="
  parent: "="
}

link : (scope, elem, attrs) ->
  elem.append ($compile bucketHtml) scope
}

bucketHtml =
  """
<div class="annotator-outer annotator-viewer">
  <ul class="annotator-widget annotator-listing">
      <li anno="exp" class="hyp-annotation hyp-summary hyp-paper" ng-repeat="child in node.children" node="child" parent="node"></div>
  </ul>
</div>
  """


#Templating for annotations
app.directive 'anno', ($compile) -> {

restrict: 'A',
scope: {
  node: "="
  parent: "="
}

link : (scope, elem, attrs) ->
  elem.append ($compile annoHtml) scope
}

annoHtml =
  """
<div class="topbar">
  <div class="hyp-user">{{node.username}}</div>
  <div class="hyp-time">{{node.time}}</div>
</div>

<div class="hyp-content">{{node.text}}</div>

  """


# Templating for replies tree
app.directive 'tree', ($compile) -> {

  replace: true,
  scope: {
    node: "="
    parent: "="
  }

  link : (scope, elem, attrs) ->
    elem.append ($compile treeHtml) scope
}

treeHtml =
  """
<a class="hyp-threadexp" href="#collapse"></a>
<div class="topbar">
  <div class="hyp-user">{{node.username}}</div>
  <di  background-repeat: no-repeat;
  background-position: center;
  background-size: 100% 100%;v class="hyp-time">{{node.time}}</div>
</div>
<div class="hyp-content">{{node.text}}</div>
<div class="hyp-thread">
  <ul class="annotator-listing"> 

      <li tree="exp" class="hyp-annotation hyp-detail" ng-repeat="child in node.children" node="child" parent="node"></li>

  </ul>
</div>

  """


#DETAIL VIEW

#Templating for detail
app.directive 'detail', ($compile) -> {

restrict: 'E',
scope: {
  node: "="
  parent: "="
}

link : (scope, elem, attrs) ->
  elem.append ($compile bucketHtml) scope
}

bucketHtml =
  """
<div class="annotator-outer annotator-viewer">
  <ul class="annotator-widget annotator-listing">
      <li anno="exp" class="hyp-annotation hyp-summary hyp-paper" ng-repeat="child in node.children" node="child" parent="node"></div>
  </ul>
</div>
  """


#Templating for annotations
app.directive 'anno', ($compile) -> {

restrict: 'A',
scope: {
  node: "="
  parent: "="
}

link : (scope, elem, attrs) ->
  elem.append ($compile annoHtml) scope
}

annoHtml =
  """
<div class="topbar">
  <div class="hyp-user">{{node.username}}</div>
  <div class="hyp-time">{{node.time}}</div>
</div>

<div class="hyp-content">{{node.text}}</div>

  """


# Templating for replies tree
app.directive 'tree', ($compile) -> {

  replace: true,
  scope: {
    node: "="
    parent: "="
  }

  link : (scope, elem, attrs) ->
    elem.append ($compile treeHtml) scope
}

treeHtml =
  """
<a class="hyp-threadexp" href="#collapse"></a>
<div class="topbar">
  <div class="hyp-user">{{node.username}}</div>
  <di  background-repeat: no-repeat;
  background-position: center;
  background-size: 100% 100%;v class="hyp-time">{{node.time}}</div>
</div>
<div class="hyp-content">{{node.text}}</div>
<div class="hyp-thread">
  <ul class="annotator-listing"> 

      <li tree="exp" class="hyp-annotation hyp-detail" ng-repeat="child in node.children" node="child" parent="node"></li>

  </ul>
</div>

  """



@BuckEt = ($scope) ->

  $scope.root = {

    name : "Bucket"
    children : [ 
      {
        username: "xXbRiAnSgIrLXx",
        time: "about 3 days ago",
        text: "Chinese officials sound really easy to bribe."
      },
      {
        username: "FutureFry",
        time: "about 21 hours ago",
        text: "Seems to me that the article singles out Microsoft because it puts this motion in the context of Microsoft making secret patent deals with Android manufacturers:"
      },
      {
        username: "brian_buggers",
        time: "1 day ago",
        text: "In other words, Apple is currently about where Microsoft was when they started paying dividends a little more than a decade ago...i.e. The point where they went from a growth company to a the sort of 'blue chip' held by index funds. The past decade has been spent securing their place in enterprise - their core market and one in which Apple, Google, and Facebook offer little competition. With loads of cash, a conucopia of brilliant personnel and Gates and Ballmer as the two largest shareholders, the whims of Wall Street bloggers don't have much effect."
      },
      {
        username: "Mb'Skepteko",
        time: "about 6 hours ago",
        text: "The key to a long-lasting marriage"
      },
      {
        username: "P1MP_$TEVE",
        time: "about 1 hour ago",
        text: "In related news, German electricity is 30% more expensive than French, and 300% more expensive than American."
      }
    ]
  }