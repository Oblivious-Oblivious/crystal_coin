require "digest/sha256";

x = 5;
y = 0;

def hash(value)
  Digest::SHA256.hexdigest value;
end

while hash((x * y).to_s)[0..5] != "000000"
  y += 1;
end

puts "The solution is y = #{y}";
puts "Hash(#{x} * #{y}) = #{hash((x * y).to_s)}";
