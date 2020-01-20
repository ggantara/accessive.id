<div class="box box-info">
	<div class="box-header">
		<h3 class="box-title">users</h3>
	</div>
	<div class="box-body">
		<table class="table" id="myTable">
			<thead>	
				<tr>	
					<th>no</th>
					<th>Category Name</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<?php foreach ($users as $key => $value): ?>
					<tr>
					<td><?php echo $key+1; ?></td>
					<td><?php echo $value['category_name']; ?></td>
					<td>	
							<a href="<?php echo base_url("admin/users/update/".$value['category_id']) ?>">Update</a>

							<span>|</span>

							<a href="<?php echo base_url("admin/users/delete/".$value['category_id']) ?>"
							onclick="return confirm('Are you sure want to delete?')">Delete</a>
					</td>
				</tr>
				<?php endforeach ?>
			</tbody>
		</table>

	</div>
	<div class="box-footer">
		<a href="<?php echo base_url("admin/users/create"); ?>" class="btn btn-primary btn-sm">Create</a>
	</div>
</div>