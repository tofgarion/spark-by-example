import sys

filename = sys.argv[1]

chapters = open("../stats/chapters.csv","r")
values=[0,0,0,0,0,0,0]
chapters.readline();
for i in range(1,9):
    algos = chapters.readline().split(",")
    if algos[0] == filename:
        output = open("../stats/chapter-stdout-" + filename +".csv", "w")
        output.write("algo,total,% proved,altergo,cvc4,z3,unproved,flow\n")
        algos[len(algos)-1] = algos[len(algos)-1][:-1]
        for j in range(1,len(algos)):
            input = open("../stats/"+algos[j]+".stdout.csv",'r')
            input.readline()
            for k in range(1,9) :
                tokens = input.readline().split(",")
                values[0]+= float(tokens[1]) + float(tokens[5])
                for l in range(2,7):
                    values[l]+= float(tokens[l])
            input.close()
            values[1]= (values[0]-values[5])/values[0]*100
            output.write(algos[j])
            for k in range(0,7):
                output.write(","+str(values[k]))
            output.write("\n")
            values=[0,0,0,0,0,0,0]
        output.close()
