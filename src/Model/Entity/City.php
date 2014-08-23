<?php
namespace App\Model\Entity;

use Cake\ORM\Entity;

/**
 * City Entity.
 */
class City extends Entity {

/**
 * Fields that can be mass assigned using newEntity() or patchEntity().
 *
 * @var array
 */
	protected $_accessible = [
		'name' => true,
		'country_id' => true,
		'district' => true,
		'population' => true,
		'country' => true,
	];

}
