/* Read data */
filename myfile url 'http://www.d.umn.edu/~yangli/stat5411F16/pesticides.txt';

/* Read the data into SAS */
/* The first column is the observed yield. The second column is the
pesticide factor, and the third column is the variety factor */
data pesticides;
    infile myfile;
    input yield pesticide variety;
run;

proc print data = pesticides;
run;

/* sort by both factors before producing summaries */
proc sort data = pesticides;
    by pesticide variety;
run;

proc means data = pesticides maxdec = 2 n mean std;   
    by pesticide variety;
    var yield;
    output out = means mean = my;
run;

/* Make profile plot */
proc plot data = means;
/* note I plot the 'mncrop' data, not the 'crop' data */
    title2 'Profile Plot';
    plot my * pesticide $ variety;
run;

/* ANOVA Table */
proc glm data = pesticides;
    class pesticide variety;
    model yield = pesticide | variety;
    output out = yieldfit p = yhat r = resid;
run;

