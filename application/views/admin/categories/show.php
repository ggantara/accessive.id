<div class="box box-info">
	<div class="box-header">
		<h3 class="box-title">Data Kategori</h3>
	</div>
	<div class="box-body">
		<table class="table" id="myTable">
			<thead>	
				<tr>	
					<th>no</th>
					<th>Nama Kategori</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<?php foreach ($categories as $key => $value): ?>
					<tr>
					<td><?php echo $key+1; ?></td>
					<td><?php echo $value['category_name']; ?></td>
					<td>	
							<a href="<?php echo base_url("admin/categories/update/".$value['category_id']) ?>">Ubah</a>

							<span>|</span>

							<a href="<?php echo base_url("admin/categories/delete/".$value['category_id']) ?>"
							onclick="return confirm('Are you sure want to delete?')">Hapus</a>
					</td>
				</tr>
				<?php endforeach ?>
			</tbody>
		</table>

	</div>
	<div class="box-footer">
		<a href="<?php echo base_url("admin/categories/create"); ?>" class="btn btn-primary btn-sm">Tambah Kategori Baru</a>
	</div>
</div>