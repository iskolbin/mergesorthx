package nook.ds;

class MergeSort {
	public static function merge<T>( a: Array<T>, b: Array<T>, cmp: T->T->Int ): Array<T> {
		var i = 0;
		var j = 0;
		var na = a.length;
		var nb = b.length;
		var buffer = new Array<T>();
		while ( i < na && j < nb ) {
			if ( cmp( a[i], b[j] ) <= 0 ) {
				buffer.push( a[i] );
				i++;
			} else {
				buffer.push( b[j] );
				j++;
			}
		}

		if ( i >= na ) {
			while ( j < nb ) {
				buffer.push( b[j] );
				j++;
			}
		} else if ( j >= nb ) {
			while ( i < na ) {
				buffer.push( a[i] );
				i++;
			}
		}

		return buffer;
	}

	//http://stackoverflow.com/questions/1557894/non-recursive-merge-sort
	public static function sort<T>( a: Array<T>, ?cmp: T->T->Int ): Array<T> {
		var num = a.length;
		var b = new Array<T>();
		var k = 1;
		
		cmp = (cmp == null) ? Reflect.compare : cmp; 
		
		while( k < num ) {
			var left = 0;
			while ( left + k < num ) {
				var rght = left + k;        
				var rend = rght + k;
				if ( rend > num ) {
					rend = num; 
				}
				var m = left; 
				var i = left; 
				var j = rght; 
				while ( i < rght && j < rend ) { 
					if ( cmp( a[i], a[j] ) <= 0 ) {         
						b[m] = a[i]; 
						i++;
					} else {
						b[m] = a[j]; 
						j++;
					}
					m++;
				}
				while ( i < rght ) { 
					b[m] = a[i]; 
					i++; 
					m++;
				}
				while ( j < rend ) { 
					b[m] = a[j]; 
					j++; 
					m++;
				}

				m = left;
				while ( m < rend ) {
					a[m] = b[m]; 
					m++;
				}
		
				left += k + k;	
			}

			k += k;
		}
	
		return b;
	}
}
