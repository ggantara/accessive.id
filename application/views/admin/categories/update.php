<div class="box box-info">	
	<div class="box-header">
			<h3 class="box-title">Ubah Data Kategori</h3>	
	</div>
	<form method="POST">	
		<div class="box-body">
			<div class="form-group">
				<label for="categoryName">Nama Kategori</label>
				<input type="text" id="categoryName" class="form-control"
				placeholder="Example : Universtas" name="category_name" value="<?php echo $category['category_name']; ?>">
			</div>
		</div>
		<div class="box-footer">
		<button class="btn-primary btn btn-sm"><i class="fa fa-save"></i><span>	Simpan</span></button>
		<a href="<?php echo base_url("admin/categories"); ?>" class="btn btn-primary btn-sm">Kembali</a>	
		</div>
	</form>
</div>