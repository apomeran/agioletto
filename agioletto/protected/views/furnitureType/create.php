<?php
/* @var $this FurnitureTypeController */
/* @var $model FurnitureType */

$this->breadcrumbs=array(
	'Furniture Types'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List FurnitureType', 'url'=>array('index')),
	array('label'=>'Manage FurnitureType', 'url'=>array('admin')),
);
?>

<h1>Create FurnitureType</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>