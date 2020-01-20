<div class="box box-info">
	<div class="box-header"><h1>Ulasan dari Pengguna</h1></div>
	<div class="box-body">
		<ul class="timeline timeline-inverse">
			<?php foreach ($reviews as $key => $value): ?>

				<li class="time-label">
					<span class="bg-red">
						<?php echo date("d M. Y", strtotime($value['created'])); ?>
					</span>
				</li>
				<li>
					<i class="fa fa-comments bg-yellow"></i>

					<div class="timeline-item">
						<span class="time"><i class="fa fa-clock-o"></i> <?php echo date("H: i", strtotime($value['created'])); ?></span>

						<h3 class="timeline-header"><a href="#"><?php echo $value['user_id']; ?></a> memberikan ulasan</h3>

						<div class="timeline-body">
							<?php echo $value['review_description']; ?>
						</div>
						<div class="timeline-footer">
							<?php for ($i=1; $i <=$value['review_rating'];$i++):?>
								<i class="fa fa-star" style="color: gold;"></i>
							<?php endfor ?>
						</div>
					</div>
				</li>

			<?php endforeach ?>
		</ul>
	</div>
	<div class="box-footer">
		<a href="<?php echo base_url("admin/places"); ?>" class="btn btn-primary btn-sm">Kembali</a>
	</div>

</div>