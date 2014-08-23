<?php
namespace App\Model\Entity;

use Cake\ORM\Entity;

/**
 * Country Entity.
 */
class Country extends Entity {

/**
 * Fields that can be mass assigned using newEntity() or patchEntity().
 *
 * @var array
 */
	protected $_accessible = [
		'name' => true,
		'continent' => true,
		'region' => true,
		'surface_area' => true,
		'independence_year' => true,
		'population' => true,
		'life_expectancy' => true,
		'gnp' => true,
		'gnp_oid' => true,
		'local_name' => true,
		'government_form' => true,
		'head_of_state' => true,
		'capital_id' => true,
		'code' => true,
		'capital' => true,
		'cities' => true,
		'languages' => true,
	];

}
