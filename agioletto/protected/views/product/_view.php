<?php
/* @var $this ProductController */
/* @var $data Product */
?>

<div class="view">


	<b><?php echo CHtml::encode($data->getAttributeLabel('name')); ?>:</b>
	<?php echo CHtml::encode($data->name); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('family')); ?>:</b>
	<?php echo CHtml::encode($data->family0->name); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('furniture_type')); ?>:</b>
	<?php echo CHtml::encode($data->furnitureType->name); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('price')); ?>:</b>
	<?php echo CHtml::encode($data->price); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('list_price')); ?>:</b>
	<?php echo CHtml::encode($data->list_price); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('stock')); ?>:</b>
	<?php echo CHtml::encode($data->stock); ?>
	<br />


</div>