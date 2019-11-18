$(document).ready(function() {
    $('#home').addClass('active');
    
    var generateStatisticsChart = function(id, title, name, data) {
        Highcharts.chart(id, {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: 0,
            plotShadow: false
        },
        title: {
            text: title,
            align: 'center',
            verticalAlign: 'middle',
            y: 60
        },
        tooltip: {
            formatter: function() {
                return this.series.name + ': <b>'+ Highcharts.numberFormat(this.point.percentage , 2) + '%</b> <br/> <b>Count:</b>'+this.point.y;
            }
        },
        plotOptions: {
            pie: {
                dataLabels: {
                    enabled: true,
                    distance: -50,
                    style: {
                        fontWeight: 'bold',
                        color: 'white'
                    }
                },
                startAngle: -90,
                endAngle: 90,
                center: ['50%', '75%'],
                size: '110%'
            }
        },
        series: [{
            type: 'pie',
            name: name,
            innerSize: '50%',
            data: data
        }]
    });
    }

    var gaugeOptions = {
        chart: {
            type: 'solidgauge'
        },

        title: null,

        pane: {
            center: ['50%', '85%'],
            size: '140%',
            startAngle: -90,
            endAngle: 90,
            background: {
                backgroundColor:
                    Highcharts.defaultOptions.legend.backgroundColor || '#EEE',
                innerRadius: '60%',
                outerRadius: '100%',
                shape: 'arc'
            }
        },

        exporting: {
            enabled: false
        },

        tooltip: {
            enabled: false
        },
        yAxis: {
            stops: [
                [0.1, '#55BF3B'], // green
                [0.5, '#DDDF0D'], // yellow
                [0.9, '#DF5353'] // red
            ],
            lineWidth: 0,
            tickWidth: 0,
            minorTickInterval: null,
            title: {
                y: -70
            },
            labels: {
                y: 16
            }
        },

        plotOptions: {
            solidgauge: {
                dataLabels: {
                    y: 5,
                    borderWidth: 0,
                    useHTML: true
                }
            }
        }
    };
    
    var associated_mentors = parseInt(JSON.parse(document.getElementById('associated_mentors_count').textContent), 10)
    Highcharts.chart('reportStatistics', Highcharts.merge(gaugeOptions, {
        yAxis: {
            min: 0,
            max: associated_mentors,
            title: {
                text: 'Mentor Reports Submission'
            }
        },

        series: [{
            name: 'Mentor Reports Submission',
            data: [JSON.parse(document.getElementById('reports_submitted_count').textContent)],
            dataLabels: {
                format:
                    '<div style="text-align:center">' +
                    '<span style="font-size:25px">{y}</span>' +
                    '<span style="font-size:12px;opacity:0.4">' +
                    '</span>' +
                    '</div>'
            },
            tooltip: {
                valueSuffix: ' revolutions/min'
            }
        }]
    }));


    mentorData = [['Mentors Available', JSON.parse(document.getElementById('available_mentors_count').textContent)],
        ['Mentors Associated', JSON.parse(document.getElementById('associated_mentors_count').textContent)]]  
    generateStatisticsChart('mentorStatistics', 'Mentor<br/>Statistics<br/>', 'Mentor Statistics', mentorData);


    menteeData = [['Mentees Available', JSON.parse(document.getElementById('active_mentees_count').textContent)],
        ['Mentees Associated', JSON.parse(document.getElementById('associated_mentees_count').textContent)]]  
    generateStatisticsChart('menteeStatistics', 'Mentee<br/>Statistics<br/>', 'Mentee Statistics', menteeData);


});