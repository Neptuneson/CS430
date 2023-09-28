require_relative('grid_kid.rb')


#             #
#   Testing   #
#             #

env = Environment::Environment.new()

grid = Grid::Grid.new()

# Populate grid
val = 0
for i in 0..10
    for j in 0..10
        if (i == 1 && j == 1) 
            env.set_query(Expressions::Lvalue.new(i, j), Expressions::Int.new(-1))
        elsif(i == 2 && j == 3)
            env.set_query(Expressions::Lvalue.new(i, j), Expressions::Int.new(3000))
        else
            env.set_query(Expressions::Lvalue.new(i, j), Expressions::Add.new(Expressions::Int.new(val), Expressions::Int.new(val)))
            val +=1
        end
    end
end

# Primative
print("Primative\n")
int = Expressions::Int.new(3)
print "Int: #{int} evaluates To: #{int.evaluate(env)}\n"
float = Expressions::Float.new(3.1)
print "Float: #{float} evaluates To: #{float.evaluate(env)}\n"
bool = Expressions::Bool.new(true)
print "Bool: #{bool} evaluates To: #{bool.evaluate(env)}\n"
string = Expressions::String.new("Hello World")
print "String: #{string} evaluates To: #{string.evaluate(env)}\n"
print("\n")


# Aritmetic Operations
print("Arithmetic Operations\n")
print("Addition\n")
add = Expressions::Add.new(int, int)
print "Int-Int Additon: #{add} = #{add.evaluate(env)}\n"
add = Expressions::Add.new(int, float)
print "Int-Float Additon: #{add} = #{add.evaluate(env)}\n"
add = Expressions::Add.new(float, int)
print "Float-Int Additon: #{add} = #{add.evaluate(env)}\n"
add = Expressions::Add.new(float, float)
print "Float-Float Additon: #{add} = #{add.evaluate(env)}\n"

print("Subtraction\n")
sub = Expressions::Sub.new(int, int)
print "Int-Int Subtraction: #{sub} = #{sub.evaluate(env)}\n"
sub = Expressions::Sub.new(int, float)
print "Int-Float Subtraction: #{sub} = #{sub.evaluate(env)}\n"
sub = Expressions::Sub.new(float, int)
print "Float-Int Subtraction: #{sub} = #{sub.evaluate(env)}\n"
sub = Expressions::Sub.new(float, float)
print "Float-Float Subtraction: #{sub} = #{sub.evaluate(env)}\n"

print("Multiplicaton\n")
mult = Expressions::Mult.new(int, int)
print "Int-Int Multiplication: #{mult} = #{mult.evaluate(env)}\n"
mult = Expressions::Mult.new(int, float)
print "Int-Float Multiplication: #{mult} = #{mult.evaluate(env)}\n"
mult = Expressions::Mult.new(float, int)
print "Float-Int Multiplication: #{mult} = #{mult.evaluate(env)}\n"
mult = Expressions::Mult.new(float, float)
print "Float-Float Multiplication: #{mult} = #{mult.evaluate(env)}\n"

print("Division\n")
div = Expressions::Div.new(int, int)
print "Int-Int Division: #{div} = #{div.evaluate(env)}\n"
div = Expressions::Div.new(int, float)
print "Int-Float Division: #{div} = #{div.evaluate(env)}\n"
div = Expressions::Div.new(float, int)
print "Float-Int Division: #{div} = #{div.evaluate(env)}\n"
div = Expressions::Div.new(float, float)
print "Float-Float Division: #{div} = #{div.evaluate(env)}\n"

print("Modulo\n")
mod = Expressions::Mod.new(int, int)
print "Int-Int Modulo: #{mod} = #{mod.evaluate(env)}\n"
mod = Expressions::Mod.new(int, float)
print "Int-Float Modulo: #{mod} = #{mod.evaluate(env)}\n"
mod = Expressions::Mod.new(float, int)
print "Float-Int Modulo: #{mod} = #{mod.evaluate(env)}\n"
mod = Expressions::Mod.new(float, float)
print "Float-FloatModulo: #{mod} = #{mod.evaluate(env)}\n"

print("Exponentiation\n")
exp = Expressions::Exp.new(int, int)
print "Int-Int Exponentiation: #{exp} = #{exp.evaluate(env)}\n"
exp = Expressions::Exp.new(int, float)
print "Int-Float Exponentiation: #{exp} = #{exp.evaluate(env)}\n"
exp = Expressions::Exp.new(float, int)
print "Float-Int Exponentiation: #{exp} = #{exp.evaluate(env)}\n"
exp = Expressions::Exp.new(float, float)
print "Float-Float Exponentiation: #{exp} = #{exp.evaluate(env)}\n"
print("\n")


