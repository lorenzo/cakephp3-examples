<?php
namespace App\Model\Table;

use Cake\ORM\Query;
use Cake\ORM\Table;
use Cake\Validation\Validator;

/**
 * Cities Model
 */
class CitiesTable extends Table {

/**
 * Initialize method
 *
 * @param array $config The configuration for the Table.
 * @return void
 */
	public function initialize(array $config) {
		$this->table('cities');
		$this->displayField('name');
		$this->primaryKey('id');

		$this->belongsTo('Countries', [
			'foreignKey' => 'country_id',
		]);
	}

}
