<?php
namespace App\Test\Fixture;

use Cake\TestSuite\Fixture\TestFixture;

/**
 * CityFixture
 *
 */
class CityFixture extends TestFixture {

/**
 * Fields
 *
 * @var array
 */
	public $fields = [
		'id' => ['type' => 'integer', 'length' => 11, 'unsigned' => false, 'null' => false, 'default' => null, 'comment' => '', 'autoIncrement' => true, 'precision' => null],
		'name' => ['type' => 'string', 'fixed' => true, 'length' => 35, 'null' => false, 'default' => '', 'comment' => '', 'precision' => null],
		'country_id' => ['type' => 'string', 'fixed' => true, 'length' => 3, 'null' => false, 'default' => '', 'comment' => '', 'precision' => null],
		'district' => ['type' => 'string', 'fixed' => true, 'length' => 20, 'null' => false, 'default' => '', 'comment' => '', 'precision' => null],
		'population' => ['type' => 'integer', 'length' => 11, 'unsigned' => false, 'null' => false, 'default' => '0', 'comment' => '', 'precision' => null, 'autoIncrement' => null],
		'_constraints' => [
			'primary' => ['type' => 'primary', 'columns' => ['id'], 'length' => []],
		],
	];

/**
 * Records
 *
 * @var array
 */
	public $records = [
		[
			'id' => 1,
			'name' => 'Lorem ipsum dolor sit amet',
			'country_id' => 'L',
			'district' => 'Lorem ipsum dolor ',
			'population' => 1
		],
	];

}
