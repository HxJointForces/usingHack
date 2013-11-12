package ;
import haxe.Timer;
import haxe.macro.Expr;
import macros.UsingHack;

using macros.UsingHack;

/**
 * ...
 * @author deep <system.grand@gmail.com>
 */
class UsingMacro
{

	macro static public function a(expr:Expr):Expr {
		var e = UsingHack.fixExpr(expr);
		var res = Std.string(e.expr);
		return macro $v{res};
	}
	
	macro static public function measure(expr:Expr):Expr {
		var t = Timer.stamp();
		for (i in 0...10000) {
			var e = expr.fixExpr();
		}
		t = Timer.stamp() - t;
		return macro $v { t };
	}
}