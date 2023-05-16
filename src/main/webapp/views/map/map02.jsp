<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
  #map02 > #map{
    width: 500px;
    height: 500px;
    border: 2px solid red;
  }
</style>
<script>
  //seoul 37.5446864 127.0582152
  //seoul 37.5466178 126.8748256
  //daegu 35.8716822 128.5646302
  //jeju 33.4546419 126.7179249

  let map02 = {
    map : null,
    init : function (){
      this.display();
      $('#s_btn').click(function (){
        map02.go(37.5466178, 126.8748256);
      });
      $('#d_btn').click(function (){
        map02.go(35.8716822, 128.5646302);
      });
      $('#j_btn').click(function (){
        map02.go(33.4546419, 126.7179249);
      });
    },
    display : function (){
      var mapContainer = document.querySelector('#map02 > #map');
      var mapOption = {
        center: new kakao.maps.LatLng(37.5446864, 127.0582152),
        level: 5 // 지도의 확대 레벨
      };
      map = new kakao.maps.Map(mapContainer, mapOption);
      var mapTypeControl = new kakao.maps.MapTypeControl();
      map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
      var zoomControl = new kakao.maps.ZoomControl();
      map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

      var markerPosition  = new kakao.maps.LatLng(37.5446864, 127.0582152);
      var marker = new kakao.maps.Marker({
        position: markerPosition
      });
      marker.setMap(map);
    },
    go:function (lat,lng){
      var moveLatLon = new kakao.maps.LatLng(lat,lng);
      map.panTo(moveLatLon);

      var markerPosition  = new kakao.maps.LatLng(lat,lng);
      var marker = new kakao.maps.Marker({
        position: markerPosition
      });
      marker.setMap(map);
    }
  };
  $(function(){
    map02.init();
  })
</script>

<div class="col-sm-8 text-left">
  <div class="container" id="map02">
    <h3>MAP02</h3>
    <button id="s_btn" type="button" class="btn btn-primary">Seoul</button>
    <button id="d_btn" type="button" class="btn btn-primary">Daegu</button>
    <button id="j_btn" type="button" class="btn btn-primary">Jeju</button>
    <div id="map"></div>
  </div>
</div>