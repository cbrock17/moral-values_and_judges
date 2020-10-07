*merge.do
*merges case data with judge data from us appeals courts
*updated 9.30.30

*******************
***Preliminaries***
*******************
clear all
capture log close
set more off
cd C:\Users\cbrock\Documents\thesis

use "C:\Users\cbrock\Documents\thesis\appeals_cases_data96.dta", clear

*creats 15 lines for each original line of data. each line was a case, now each line is a judge.
reshape long codej, i(casenum) j(counter)

*drops if missing judge; cases list up to 15 judges, but many have fewer
drop if missing(codej)

*drops if not a circuit court judge
drop if codej < 1300

*resolve discrepancies
gen ids=codej

replace ids=722 if codej==218
replace ids=0 if codej==346
replace ids=542 if codej==536
replace ids=722 if codej==624
replace ids=971 if codej==970
replace ids=970 if codej==973
replace ids=808 if codej==1007
replace ids=819 if codej==1015
replace ids=502 if codej==1101
replace ids=510 if codej==1102
replace ids=514 if codej==1104 
replace ids=516 if codej==1106
replace ids=521 if codej==1107
replace ids=523 if codej==1108
replace ids=524 if codej==1109
replace ids=570 if codej==1110
replace ids=530 if codej==1111
replace ids=534 if codej==1112
replace ids=537 if codej==1113
replace ids=540 if codej==1114
replace ids=545 if codej==1115
replace ids=554 if codej==1116
replace ids=555 if codej==1117
replace ids=556 if codej==1118

*merge
*merge m:1 ids using "C:\Users\cbrock\Documents\thesis\attributes_data.dta"

