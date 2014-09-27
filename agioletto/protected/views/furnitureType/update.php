<?php
/* @var $this FurnitureTypeController */
/* @var $model FurnitureType */

$this->breadcrumbs=array(
	'Furniture Types'=>array('index'),
	$model->name=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List FurnitureType', 'url'=>array('index')),
	array('label'=>'Create FurnitureType', 'url'=>array('create')),
	array('label'=>'View FurnitureType', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage FurnitureType', 'url'=>array('admin')),
);
?>

<h1>Update FurnitureType <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>