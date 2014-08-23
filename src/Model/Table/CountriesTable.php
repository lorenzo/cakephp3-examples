<?php
namespace App\Model\Table;

use Cake\ORM\Query;
use Cake\ORM\Table;
use Cake\Validation\Validator;

/**
 * Countries Model
 */
class CountriesTable extends Table {

/**
 * Initialize method
 *
 * @param array $config The configuration for the Table.
 * @return void
 */
	public function initialize(array $config) {
		$this->table('countries');
		$this->displayField('name');
		$this->primaryKey('id');

		$this->belongsTo('Capitals', [
			'foreignKey' => 'capital_id',
		]);

		$this->hasMany('Cities', [
			'foreignKey' => 'country_id',
		]);

		$this->hasMany('Languages', [
			'foreignKey' => 'country_id',
		]);

		$this->hasOne('OfficialLanguages', [
			'className' => LanguagesTable::class,
			'foreignKey' => 'country_id',
			'conditions' => ['OfficialLanguages.is_official' => 'T']
		]);
	}

/*
 * Simple finds
 *
 */

	public function findBiggestMonarchies(Query $query) {
		return $query
			->where(['government_form LIKE' => '%Monarchy%'])
			->order(['population' => 'DESC']);
	}

	public function findRepublics(Query $query) {
		return $query
			->where(['government_form' => 'Republic'])
			->orWhere(['government_form' => 'Federal Republic']);
	}

/*
 * Association eager loading
 *
 */

	public function findWithSpokenLanguages(Query $query, $options = []) {
		if (!empty($options['languageStrategy'])) {
			$this->Languages->strategy($options['languageStrategy']);
		}
		return $query
			->contain('Languages');
	}

	public function findWithOfficialLanguage(Query $query) {
		return $query
			->contain('OfficialLanguages');
	}

/*
 * Subqueries and SQL functions
 *
 */

	public function findAverageLifeExpectancy(Query $query) {
		return $query->select(['average_exp' => $query->func()->avg('life_expectancy')]);
	}

	public function findWithHighLifeExp(Query $query) {
		$average = $this->find('averageLifeExpectancy');
		return $query
			->where(['life_expectancy >' => $average])
			->order(['life_expectancy' => 'DESC']);
	}

	public function findWithCitiesBiggerThanDenmark(Query $query) {
		$denmarkPopulation = $this->find()
			->select(['population'])
			->where(['id' => 'DNK']);

		return $query
			//->distinct(['Countries.id'])
			->matching('Cities', function($q) use ($denmarkPopulation) {
				return $q->where(['Cities.population >' => $denmarkPopulation]);
			});
	}

/*
 * Result post-processing examples
 *
 */

	public function findInContinentGroups(Query $query) {
		$query->formatResults(function($results) {
			return $results->groupBy('continent');
		});
		return $query;
	}

	public function findOfficialLanguageList(Query $query) {
		$query->formatResults(function($results) {
			return $results->combine('name', 'official_language.language');
		});
		return $query->find('withOfficialLanguage');
	}

	public function findInRegionalGroups(Query $query) {
		$query
			->find('inContinentGroups')
			->formatResults(function($results) {
				return $results->map(function($continent) {
					return collection($continent)->groupBy('region');
				});
			});
		return $query;
	}

}
