#MplusWiths

SPSS Python Extension function that writes a set of "with" statements in the Output window that can be copied into an Mplus program.

This program accepts a list of names. It then prints a set of WITH statements that pair each name with each other name. This is useful when you have a large number of predictors or outcomes in Mplus and you want to declare * that they are all allowed to covary.

##Usage
**MplusWiths(namelist1, namelist2, within)**

There are 3 usages. The first usage takes a single list of strings as a parameter (namelist1). It then prints out all of the unique pairings of variables in that list.

The second usage takes two lists of strings as parameters (namelist1, namelist2). It then prints out pairings of all of the items in the first list with all of the items in the second list.

The third usage is the same as the second, but there is a third parameter (within) that takes a value of 0 or 1. If the value is set to 1, then the program prints out all the unique pairings within the first list, all the unique pairings within the second list, and then all of the pairings of items in the first list with items in the second list. If the third parameter is set to 0, then it only prints out the pairings of the items in the first list with the items in the second list.

##Example 1
###Code
**varlist = ["age", "yrsexp", "besd"]**  
**MplusWiths(varlist)**  
###Output
age WITH yrsexp;  
age WITH besd;  
yrsexp WITH besd;  

##Example 2
###Code
**varlist1 = ["age", "yrsexp", "besd"]**  
**varlist2 = ["co", "es", "is"]**  
**MplusWiths(varlist1, varlist2)** 
###Output
age WITH co;  
age WITH es;  
age WITH is;  
yrsexp WITH co;  
yrsexp WITH es;  
yrsexp WITH is;  
besd WITH co;  
besd WITH es;  
besd WITH is;  

##Example 3
###Code
**varlist1 = ["age", "yrsexp", "besd"]**  
**varlist2 = ["co", "es", "is"]**  
**MplusWiths(varlist1, varlist2, 1)** 
###Output
age WITH co;  
age WITH es;  
age WITH is;  
yrsexp WITH co;  
yrsexp WITH es;  
yrsexp WITH is;  
besd WITH co;  
besd WITH es;  
besd WITH is;  

age WITH yrsexp;  
age WITH besd;  
yrsexp WITH besd;  

co WITH es;  
co WITH is;  
es WITH is;  
