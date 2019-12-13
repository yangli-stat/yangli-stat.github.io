data bread;
    input y temperature flour day;
    datalines;
     5.8    1     1   1
     4.6    2     1   1
     4.6    3     1   1
    11.4    1     1   2
     5.2    2     1   2
     5.2    3     1   2
    10.5    1     1   3
     9.7    2     1   3
     4.7    3     1   3
     8.4    1     2   1
     5.4    2     2   1
     4.7    3     2   1
     7.5    1     2   2
     7.9    2     2   2
     7.2    3     2   2
    14.6    1     2   3
     7.9    2     2   3
     6.9    3     2   3
    16.0    1     3   1
     5.2    2     3   1
     4.2    3     3   1
    17.8    1     3   2
     7.0    2     3   2
     6.3    3     3   2
    16.9    1     3   3
    11.5    2     3   3
     7.2    3     3   3
    ;
run;

proc sort data=bread;
    by temperature flour;
run;

proc glm data=bread;
    class temperature flour day;
    model y = day temperature | flour;
run;

proc means data=bread;
    by temperature flour;
    var y;
    output out=breadoutput mean=meanbread;
run;

proc print data=breadoutput;
run;

proc plot data=breadoutput;
    plot meanbread*temperature $ flour;
run;

proc plot data=breadoutput;
    plot meanbread*flour $ temperature;
run;   