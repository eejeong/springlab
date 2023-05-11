<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
  #map01 > #map{
    width: 400px;
    height: 400px;
    border: 2px solid red;
  }
</style>

<script>
  let map01= {
    map:null,
    init:function (){
      var mapContainer = document.querySelector('#map');// 지도를 표시할 div
      var mapOption = {
          center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
          level: 3 // 지도의 확대 레벨
        };
        map = new kakao.maps.Map(mapContainer, mapOption);

        var mapTypeControl = new kakao.maps.MapTypeControl();
        map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
        var zoomControl = new kakao.maps.ZoomControl();
        map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

      // 마커가 표시될 위치입니다
      var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667);
      // 마커를 생성합니다
      var marker = new kakao.maps.Marker({
        position: markerPosition
      });
      // 마커가 지도 위에 표시되도록 설정합니다
      marker.setMap(map);

      // 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
      var iwContent = '<img src="/img/nature.jpg" style="width:80px"><div style="padding:5px;">Hello Kakao!</div>';

      // 인포윈도우를 생성합니다
      var infowindow = new kakao.maps.InfoWindow({
        content : iwContent
      });

      // 마커에 마우스오버 이벤트를 등록합니다
      kakao.maps.event.addListener(marker, 'mouseover', function() {
        // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
        infowindow.open(map, marker);
      });

      kakao.maps.event.addListener(marker, 'mouseout', function() {
        // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
        infowindow.close();
      });

      kakao.maps.event.addListener(marker, 'click', function() {
        location.href='http://www.nate.com';
      });
    }
  };
  $(function (){
    map01.init();
  })
</script>

<div class="col-sm-8 text-left">
  <div class="container" id="map01">
    <h3>MAP01</h3>
    <div id="map"></div>
  </div>
</div>