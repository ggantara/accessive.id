<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Accessive Admin</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="<?php echo base_url("assets/bower_components/bootstrap/dist/css/bootstrap.min.css"); ?>">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<?php echo base_url("assets/bower_components/font-awesome/css/font-awesome.min.css"); ?>">
  <!-- Ionicons -->
  <link rel="stylesheet" href="<?php echo base_url("assets/bower_components/Ionicons/css/ionicons.min.css"); ?>">
  <!-- Theme style -->
  <link rel="stylesheet" href="<?php echo base_url("assets/dist/css/AdminLTE.min.css"); ?>">
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect. -->
        <link rel="stylesheet" href="<?php echo base_url("assets/dist/css/skins/skin-blue.min.css"); ?>">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap.min.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

<!-- Google Font -->
<link rel="stylesheet"
href="<?php echo base_url("https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"); ?>">
</head>
<style>
 /* Set the size of the div element that contains the map */
 #map, #peta {
  height: 400px;  /* The height is 400 pixels */
  width: 100%;  /* The width is the width of the web page */
}
</style>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition skin-blue sidebar-mini">
  <div class="wrapper">

    <!-- Main Header -->
    <header class="main-header">

      <!-- Logo -->
      <a href="<?php echo base_url("admin") ?>" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <!-- <span class="logo-mini"><b>A</b>LT</span> -->
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>Accessive</b></span>
      </a>

      <!-- Header Navbar -->
      <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
          <span class="sr-only">Toggle navigation</span>
        </a>
        <!-- Navbar Right Menu -->

      </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">

      <!-- sidebar: style can be found in sidebar.less -->
      <section class="sidebar">

        <!-- Sidebar user panel (optional) -->
        <div class="user-panel">
          <h3 style="color:#eeee;" class="text-center">Admin</h3>


        </div>


        <!-- /.search form -->

        <!-- Sidebar Menu -->
        <ul class="sidebar-menu" data-widget="tree">
          <!-- <li class="header">HEADER</li> -->
          <!-- Optionally, you can add icons to the links -->
          <li class="<?php if(!$this->uri->segment(2)){echo"active";} ?>"><a href="<?php echo base_url("admin") ?>"><i class="fa fa-home"></i> <span>Dashboard</span></a></li>

          <li class="<?php if($this->uri->segment(2)=='places'){echo"active";} ?>"><a href="<?php echo base_url("admin/places"); ?>"><i class="fa fa-map-marker"></i> <span>Data Tempat</span></a></li>
          <li class="<?php if($this->uri->segment(2)=='categories'){echo"active";} ?>"><a href="<?php echo base_url("admin/categories"); ?>"> <i class="fa fa-list-alt"></i> <span>Data Kategori</span></a></li>
          <li class="<?php if($this->uri->segment(2)=='facilities'){echo"active";} ?>"><a href="<?php echo base_url("admin/facilities"); ?>"><i class="fa fa-wheelchair"></i> <span>Data Fasilitas</span></a></li>
            <li class="<?php if($this->uri->segment(2)=='logout'){echo"active";} ?>"><a href="<?php echo base_url("admin/logout"); ?>"><i class="fa fa-sign-out"></i> <span>Keluar</span></a></li>

        </ul>
        <!-- /.sidebar-menu -->
      </section>
      <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">


      <!-- Main content -->
      <section class="content container-fluid">

      <!--------------------------
        | Your Page Content Here |
        -------------------------->
        <?php echo $konten; ?>

      </section>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <footer class="main-footer">
      <!-- To the right -->
      <div class="pull-right hidden-xs">

      </div>
      <!-- Default to the left -->
      <strong>Copyright &copy; 2019 <a href="#">Accessive</a>. </strong> All rights reserved.
    </footer>

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
      <!-- Create the tabs -->
      <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
        <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
        <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
      </ul>
      <!-- Tab panes -->
      <div class="tab-content">
        <!-- Home tab content -->

        <!-- /.tab-pane -->
        <!-- Stats tab content -->
        <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
        <!-- /.tab-pane -->
        <!-- Settings tab content -->
        <div class="tab-pane" id="control-sidebar-settings-tab">
          <form method="post">
            <h3 class="control-sidebar-heading">General Settings</h3>

            <div class="form-group">
              <label class="control-sidebar-subheading">
                Report panel usage
                <input type="checkbox" class="pull-right" checked>
              </label>

              <p>
                Some information about this general settings option
              </p>
            </div>
            <!-- /.form-group -->
          </form>
        </div>
        <!-- /.tab-pane -->
      </div>
    </aside>
    <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
    immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
  </div>
  <!-- ./wrapper -->

  <!-- REQUIRED JS SCRIPTS -->

  <!-- jQuery 3 -->
  <script src="<?php echo base_url("assets/bower_components/jquery/dist/jquery.min.js"); ?>"></script>
  <!-- Bootstrap 3.3.7 -->
  <script src="<?php echo base_url("assets/bower_components/bootstrap/dist/js/bootstrap.min.js"); ?>"></script>
  <!-- AdminLTE App -->
  <script src="<?php echo base_url("assets/dist/js/adminlte.min.js"); ?>"></script>
  <script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap.min.js"></script>

  <script>
    $('#myTable').DataTable({
      autoFill: true
    });
  </script>


</body>
</html>