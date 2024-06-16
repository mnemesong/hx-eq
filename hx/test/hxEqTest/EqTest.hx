package hxEqTest;

using hxEq.Eq;

enum A {
	I;
	T;
	S( a : Int );
}

class Cls {

	public var a = 1;
	public var b = false;
	public var c = { a : false };

	public function new() {}
}

enum B {
	TA( e : Bool );
	TB( e : Int );
}

abstract Abs( Array<Int> ) {

	public function new( a ) {
		this = a;
	}
}

class EqTest {

	public static function testAll() {
		Sure.sure( ![1].eq( [1, 3] ) );
		Sure.sure( [1].eq( [1] ) );
		Sure.sure( ![1 => 2, 3 => 4].eq( [1 => 2] ) );
		Sure.sure( [1 => 2, 3 => 4].eq( [1 => 2, 3 => 4] ) );
		Sure.sure( !A.I.eq( A.T ) );
		Sure.sure( A.T.eq( A.T ) );
		Sure.sure( !A.S( 1 ).eq( A.S( 2 ) ) );
		Sure.sure( A.S( 1 ).eq( A.S( 1 ) ) );

		var a = {
			a : [1, 2, 3],
			b : [1 => 3, 2 => 4],
			c : { a : new Cls(), c : B.TA( true ) }
		};

		var b = {
			a : [1, 2, 3],
			b : [1 => 3, 2 => 4],
			c : { a : new Cls(), c : B.TA( true ) }
		};
		Sure.sure( a.eq( b ) );
		b.b = null;
		Sure.sure( !a.eq( b ) );

		var c = new Abs( [1, 2, 3] );
		var d = new Abs( [2, 3, 1] );
		var e = new Abs( [1, 2, 3] );
		Sure.sure( !c.eq( d ) );
		Sure.sure( c.eq( e ) );

		var t1 = {
			f : function () {
				trace( 1 );
			}
		};
		var t2 = {
			f : function () {
				trace( 2 );
			}
		};
		var t3 = { f : null };
		var t4 = { f : null };
		Sure.sure( t1.eq( t2 ) );
		Sure.sure( !t1.eq( t3 ) );
		Sure.sure( t3.eq( t4 ) );
		trace( "Success!" );
	}

	public static function main() {
		testAll();
	}
}
