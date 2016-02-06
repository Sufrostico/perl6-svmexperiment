#!/usr/bin/env perl6
use v6;


# Plan de ejecución

# GWO     55 2
spurt "exp-modelos.current", "GWO     55 2\n", :append;
shell("svm-train -s 0 -t 2 -c {2**11.724954881234} -g {2**-12.2053228135595} 2CTASSCasasola.train.2 gwo-55-2.model");

# GWO     55 3
spurt "exp-modelos.current", "GWO     55 3\n", :append;
shell("svm-train -s 0 -t 2 -c {2**2.47993484910059} -g {2**-3.07751577034535} 2CTASSCasasola.train.3 gwo-55-3.model");

# Malla         2
spurt "exp-modelos.current", "Malla 2\n", :append;
shell("svm-train -s 0 -t 2 -c {2**11} -g {2**-11} 2CTASSCasasola.train.2 malla-2.model");

# Malla         5
spurt "exp-modelos.current", "Malla 5\n", :append;
shell("svm-train -s 0 -t 2 -c {2**9} -g {2**-5} 2CTASSCasasola.train.5 malla-5.model");

# GWO     55 4
spurt "exp-modelos.current", "GWO     55 4\n", :append;
shell("svm-train -s 0 -t 2 -c {2**1.00298816973267} -g {2**-2.71913692564381} 2CTASSCasasola.train.4 gwo-55-4.model");

# GWO     55 1
spurt "exp-modelos.current", "GWO     55 1\n", :append;
shell("svm-train -s 0 -t 2 -c {2** 4.10370416571414} -g {2**-2.97636751380374} 2CTASSCasasola.train.1 gwo-55-1.model");

# GWO     165 5
spurt "exp-modelos.current", "GWO     165   5\n", :append;
shell("svm-train -s 0 -t 2 -c {2**13.1931027300608} -g {2**-6.29089135233958} 2CTASSCasasola.train.5 gwo-165-5.model");

# GWO     165 4
spurt "exp-modelos.current", "GWO     165   4\n", :append;
shell("svm-train -s 0 -t 2 -c {2**8.83893076690021} -g {2**-6.69902984860747} 2CTASSCasasola.train.4 gwo-165-4.model");

# GWO     165 3
spurt "exp-modelos.current", "GWO     165   3\n", :append;
shell("svm-train -s 0 -t 2 -c {2**0.791044084831337} -g {2**-3.63730459417936} 2CTASSCasasola.train.3 gwo-165-3.model");

# GWO     110 4
spurt "exp-modelos.current", "GWO     110   4\n", :append;
shell("svm-train -s 0 -t 2 -c {2**0.236127698311231} -g {2**-2.83947674550627} 2CTASSCasasola.train.4 gwo-110-4.model");

# GWO     110 1
spurt "exp-modelos.current", "GWO     110   1\n", :append;
shell("svm-train -s 0 -t 2 -c {2**1.33292769274042} -g {2**-1.37238132920901} 2CTASSCasasola.train.1 gwo-110-1.model");

# GWO     55 5
spurt "exp-modelos.current", "GWO     55    5\n", :append;
shell("svm-train -s 0 -t 2 -c {2**9.95760089673571} -g {2**-5.44926631504506} 2CTASSCasasola.train.5 gwo-55-5.model");

# GWO     110 2
spurt "exp-modelos.current", "GWO     110   2\n", :append;
shell("svm-train -s 0 -t 2 -c {2**14.2014442667934} -g {2**-13.2406615340093}  2CTASSCasasola.train.2 gwo-110-2.model");

# GWO     110 3
spurt "exp-modelos.current", "GWO     110   3\n", :append;
shell("svm-train -s 0 -t 2 -c {2**13.5722188471826} -g {2**-14.766009613071}  2CTASSCasasola.train.3 gwo-110-3.model");

# GWO     165 2
spurt "exp-modelos.current", "GWO     165   2\n", :append;
shell("svm-train -s 0 -t 2 -c {2**12.1555399759767} -g {2**-12.1582474859284}  2CTASSCasasola.train.2 gwo-165-2.model");

# GWO     165 1
spurt "exp-modelos.current", "GWO     165   1\n", :append;
shell("svm-train -s 0 -t 2 -c {2**0.346935636079502} -g {2**-0.117553516515744}  2CTASSCasasola.train.1 gwo-165-1.model");

# Malla         1
spurt "exp-modelos.current", "Malla 1\n", :append;
shell("svm-train -s 0 -t 2 -c {2**1} -g {2**-1}  2CTASSCasasola.train.1 malla-1.model");

# Malla         3
spurt "exp-modelos.current", "Malla 3\n", :append;
shell("svm-train -s 0 -t 2 -c {2**3} -g {2**-5}  2CTASSCasasola.train.3  malla-3.model");

# GWO     110 5
spurt "exp-modelos.current", "GWO     110   5\n", :append;
shell("svm-train -s 0 -t 2 -c {2**14.9396614478513} -g {2**-7.20870999581631}  2CTASSCasasola.train.5 gwo-110-5.model");

# Malla         4
spurt "exp-modelos.current", "Malla 4\n", :append;
shell("svm-train -s 0 -t 2 -c {2**5} -g {2**-5}  2CTASSCasasola.train.4 malla-4.model");

# Default   1
spurt "exp-modelos.current", "Default 1\n", :append;
shell("svm-train -s 0 -t 2  2CTASSCasasola.train.1 default-1.model");

# Default   2
spurt "exp-modelos.current", "Default 2\n", :append;
shell("svm-train -s 0 -t 2  2CTASSCasasola.train.2 default-2.model");

# Default   3
spurt "exp-modelos.current", "Default 3\n", :append;
shell("svm-train -s 0 -t 2  2CTASSCasasola.train.3 default-3.model");

# Default   4
spurt "exp-modelos.current", "Default 4\n", :append;
shell("svm-train -s 0 -t 2  2CTASSCasasola.train.4 default-4.model");

# Default   5
spurt "exp-modelos.current", "Default 5\n", :append;
shell("svm-train -s 0 -t 2  2CTASSCasasola.train.5 default-5.model");

