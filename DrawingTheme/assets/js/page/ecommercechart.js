window.Apex = {
    chart: {
      foreColor: '#555',
      toolbar: {
        show: false
      },
    },
    colors: ['#FCCF31', '#17ead9', '#f02fc2'],
    stroke: {
      width: 3
    },
    dataLabels: {
      enabled: false
    },
    grid: {
      borderColor: "#f1f1f1",
    },
    xaxis: {
      axisTicks: {
        color: ''
      },
      axisBorder: {
        color: ""
      }
    },
    fill: {
      type: 'gradient',
      gradient: {
        gradientToColors: ['#F55555', '#6078ea', '#6094ea']
      },
    },
    tooltip: {
      theme: 'dark',
    //   x: {
    //     formatter: function (val) {
    //       return moment(new Date(val)).format("HH:mm:ss")
    //     }
    //   }
    },
    yaxis: {
      decimalsInFloat: 2,
      opposite: true,
      labels: {
        offsetX: -10
      }
    }
};
  
  var trigoStrength = 3
  var iteration = 11
  
  function getRandom() {
    var i = iteration;
    return (Math.sin(i / trigoStrength) * (i / trigoStrength) + i / trigoStrength + 1) * (trigoStrength * 2)
  }
  
  function getRangeRandom(yrange) {
    return Math.floor(Math.random() * (yrange.max - yrange.min + 1)) + yrange.min
  }
  
  function generateMinuteWiseTimeSeries(baseval, count, yrange) {
    var i = 0;
    var series = [];
    while (i < count) {
      var x = baseval;
      var y = ((Math.sin(i / trigoStrength) * (i / trigoStrength) + i / trigoStrength + 1) * (trigoStrength * 2))
      series.push([x, y]);
      baseval += 300000;
      i++;
    }
    return series;
  }

  function getNewData(baseval, yrange) {
    var newTime = baseval + 300000;
    return {
      x: newTime,
      y: Math.floor(Math.random() * (yrange.max - yrange.min + 1)) + yrange.min
    }
  }
  
  //   /***************Progress********************/