# Logical Operators
print("Logical Operators\n")
l_and = Expressions::LAnd.new(bool, bool)
print "Logical And: #{l_and} = #{l_and.evaluate(env)}\n"
l_or = Expressions::LOr.new(bool, bool)
print "Logical Or: #{l_or} = #{l_or.evaluate(env)}\n"
l_not = Expressions::LNot.new(bool)
print "Logical Not: #{l_not} = #{l_not.evaluate(env)}\n"
print("\n")

# Cells
print("Cells\n")
l_value = Expressions::Lvalue.new(3, 4)
print "Cell: #{l_value} Lvalue: #{l_value.evaluate(env)}\n"
r_value = Expressions::Rvalue.new(1, 2)
print "Cell: #{r_value} Rvalue: #{r_value.evaluate(env)}\n"
print("\n")

# Bitwise Operators
print("Bitwise Operators\n")
b_and = Expressions::BAnd.new(int, int)
print "Bitwise And: #{b_and} = #{b_and.evaluate(env)}\n"
b_or = Expressions::BOr.new(int, int)
print "Bitwise Or: #{b_or} = #{b_or.evaluate(env)}\n"
b_xor = Expressions::BXor.new(int, int)
print "Bitwise Xor: #{b_xor} = #{b_xor.evaluate(env)}\n"
b_not = Expressions::BNot.new(int)
print "Bitwise Not: #{b_not} = #{b_not.evaluate(env)}\n"
b_left_shift = Expressions::RShift.new(int, int)
print "Bitwise Left Shift: #{b_left_shift} = #{b_left_shift.evaluate(env)}\n"
b_right_shift = Expressions::LShift.new(int, int)
print "Bitwise Right Shift: #{b_right_shift} = #{b_right_shift.evaluate(env)}\n"
print("\n")

# Relational Operators
print("Relational Operators\n")
equal = Expressions::Equal.new(int, int)
print "Equal: #{equal} = #{equal.evaluate(env)}\n"
not_equal = Expressions::NotEqual.new(int, int)
print "Not Equal: #{not_equal} = #{not_equal.evaluate(env)}\n"
less = Expressions::Less.new(int, int)
print "Less: #{less} = #{less.evaluate(env)}\n"
less_equal = Expressions::LessEqual.new(int, int)
print "Less Equals: #{less_equal} = #{less_equal.evaluate(env)}\n"
greater = Expressions::Greater.new(int, int)
print "Greater: #{greater} = #{greater.evaluate(env)}\n"
greater_equal = Expressions::GreaterEqual.new(int, int)
print "Greater Equals: #{greater_equal} = #{greater_equal.evaluate(env)}\n"
print("\n")

# Casting Operators
print("Casting Operators\n")
float_to_int = Expressions::FloatToInt.new(float)
print "Float to Int: #{float_to_int} to #{float_to_int.evaluate(env)}\n"
int_to_float = Expressions::IntToFloat.new(int)
print "Float to Int: #{int_to_float} to #{int_to_float.evaluate(env)}\n"
print("\n")

# Statistical Functions
print("Statistical Functions\n")
max = Expressions::Max.new(Expressions::Lvalue.new(0, 0), Expressions::Lvalue.new(10, 10))
print "Max: #{max.evaluate(env)}\n"
min = Expressions::Min.new(Expressions::Lvalue.new(0, 0), Expressions::Lvalue.new(10, 10))
print "Min: #{min.evaluate(env)}\n"
mean = Expressions::Mean.new(Expressions::Lvalue.new(0, 0), Expressions::Lvalue.new(10, 10))
print "Mean: #{mean.evaluate(env)}\n"
sum = Expressions::Sum.new(Expressions::Lvalue.new(0, 0), Expressions::Lvalue.new(10, 10))
print "Sum: #{sum.evaluate(env)}\n"
print("\n")

# Failure Checks
#f_add = Expressions::Add.new(4,5)
#print "Additon: #{f_add} = #{f_add.evaluate(env)}\n"

#float_to_int = Expressions::FloatToInt.new(int)
#print "Float to Int: #{float_to_int} to #{float_to_int.evaluate(env)}\n"

#f_max = Expressions::Max.new(Expressions::Lvalue.new(0, 0), Expressions::Lvalue.new(20, 20))
#print "Max: #{f_max.evaluate(env)}\n"


print("Lexer\n")
lexer = Lexer::Lexer.new('tru567.87><=+-*/%**maxminmeansum&&||!&|^~<<>>=!=<>=truefalse2345hello()')
tokens = lexer.lex
puts tokens

print("Parser\n")
parser = Parser::Parser.new(tokens)
ast = parser.expression
puts ast