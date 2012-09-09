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

#Templating for list
app.directive 'bucket', ($compile) -> {

restrict: 'E',
scope: {
  node: "="
  parent: "="
}

link : (scope, elem, attrs) ->
  elem.append ($compile listHtml) scope
}

listHtml =
  """
<div id="stream">
  <ul class="annotator-widget annotator-listing">
      <div anno="exp" class="tile" ng-repeat="child in node.children" node="child" parent="node"></div>
  </ul>
</div>
  """

#Templating for annotations
app.directive 'anno', ($compile) -> {

scope: {
  node: "="
  parent: "="
}

link : (scope, elem, attrs) ->
  elem.append ($compile annoHtml) scope
}


#   <div class="metadata"><a>JordanLikesCoffee</a></div>
# <div class="control">
#   <a class="goto"><div class="inner">To Annotation</div></a>
# </div>
# <div class="control">
#   <a class="fave"><div class="inner">Favorite</div></a>
# </div>

# <div class="control">
#   <a class="goto"><div class="inner">To Annotation</div></a>
# </div>
# <div class="control">
#   <a class="fave"><div class="inner">Favorite</div></a>
# </div>

annoHtml =
  """
<ul class="annotator-widget annotator-listing">
  <li class="sidepanel">
    <div class="avablock">
      <img class="ava" src="images/{{node.avatar}}"/>
    </div>
  </li>
  <div class="papercontainer">
    <div class="metadata"><a>{{node.username}}</a> annotated:</div>
    <div class="control">
      <a class="goto"><div class="inner">To Annotation</div></a>
    </div>
    <li class="hyp-annotation hyp-paper hyp-detail hyp-excerpt" ng-click="showHide=!showHide">   
      <div class="page">
        <a href="{{node.link}}">{{node.page|truncate:60}}</a>
        <div class="domain">{{node.domain}}<img class="favicon" ng-src="http://{{node.domain}}/favicon.ico"/>
        </div>
      </div>
      <blockquote ng-show="node.srclevel" ng-hide="showHide">
        {{node.excerpt|truncate:140}}
      </blockquote>
      <blockquote ng-show="showHide">
        {{node.excerpt}}
      </blockquote>
      <div class="topbar">
        <div class="hyp-user">{{node.username}}</div>
        <div class="hyp-time">{{node.time}}</div>
      </div>    
      <div class="hyp-content" ng-hide="showHide">{{node.text|truncate:200}}</div>
      <div class="hyp-content" ng-show="showHide">{{node.text}}</div>
      <div class="hyp-thread">
        <ul class="annotator-listing" ng-show="showHide">

        <li tree="exp" class="hyp-annotation hyp-detail" ng-repeat="child in node.children" node="child" parent="node"></li>

        </ul>
      </div>
    </li>
  </div>
</ul>


  """

  # <li class="rightsidepanel">
  #   <div class="biggoto"></div>
  #   <div class="label">To Annotation</div>
  # </li>


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
  # <div class="annotator-controls">
  #  <a href="#reply" class="hyp-write">Reply</a>
  # </div>

@BuckEt = ($scope) ->

  $scope.root = {

    name : "New Annotations"
    children : [ 
      {
        username: "xXbRiAnSgIrLXx",
        avatar: "avatar_3.jpg",
        time: "about 3 days ago",
        page: "China cancels waste project after protests turn violent | Reuters",
        link: "http://www.reuters.com/article/2012/07/28/us-china-environment-protest-idUSBRE86R02Y20120728",
        domain: "reuters.com",
        srclevel: true,
        excerpt: "Demonstrators seized bottles of liquor and wine from the offices along with cartons of cigarettes, items which Chinese officials frequently receive as bribes. A photograph posted on Sina Weibo, the main Chinese microblogging service, showed some of the items displayed outside the government building.",
        text: "Chinese officials sound really easy to bribe."
      },
      {
        username: "FutureFry",
        avatar: "avatar_4.jpg",
        time: "about 21 hours ago",
        page: "Microsoft Files Motion in Apple v. Samsung to Hide Patent License Agreement Terms ~pj",
        link: "http://groklaw.net/article.php?story=20120727084323510",
        domain: "groklaw.net",
        srclevel: false,
        excerpt: "I seriously want to see those license terms, and I'd go so far as to suggest that the public has a right to know what those terms are, particularly future victims of Microsoft's patent strategy, and I know you want to know this too, because we've all heard the rumors that Microsoft licenses on very, very low royalties, just to be able to say to the world that Android/Linux folks are paying Microsoft for its patents. I'd love to know if that is true. Plus, if Microsoft paid for Samsung's FRAND patents the fee Samsung is asking Apple for, on what basis would Microsoft argue in its litigation against Motorola, that FRAND patents should be paid for at a greatly reduced royalty?",
        text: "Seems to me that the article singles out Microsoft because it puts this motion in the context of Microsoft making secret patent deals with Android manufacturers:"
      },
      {
        username: "brian_buggers",
        avatar: "avatar_5.jpg",
        time: "1 day ago",
        page: "How Microsoft Lost Its Mojo: Steve Ballmer and Corporate America’s Most Spectacular Decline | Business | Vanity Fair",
        link: "http://m.vanityfair.com/business/2012/08/microsoft-lost-mojo-steve-ballmer",
        domain: "m.vanityfair.com",
        srclevel: true,
        excerpt: "In December 2000, Microsoft had a market capitalization of $510 billion, making it the world’s most valuable company. As of June it is No. 3, with a market cap of $249 billion. In December 2000, Apple had a market cap of $4.8 billion and didn’t even make the list. As of this June it is No. 1 in the world, with a market cap of $541 billion.",
        text: "In other words, Apple is currently about where Microsoft was when they started paying dividends a little more than a decade ago...i.e. The point where they went from a growth company to a the sort of 'blue chip' held by index funds. The past decade has been spent securing their place in enterprise - their core market and one in which Apple, Google, and Facebook offer little competition. With loads of cash, a conucopia of brilliant personnel and Gates and Ballmer as the two largest shareholders, the whims of Wall Street bloggers don't have much effect."
      },
      {
        username: "Mb'Skepteko",
        avatar: "avatar_6.jpg",
        time: "about 6 hours ago",
        page: "Japanese equestrian defies Father Time as the oldest competitor at London Olympics - Yahoo! Sports",
        link: "http://sports.yahoo.com/news/olympics--japanese-equestrian-defies-father-time-as-oldest-competitor-at-london-olympics.html",
        domain: "sports.yahoo.com",
        srclevel: true,
        excerpt: "I have not seen my wife, Motoko, for more than a year",
        text: "The key to a long-lasting marriage"
      },
      {
        username: "P1MP_$TEVE",
        avatar: "avatar_7.jpg",
        time: "about 1 hour ago",
        page: "German renewables output hits record high in H1 | Reuters",
        link: "http://www.reuters.com/article/2012/07/26/germany-renewables-idUSL6E8IQIA720120726",
        domain: "reuters.com",
        srclevel: true,
        excerpt: "Renewables now account for 25 percent of energy production, up from 21 percent last year, the country's energy industry association (BDEW) said in a statement that reinforced Germany's position as a leader in green technology.",
        text: "In related news, German electricity is 30% more expensive than French, and 300% more expensive than American."
      }
    ]
  }