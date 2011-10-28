// A radar chart has a 
RadarChart = function(_opts) {
  var opts = $.extend({
    ele:    $("#radar-chart")[0], // DOM element where we will draw our radar chart
    maxVal: 5, // maximum value a radial can take (same for all radials)
    labels: ["Office", "Team", "Balance", "Company", "Career", "Impact"]
  }, _opts);
  var ele    = opts.ele,
      maxVal = opts.maxVal,
      labels = opts.labels;

  this.draw = function (values) {
    var prepared_values = $.map(values, function(val, i) { return([[i, val]]); });
    var prepared_labels = $.map(labels, function(lbl, i) { return({label: lbl}); });

    var data = [{ 
      data: prepared_values,
      spider: {show: true, lineWidth: 12} 
    }];
    
    var options = { 
      grid: { hoverable: true, clickable: true, tickColor: "rgba(0,0,0,0.2)", mode: "spider"},
      series: { 
        spider: { 
          active: true,
          highlight: {mode: "area"},
          scaleMode: "static",
          spiderSize: 0.9,
          legs: { 
            data: prepared_labels,
            legScaleMin: 1,
            legScaleMax: 1,
            legMin: 0,
            legMax: maxVal
          }
        }
      }
    };
    
    $.plot(ele, data, options);
  }
}
