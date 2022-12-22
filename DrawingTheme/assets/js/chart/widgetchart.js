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
        color: '#333'
      },
      axisBorder: {
        color: "#333"
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
  
  var optionsLine = {
    chart: {
      height: 350,
      type: 'line',
      stacked: true,
      foreColor: '#555555',
      animations: {
        enabled: true,
        easing: 'linear',
        dynamicAnimation: {
          speed: 1000
        }
      },
      dropShadow: {
        enabled: true,
        opacity: 0.3,
        blur: 5,
        left: -7,
        top: 22
      },
      events: {
        animationEnd: function (chartCtx, opts) {
          const newData1 = chartCtx.w.config.series[0].data.slice()
          newData1.shift()
          const newData2 = chartCtx.w.config.series[1].data.slice()
          newData2.shift()
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
      curve: 'straight',
      width: 5,
    },
    grid: {
      padding: {
        left: 0,
        right: 0
      }
    },
    markers: {
      size: 0,
      hover: {
        size: 0
      }
    },
    series: [{
      name: 'Online',
      data: generateMinuteWiseTimeSeries(new Date("12/12/2021 00:20:00").getTime(), 12, {
        min: 30,
        max: 110
      })
    }, {
      name: 'Store',
      data: generateMinuteWiseTimeSeries(new Date("12/12/2021 00:20:00").getTime(), 12, {
        min: 30,
        max: 110
      })
    }],
    xaxis: {
      type: 'datetime',
      range: 2700000,
    },
    title: {
      text: 'Processes',
      align: 'left',
      style: {
        fontSize: '14px',
      }
    },
    subtitle: {
      text: '20',
      floating: true,
      align: 'right',
      offsetY: 0,
      style: {
        fontSize: '22px',
      }
    },
    legend: {
      show: true,
      floating: true,
      horizontalAlign: 'left',
      onItemClick: {
        toggleDataSeries: false
      },
      position: 'top',
      offsetY: -35,
      offsetX: 60,
    },
  }
  
  var chartLine = new ApexCharts(
    document.querySelector("#linechart"),
    optionsLine
  );
  chartLine.render()
  
  var optionsCircle = {
    chart: {
      type: 'radialBar',
      height: 320,
      offsetY: 10,
      offsetX: 20,
      foreColor: '#555555',
    },
    plotOptions: {
      radialBar: {
        size: undefined,
        inverseOrder: false,
        hollow: {
          margin: 5,
          size: '48%',
          background: 'transparent',
        },
        track: {
          show: true,
          background: '#ccc',
          strokeWidth: '10%',
          opacity: 1,
          margin: 3, // margin is in pixels
        },
      },
    },
    series: [71, 63, 54],
    labels: ['Facebook', 'Youtube','DirectSearch'],
    dataLabels: {
        style: {
          colors: ['#F44336']
        }
    },
    legend: {
      show: true,
      position: 'top',
      offsetX: -30,
      offsetY: -5,
      formatter: function (val, opts) {
        return val + " - " + opts.w.globals.series[opts.seriesIndex] + '%'
      }
    },
    fill: {
      type: 'gradient',
      gradient: {
        shade: 'dark',
        type: 'horizontal',
        shadeIntensity: 0.5,
        inverseColors: true,
        opacityFrom: 1,
        opacityTo: 1,
        stops: [0, 100]
      }
    }
  }
  
  var chartCircle = new ApexCharts(document.querySelector('#circlechart'), optionsCircle);
  chartCircle.render();


  
  setInterval(function () {
    iteration++;
    chartLine.updateSeries([{
      data: [...chartLine.w.config.series[0].data,
        [
          chartLine.w.globals.maxX + 300000,
          getRandom()
        ]
      ]
    }, {
      data: [...chartLine.w.config.series[1].data,
        [
          chartLine.w.globals.maxX + 300000,
          getRandom()
        ]
      ]
    }])
  
  }, 3000);

  setInterval(() => {
    chartCircle.updateSeries([getRangeRandom({ min: 10, max: 100 }), getRangeRandom({ min: 10, max: 100 }), getRangeRandom({ min: 10, max: 100 })]);
  }, 2500);
  
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
      name: 'Coffee Cup',
      data: [44]
    }],
    title: {
      floating: true,
      offsetX: -10,
      offsetY: 5,
      text: 'Coffee Cup'
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
      categories: ['Coffee Cup'],
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
      name: 'Historical Books',
      data: [80]
    }],
    title: {
      floating: true,
      offsetX: -10,
      offsetY: 5,
      text: 'Historical Books'
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
      categories: ['Historical Books'],
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
      name: 'Table Clock',
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
      text: 'Table Clock'
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
      categories: ['Table Clock'],
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
      name: 'Door Stand',
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
      text: 'Door Stand'
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
      categories: ['Door Stand'],
    },
    yaxis: {
      max: 100
    },
  }
  
  var chartProgress4 = new ApexCharts(document.querySelector('#progress4'), optionsProgress4);
  chartProgress4.render();
  //progerss chart 1 to 4 end

  var optionsCirclewallet = {
    chart: {
      type: 'radialBar',
      height: 300,
      offsetY: 0,
      offsetX: 0,
      foreColor: '#555555',
    },
    plotOptions: {
      radialBar: {
        size: undefined,
        inverseOrder: false,
        hollow: {
          margin: 5,
          size: '48%',
          background: 'transparent',
        },
        track: {
          show: true,
          background: '#ccc',
          strokeWidth: '10%',
          opacity: 1,
          margin: 3, // margin is in pixels
        },
      },
    },
    series: [71, 63, 54],
    labels: ['Ethereum', 'Bitcoin','Litecoin'],
    dataLabels: {
        style: {
          colors: ['#F44336']
        }
    },
    legend: {
      show: true,
      position: 'bottom',
      offsetX: 0,
      offsetY: 0,
      formatter: function (val, opts) {
        return val + " - " + opts.w.globals.series[opts.seriesIndex] + '%'
      }
    },
    fill: {
      type: 'gradient',
      gradient: {
        shade: 'dark',
        type: 'horizontal',
        shadeIntensity: 0.5,
        inverseColors: true,
        opacityFrom: 1,
        opacityTo: 1,
        stops: [0, 100]
      }
    }
  }
  
  var chartCirclewallet = new ApexCharts(document.querySelector('#circlechartwallet'), optionsCirclewallet );
  chartCirclewallet.render();

  setInterval(() => {
    chartCirclewallet.updateSeries([getRangeRandom({ min: 10, max: 100 }), getRangeRandom({ min: 10, max: 100 }), getRangeRandom({ min: 10, max: 100 })])    
  }, 2600);