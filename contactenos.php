<?php include ('views/front/templates/head.php'); ?>
<article class="body">

  <article class="contactenos">
<h1> CONTACTANOS </h1>
  </article>

<article class="par-contac">
<div class"info-1">hola </div>
<div class"info-2"> </div>
</article>




<div id="map" style="width:98%;height:400px;background:blue;margin:15px;"></div>

<script>
function myMap() {
var mapOptions = {
    center: new google.maps.LatLng(51.5, -0.12),
    zoom: 10,
    mapTypeId: google.maps.MapTypeId.HYBRID
}
var map = new google.maps.Map(document.getElementById("map"), mapOptions);
}
</script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBu-916DdpKAjTmJNIgngS6HL_kDIKU0aU&callback=myMap"></script>



<center>
<div class="container">

  <form action="/action_page.php">

    <div class="row">

      <div class="campos">
        <label>USUARIO</label>
      </div>
      <div class="respuesta">
        <input type="text" placeholder="Tu Usuario...">
      </div>
    </div>

    <div class="row">
      <div class="campos">
        <label for="lname">ASUNTO</label>
      </div>
      <div class="respuesta">
        <input type="text" id="lname" name="lastname" placeholder="Tu Asunto...">
      </div>
    </div>

 <div class="row">
      <div class="campos">
        <label for="lname">MENSAJE</label>
      </div>
      <div class="respuesta">
        <textarea  placeholder="Tu Mensaje..."></textarea>
      </div>
    </div>


    <div class="row">
      <input class="Enviar" type="submit" value="Enviar">
    </div>
  </form>
</div>

</center>
</article>
<?php include ('views/front/templates/foot.php'); ?>