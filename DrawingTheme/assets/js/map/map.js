
$(function() {
    "use strict";

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

        $('#india_map').vectorMap({
            map : 'in_mill',
            backgroundColor : 'transparent',
            regionStyle : {
                initial : {
                    fill : '#ff7b54'
                }
            }
        });    
        
        $('#usa_map').vectorMap({
            map : 'us_aea_en',
            backgroundColor : 'transparent',
            regionStyle : {
                initial : {
                    fill : '#f3f2da'
                }
            }
        });

        $('#au_map').vectorMap({
            map : 'au_mill',
            backgroundColor : 'transparent',
            regionStyle : {
                initial : {
                    fill : '#4e8d7c'
                }
            }
        });
                
        $('#uk_map').vectorMap({
            map : 'uk_mill_en',
            backgroundColor : 'transparent',
            regionStyle : {
                initial : {
                    fill : '#045762'
                }
            }
        });    
    }
});