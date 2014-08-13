* Python program to generate WITH statements for correlated IVs in Mplus
* Written by Jamie DeCoster

* This program accepts a list of names. It then prints a set of WITH statement 
* that pairs each name with each other name. This is useful when you have
* a large number of predictors or outcomes in Mplus and you want to declare
* that they are all allowed to correlate.

* There are 3 usages. The first usage takes a single list of strings as a parameter.
* It then prints out all of the unique pairings of variables in that list.

* The second usage takes two lists of strings as parameters. It then prints out
* pairings of all of the items in the first list with all of the items in the second list.

* The third usage is the same as the second, but there is a third parameter that
* takes a value of 0 or 1. If the value is set to 1, then the program prints out all 
* the unique pairings within the first list, all the unique pairings within the second 
* list, and then all of the pairings of items in the first list with items in the second 
* list. If the third parameter is set to 0, then it only prints out the pairings of the
* items in the first list with the items in the second list.

**********
* Version History
**********
* 2012-09-15 Created
* 2012-10-07 Automatically cleared output 
* 2013-09-06 Added titles around withs so that they copy easier

begin program python.
import spss

def MplusWiths(namelist1, namelist2=["empty7663804"], within = 0):
    spss.Submit("title 'MplusWiths start'.")
    if (namelist2==["empty7663804"]):
        for t in range(len(namelist1)):
            for i in range(t+1,len(namelist1)):
                print namelist1[t] + " WITH " + namelist1[i] + ";"
    else:
        for t in namelist1:
            for i in namelist2:
                print t + " WITH " + i + ";"

        if (within == 1):
            print "\n"
            for t in range(len(namelist1)):
                for i in range(t+1,len(namelist1)):
                    print namelist1[t] + " WITH " + namelist1[i] + ";"
            print "\n"
            for t in range(len(namelist2)):
                for i in range(t+1,len(namelist2)):
                    print namelist2[t] + " WITH " + namelist2[i] + ";"
    spss.Submit("title 'MplusWiths end'.")
end program python.

