package macros;
import haxe.macro.Context;
import haxe.macro.Expr;
import sys.io.File;
import sys.io.FileSeek;

/**
 * ...
 * @author deep <system.grand@gmail.com>
 */
class UsingHack {

	static public inline function fixExpr(expr:Expr):Expr {
		switch (expr.expr) {
			case EMeta({name:":this"}, {expr:EConst(CIdent("this"))}):
				var pos = expr.pos;
				var posInfo = Context.getPosInfos(pos);
				
				var f = File.read(posInfo.file, false);
				f.seek(posInfo.min, FileSeek.SeekBegin);
				var str = f.readString(posInfo.max - posInfo.min);
				f.close();
				
				expr = Context.parseInlineString(str, pos);

				switch (expr.expr) {
					case EField(e, _): expr = e;
					default:
				}
			default:
		}
		return expr;
	}
	
}