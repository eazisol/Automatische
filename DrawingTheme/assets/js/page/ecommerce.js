
$(function() {
    "use strict";
    $('.owl-carousel').owlCarousel({
        loop:true,
        margin:10,
        nav:true,
        responsive:{
            0:{
                items:1
            },
            600:{
                items:2
            },
            991:{
                items:3
            },
            1200:{
                items:4
            },
            1600:{
                items:5
            }
        }
    })

});

$(function() {
    function chartLoad(){
        "use strict";
        var productchart = document.getElementById('productinfo');
        var textColor = "#555555"
        var themType = `data-theme="dark"`
        if(window.document.all[0].attributes.length > 2){
            if(window.document.all[0].attributes[2].nodeValue ==="dark"){
                textColor= '#8f8f8f'
            }
            if(window.document.all[0].attributes[2].nodeValue ==="high-contrast"){
                textColor= '#ffffff'
            }
        }
        if(productchart != null){
            var productchart = echarts.init(productchart);
            var option = {
                color: ['#80FFA5', '#00DDFF', '#37A2FF', '#FF0087', '#FFBF00'],
                title: {
                    text: ''
                },
                textStyle:{
                    color:textColor,
                },
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'cross',
                        label: {
                            backgroundColor: '#6a7985'
                        }
                    }
                },
                legend: {
                    bottom: "0",
                    data: ['Orders Received', 'Revenue', 'Income', 'Total Sales', 'New User'],
                    textStyle: {
                        color: textColor
                    }
                },
                toolbox: {
                    show: false,
                },
                grid: {
                    top:'2%',
                    left: '0',
                    right: '0',
                    bottom: '8%',
                    containLabel: true,
                    borderColor:textColor
                },
                xAxis: [
                    {
                        splitLine:{
                            show:false
                        },
                        type: 'category',
                        boundaryGap: false,
                        data: ['2015', '2016', '2017', '2018', '2019', '2020','2021']
                    }
                ],
                yAxis: [
                    {
                        splitLine:{
                            show:false
                        },
                        type: 'value'
                    }
                ],
                series: [
                    {
                        name: 'Orders Received',
                        type: 'line',
                        stack: '总量',
                        smooth: true,
                        lineStyle: {
                            width: 0
                        },
                        showSymbol: false,
                        areaStyle: {
                            opacity: 0.8,
                            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                offset: 0,
                                color: 'rgba(202,9,124)'
                            }, {
                                offset: 1,
                                color: 'rgba(149,31,143)'
                            }])
                        },
                        emphasis: {
                            focus: 'series'
                        },
                        data: [140, 232, 101, 264, 90, 340, 250]
                    },
                    {
                        name: 'Revenue',
                        type: 'line',
                        stack: '总量',
                        smooth: true,
                        lineStyle: {
                            width: 0
                        },
                        showSymbol: false,
                        areaStyle: {
                            opacity: 0.8,
                            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                offset: 0,
                                color: 'rgba(203,216,39)'
                            }, {
                                offset: 1,
                                color: 'rgba(129,188,46)'
                            }])
                        },
                        emphasis: {
                            focus: 'series'
                        },
                        data: [120, 282, 111, 234, 220, 340, 310]
                    },
                    {
                        name: 'Income',
                        type: 'line',
                        stack: '总量',
                        smooth: true,
                        lineStyle: {
                            width: 0
                        },
                        showSymbol: false,
                        areaStyle: {
                            opacity: 0.8,
                            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                offset: 0,
                                color: 'rgba(0,156,179)'
                            }, {
                                offset: 1,
                                color: 'rgba(0,167,132)'
                            }])
                        },
                        emphasis: {
                            focus: 'series'
                        },
                        data: [320, 132, 201, 334, 190, 130, 220]
                    },
                    {
                        name: 'Total Sales',
                        type: 'line',
                        stack: '总量',
                        smooth: true,
                        lineStyle: {
                            width: 0
                        },
                        showSymbol: false,
                        areaStyle: {
                            opacity: 0.8,
                            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                offset: 0,
                                color: 'rgba(173,108,174)'
                            }, {
                                offset: 1,
                                color: 'rgba(103,59,154)'
                            }])
                        },
                        emphasis: {
                            focus: 'series'
                        },
                        data: [220, 402, 231, 134, 190, 230, 120]
                    },
                    {
                        name: 'New User',
                        type: 'line',
                        stack: '总量',
                        smooth: true,
                        lineStyle: {
                            width: 0
                        },
                        showSymbol: false,
                        label: {
                            show: true,
                            position: 'top'
                        },
                        areaStyle: {
                            opacity: 0.8,
                            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                offset: 0,
                                color: 'rgba(255, 191, 0)'
                            }, {
                                offset: 1,
                                color: 'rgba(224, 62, 76)'
                            }])
                        },
                        emphasis: {
                            focus: 'series'
                        },
                        data: [220, 302, 181, 234, 210, 290, 150]
                    }
                ]
            };
            productchart.setOption(option);
            window.onresize = function() {
                productchart.resize();
            };
        }
      
    }
    $( document ).ready(function() {
        chartLoad()
        // $('#productinfo')
    });
    $('#dark').click(function() {
        // location.reload();
        setTimeout(() => {
            chartLoad();    
        }, 100);
        
     });
     $('#highcontrast').click(function() {
   
        setTimeout(() => {
            chartLoad();    
        }, 100);
        
     });
});
