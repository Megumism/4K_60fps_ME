result = []
with open("cur_img.txt","r") as f:
    data = f.readlines()
    #datar = [str(bin(int(x.strip())))[2:]for x in data]
    datar = [x.strip() for x in data]
    print(datar[25])
    y = []
    for x in range(2160):
        #front = ["0","0","0","0","0","0","0"]
        #back = ["0","0","0","0","0","0","0","0"]
        #y.append(front + datar[x*3840:(x+1)*3840] + back)  
        y.append(datar[x*3840:(x+1)*3840]) 
    #zero = ["0" for x in range(3840)]
    #top = [zero for x in range(7)]
    #bottom = [zero for x in range(8)]
    #result = top + y + bottom
    result = y
    
re = []

for x in range(270):
    t = result[x*8:(x+1)*8]
    for y in range(480):
        r = []
        for q in t:
            for s in q[y*8:(y+1)*8]:
                re.append(s)

print(re[193])
print(len(re))   
rq = []     
for x in re:
    y = str(bin(int(x)))[2:]
    rq.append(y)
print(len(rq))
rd = []
for x in rq:
    r = '0'*(8-len(x))
    t = r + x;
    rd.append(t)
print(len(rd))
print(rd[193])
ra = []

for x in range(int(len(rd)/4)):
    q = rd[x*4]+rd[x*4+1]+rd[x*4+2]+rd[x*4+3]
    ra.append(q)
print(ra[48])
with open("cur_2.txt","w") as f:
    for x in ra:
        f.write(x)
        f.write('\n')
        
        
        