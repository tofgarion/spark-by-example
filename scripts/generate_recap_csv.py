chapters = ["non-mutating","maxmin","binary-search","mutating","numeric","heap","sorting","classic-sorting"]
values=[0,0,0,0,0,0,0]

output = open("../stats/recap.csv", "w")
output.write("chapter,total,% proved,altergo,cvc4,z3,unproved,flow\n")
for j in range(len(chapters)):
    input = open("../stats/chapter-stdout-"+chapters[j]+".csv",'r')
    tokens=input.readline().split(",")
    while len(tokens)>1 :
        tokens = input.readline().split(",")
        if len(tokens)==1 :
            continue
        values[0]+= float(tokens[1])
        for l in range(3,8):
            values[l-1]+= float(tokens[l])
    input.close()
    values[1]= (values[0]-values[5])/values[0]*100
    output.write(chapters[j])
    for k in range(0,7):
        output.write(","+str(values[k]))
    output.write("\n")
    values=[0,0,0,0,0,0,0]
output.close()
