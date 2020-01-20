<h3>Dashboard</h3>
<br>
<div class="row">
  <div class="col-md-3 col-sm-6 col-xs-12">
    <a href="<?php echo base_url("admin/categories") ?>">
      <div class="info-box">
        <span class="info-box-icon bg-aqua"><i class="fa fa-list-alt"></i></span>

        <div class="info-box-content">
          <span class="info-box-text">Jumlah Kategori </span>
          <span class="info-box-number"><?php echo count($category); ?></span>
        </div>
        <!-- /.info-box-content -->
      </div>
    </a>
    <!-- /.info-box -->
  </div>
  <!-- /.col -->
  <div class="col-md-3 col-sm-6 col-xs-12">
    <a href="<?php echo base_url("admin/facilities") ?>">
      <div class="info-box">
        <span class="info-box-icon bg-green"><i class="fa fa-wheelchair"></i></span>

        <div class="info-box-content">
          <span class="info-box-text">Jumlah Fasilitas</span>
          <span class="info-box-number"><?php echo count($facility); ?></span>
        </div>
        <!-- /.info-box-content -->
      </div>
    </a>
    <!-- /.info-box -->
  </div>
  <!-- /.col -->
  <div class="col-md-3 col-sm-6 col-xs-12">
    <a href="<?php echo base_url("admin/places") ?>">
      <div class="info-box">
        <span class="info-box-icon bg-yellow"><i class="fa fa-map-marker"></i></span>

        <div class="info-box-content">
          <span class="info-box-text">Jumlah Tempat</span> <span class="info-box-number"><?php echo count($place); ?></span>
        </div>
        <!-- /.info-box-content -->
      </div>
    </a>
    <!-- /.info-box -->
  </div>
  <!-- /.col -->
  <div class="col-md-3 col-sm-6 col-xs-12">
    <a href="<?php echo base_url("admin/places") ?>">
      <div class="info-box">
        <span class="info-box-icon bg-red"><i class="fa fa-comments"></i></span>

        <div class="info-box-content">
          <span class="info-box-text">Jumlah Ulasan</span>
          <span class="info-box-number"><?php echo $review; ?></span>
        </div>
        <!-- /.info-box-content -->
      </div>
    </a>
    <!-- /.info-box -->
  </div>
  <!-- /.col -->
</div>

<div class="box box-info">
  <div class="box-header">
    <h3 class="box-title">Tempat yang telah terdata</h3>
    <h6><p>silahkan klik marker untuk melihat informasi</p></h6>
  </div>
  <div class="box-body">
    <div id="map"></div>
  </div>
</div>
<script>
  function initMap() {
    map = new google.maps.Map(
      document.getElementById('map'),
      {center: new google.maps.LatLng(-7.78278, 110.36083), zoom: 12});

      // menampilkan latitude dan longitude
      var features = [
      <?php foreach ($place as $key => $value): ?>
        {
          position: new google.maps.LatLng(<?php echo $value['latitude'] ?>,<?php echo $value['longitude'] ?>),
          id:'<?php echo $value["place_id"]; ?>',
          nama:'<?php echo $value["title"]; ?>',
          alamat:'<?php echo $value["address"]; ?>'
        },
      <?php endforeach ?>
      ];
      // Create markers.
      for (var i = 0; i < features.length; i++) {

        var marker = new google.maps.Marker({
          position: features[i].position,
          map: map
        });

        var content= "<h1>"+features[i].nama+"</h1><br/><p>"+features[i].alamat+"</p><a href='<?php echo base_url("admin/places/detail/"); ?>"+features[i].id+"'>Detail</a>";

        var infowindow = new google.maps.InfoWindow()

        google.maps.event.addListener(marker,'click', (function(marker,content,infowindow){ 
          return function() {
           infowindow.setContent(content);
           infowindow.open(map,marker);
         };
       })(marker,content,infowindow)); 
      };
    }
  </script>
  <!-- memanggil api google maps -->
  <script async defer
  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAZlgi_GjRxGAd-wPYqU9y-lp4PQSA-j1o&callback=initMap"></script>