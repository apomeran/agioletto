<?php
/* @var $this UserController */
/* @var $data User */
?>

<div class="view">


	<b><?php echo CHtml::encode($data->getAttributeLabel('username')); ?>:</b>
	<?php echo CHtml::encode($data->username); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('email')); ?>:</b>
	<?php echo CHtml::encode($data->email); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('role')); ?>:</b>
	<?php echo CHtml::encode($data->role0->name); ?>
	<br />


</div>