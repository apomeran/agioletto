<?php
/* @var $this FurnitureTypeController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Furniture Types',
);

$this->menu=array(
	array('label'=>'Create FurnitureType', 'url'=>array('create')),
	array('label'=>'Manage FurnitureType', 'url'=>array('admin')),
);
?>

<h1>Furniture Types</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
