require 'curses'

include Curses

###############
#             #
# Expressions #
#             #
###############
module Expressions
    # Primative
    class Int
        attr_reader :value
        def initialize(value)
            @value = value
        end

        def evaluate(env)
            self
        end

        def to_s
            "#{@value}"
        end
    end

    class Float
        attr_reader :value
        def initialize(value)
            @value = value
        end

        def evaluate(env)
            self
        end

        def to_s
            "#{@value}"
        end
    end

    class Bool
        attr_reader :value
        def initialize(value)
            @value = value
        end

        def evaluate(env)
            self
        end

        def to_s
            "#{@value}"
        end
    end

    class String
        attr_reader :value
        def initialize(value)
            @value = value
        end

        def evaluate(env)
            self
        end

        def to_s
            "#{@value}"
        end
    end

    # Arithmetic Operations
    class Add
        def initialize(left, right)
            @left = left
            @right = right
        end

        def evaluate(env)
            left_value = @left.evaluate(env)
            right_value = @right.evaluate(env)
            if (left_value.instance_of? Int) && (right_value.instance_of? Int)
                Int.new(left_value.value + right_value.value)
            elsif (left_value.instance_of? Float) || (right_value.instance_of? Float) && (right_value.instance_of? Int) || (left_value.instance_of? Int)
                Float.new(left_value.value + right_value.value)
            else
                raise Exception
            end
        end

        def to_s
            "#{@left.to_s} + #{@right.to_s}"
        end
    end

    class Sub
        def initialize(left, right)
            @left = left
            @right = right
        end

        def evaluate(env)
            left_value = @left.evaluate(env)
            right_value = @right.evaluate(env)
            if (left_value.instance_of? Int) && (right_value.instance_of? Int)
                Int.new(left_value.value - right_value.value)
            elsif (left_value.instance_of? Float) || (right_value.instance_of? Float) && (right_value.instance_of? Int) || (left_value.instance_of? Int)
                Float.new(left_value.value - right_value.value)
            else
                raise Exception
            end
        end

        def to_s
            "#{@left.to_s} - #{@right.to_s}"
        end
    end

    class Mult
        def initialize(left, right)
            @left = left
            @right = right
        end

        def evaluate(env)
            left_value = @left.evaluate(env)
            right_value = @right.evaluate(env)
            if (left_value.instance_of? Int) && (right_value.instance_of? Int)
                Int.new(left_value.value * right_value.value)
            elsif (left_value.instance_of? Float) || (right_value.instance_of? Float) && (right_value.instance_of? Int) || (left_value.instance_of? Int)
                Float.new(left_value.value * right_value.value)
            else
                raise Exception
            end
        end

        def to_s
            "#{@left.to_s} * #{@right.to_s}"
        end
    end

    class Div
        def initialize(left, right)
            @left = left
            @right = right
        end
        
        def evaluate(env)
            left_value = @left.evaluate(env)
            right_value = @right.evaluate(env)
            if (left_value.instance_of? Int) && (right_value.instance_of? Int)
                Int.new(left_value.value / right_value.value)
            elsif (left_value.instance_of? Float) || (right_value.instance_of? Float) && (right_value.instance_of? Int) || (left_value.instance_of? Int)
                Float.new(left_value.value / right_value.value)
            else
                raise Exception
            end
        end

        def to_s
            "#{@left.to_s} / #{@right.to_s}"
        end
    end

    class Mod
        def initialize(left, right)
            @left = left
            @right = right
        end
        
        def evaluate(env)
            left_value = @left.evaluate(env)
            right_value = @right.evaluate(env)
            if (left_value.instance_of? Int) && (right_value.instance_of? Int)
                Int.new(left_value.value % right_value.value)
            elsif (left_value.instance_of? Float) || (right_value.instance_of? Float) && (right_value.instance_of? Int) || (left_value.instance_of? Int)
                Float.new(left_value.value % right_value.value)
            else
                raise Exception
            end
        end

        def to_s
            "#{@left.to_s} % #{@right.to_s}"
        end
    end

    class Exp
        def initialize(left, right)
            @left = left
            @right = right
        end
        
        def evaluate(env)
            left_value = @left.evaluate(env)
            right_value = @right.evaluate(env)
            if (left_value.instance_of? Int) && (right_value.instance_of? Int)
                Int.new(left_value.value ** right_value.value)
            elsif (left_value.instance_of? Float) || (right_value.instance_of? Float) && (right_value.instance_of? Int) || (left_value.instance_of? Int)
                Float.new(left_value.value ** right_value.value)
            else
                raise Exception
            end
        end

        def to_s
            "#{@left.to_s} ** #{@right.to_s}"
        end
    end

    # Logical Operations
    class LAnd
        def initialize(left, right)
            @left = left
            @right = right
        end
        
        def evaluate(env)
            left_value = @left.evaluate(env)
            right_value = @right.evaluate(env)
            if (left_value.instance_of? Bool) && (right_value.instance_of? Bool)
                Bool.new(left_value.value && right_value.value)
            else
                raise Exception
            end
        end

        def to_s
            "#{@left.to_s} && #{@right.to_s}"
        end
    end

    class LOr
        def initialize(left, right)
            @left = left
            @right = right
        end
        
        def evaluate(env)
            left_value = @left.evaluate(env)
            right_value = @right.evaluate(env)
            if (left_value.instance_of? Bool) && (right_value.instance_of? Bool)
                Bool.new(left_value.value && right_value.value)
            else
                raise Exception
            end
        end

        def to_s
            "#{@left.to_s} || #{@right.to_s}"
        end
    end

    class LNot
        def initialize(operand)
            @operand = operand
        end
        
        def evaluate(env)
            operand_value = @operand.evaluate(env)
            if operand_value.instance_of? Bool
                Bool.new(!operand_value.value)
            else
                raise Exception
            end
        end

        def to_s
            "!#{@operand.to_s}"
        end
    end

    # Cells
    # what should these evaluate to?
    class Lvalue
        attr_reader :left, :right
        def initialize(left, right)
            @left = left
            @right = right
        end
        
        def evaluate(env)
            self
        end

        def to_s
            "(#{@left.to_s}, #{@right.to_s})"
        end
    end

    class Rvalue
        attr_reader :left, :right
        def initialize(left, right)
            @left = left
            @right = right
        end
        
        def evaluate(env)
            env.get_query(Rvalue.new(left, right), env)
        end

        def to_s
            "(#{@left.to_s}, #{@right.to_s})"
        end
    end

    # Bitwise Operations
    class BAnd
        def initialize(left, right)
            @left = left
            @right = right
        end
        
        def evaluate(env)
            left_value = @left.evaluate(env)
            right_value = @right.evaluate(env)
            if (left_value.instance_of? Int) && (right_value.instance_of? Int)
                Int.new(left_value.value & right_value.value)
            else
                raise Exception
            end
        end

        def to_s
            "#{@left.to_s} & #{@right.to_s}"
        end
    end

    class BOr
        def initialize(left, right)
            @left = left
            @right = right
        end
        
        def evaluate(env)
            left_value = @left.evaluate(env)
             right_value = @right.evaluate(env)
            if (left_value.instance_of? Int) && (right_value.instance_of? Int)
                Int.new(left_value.value | right_value.value)
            else
                raise Exception
            end
        end

        def to_s
            "#{@left.to_s} | #{@right.to_s}"
        end
    end

    class BXor
        def initialize(left, right)
            @left = left
            @right = right
        end
        
        def evaluate(env)
            left_value = @left.evaluate(env)
            right_value = @right.evaluate(env)
            if (left_value.instance_of? Int) && (right_value.instance_of? Int)
                Int.new(left_value.value ^ right_value.value)
            else
                raise Exception
            end
        end

        def to_s
            "#{@left.to_s} ^ #{@right.to_s}"
        end
    end

    class BNot
        def initialize(operand)
            @operand = operand
        end
        
        def evaluate(env)
            operand_value = @operand.evaluate(env)
            if operand_value.instance_of? Int
                Int.new(~operand_value.value)
            else
                raise Exception
            end
        end

        def to_s
            "~#{@operand.to_s}"
        end
    end

    class LShift
        def initialize(left, right)
            @left = left
            @right = right
        end
        
        def evaluate(env)
            left_value = @left.evaluate(env)
            right_value = @right.evaluate(env)
            if (left_value.instance_of? Int) && (right_value.instance_of? Int)
                Int.new(left_value.value << right_value.value)
            else
                raise Exception
            end
        end

        def to_s
            "#{@left.to_s} << #{@right.to_s}"
        end
    end

    class RShift
        def initialize(left, right)
            @left = left
            @right = right
        end
        
        def evaluate(env)
            left_value = @left.evaluate(env)
            right_value = @right.evaluate(env)
            if (left_value.instance_of? Int) && (right_value.instance_of? Int)
                Int.new(left_value.value >> right_value.value)
            else
                raise Exception
            end
        end

        def to_s
            "#{@left.to_s} >> #{@right.to_s}"
        end
    end

    # Relational Operations
    class Equal
        def initialize(left, right)
            @left = left
            @right = right
        end
        
        def evaluate(env)
            left_value = @left.evaluate(env)
            right_value = @right.evaluate(env)
            Bool.new(left_value.value == right_value.value)
        end

        def to_s
            "#{@left.to_s} == #{@right.to_s}"
        end
    end

    class NotEqual
        def initialize(left, right)
            @left = left
            @right = right
        end
        
        def evaluate(env)
            left_value = @left.evaluate(env)
            right_value = @right.evaluate(env)
            Bool.new(left_value.value != right_value.value)
        end

        def to_s
            "#{@left.to_s} != #{@right.to_s}"
        end
    end

    class Less
        def initialize(left, right)
            @left = left
            @right = right
        end
        
        def evaluate(env)
            left_value = @left.evaluate(env)
            right_value = @right.evaluate(env)
            Bool.new(left_value.value < right_value.value)
        end

        def to_s
            "#{@left.to_s} < #{@right.to_s}"
        end
    end

    class LessEqual
        def initialize(left, right)
            @left = left
            @right = right
        end
        
        def evaluate(env)
            left_value = @left.evaluate(env)
            right_value = @right.evaluate(env)
            Bool.new(left_value.value <= right_value.value)
        end

        def to_s
            "#{@left.to_s} <= #{@right.to_s}"
        end
    end

    class Greater
        def initialize(left, right)
            @left = left
            @right = right
        end
        
        def evaluate(env)
            left_value = @left.evaluate(env)
            right_value = @right.evaluate(env)
            Bool.new(left_value.value > right_value.value)
        end

        def to_s
            "#{@left.to_s} > #{@right.to_s}"
        end
    end

    class GreaterEqual
        def initialize(left, right)
            @left = left
            @right = right
        end
        
        def evaluate(env)
            left_value = @left.evaluate(env)
            right_value = @right.evaluate(env)
            Bool.new(left_value.value >= right_value.value)
        end

        def to_s
            "#{@left.to_s} >= #{@right.to_s}"
        end
    end
    
    # Casting Operations
    class FloatToInt
        def initialize(operand)
            @operand = operand
        end
        
        def evaluate(env)
            operand_value = @operand.evaluate(env)
            if operand_value.instance_of? Float
                Int.new(operand_value.value.to_i)
            else
                raise Exception
            end
        end

        def to_s
            "#{@operand.to_s}"
        end
    end

    class IntToFloat
        def initialize(operand)
            @operand = operand
        end
        
        def evaluate(env)
            operand_value = @operand.evaluate(env)
            if operand_value.instance_of? Int
                Float.new(operand_value.value.to_f)
            else
                raise Exception
            end
        end

        def to_s
            "#{@operand.to_s}"
        end
    end

    # Statistical Functions
    class Max
        def initialize(left, right)
            @left = left
            @right = right
        end
        
        def evaluate(env)
            left_value = @left.evaluate(env)
            right_value = @right.evaluate(env)
            if (left_value.instance_of? Lvalue) && (right_value.instance_of? Lvalue)
                x = env.get_query(left_value, env)
                for i in 0..right_value.left
                    for j in 0..right_value.right
                        y = env.get_query(Lvalue.new(left_value.left + i, left_value.right + j), env)
                        if Less.new(x, y).evaluate(env).value
                            x = y
                        end
                    end
                end 
                x
            else
                raise Exception
            end
        end

        def to_s
        end
    end

    class Min
        def initialize(left, right)
            @left = left
            @right = right
        end
        
        def evaluate(env)
            left_value = @left.evaluate(env)
            right_value = @right.evaluate(env)
            if (left_value.instance_of? Lvalue) && (right_value.instance_of? Lvalue)
                x = env.get_query(left_value, env)
                for i in 0..right_value.left
                    for j in 0..right_value.right
                        y = env.get_query(Lvalue.new(left_value.left + i, left_value.right + j), env)
                        if Less.new(y, x).evaluate(env).value
                            x = y
                        end
                    end
                end 
                x
            else
                raise Exception
            end
        end

        def to_s
        end
    end

    class Mean
        def initialize(left, right)
            @left = left
            @right = right
        end
        
        def evaluate(env)
            left_value = @left.evaluate(env)
            right_value = @right.evaluate(env)
            if (left_value.instance_of? Lvalue) && (right_value.instance_of? Lvalue)
                x = 0
                count = 0
                for i in 0..right_value.left
                    for j in 0..right_value.right
                        count += 1
                        x = Expressions::Add.new(env.get_query(Lvalue.new(left_value.left + i, left_value.right + j), env), Expressions::Int.new(x)).evaluate(env).value
                    end
                end 
                Expressions::Div.new(Expressions::Int.new(x), Expressions::Int.new(count)).evaluate(env).value
            else
                raise Exception
            end
        end

        def to_s
        end
    end

    class Sum
        def initialize(left, right)
            @left = left
            @right = right
        end
        
        def evaluate(env)
            left_value = @left.evaluate(env)
            right_value = @right.evaluate(env)
            if (left_value.instance_of? Lvalue) && (right_value.instance_of? Lvalue)
                x = 0
                for i in 0..right_value.left
                    for j in 0..right_value.right
                        x = Expressions::Add.new(env.get_query(Lvalue.new(left_value.left + i, left_value.right + j), env), Expressions::Int.new(x)).evaluate(env).value
                    end
                end 
                x
            else
                raise Exception
            end
        end

        def to_s
        end
    end
