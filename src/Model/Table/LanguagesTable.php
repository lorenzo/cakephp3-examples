<?php
namespace App\Model\Table;

use Cake\ORM\Query;
use Cake\ORM\Table;
use Cake\Validation\Validator;

/**
 * Languages Model
 */
class LanguagesTable extends Table {

/**
 * Initialize method
 *
 * @param array $config The configuration for the Table.
 * @return void
 */
	public function initialize(array $config) {
		$this->table('languages');
		$this->displayField('country_id');
		$this->primaryKey('country_id');

		$this->belongsTo('Countries', [
			'foreignKey' => 'country_id',
		]);
	}

/*
 * Deep association conditions
 *
 */

	public function findCityProbability(Query $query) {
		return $query
			->matching('Countries.Cities', function($q) {
				$prob = $q->newExpr('(Languages.percentage / 100) * (Cities.population / Countries.population)');
				return $q
					->select(['probability' => $prob, 'Cities.name'])
					->where(function($exp) use ($prob) {
						return $exp->gte($prob, 0.25);
					});
			});
	}

}
