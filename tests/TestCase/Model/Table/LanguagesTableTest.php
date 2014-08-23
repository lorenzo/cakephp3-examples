<?php
namespace App\Test\TestCase\Model\Table;

use Cake\ORM\TableRegistry;
use App\Model\Table\LanguagesTable;
use Cake\TestSuite\TestCase;

/**
 * App\Model\Table\LanguagesTable Test Case
 */
class LanguagesTableTest extends TestCase {

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$config = TableRegistry::exists('Languages') ? [] : ['className' => 'App\Model\Table\LanguagesTable'];
		$this->Languages = TableRegistry::get('Languages', $config);
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->Languages);

		parent::tearDown();
	}

}
