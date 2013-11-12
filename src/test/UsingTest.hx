package ;

import haxe.unit.TestCase;
using UsingMacro;

/**
 * ...
 * @author deep <system.grand@gmail.com>
 */
class UsingTest extends TestCase {

	public function new() {
		super();
	}
	
	static var st = true;
	var t = 12;
	
	function test1() {
		var a = 10;
		assertEquals(UsingMacro.a(a), a.a());
		
		
		assertEquals(UsingMacro.a("test"), "test".a());
		assertEquals(UsingMacro.a(true), true.a());
		
		assertEquals(UsingMacro.a(st), st.a());
		
		assertEquals(UsingMacro.a(t), t.a());
		
	}
	
	function testTime() {
		var a = 10;
		trace("10K without using: " + UsingMacro.measure(a.b.c));
		trace("10K with using: " + a.measure());
		
		assertEquals(1, 1);
	}
	
}
