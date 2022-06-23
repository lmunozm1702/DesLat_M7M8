#@param {String[]}ops
#@return integer

def cal_points(ops)
    #puts ops
    result=[]
    ops.each do |op|
        if op == "+"
            result.push result[-1].to_i + result[-2].to_i
            #print result
        elsif op == "D"
            result.push result[-1].to_i * 2
            #print result
        elsif op == "C"
            result.pop
            #print result
        else
            result.push op.to_i
            #print result
        end
    end    
    return result.sum
end

ops = ["5","2","C","D","+"]
puts cal_points(ops)