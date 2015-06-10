sum = 0
K=0
for deltaR = 2:0.1:4
    for deltaR1 = 2:0.1:4
        sum = sum+(1/|K|)*B(deltaR-deltaR1)
    end
end