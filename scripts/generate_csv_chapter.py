import sys

filename = sys.argv[1]

chapters = open("../stats/chapters.csv","r")
values=[0,0,0,0,0,0]
chapters.readline();
for i in range(1,8):
    algos = chapters.readline().split(",")
    if algos[0] == filename:
        output = open("../stats/chapter-" + filename +".csv", "w")
        output.write("algo,total,% proved,altergo,cvc4,z3\n")
        algos[len(algos)-1] = algos[len(algos)-1][:-1]
        for j in range(1,len(algos)):
            input = open("../stats/"+algos[j]+".csv",'r')
            input.readline()
            for line in input :
                tokens = line.split(",")
                values[0]+= float(tokens[1])
                values[2]+= float(tokens[4])
                values[3]+= float(tokens[5])
                values[4]+= float(tokens[6])
                values[5]+= float(tokens[7])
            input.close()
            values[1]= (values[0]-values[5])/values[0]*100
            output.write(algos[j])
            for k in range(0,5):
                output.write(","+str(values[k]))
            output.write("\n")
            values=[0,0,0,0,0,0]
        output.close()
