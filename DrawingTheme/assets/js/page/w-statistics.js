$(function() {

    "use strict";

    // block-header bar chart js

    $('.chart_1').sparkline('html', {

        type: 'bar',

        height: '80px',

        barSpacing: 7,

        barWidth: 3,

        barColor: '#467fcf',        

    });

    $('.chart_2').sparkline('html', {

        type: 'pie',

        offset: 90,

        width: '80px',

        height: '80px',

        sliceColors: ['#2bcbba', '#de5d83', '#ffc107']

    });

    $('.chart_3').sparkline('html', {

        type: 'bar',

        height: '80px',

        barSpacing: 7,

        barWidth: 3,

        barColor: '#28a745',        

    });

    $('.chart_4').sparkline('html', {

        type: 'bar',

        height: '80px',

        barSpacing: 7,

        barWidth: 3,

        barColor: '#45aaf2',        

    });

    $('.sparkline_analysis').sparkline('html', {

        type: 'bar',

        height: '30px',

        barSpacing: 10,

        barWidth: 3,

        barColor: '#45aaf2',        

    });

    $('.Popular_Cryptocurrency').sparkline('html', {

        type: 'pie',

        offset: 90,

        width: '160px',

        height: '160px',

        sliceColors: ['#f8921a', '#6fb92c', '#157dd1']

    })

    $('.sparkline_Crypto').sparkline('html', {

        type: 'bar',

        height: '30px',

        barSpacing: 5,

        barWidth: 5,

        barColor: '#467fcf',        

    });

    // BTC =================

    $('#w_bitcoin').sparkline([155, 161, 170, 205, 198, 245, 279, 301, 423], {

        type: 'line',

        width: '100%',

        height: '380',

        chartRangeMax:100,

        resize: true,

        lineColor: '#ffc107',

        fillColor: '#ffdd95',

        highlightLineColor: 'rgba(0,0,0, .1)',

        highlightSpotColor: 'rgba(0,0,0, .2)',

    });    

    $('#w_bitcoin').sparkline([4, 5, 7, 5, 10, 12, 22, 32, 41, 32], {

        type: 'line',

        width: '100%',

        height: '280',

        chartRangeMax: 100,

        lineColor: '#fb3a71',

        fillColor: '#ED5782',

        composite: true,

        resize: true,

        highlightLineColor: 'rgba(0,0,0, .1)',

        highlightSpotColor: 'rgba(0,0,0, .2)',

    });

    $('.sale_Weekly').sparkline('html', {

        type: 'bar',

        height: '30px',

        barSpacing: 5,

        barWidth: 5,

        barColor: '#007bff',        

    });

    $('.sale_Monthly').sparkline('html', {

        type: 'bar',

        height: '30px',

        barSpacing: 6,

        barWidth: 2,

        barColor: '#28a745',        

    });
    
    $('.knob').knob({

        draw: function () {

        }

    });



    $('.knob2').knob({

        'format' : function (value) {

            return value + '%';

         }

    });



    var chart = c3.generate({

        bindto: '#User_Statistics', // id of chart wrapper

        data: {

            columns: [

                // each columns data

                ['data1', 7.0, 6.9, 9.5, 14.5, 18.4, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 24.6],

                ['data2', 3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8],

                ['data3', 14.2, 10.3, 11.9, 15.2, 17.0, 16.6, 6.6, 4.8, 3.9, 4.2, 5.7, 8.5],

            ],

            labels: true,

            type: 'line', // default type of chart

            colors: {

                'data1': buzzer.colors["orange"],

                'data2': buzzer.colors["green"],

                'data3': buzzer.colors["gray-light"]

            },

            names: {

                // name of each serie

                'data1': 'Bitcoin',

                'data2': 'NEO',

                'data3': 'ETH'

            }

        },

        axis: {

            x: {

                type: 'category',

                // name of each category

                categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun']

            },

        },

        legend: {

            show: true, //hide legend

        },

        padding: {

            bottom: 10,

            top: 0

        },

    });

    var chart = c3.generate({

        bindto: '#chart_donut', // id of chart wrapper

        data: {

            columns: [

                // each columns data

                ['data1', 35],

                ['data2', 25],

                ['data3', 20],

                ['data4', 15],

                ['data5', 5]

            ],               



            type: 'donut', // default type of chart

            colors: {

                'data1': buzzer.colors["blue"],

                'data2': buzzer.colors["green"],

                'data3': buzzer.colors["indigo"],

                'data4': buzzer.colors["orange"],

                'data5': buzzer.colors["cyan"]

            },

            names: {

                // name of each serie

                'data1': 'US',

                'data2': 'Canada',

                'data3': 'UK',

                'data4': 'India',

                'data5': 'Aus'

            }

        },

        axis: {

        },

        legend: {

            show: true, //hide legend

        },

        padding: {

            bottom: 20,

            top: 0

        },

    });

    var chart = c3.generate({

        bindto: '#chart-pie', // id of chart wrapper

        data: {

            columns: [

                // each columns data

                ['data1', 67],

                ['data2', 33],

            ],

            type: 'pie', // default type of chart

            colors: {

                'data1': buzzer.colors["azure"],

                'data2': buzzer.colors["pink"],

            },

            names: {

                // name of each serie

                'data1': 'Male',

                'data2': 'Female',

            }

        },

        axis: {

        },

        legend: {

            show: true, //hide legend

        },

        padding: {

            bottom: 15,

            top: 0

        },

    });

    if( $('#world-map-markers').length > 0 ){

        $('#world-map-markers').vectorMap(

        {

            map: 'world_mill_en',

            backgroundColor: 'transparent',

            borderColor: '#fff',

            borderOpacity: 0.25,

            borderWidth: 0,

            color: '#e6e6e6',

            regionStyle : {

                initial : {

                fill : '#e9ecef'

                }

            },



            markerStyle: {

            initial: {

                        r: 5,

                        'fill': '#fff',

                        'fill-opacity':1,

                        'stroke': '#000',

                        'stroke-width' : 1,

                        'stroke-opacity': 0.4

                    },

                },

        

            markers : [{

                latLng : [21.00, 78.00],

                name : 'INDIA : 350'

            

            },

                {

                latLng : [-33.00, 151.00],

                name : 'Australia : 250'

                

            },

                {

                latLng : [36.77, -119.41],

                name : 'USA : 250'

                

            },

                {

                latLng : [55.37, -3.41],

                name : 'UK   : 250'

                

            },

                {

                latLng : [25.20, 55.27],

                name : 'UAE : 250'

            

            }],



            series: {

                regions: [{

                    values: {

                        "US": '#FFAF9F',

                        "SA": '#42ACFF',

                        "AU": '#F3EED9',

                        "IN": '#fd9644',

                        "GB": '#FFE9EA',

                    },

                    attribute: 'fill'

                }]

            },

            hoverOpacity: null,

            normalizeFunction: 'linear',

            zoomOnScroll: false,

            scaleColors: ['#000000', '#000000'],

            selectedColor: '#000000',

            selectedRegions: [],

            enableZoom: false,

            hoverColor: '#fff',

        });

    }

});
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
