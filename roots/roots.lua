math.randomseed(os.time())
print("How big is your polynomial")

Number_of_degrees = io.read("*n")
local polynomial = {}
local derivative = {}
--local minimum_closeness_to_zero
local max_iterations = 200

print("write your coefficents from smallest to largest")

for i = 1,Number_of_degrees,1
do
    print("degree", Number_of_degrees-i)
    table.insert(polynomial, io.read("*n"))
end

print("==========================================")

for i = 1,Number_of_degrees-1,1
do
    derivative[i] = polynomial[i] * (Number_of_degrees-i)
    print(derivative[i])
end

function EvaluatePolynomial(f_polynomial, f_input)
    local return_value = 0
    local polynomial_size = #f_polynomial
    for i = 1, polynomial_size, 1 do
        --print(return_value)
        return_value = return_value + f_polynomial[i] * (f_input ^ (polynomial_size-i))
    end
    return return_value
end

function GetTangentLine(f_polynomial, f_derivative, f_input)
    local slope = EvaluatePolynomial(f_derivative, f_input)
    local y_intercept = EvaluatePolynomial(f_polynomial,f_input) - slope*f_input
    return {slope, y_intercept}
end

function GetZeroFromLine(f_line)
    return f_line[2]/f_line[1] * -1
end


for i = 1, Number_of_degrees-1, 1 do
    local input = math.random()
    math.randomseed(math.random(-100000000, 10000000000))
    for i = 1, max_iterations, 1 do
        local closness_to_zero =  5000
        input = GetZeroFromLine(GetTangentLine(polynomial, derivative, input))
        closness_to_zero = math.abs(EvaluatePolynomial(polynomial,input))
        if closness_to_zero < .01 then
            break
        end
    end
    print(input)
end

--print(GetZeroFromLine(GetTangentLine(polynomial,derivative,-1)))

