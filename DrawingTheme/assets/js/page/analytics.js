$(function() {
    "use strict";
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

  $(document).ready(function() {
        var randomizeArray = function (arg) {
            var array = arg.slice();
            var currentIndex = array.length,
            temporaryValue, randomIndex;

            while (0 !== currentIndex) {  
                randomIndex = Math.floor(Math.random() * currentIndex);
                currentIndex -= 1;

                temporaryValue = array[currentIndex];
                array[currentIndex] = array[randomIndex];
                array[randomIndex] = temporaryValue;
            }  
            return array;
        }
        /***************sparkline********************/
        // data for the sparklines that appear below header area
        var sparklineData = [47, 45, 54, 38, 56, 24, 65, 31, 37, 39, 62, 51, 35, 41, 35, 27, 93, 53, 61, 27, 54, 43, 19, 46];

        // topb big chart    
        var spark1 = {
            chart: {
                type: 'area',
                height: 100,
                sparkline: {
                enabled: true
                },
            },
            stroke: {
                width: 2
            },
            series: [{
                data: randomizeArray(sparklineData)
            }],
            colors: ['#ffba56'],
            fill: {
                colors: '#ffe28c',
                type: 'solid'
            },
            title: {
                offsetX: 0,
                style: {
                    fontSize: '24px',
                    cssClass: 'apexcharts-yaxis-title'
                }
            },
            subtitle: {
                offsetX: 0,
                style: {
                    fontSize: '14px',
                    cssClass: 'apexcharts-yaxis-title'
                }
            }
        }
        var spark1 = new ApexCharts(document.querySelector("#apexsparkbigone"), spark1);
        spark1.render();

        var spark2 = {
            chart: {
                type: 'area',
                height: 100,
                sparkline: {
                enabled: true
                },
            },
            stroke: {
                width: 2
            },
            series: [{
                data: randomizeArray(sparklineData)
            }],
            colors: ['#84c0ec'],
            fill: {
                colors: '#a7daff',
                type: 'solid'
            },
            title: {
                offsetX: 0,
                style: {
                    fontSize: '24px',
                    cssClass: 'apexcharts-yaxis-title'
                }
            },
            subtitle: {
                offsetX: 0,
                style: {
                    fontSize: '14px',
                    cssClass: 'apexcharts-yaxis-title'
                }
            }
        }
        var spark2 = new ApexCharts(document.querySelector("#apexsparkbigtwo"), spark2);
        spark2.render();
    });
});

