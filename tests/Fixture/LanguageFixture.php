<?php
namespace App\Test\Fixture;

use Cake\TestSuite\Fixture\TestFixture;

/**
 * LanguageFixture
 *
 */
class LanguageFixture extends TestFixture {

/**
 * Fields
 *
 * @var array
 */
	public $fields = [
		'country_id' => ['type' => 'string', 'fixed' => true, 'length' => 3, 'null' => false, 'default' => '', 'comment' => '', 'precision' => null],
		'language' => ['type' => 'string', 'fixed' => true, 'length' => 30, 'null' => false, 'default' => '', 'comment' => '', 'precision' => null],
		'is_official' => ['type' => 'text', 'length' => null, 'null' => false, 'default' => 'F', 'comment' => '', 'precision' => null],
		'percentage' => ['type' => 'float', 'length' => 4, 'precision' => 1, 'unsigned' => false, 'null' => false, 'default' => '0.0', 'comment' => ''],
		'_constraints' => [
			'primary' => ['type' => 'primary', 'columns' => ['country_id', 'language'], 'length' => []],
		],
	];

/**
 * Records
 *
 * @var array
 */
	public $records = [
		[
			'country_id' => '53e9368b-d098-4e7a-96ee-49ff6fa81c7a',
			'language' => '53e9368b-efd8-4970-b7e3-49ff6fa81c7a',
			'is_official' => 'Lorem ipsum dolor sit amet, aliquet feugiat. Convallis morbi fringilla gravida, phasellus feugiat dapibus velit nunc, pulvinar eget sollicitudin venenatis cum nullam, vivamus ut a sed, mollitia lectus. Nulla vestibulum massa neque ut et, id hendrerit sit, feugiat in taciti enim proin nibh, tempor dignissim, rhoncus duis vestibulum nunc mattis convallis.',
			'percentage' => 1
		],
	];

}
