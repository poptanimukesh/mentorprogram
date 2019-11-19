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
    
    mentorData = [['Mentors Available', JSON.parse(document.getElementById('available_mentors_count').textContent)],
        ['Mentors Associated', JSON.parse(document.getElementById('associated_mentors_count').textContent)]]  
    generateStatisticsChart('mentorStatistics', 'Mentor<br/>Statistics<br/>', 'Mentor Statistics', mentorData);

    menteeData = [['Mentees Available', JSON.parse(document.getElementById('active_mentees_count').textContent)],
        ['Mentees Associated', JSON.parse(document.getElementById('associated_mentees_count').textContent)]]  
    generateStatisticsChart('menteeStatistics', 'Mentee<br/>Statistics<br/>', 'Mentee Statistics', menteeData);

});