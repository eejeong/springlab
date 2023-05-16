<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- <style>
#c1, #c2, #c3{
width: 300px;
height: 300px;
border: 2px solid blue;
margin: 0px 10px;
}
</style> -->
<script>
  let chart03 = {
    init : function (){
      this.getdata1();
      this.getdata2();
      this.getdata3();
    },
    getdata1 : function (){
      $.ajax({
        url: '/chart0301',
        success : function(result){
          chart03.display1(result);
        }
      });
    },
    getdata2 : function (){
      $.ajax({
        url: '/chart0302',
        success : function(result){
          chart03.display2(result);
        }
      });
    },
    getdata3 : function (){
      $.ajax({
        url: '/chart0303',
        success : function(result){
          chart03.display3(result);
        }
      });
    },

    display1 : function (result){
      Highcharts.chart('c1', {
        chart: {
          type: 'pie',
          options3d: {
            enabled: true,
            alpha: 45
          }
        },
        title: {
          text: 'Beijing 2022 gold medals by country',
          align: 'left'
        },
        subtitle: {
          text: '3D donut in Highcharts',
          align: 'left'
        },
        plotOptions: {
          pie: {
            innerSize: 100,
            depth: 45
          }
        },
        series: [{
          name: 'Medals',
          data: result
        }]
      });

    },
    display2 : function (result){
      Highcharts.chart('c2', {
        chart: {
          type: 'column'
        },
        title: {
          text: 'World\'s largest cities per 2021'
        },
        subtitle: {
          text: 'Source: <a href="https://worldpopulationreview.com/world-cities" target="_blank">World Population Review</a>'
        },
        xAxis: {
          type: 'category',
          labels: {
            rotation: -45,
            style: {
              fontSize: '13px',
              fontFamily: 'Verdana, sans-serif'
            }
          }
        },
        yAxis: {
          min: 0,
          title: {
            text: 'Population (millions)'
          }
        },
        legend: {
          enabled: false
        },
        tooltip: {
          pointFormat: 'Population in 2021: <b>{point.y:.1f} millions</b>'
        },
        series: [{
          name: 'Population',
          data: result,
          dataLabels: {
            enabled: true,
            rotation: -90,
            color: '#FFFFFF',
            align: 'right',
            format: '{point.y:.1f}', // one decimal
            y: 10, // 10 pixels down from the top
            style: {
              fontSize: '13px',
              fontFamily: 'Verdana, sans-serif'
            }
          }
        }]
      });
    },
    display3 : function (result){
      Highcharts.chart('c3', {
        chart: {
          type: 'pie',
          options3d: {
            enabled: true,
            alpha: 45,
            beta: 0
          }
        },
        title: {
          text: 'Global smartphone shipments market share, Q1 2022',
          align: 'left'
        },
        subtitle: {
          text: 'Source: ' +
                  '<a href="https://www.counterpointresearch.com/global-smartphone-share/"' +
                  'target="_blank">Counterpoint Research</a>',
          align: 'left'
        },
        accessibility: {
          point: {
            valueSuffix: '%'
          }
        },
        tooltip: {
          pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
          pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            depth: 35,
            dataLabels: {
              enabled: true,
              format: '{point.name}'
            }
          }
        },
        series: [{
          type: 'pie',
          name: 'Share',
          data: result
        }]
      });
    }
  };
  $(function (){
    chart03.init();
  })
</script>

<div class="col-sm-8 text-left">
  <div class="container">
    <h3>Chart03</h3>
    <div class="row">
      <div class="col-sm-4" id="c1" class="well"></div>
      <div class="col-sm-4" id="c2" class="well"></div>
      <div class="col-sm-4" id="c3" class="well"></div>
    </div>
  </div>
</div>