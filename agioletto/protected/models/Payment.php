<?php

/**
 * This is the model class for table "payment".
 *
 * The followings are the available columns in table 'payment':
 * @property integer $id
 * @property integer $payment_method
 * @property integer $order
 * @property double $amount
 * @property double $current_debt
 * @property integer $client
 * @property integer $currency
 * @property integer $is_deposit
 * @property integer $is_additional_deposit
 *
 * The followings are the available model relations:
 * @property Currency $currency0
 * @property PaymentMethod $paymentMethod
 * @property Order $order0
 * @property Client $client0
 */
class Payment extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'payment';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('payment_method, order, amount, current_debt, client, currency, is_deposit, is_additional_deposit', 'required'),
			array('payment_method, order, client, currency, is_deposit, is_additional_deposit', 'numerical', 'integerOnly'=>true),
			array('amount, current_debt', 'numerical'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, payment_method, order, amount, current_debt, client, currency, is_deposit, is_additional_deposit', 'safe', 'on'=>'search'),
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
			'currency0' => array(self::BELONGS_TO, 'Currency', 'currency'),
			'paymentMethod' => array(self::BELONGS_TO, 'PaymentMethod', 'payment_method'),
			'order0' => array(self::BELONGS_TO, 'Order', 'order'),
			'client0' => array(self::BELONGS_TO, 'Client', 'client'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'payment_method' => 'Payment Method',
			'order' => 'Order',
			'amount' => 'Amount',
			'current_debt' => 'Current Debt',
			'client' => 'Client',
			'currency' => 'Currency',
			'is_deposit' => 'Is Deposit',
			'is_additional_deposit' => 'Is Additional Deposit',
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
		$criteria->compare('payment_method',$this->payment_method);
		$criteria->compare('order',$this->order);
		$criteria->compare('amount',$this->amount);
		$criteria->compare('current_debt',$this->current_debt);
		$criteria->compare('client',$this->client);
		$criteria->compare('currency',$this->currency);
		$criteria->compare('is_deposit',$this->is_deposit);
		$criteria->compare('is_additional_deposit',$this->is_additional_deposit);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Payment the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
