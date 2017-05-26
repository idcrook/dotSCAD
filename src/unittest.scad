module fail(title, message) {
    echo(
        str( 
            "<b>",
                "<span style='color: red'>", 
                    "FAIL: ",  title,
                "</span>", 
            "</b>"
        )
    );
    if(message != undef) {
        echo(
            str( 
                "<b>",
                    "<span style='color: red'>　",
                        message, 
                    "</span>", 
                "</b>"
            )
        );
    }
}

function shift_to_int(point, digits) = 
    let(
        pt = point * digits
    )
    len(pt) == 2 ? 
        [round(pt[0]), round(pt[1])] :
        [round(pt[0]), round(pt[1]), round(pt[2])];

function all_shift_to_int(points, digits) = 
    [for(pt = points) shift_to_int(pt, digits) / digits];

module assertEqualPoint(expected, actual) {
    leng_expected = len(expected);
    leng_actual = len(actual);

    if(leng_expected != leng_actual) {
         fail(
            "Point", 
            str("expected length: ", leng_expected,
            ", but: ", leng_actual)
        );       
    } else {
        n = 10000;

        shifted_expected = shift_to_int(
            expected, n
        );

        shifted_actual = shift_to_int(
            actual, n
        );
        
        if(shifted_expected != shifted_actual) {
            fail(
                "Point", 
                str("expected: ", shifted_expected / n,
                ", but: ", shifted_actual / n)
            );
        }
    }
}

module assertEqualPoints(expected, actual) {
    leng_expected = len(expected);
    leng_actual = len(actual);

    if(leng_expected != leng_actual) {
         fail(
            "Points", 
            str("expected length: ", leng_expected,
            ", but: ", leng_actual)
        );       
    } else {
        for(i = [0:len(actual) - 1]) {        
            assertEqualPoint(expected[i], actual[i]);
        }
    }
}

module assertEqual(expected, actual) {        
    if(expected != actual) {
        fail(
            "Equality", 
            str("expected: ", expected,
            ", but: ", actual)
        );
    }
    
}