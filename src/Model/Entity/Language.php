<?php
namespace App\Model\Entity;

use Cake\ORM\Entity;

/**
 * Language Entity.
 */
class Language extends Entity {

/**
 * Fields that can be mass assigned using newEntity() or patchEntity().
 *
 * @var array
 */
	protected $_accessible = [
		'is_official' => true,
		'percentage' => true,
	];

}
