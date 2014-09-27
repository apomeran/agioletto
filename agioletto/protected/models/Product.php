<?php

/**
 * This is the model class for table "product".
 *
 * The followings are the available columns in table 'product':
 * @property integer $id
 * @property string $name
 * @property integer $family
 * @property integer $furniture_type
 * @property double $price
 * @property double $list_price
 * @property integer $stock
 * @property integer $visible
 *
 * The followings are the available model relations:
 * @property Family $family0
 * @property FurnitureType $furnitureType
 * @property ProductCategory[] $productCategories
 */
class Product extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'product';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('name, family, furniture_type, price, list_price, stock', 'required'),
			array('family, furniture_type, stock', 'numerical', 'integerOnly'=>true),
			array('price, list_price', 'numerical'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, name, family, furniture_type, price, list_price, stock, visible', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'family0' => array(self::BELONGS_TO, 'Family', 'family'),
			'furnitureType' => array(self::BELONGS_TO, 'FurnitureType', 'furniture_type'),
			'productCategories' => array(self::HAS_MANY, 'ProductCategory', 'product'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'name' => 'Name',
			'family' => 'Family',
			'furniture_type' => 'Furniture Type',
			'price' => 'Price',
			'list_price' => 'List Price',
			'stock' => 'Stock',
			'visible' => 'Visible',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('name',$this->name,true);
		$criteria->compare('family',$this->family);
		$criteria->compare('furniture_type',$this->furniture_type);
		$criteria->compare('price',$this->price);
		$criteria->compare('list_price',$this->list_price);
		$criteria->compare('stock',$this->stock);
		$criteria->compare('visible',$this->visible);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Product the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
