<div class="box box-info">
	<div class="box-header">
		<h3 class="box-title">Data Fasilitas</h3>
	</div>

	<form method="POST">
		<div class="box-body">
			<div class="form-group">
			<label>Pilih fasilitas yang tersedia</label>
			<?php foreach ($facilities as $key => $value): ?>
				<div style="padding: 10px;border: 1px solid #c5c5c5;margin-bottom: 5px;">
					<input type="checkbox" name="facilities[<?php echo $value['facility_id'] ?>]" <?php if(in_array($value['facility_id'],$place_facility)){echo "checked";} ?>><?php echo $value['facility_name'] ?>
				</div>
			<?php endforeach ?>
		</div>
		</div>
		<div class="box-footer">
			<button class="btn-primary btn btn-sm"><i class="fa fa-save"></i><span>	Simpan</span></button>	
		</div>
	</form>
</div>