end

module Environment
    class Environment
        def initialize
            @grid = Grid::Grid.new()
        end

        def set_query(address, expression)
            @grid.set(address, expression)
        end

        def get_query(address, env)
            @grid.get(address, env)
        end
    end
end

module Grid
    class Grid
        attr_reader :grid
        def initialize
            @grid = []
        end

        def set(address, expression)
            @grid.push({row: address.left, col:address.right, value: expression})
        end

        def get(address, env)
            result = @grid.select{ |cell| cell[:row] == address.left && cell[:col] == address.right}
            if result[0] == nil
                raise Exception
            end
            result[0][:value].evaluate(env)
        end
    end
end


###############
#             #
#    Lexer    #
#             #
###############
module Lexer
    class Lexer
        def initialize(source)
            @source = source
        end

        def lex
            @i = 0
            @j = 0
            @token_so_far = ''
            @tokens = []

            while @i < @source.length
                if has('+')
                    capture
                    emit_token(:plus)
                elsif has('-')
                    capture
                    emit_token(:minus)
                elsif has('(')
                    capture
                    emit_token(:left_parentheses)
                elsif has(')')
                    capture
                    emit_token(:right_parentheses)
                elsif has('*')
                    capture
                    if has('*')
                        capture
                        emit_token(:exponent)
                    else
                        emit_token(:multipy)
                    end
                elsif has('/')
                    capture
                    emit_token(:divide)
                elsif has('%')
                    capture
                    emit_token(:modulo)
                elsif has('&')
                    capture
                    if has('&')
                        capture
                        emit_token(:logical_and)
                    else
                        emit_token(:bitwise_and)
                    end
                elsif has('|')
                    capture
                    if has('|')
                        capture
                        emit_token(:logical_or)
                    else
                        emit_token(:bitwise_or)
                    end
                elsif has('^')
                    capture
                    emit_token(:bitwise_xor)
                elsif has('~')
                    capture
                    emit_token(:bitwise_not)
                elsif has('!')
                    capture
                    if has('=')
                        capture
                        emit_token(:not_equal)
                    else
                        emit_token(:logical_not)
                    end
                elsif has('=')
                    capture
                    emit_token(:equal)
                elsif has('<')
                    capture
                    if has('<')
                        capture
                        emit_token(:left_shift)
                    elsif has('=')
                        capture
                        emit_token(:less_than_or_equal)
                    else
                        emit_token(:less_than)
                    end
                elsif has('>')
                    capture
                    if has('>')
                        capture
                        emit_token(:left_shift)
                    elsif has('=')
                        capture
                        emit_token(:greater_than_or_equal)
                    else
                        emit_token(:greater_than)
                    end
                elsif has_digit
                    while has_digit
                        capture
                    end
                    if has('.')
                        capture
                        while has_digit
                            capture
                        end
                        emit_token(:float_literal)
                    end
                    emit_token(:integer_literal)
                elsif has('t')
                    done = false
                    capture
                    if has('r')
                        capture
                        if has('u')
                            capture
                            if has('e')
                                done = true
                                capture
                                emit_token(:boolean_literal)
                            end
                        end
                    end
                    if !done
                        while has_letter
                            capture
                        end
                        emit_token(:string_literal)
                    end
                elsif has('f')
                    done = false
                    capture
                    if has('a')
                        capture
                        if has('l')
                            capture
                            if has('s')
                                capture
                                if has('e')
                                    done = true
                                    capture
                                    emit_token(:boolean_literal)
                                end
                            end
                        end
                    end
                    if !done
                        while has_letter
                            capture
                        end
                        emit_token(:string_literal)
                    end
                elsif has('m')
                    done = false
                    capture
                    if has('a')
                        capture
                        if has('x')
                            done = true
                            capture
                            emit_token(:max)
                        end
                    elsif has('i')
                        capture
                        if has('n')
                            done = true
                            capture
                            emit_token(:min)
                        end
                    elsif has('e')
                        capture
                        if has('a')
                            capture
                            if has('n')
                                done = true
                                capture
                                emit_token(:mean)
                            end
                        end
                    end
                    if !done
                        while has_letter
                            capture
                        end
                        emit_token(:string_literal)
                    end
                elsif has('s')
                    done = false
                    capture
                    if has('u')
                        capture
                        if has('m')
                            done = true
                            capture
                            emit_token(:sum)
                        end
                    end
                    if !done
                        while has_letter
                            capture
                        end
                        emit_token(:string_literal)
                    end
                elsif has_letter
                    while has_letter
                        capture
                    end
                    emit_token(:string_literal)
                else
                    @i += 1
                    @token_so_far = ''
                end
            end
            @tokens
        end

        def has(character)
            @j < @source.length && @source[@j] == character
        end

        def has_letter
            @j < @source.length && 'a' <= @source[@j] && @source[@j] <= 'z'
        end

        def has_digit
            @j < @source.length && '0' <= @source[@j] && @source[@j] <= '9'
        end

        def has_keyword(key_word)
            for k in 0..key_word.length
                if key_word[k] == @source[@j + k]
                    capture
                end
            end
        end

        def capture
            @token_so_far += @source[@j]
            @j += 1
        end

        def emit_token(type)
            @tokens << {type: type, source: @token_so_far, start: @i, end:@j}
            @i = @j
            @token_so_far = ''
        end
    end
end


###############
#             #
#    Parser   #
#             #
###############
module Parser
    class Parser
        def initialize(tokens)
            @tokens = tokens
            @i = 0
            @j = 0
            @k = 0
        end

        def expression

        end

        def atom
            id_token = advance
            if id_token[:type] == 'integer_literal'
                Expressions::Int.new(id_token[:source].to_i)
            elsif id_token[:type] == 'float_literal'
                Expressions::Float.new(id_token[:source].to_f)
            elsif id_token[:type] == 'string_literal'
                Expressions::String.new(id_token[:source].to_s)
            elsif id_token[:type] == 'boolean_literal'
                Expressions::Bool.new(id_token[:source].to_b)
            end
        end

        def has(type)
            @i < @tokens.length && @tokens[@i][:type] == type
        end

        def capture
            token = @tokens[@i]
            @i += 1
            @j = token[:start]
            @k = token[:end]
            token
        end
    end
end