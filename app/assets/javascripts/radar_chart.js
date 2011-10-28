// A radar chart has a 
RadarChart = function(_opts) {
  var opts = $.extend({
    ele:     $("#radar-chart")[0], // DOM element where we will draw our radar chart
    width:   500,                  // horizontal width of radar chart on page (in pixels)
    height:  500,                  // vertical height of radar chart on page (in pixels)
    maxVal:  5                     // maximum value a radial can take (same for all radials)
  }, _opts);
  var ele     = opts.ele
  var width   = opts.width;
  var height  = opts.height;
  var maxVal = opts.maxVal;
  
  // bind radar chart to specified DOM object
  var paper = Raphael(ele, width, height);
  
  // given an array of integers as input, this method draws a radar chart based on that data
  this.draw = function(data) {
    var centerX = width/2,
        centerY = height/2,
        numRadials = data.length,
        axisLength = width/2;
    
    // draw radar chart axes and calculate location of vertices of the polygon
    var vertices = [];
    $.each(data, function(i, val) {
      console.log("ITER: ", i);
      var axis  = paper.path(centerTo(centerX, 0)),
          degrees = (i/numRadials)*360;
      axis.rotate(degrees, centerX, centerY); // rotate axis around end at center of canvas
      var vertex = axis.getPointAtLength((val/maxVal)*axisLength); // -1 fudge factor since Raphael doesn't hand edge cases
      vertex = paper.path(centerTo(vertex.x, vertex.y));
      vertex.rotate(degrees, centerX, centerY);
      vertex.glow();
      vertices.push(vertex.getPointAtLength(0));
    });
    
    // draw polygon
    vertices.push(vertices[0]);
    for (i = 0; i < vertices.length - 1; ++i) {
      paper.path(joinPoints(vertices[i].x, vertices[i].y, vertices[i+1].x, vertices[i+1].y));
    }
    
    function centerTo(x, y) {
      return(joinPoints(centerX, centerY, x, y));
    }
    
    function joinPoints(x1, y1, x2, y2) {
      return("M"+x1+","+y1+"L"+x2+","+y2);
    }
  }
}