//progerss chart 1 to 4 start
  
  var optionsProgress1 = {
    chart: {
      height: 70,
      type: 'bar',
      stacked: true,
      sparkline: {
        enabled: true
      }
    },
    plotOptions: {
      bar: {
        horizontal: true,
        barHeight: '20%',
        colors: {
            backgroundBarColors: ['#f1f1f1']
        }
      },
    },
    stroke: {
      width: 0,
    },
    series: [{
      name: 'Area',
      data: [44]
    }],
    title: {
      floating: true,
      offsetX: -10,
      offsetY: 5,
        text: 'Area'
    },
    subtitle: {
      floating: true,
      align: 'right',
      offsetY: 0,
      text: '44%',
      style: {
        fontSize: '20px'
      }
    },
    tooltip: {
      enabled: false
    },
    xaxis: {
        categories: ['Area'],
    },
    yaxis: {
      max: 100
    },
    fill: {
      opacity: 1
    }
  }


  var chartProgress1 = new ApexCharts(document.querySelector('#progress1'), optionsProgress1);
  chartProgress1.render();
  
  
  var optionsProgress2 = {
    chart: {
      height: 70,
      type: 'bar',
      stacked: true,
      sparkline: {
        enabled: true
      }
    },
    plotOptions: {
      bar: {
        horizontal: true,
        barHeight: '20%',
        colors: {
            backgroundBarColors: ['#f1f1f1']
        }
      },
    },
    colors: ['#17ead9'],
    stroke: {
      width: 0,
    },
    series: [{
      name: 'Sprinkles',
      data: [80]
    }],
    title: {
      floating: true,
      offsetX: -10,
      offsetY: 5,
        text: 'Sprinkles'
    },
    subtitle: {
      floating: true,
      align: 'right',
      offsetY: 0,
      text: '80%',
      style: {
        fontSize: '20px'
      }
    },
    tooltip: {
      enabled: false
    },
    xaxis: {
        categories: ['Sprinkles'],
    },
    yaxis: {
      max: 100
    },
    fill: {
      type: 'gradient',
      gradient: {
        inverseColors: false,
        gradientToColors: ['#6078ea']
      }
    },
  }
  
  var chartProgress2 = new ApexCharts(document.querySelector('#progress2'), optionsProgress2);
  chartProgress2.render();
  
  
  var optionsProgress3 = {
    chart: {
      height: 70,
      type: 'bar',
      stacked: true,
      sparkline: {
        enabled: true
      }
    },
    plotOptions: {
      bar: {
        horizontal: true,
        barHeight: '20%',
        colors: {
            backgroundBarColors: ['#f1f1f1']
        }
      },
    },
    colors: ['#c133aa'],
    stroke: {
      width: 0,
    },
    series: [{
      name: 'Dry Area',
      data: [74]
    }],
    fill: {
      type: 'gradient',
      gradient: {
        gradientToColors: ['#f533a1']
      }
    },
    title: {
      floating: true,
      offsetX: -10,
      offsetY: 5,
        text: 'Dry Area'
    },
    subtitle: {
      floating: true,
      align: 'right',
      offsetY: 0,
      text: '74%',
      style: {
        fontSize: '20px'
      }
    },
    tooltip: {
      enabled: false
    },
    xaxis: {
        categories: ['Dry Area'],
    },
    yaxis: {
      max: 100
    },
  }
  
  var chartProgress3 = new ApexCharts(document.querySelector('#progress3'), optionsProgress3);
  chartProgress3.render();

  var optionsProgress4 = {
    chart: {
      height: 70,
      type: 'bar',
      stacked: true,
      sparkline: {
        enabled: true
      }
    },
    plotOptions: {
      bar: {
        horizontal: true,
        barHeight: '20%',
        colors: {
          backgroundBarColors: ['#f1f1f1']
        }
      },
    },
    colors: ['#8757e7'],
    stroke: {
      width: 0,
    },
    series: [{
      name: 'Water',
      data: [88]
    }],
    fill: {
      type: 'gradient',
      gradient: {
        gradientToColors: ['#63aefd']
      }
    },
    title: {
      floating: true,
      offsetX: -10,
      offsetY: 5,
        text: 'Water'
    },
    subtitle: {
      floating: true,
      align: 'right',
      offsetY: 0,
      text: '88%',
      style: {
        fontSize: '20px'
      }
    },
    tooltip: {
      enabled: false
    },
    xaxis: {
        categories: ['Water'],
    },
    yaxis: {
      max: 100
    },
  }
  
  var chartProgress4 = new ApexCharts(document.querySelector('#progress4'), optionsProgress4);
  chartProgress4.render();
  //progerss chart 1 to 4 end

  //column chart start
  var optionsColumn = {
    chart: {
      height: 330,
      type: 'bar',
      animations: {
        enabled: false
      },
      events: {
        animationEnd: function (chartCtx, opts) {
          const newData = chartCtx.w.config.series[0].data.slice()
          newData.shift()
          window.setTimeout(function () {
            chartCtx.updateOptions({
              series: [{
                data: newData
              }],
              xaxis: {
                min: chartCtx.minX,
                max: chartCtx.maxX
              },
              subtitle: {
                text: parseInt(getRangeRandom({min: 1, max: 20})).toString() + '%',
              }
            }, false, false)
          }, 300)
        }
      },
      toolbar: {
        show: false
      },
      zoom: {
        enabled: false
      }
    },
    dataLabels: {
      enabled: false
    },
    stroke: {
      width: 0,
    },
    series: [{
      name: 'Total Average',
      data: generateMinuteWiseTimeSeries(new Date("12/12/2016 00:20:00").getTime(), 12, {
        min: 10,
        max: 110
      })
    }],
    title: {
      text: 'Load Average',
      align: 'left',
      style: {
        fontSize: '12px'
      }
    },
    subtitle: {
      text: '20%',
      floating: true,
      align: 'right',
      offsetY: 0,
      style: {
        fontSize: '22px'
      }
    },
    fill: {
      type: 'gradient',
      gradient: {
        shade: 'dark',
        type: 'vertical',
        shadeIntensity: 0.5,
        inverseColors: false,
        opacityFrom: 1,
        opacityTo: 0.8,
        stops: [0, 100]
      }
    },
    xaxis: {
      type: 'datetime',
      range: 2700000
    },
    legend: {
      show: true
    },
  }

  var chartColumn = new ApexCharts(
    document.querySelector("#columncharttest"),
    optionsColumn
  );
  chartColumn.render()

  setInterval(() => {
        chartColumn.updateSeries([{
        data: [...chartColumn.w.config.series[0].data,
            [
            chartColumn.w.globals.maxX + 300000,
            getRandom()
            ]
        ]
        }])
      var p1Data = getRangeRandom({ min: 10, max: 100 });
      chartProgress1.updateOptions({
        series: [{
          data: [p1Data]
        }],
        subtitle: {
          text: p1Data + "%"
        }
      })
    
      var p2Data = getRangeRandom({ min: 10, max: 100 });
      chartProgress2.updateOptions({
        series: [{
          data: [p2Data]
        }],
        subtitle: {
          text: p2Data + "%"
        }
      })
    
      var p3Data = getRangeRandom({ min: 10, max: 100 });
      chartProgress3.updateOptions({
        series: [{
          data: [p3Data]
        }],
        subtitle: {
          text: p3Data + "%"
        }
      })
  
      var p4Data = getRangeRandom({ min: 10, max: 100 });
      chartProgress4.updateOptions({
        series: [{
          data: [p4Data]
        }],
        subtitle: {
          text: p4Data + "%"
        }
      })
  }, 2000);
//column chart end
