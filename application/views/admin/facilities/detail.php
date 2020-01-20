<div class="box box-info">
	<div class="box-header">
		<h3 class="box-title">Detail Fasilitas</h3>
	</div>
	<div class="box-body">
		<table class="table" id="myTable">
			
			<tr>
				<th>Nama Fasilitas</th>
				<th>:</th>
				<td><?php echo $facilities['facility_name'] ?></td>
			</tr>
			<tr>
				<th>Informasi Fasilitas</th>
				<th>:</th>
				<td><?php echo $facilities['facility_info'] ?></td>
			</tr>
			<tr>
				<th>Lambang Fasilitas</th>
				<th>:</th>
				<td><img src="<?php echo $facilities['facility_icon']; ?>"></td>
			</tr>
			</table>

		</div>
		<div class="box-footer">
			<a href="<?php echo base_url("admin/facilities"); ?>" class="btn btn-primary btn-sm">Kembali</a>
		</div>
	</div>