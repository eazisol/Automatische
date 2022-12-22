window.Apex = {
    chart: {
      foreColor: 'var(--font-color)',
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
      borderColor: "var(--border-color)",
    },
    xaxis: {
      axisTicks: {
        color: 'var(--font-color)'
      },
      axisBorder: {
        color: "var(--font-color)"
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
      x: {
        formatter: function (val) {
          return moment(new Date(val)).format("HH:mm:ss")
        }
      }
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
  var optionsCirclewallet = {
    chart: {
      type: 'radialBar',
      height: 300,
      offsetY: 0,
      offsetX: 0,
      foreColor: 'var(--font-color)',
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

 var traffic =[] //Array(1).fill(1)
     var i = 1;
     while (i < 11) {
        traffic.push([new Date().getTime()-(8640*(11-i)),`${i*7}`])
        i++
     }

  var options33 = {
    chart: {
        height: 380,
        animations: {
            enabled: true,
            easing: "linear",
            dynamicAnimation: {
            speed: 2000
            }
        },
        toolbar: {
            show: false
        },
        zoom: {
            enabled: false
        }
    },
    stroke: {
        curve: "smooth",
        width: 5
    },
    tooltip: { enabled: false },
    xaxis: {
        labels: {
            formatter: function (value, timestamp) {
            //  console.log(value);
            return moment(new Date(value)).format("HH:mm:ss");
            }, 
        }
    },
    yaxis: [{
        min: 1,
        max: 100
    }],
    series: [
        {
        data: traffic
        }
    ]
  };
  var chart33 = new ApexCharts(document.querySelector("#stockupdate"), options33);
  chart33.render();

  
  setInterval(()=>{
    traffic.push([new Date().getTime(),(Math.random()*100).toFixed()]);
    chart33.updateSeries([
          {
            data: traffic
        
          }
        ])
  },2000);

    /***************Trending********************/
    var data = generateDayWiseTimeSeries(new Date("22-Apr-2020").getTime(), 115, {min: 30,max: 90});
    var options11 = {
        chart: {
            id: "chart22",
            type: "area",
            height: 230,
            toolbar: {
                autoSelected: "pan",
                show: false
            }
        },
        colors: ["#ffe28c"],
        stroke: {
            width: 3
        },
        grid: {
            borderColor: "#ccc",
            clipMarkers: false,
            yaxis: {
                labels:{show:false},
                lines: {
                show: false
                }
            }
        },
        dataLabels: {
        enabled: false
        },
        fill: {
            colors: '#fdebb9',
            type: "solid",
        },
        markers: {
        size: 5,
            colors: ["#ffe28c"],
            strokeColor: "#ffba56",
            strokeWidth: 3
        },
        series: [
        {
            data: data
        }
        ],
        tooltip: {
        theme: "dark"
        },
        xaxis: {
        type: "datetime",
        labels: {
            formatter: function (value, timestamp) {
                return moment(new Date(value)).format("DD MMM");
              }, 
          }
        },
        yaxis: {
            min: 0,
            tickAmount: 4,
            labels:{
                minWidth: 40
            }
        }
    };

    var chart11 = new ApexCharts(document.querySelector("#chartarea-liveprice"), options11);
    chart11.render();

    var options22 = {
        chart: {
        id: "chart11",
        height: 130,
        type: "bar",
        brush: {
            target: "chart22",
            enabled: true
        },
        selection: {
            enabled: true,
            fill: {
                color: "#f15f79",
                opacity: 0.4
            },
            stroke: {
                width: 1,
                dashArray: 3,
                color: '#b95d6d',
                opacity: 0.8
            },
            xaxis: {
                min: new Date("27-Jul-2020").getTime(),
                max: new Date("14-Aug-2020").getTime()
            }
        }
        },
        colors: ["#f15f79"],
        series: [
        {
            data: data
        }
        ],
        stroke: {
            width: 2
        },
        grid: {
            borderColor: "#fafafa"
        },
        markers: {
            size: 0
        },
        xaxis: {
            type: "datetime",
            tooltip: {
                enabled: true
            },
            labels: {
                formatter: function (value, timestamp) {
                    return moment(new Date(value)).format("DD MMM");
                  }, 
              }
        },
        yaxis: [{
            tickAmount: 2,
        }]
    };

    var chart22 = new ApexCharts(document.querySelector("#chartbar-liveprice"), options22);
    chart22.render();

    function generateDayWiseTimeSeries(baseval, count, yrange) {
        var i = 0;
        var series = [];
        while (i < count) {
        var x = baseval;
        // x = new Date(x);
        var y =
            Math.floor(Math.random() * (yrange.max - yrange.min + 1)) + yrange.min;

        series.push([x, y]);
        baseval += 86400000;
        
        i++;
        }
        return series;
    }

    $('#liveprice').owlCarousel({ 
        items:13,
        loop:true,
        margin:10,
        autoplay:true,
        autoplayTimeout:1000,
        autoplayHoverPause:true,
        responsive:{
            0:{
                items:3
            },
            480:{
                items:5
            },
            800:{
                items:5
            },
            1024:{
                items:8
            },
            1366:{
                items:10
            },
            1600:{
                items:12
            }
        }
    });