import haxe.ds.ArraySort;
import nook.ds.MergeSort;

class Test {
	static var f: Array<Float>;
	static var f_: Array<Float>;
	static var f__: Array<Float>;
	static var i: Array<Int>;
	static var i_: Array<Int>;
	static var i__: Array<Int>;
	static var s: Array<String>;
	static var s_: Array<String>;
	static var s__: Array<String>;
	static var nf = 1000000;
	static var ni = 1000000;
	static var ns = 1000000;

	public static function shuffle<T>( a: Array<T> ) {
		var j = a.length-1;
		for ( i in 0...a.length-1 ) {
			var tmp = a[j];
			var k = Std.random(j);
			a[j] = a[k];
			a[k] = tmp;
			j -= 1;
		}
	}

	static inline function profile( f: Void->Void ): Float {	
		var start = haxe.Timer.stamp();
		f();
		var finish = haxe.Timer.stamp();
		return finish - start;
	}

	public static function main() {
		f = [ for ( j in 0...nf ) j*1.0 ];
		shuffle(f);
		f_ = f.copy(); f__ = f.copy();
		i = [ for ( j in 0...ni ) j ];
		shuffle(i);
		i_ = i.copy(); i__ = i.copy();
		s = [ for ( j in 0...ns ) Std.string( j ) ];
		shuffle(s);
		s_ = s.copy(); s__ = s.copy();
	
		trace( '*** RANDOM DISTRIBUTION ***' );
		trace( 'ArraySort of floats', profile( function() ArraySort.sort( f, Reflect.compare )));
		trace( 'MergeSort of floats', profile( function() MergeSort.sort( f_, Reflect.compare )));
		trace( 'built-in sort of floats', profile( function() f__.sort( Reflect.compare )));
		trace( 'ArraySort of ints', profile( function() ArraySort.sort( i, Reflect.compare )));
		trace( 'MergeSort of ints', profile( function() MergeSort.sort( i_, Reflect.compare )));
		trace( 'built-in sort of ints', profile( function() i__.sort( Reflect.compare )));
		trace( 'ArraySort of strings', profile( function() ArraySort.sort( s, Reflect.compare )));
		trace( 'MergeSort of strings', profile( function() MergeSort.sort( s_, Reflect.compare )));
		trace( 'built-in sort of strings', profile( function() s__.sort( Reflect.compare )));
		
		f = [ for ( j in 0...nf ) j*1.0 ];
		f_ = f.copy(); f__ = f.copy();
		i = [ for ( j in 0...ni ) j ];
		i_ = i.copy(); i__ = i.copy();
		s = [ for ( j in 0...ns ) Std.string( j ) ];
		s_ = s.copy(); s__ = s.copy();
	
		trace( '*** ALREADY SORTED ***' );
		trace( 'ArraySort of floats', profile( function() ArraySort.sort( f, Reflect.compare )));
		trace( 'MergeSort of floats', profile( function() MergeSort.sort( f_, Reflect.compare )));
		trace( 'built-in sort of floats', profile( function() f__.sort( Reflect.compare )));
		trace( 'ArraySort of ints', profile( function() ArraySort.sort( i, Reflect.compare )));
		trace( 'MergeSort of ints', profile( function() MergeSort.sort( i_, Reflect.compare )));
		trace( 'built-in sort of ints', profile( function() i__.sort( Reflect.compare )));
		trace( 'ArraySort of strings', profile( function() ArraySort.sort( s, Reflect.compare )));
		trace( 'MergeSort of strings', profile( function() MergeSort.sort( s_, Reflect.compare )));
		trace( 'built-in sort of strings', profile( function() s__.sort( Reflect.compare )));
		
		f = [ for ( j in 0...nf ) -j*1.0 ];
		f_ = f.copy(); f__ = f.copy();
		i = [ for ( j in 0...ni ) -j ];
		i_ = i.copy(); i__ = i.copy();
		s = [ for ( j in 0...ns ) Std.string( -j ) ];
		s_ = s.copy(); s__ = s.copy();
	
		trace( '*** REVERSE ORDER ***' );
		trace( 'ArraySort of floats', profile( function() ArraySort.sort( f, Reflect.compare )));
		trace( 'MergeSort of floats', profile( function() MergeSort.sort( f_, Reflect.compare )));
		trace( 'built-in sort of floats', profile( function() f__.sort( Reflect.compare )));
		trace( 'ArraySort of ints', profile( function() ArraySort.sort( i, Reflect.compare )));
		trace( 'MergeSort of ints', profile( function() MergeSort.sort( i_, Reflect.compare )));
		trace( 'built-in sort of ints', profile( function() i__.sort( Reflect.compare )));
		trace( 'ArraySort of strings', profile( function() ArraySort.sort( s, Reflect.compare )));
		trace( 'MergeSort of strings', profile( function() MergeSort.sort( s_, Reflect.compare )));
		trace( 'built-in sort of strings', profile( function() s__.sort( Reflect.compare )));
	}
}
