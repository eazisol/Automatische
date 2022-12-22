$(document).ready(function() {
    var options = {
        chart: {
            height: 350,
            type: 'bar',
            toolbar: {
                show: false,
            },
        },
        colors: ['#ED5782', '#ffdd95', '#868e96'],
        plotOptions: {
            bar: {
                horizontal: false,
                columnWidth: '55%',
                endingVsparks: 'rounded'	
            },
        },
        dataLabels: {
            enabled: false
        },
        stroke: {
            show: true,
            width: 2,
            colors: ['transparent']
        },
        series: [{
            name: 'Total Projects',
            data: [44, 55, 57, 56, 61, 58, 63, 60, 66]
        }, {
            name: 'Completed Projects',
            data: [76, 85, 101, 98, 87, 105, 91, 114, 94]
        }, {
            name: 'Pending Projects',
            data: [35, 41, 36, 26, 45, 48, 52, 53, 41]
        }],
        xaxis: {
            categories: ['Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct'],
        },
        yaxis: {
            title: {
                text: ''
            }
        },
        fill: {
            opacity: 1

        },
        tooltip: {
            y: {
                formatter: function (val) {
                    return "$ " + val + " thousands"
                }
            }
        }
    }

    var chart = new ApexCharts(
        document.querySelector("#apex-basic-column"),
        options
    );

    chart.render();
});
