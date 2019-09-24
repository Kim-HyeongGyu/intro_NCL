#!/bin/csh -f
# filename : 7-4-2.sh_script.csh

set month=1
while ($month < 13)
    ncl -Q year=2019 mon=$month 'area="Kongju"' 7-4-1.cli_print.ncl
    @ month += 1
end

